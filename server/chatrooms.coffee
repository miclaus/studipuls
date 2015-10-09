# NOTE dev only
# Chatrooms.remove {}

if Chatrooms.find().count() == 0
	chatrooms = [ 
		{ 
			name: 'audimax'
		}
		{ 
			name: 'aula'
		}
		{ 
			name: 'mensa'
		}
		{ 
			name: 'SR 2.1'
		}
	]

	_.each chatrooms, (chatroom) ->
        Chatrooms.insert chatroom

Meteor.publish 'chatrooms', ->
	Chatrooms.find()