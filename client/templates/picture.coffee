Template.picture.rendered = ->
	Session.set('hideWelcome',true)

Template.picture.helpers {
	picture : ->
		pictureId = Session.get('pictureId')
		Pictures.findOne({_id : pictureId})
	comments : ->
		pictureId = Session.get('pictureId')
		Comments.find({pictureId : pictureId}, {sort: {createdAt: -1}}).fetch();
}

Template.picture.events {
	'click img' : ->
		# TODO only one like per session
		pictureId = Session.get('pictureId')
		Pictures.update { _id : pictureId },
			$inc: { likes: 1 }

	'click #picture_message_icon' : ->
		$('#message').focus()
}