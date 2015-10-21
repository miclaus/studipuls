Meteor.methods
	sendMessage: (message, pictureId) ->
		check [ message, pictureId ], [ String ]

		Comments.insert
			createdAt : new Date().toString()
			message   : message
			pictureId : pictureId

	updateUserRoom: (chatroom) ->
		if chatroom isnt null
			UserData.upsert @userId, { $set : { room : chatroom } }
		else
			UserData.update @userId, { $set : { room : null } }

	likeMoment: (pictureId, center) ->
		moment = Likes.findOne({ _id : pictureId, userId : @userId })
		# console.warn moment

		if not moment
			Likes.insert {
				_id: pictureId,
				createdAt: new Date().toString()
				xPos: center.x
				yPos: center.y
			}, (error, likeId) ->
				console.error error if error
				console.warn likeId
		else
			Likes.update pictureId,
				{ $set: {
					xPos: center.x
					yPos: center.y
					updatedAt: new Date().toString()
				} },
				(error, result) ->
					console.error error if error
					console.warn result

		# recalculate all likes
		totalLikes = Likes.find(pictureId).fetch().length
		Pictures.update pictureId, { $set: { likes: totalLikes } }, (error, result) ->
			console.error error if error
			console.warn result

	clearUserData: ->
		loggedInUsers = Meteor.users.find().fetch()
		usersData = UserData.find().fetch()
		# NOTE - adapted from http://stackoverflow.com/a/24965133/2035807
		removeUserData = _.select loggedInUsers, (user) ->
			console.warn user
			! _.findWhere usersData, {_id: user._id}

		console.warn removeUserData
