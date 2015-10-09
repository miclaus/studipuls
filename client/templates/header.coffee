Template.header.events {
	'click #header_logo' : ->
		Session.set('hideWelcome',false)
		Session.set('chatroom','')
		FlowRouter.go('/');

	'click #header_list_button' : ->
		Session.set('hideWelcome',true)
		Session.set('chatroom','')
		FlowRouter.go('/');
}