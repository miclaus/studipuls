hideWelcome = ->
	$('#welcome').fadeOut 'slow'
	Session.set('hideWelcome',true)

Template.welcome.helpers {
	room : ->
		if Session.get('chatroom')
			room = Session.get('chatroom')
		else
			room = 'FH St. Pölten'
} 

Template.welcome.events {
	'click #welcome_enter_button' : ->
		hideWelcome()
}
