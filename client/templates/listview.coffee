searchChatrooms = ->
	searchQuery = $.trim( Session.get 'searchQuery' )
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
	Tracker.autorun ->
		# animation to/from listview
		if Session.equals 'hideWelcome', true
			$('#listview').fadeIn 300
		else
			$('#listview').hide()

		# update chatroom moments count
		# chatrooms = Chatrooms.find().fetch()
		# console.warn chatrooms

		# _.each chatrooms, ( chatroom, crIx ) ->
		# 	momentsCount = Pictures.find({ room : chatroom.code }).fetch().length
		# 	Chatrooms.update chatroom._id,
		# 		{ moments : momentsCount }


Template.listview.onDestroyed = ->
	resetSearchQuery()


Template.listview.helpers {
	chatrooms : ->
		searchChatrooms()

	# moments : ->
	# 	chatroom = Session.get 'chatroom'
	# 	Pictures.find({ room : chatroom }).fetch().length
}


Template.listview.events {
	'click .list-chatroom-item' : ->
		FlowRouter.go('/' + @code)
		resetSearchQuery()

	'keyup #search_chatrooms' : ->
		searchQuery = $( event.target ).val()
		Session.set 'searchQuery', searchQuery
		searchChatrooms()
}
