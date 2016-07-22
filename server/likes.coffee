# NOTE dev only
#Likes.remove {}

### permissions ###

Meteor.publish 'likes', ->
	Likes.find()

### permissions ###

Likes.allow {
	insert   : -> true
	update   : -> true
	remove   : -> false
}
