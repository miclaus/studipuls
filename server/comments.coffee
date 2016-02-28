# NOTE dev only
#Comments.remove {}

### publications ###

Meteor.publish 'comments', ->
	Comments.find()

### permissions ###

Comments.allow {
	insert   : -> true
	update   : -> false
	remove   : -> false
}
