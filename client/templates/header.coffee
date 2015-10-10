Template.header.events {
	'click #header_logo' : ->
		Session.set('hideWelcome',false)
		Session.set('chatroom','')
		Session.set('searchQuery','')
		$('#search_chatrooms').val('')
		FlowRouter.go('/');

	'click #header_list_button' : ->
		Session.set('hideWelcome',true)
		Session.set('chatroom','')
		Session.set('searchQuery','')
		$('#search_chatrooms').val('')
		FlowRouter.go('/');
}