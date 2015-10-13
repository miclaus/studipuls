Meteor.methods
	sendMessage: (message, pictureId) ->
		check [ message, pictureId ], [ String ]

		Comments.insert
			createdAt : new Date().toString()
			message   : message
			pictureId : pictureId

	updateUserRoom: (chatroom) ->
		UserData.upsert @userId, { room : chatroom }

	likeMoment: (pictureId, center) ->
		moment = Likes.findOne({ _id : pictureId, userId : @userId })
		# console.warn moment

		if not moment
			Likes.insert {
				_id  : pictureId,
				createdAt : new Date().toString()
				xPos : center.x,
				yPos : center.y
			}, (error, likeId) ->
				console.error error if error
				console.warn likeId
		else
			Likes.update pictureId,
				{ $set: {
					xPos: center.x,
					yPos: center.y,
					updatedAt : new Date().toString()
				} },
				(error, result) ->
					console.error error if error
					console.warn result

		# recalculate all likes
		totalLikes = Likes.find(pictureId).fetch().length
		Pictures.update pictureId, { $set: { likes: totalLikes } }, (error, result) ->
			console.error error if error
			console.warn result
