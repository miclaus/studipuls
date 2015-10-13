#Likes.remove {}

Meteor.publish 'likes', ->
	Likes.find()
