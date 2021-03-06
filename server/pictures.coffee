# NOTE dev only
#Pictures.remove {}

if Pictures.find().count() == 0
	pictures = [
		# {
		# 	createdAt: new Date().toString()
		# 	url: '/uploads/placeholder.jpg'
		# 	fileId: null
		# 	room: 'audimax'
		# 	likes: 0
		# }
	]

	_.each pictures, (picture) ->
        Pictures.insert picture

### publications ###

Meteor.publish 'pictures', ->
	Pictures.find()

Meteor.publish 'chatroomPictures', ( chatroom ) ->
	Pictures.find
		room: chatroom

### permissions ###

Pictures.allow {
	insert   : -> true
	update   : -> true
	remove   : -> false
}
