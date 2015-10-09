Template.picture.helpers {
	picture : ->
		pictureId = Session.get('pictureId')
		Pictures.findOne({_id : pictureId})
}

Template.picture.events {
	'click img' : ->
		# TODO only one like per session
		pictureId = Session.get('pictureId')
		Pictures.update { _id : pictureId },
            $inc: { likes: 1 }
}