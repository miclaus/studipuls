Meteor.publish 'comments', ->
	Comments.find()

Meteor.methods
	sendMessage: (message, pictureId) ->
		check [
			message
			pictureId
		], [ String ]

		Comments.insert
			createdAt	: new Date().toString()
			message 	: message
			pictureId	: pictureId
		return