Template.chatroom.rendered = ->
	Deps.autorun ->
		if Session.equals('hideWelcome',true)
			$('#chatroom').show()
		else
			$('#chatroom').hide()

Template.chatroom.helpers {
	room : ->
		Session.get('chatroom')
	users : ->
		# TODO get active sessions
		return 10
	moments : ->
		# TODO get pictures.length
		return 62
	pictures : ->
		console.warn 'TODO - get all pictures from db - picture have to be a square'
		aula = [
			{ picture: 'img/placeholder.jpg', likes: 22 },
			{ picture: 'img/placeholder.jpg', likes: 25 },
			{ picture: 'img/placeholder.jpg', likes: 830},
			{ picture: 'img/placeholder.jpg', likes: 512 },
			{ picture: 'img/placeholder.jpg', likes: 1 },
			{ picture: 'img/placeholder.jpg', likes: 9 },
			{ picture: 'img/placeholder.jpg', likes: 23 },
			{ picture: 'img/placeholder.jpg', likes: 26 }
		]
} 