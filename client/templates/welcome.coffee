$('#welcome_modal').removeClass 'animate'

hideWelcome = ->
	if ( ! $('#welcome_modal').hasClass 'animate' )
		$('#welcome_modal').addClass 'animate'

		setTimeout ->
			Session.set 'hideWelcome', true
		, 200



Template.welcome.helpers {
	room : ->
		if Session.get 'chatroomName'
			room = Session.get 'chatroomName'
		else
			room = 'FH St. Pölten'
}


Template.welcome.events {
	'click #welcome_enter_button' : ->
		hideWelcome()
}
