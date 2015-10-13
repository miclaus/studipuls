#UserData.remove {}


Meteor.publish 'userdata', ->
	UserData.find()


### permissions ###

# UserData.allow {
# 	insert   : -> true
# 	update   : -> false
# 	remove   : -> false
# }
