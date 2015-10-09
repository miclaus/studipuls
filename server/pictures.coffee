# NOTE dev only
#Pictures.remove {}

if Pictures.find().count() == 0
	pictures = [ 
		{ 
			url: '/uploads/placeholder.jpg'
			room: 'audimax'
			likes: 22 
		}
		{
			url: '/uploads/placeholder.jpg'
			room: 'audimax'
			likes: 25 
		}
		{ 
			url: '/uploads/placeholder.jpg'
			room: 'mensa'
			likes: 830
		}
		{ 
			url: '/uploads/placeholder.jpg'
			room: 'mensa'
			likes: 512 
		}
		{ 
			url: '/uploads/placeholder.jpg'
			room: 'mensa'
			likes: 1
		}
		{
			url: '/uploads/placeholder.jpg'
			room: 'aula'
			likes: 9
		}
		{ 
			url: '/uploads/placeholder.jpg'
			room: 'aula'
			likes: 23 
		}
		{ 	
			url: '/uploads/placeholder.jpg'
			room: 'aula'
			likes: 26
		}
	]

	_.each pictures, (picture) ->
        Pictures.insert picture

Meteor.publish 'pictures', ->
	Pictures.find()