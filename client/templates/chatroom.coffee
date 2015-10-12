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

    return


Template.chatroom.rendered = ->
	Tracker.autorun ->
		if Session.equals 'hideWelcome', true
			$('#chatroom').fadeIn 300
		else
			$('#chatroom').hide()


Template.chatroom.helpers {
    canUpload : ->
        Accounts.user() isnt null

	room : ->
		Session.get 'chatroomName'

	users : ->
		chatroom = Session.get 'chatroom'

		Chatrooms.findOne({ name : chatroom }).users

	moments : ->
		chatroom = Session.get 'chatroom'

		Pictures.find({ room : chatroom }).fetch().length

	pictures : ->
		chatroom = Session.get 'chatroom'
		Pictures.find({ room : chatroom }, { sort : { createdAt : -1 } }).fetch();
}


Template.chatroom.events {
	'click #chatroom_pictures, tap #chatroom_pictures' : ->
        chatroom   = Session.get 'chatroom'
        pictureId  = $( event.target ).attr 'data-ref'
        pictureUrl = '/' + chatroom + '/' + pictureId

        FlowRouter.go pictureUrl


    'click #chatroom_upload_icon, tap #chatroom_upload_icon' : ->
        $('.upload-trigger').click()


    'change .upload-trigger' : (event, template) ->
        FS.Utility.eachFile event, (file) ->
            # console.warn 'upload trigger FILE :'
            # console.info file

            chatroom  = Session.get 'chatroom'
            pictureId = Session.get 'pictureId'

            # Meteor.call 'uploadPictureFile', file, chatroom, pictureId

            # Inserted new doc with ID fileObj._id, and kicked off the data upload using HTTP
            PicturesFiles.insert file, (err, fileObj) ->
                console.warn fileObj

                fileId = if fileObj._id then fileObj._id else null
                console.log fileId

                picturesObj = {
                    createdAt: new Date().toString()
                    url: '/cfs/files/moments/' + fileId
                    fileId: fileId
                    room: chatroom
                    likes: 0
                }

                Pictures.insert picturesObj, (picturesErr, pictureObjId) ->
                    console.warn 'picture insert callback : ';
                    console.info pictureObjId


                $('.upload-trigger').val ''
}
