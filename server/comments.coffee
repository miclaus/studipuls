#Comments.remove {}

Meteor.publish 'comments', ->
	Comments.find()
