Meteor.publish 'comments', ->
	Comments.find()

Meteor.methods
	sendMessage: (message, pictureId) ->
		check [
			message
			pictureId
		], [ String ]

		Comments.insert
			message: message
			pictureId: pictureId
		return