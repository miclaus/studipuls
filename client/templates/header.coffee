Template.header.events {
	'click #header_logo': ->
		Session.set 'hideWelcome',  false
		Session.set 'chatroom',     ''
		Session.set 'chatroomName', ''
		Session.set 'searchQuery',  ''

		$('#search_chatrooms').val ''

		if $('#welcome_modal').hasClass 'animate'
			$('#welcome_modal').removeClass 'animate'

		FlowRouter.go '/'


	'click #header_chatroom_button': ->
		history.back()


	'click #header_list_button': ->
		Session.set 'hideWelcome', true
		Session.set 'chatroom',    ''
		Session.set 'searchQuery', ''

		$('#search_chatrooms').val ''

		FlowRouter.go '/'

	'click #header_search_button': ->
		$('#wrapper_search').slideToggle()
		$('html, body').animate { scrollTop: 0 }, 'slow'
}
