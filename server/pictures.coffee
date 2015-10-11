# NOTE dev only
# Pictures.remove {}

if Pictures.find().count() == 0
	pictures = [
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'audimax'
			likes: 0
		}
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'audimax'
			likes: 0
		}
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'mensa'
			likes: 0
		}
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'mensa'
			likes: 0
		}
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'mensa'
			likes: 0
		}
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'aula'
			likes: 0
		}
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'aula'
			likes: 0
		}
		{
			createdAt: new Date().toString()
			url: '/uploads/placeholder.jpg'
			room: 'aula'
			likes: 0
		}
	]

	_.each pictures, (picture) ->
        Pictures.insert picture

Meteor.publish 'pictures', ->
	Pictures.find()
