#UserData.remove {}


Meteor.publish 'userdata', ->
	UserData.find()


### permissions ###

UserData.allow {
	insert   : -> true
	update   : -> true
	remove   : -> true
}
