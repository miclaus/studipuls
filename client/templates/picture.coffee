Template.picture.helpers {
	picture : ->
		pictureId = Session.get('pictureId')
		Pictures.findOne({_id : pictureId})
}