# NOTE dev only
# Chatrooms.remove {}

if Chatrooms.find().count() == 0
	chatrooms = [
		{
			name: 'audimax'
			users: 0
		}
		{
			name: 'aula'
			users: 0
		}
		{
			name: 'mensa'
			users: 0
		}
		{
			name: 'SR 2.1'
			users: 0
		}
	]

	_.each chatrooms, (chatroom) ->
        Chatrooms.insert chatroom

Meteor.publish 'chatrooms', ->
	Chatrooms.find()
