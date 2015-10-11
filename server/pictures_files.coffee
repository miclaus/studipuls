# NOTE - dev only
# PicturesFiles.remove {}

Meteor.publish 'picturesFiles', ->
	return PicturesFiles.find()

### permissions ###

PicturesFiles.allow {
	insert   : -> true
	update   : -> false
	remove   : -> true # TODO - change this for release !
	download : -> true
}
