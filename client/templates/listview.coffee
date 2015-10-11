searchChatrooms = ->
	searchQuery = $.trim( Session.get('searchQuery') )
	searchQuery = searchQuery.replace('/', '') # prevent invalid regex pattern injection
	searchQuery = searchQuery  || ''

	if searchQuery isnt ''
		chatrooms = Chatrooms.find( name : {
			$regex 	 : searchQuery,
			$options : 'i'
		}).fetch()

	else
		chatrooms = Chatrooms.find().fetch()

	chatrooms


resetSearchQuery = ->
	Session.set 'searchQuery', ''
	$('#search_chatrooms').val ''


Template.listview.rendered = ->
	Deps.autorun ->
		if Session.equals 'hideWelcome', true
			$('#listview').fadeIn 300
		else
			$('#listview').hide()


Template.listview.onDestroyed = ->
	resetSearchQuery()


Template.listview.helpers {
	chatrooms : ->
		searchChatrooms()

	moments : ->
		# TODO get moments length
		# Pictures.find({ room : chatroom }).fetch().length
		return 'Todo'
}


Template.listview.events {
	'click .list-chatroom-item' : ->
		FlowRouter.go('/' + @name )
		resetSearchQuery()

	'keyup #search_chatrooms' : ->
		searchQuery = $( event.target ).val()
		Session.set('searchQuery', searchQuery)
		searchChatrooms()
}
