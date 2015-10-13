## remove user from active sessions if browser reloads/window closed
hotcodepush = false

Meteor._reload.onMigrate ->
    hotcodepush = true
    [ true ]


window.addEventListener 'pagehide', (e) ->
    if not hotcodepush
        chatroom   = Session.get 'chatroom'
        chatroomId = Chatrooms.findOne({ name : chatroom })._id

        Chatrooms.update { _id : chatroomId }, $inc : { users : -1 }
    # return


### onRendered ###

Template.chatroom.onRendered ->
    Tracker.autorun ->
        $('#chatroom').fadeIn 300 if Session.equals 'hideWelcome', true
        $('#chatroom').hide 0 if Session.equals 'hideWelcome', false
# end

### helpers ###

Template.chatroom.helpers {
    # chatroomGestures: ->
    #     'doubletap .chatroom-image': (event, templateInstance) ->
    #         console.warn event.center.x + ' - ' + event.center.y
    canUpload: ->
        Accounts.user() isnt null
	room: ->
		Session.get 'chatroomName'
	users: ->
		chatroom = Session.get 'chatroom'
		UserData.find({ room : chatroom }).fetch().length
	moments: ->
		chatroom = Session.get 'chatroom'
		Pictures.find({ room : chatroom }).fetch().length
	pictures: ->
		chatroom = Session.get 'chatroom'
		Pictures.find({ room : chatroom }, { sort : { createdAt : -1 } }).fetch()
}


Template.chatroom.events
	'click #chatroom_pictures, tap #chatroom_pictures': ->
        chatroom   = Session.get 'chatroom'
        pictureId  = $( event.target ).attr 'data-ref'
        pictureUrl = '/' + chatroom + '/' + pictureId

        FlowRouter.go pictureUrl


    'click #chatroom_upload_icon, tap #chatroom_upload_icon': ->
        $('.upload-trigger').click()


    'change .upload-trigger': (event, template) ->
        FS.Utility.eachFile event, (file) ->
            chatroom  = Session.get 'chatroom'
            pictureId = Session.get 'pictureId'

            PicturesFiles.insert file, (err, fileObj) ->
                # console.warn fileObj

                fileId = if fileObj._id then fileObj._id else null
                fileCursor = PicturesFiles.find fileId

                liveFileQuery = fileCursor.observe {
                    changed: (newFile, oldFile) ->
                        if newFile.isUploaded
                            liveFileQuery.stop()

                            picturesObj = {
                                createdAt: new Date().toString()
                                url: '/cfs/files/moments/' + fileId
                                fileId: fileId
                                room: chatroom
                                likes: 0
                            }

                            Pictures.insert picturesObj, (picturesErr, pictureObjId) ->
                                console.warn 'picture inserted callback';
                                console.info pictureObjId
                }

                $('.upload-trigger').val ''
