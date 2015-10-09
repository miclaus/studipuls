Template.listview.rendered = ->
	Deps.autorun ->
		if Session.equals('hideWelcome',true)
			$('#listview').show()
		else
			$('#listview').hide()

Template.listview.helpers {
	chatrooms : ->
		Chatrooms.find().fetch()
}

Template.listview.events {
	'focus #search_chatrooms' : ->
		console.warn 'search_chatrooms gained focus'
		$(window).scrollTo(0);

	'click .chatrooms-item' : ->
		FlowRouter.go('/' + @name );
}
