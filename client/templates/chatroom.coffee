Template.chatroom.rendered = ->
	Deps.autorun ->
		if Session.equals('hideWelcome',true)
			$('#chatroom').show()