likeMoment = (event) ->
	pictureId = Session.get 'pictureId'
	Meteor.call 'likeMoment', pictureId, event.center, ->
		console.warn 'likeMoment callback'


Template.picture.onRendered ->
	Session.set 'hideWelcome', true


Template.picture.helpers {
	###
	pictureGestures: {
        'doubletap .picture-image': (event, templateInstance) -> likeMoment(event)
	}
	###

	picture: ->
		pictureId = Session.get 'pictureId'
		Pictures.findOne({ _id : pictureId })
	comments: ->
		pictureId = Session.get 'pictureId'
		Comments.find({ pictureId: pictureId }, { sort: { createdAt: -1 }}).fetch()
}


Template.picture.events {
	'click img, click #picture_likes' : ->
		pictureId = Session.get 'pictureId'
		likedPictures = localStorage.getItem('likedPictures')
		# console.log likedPictures

		# TODO do not use String, but array
		# if not _.contains(likedPictures,pictureId)
		if likedPictures.search( pictureId ) is -1
			Pictures.update { _id : pictureId }, $inc : { likes : 1 }
			saveDataToLocalStorage( pictureId )

	'click #picture_message_icon': ->
		$('#message').focus()
}
