Template.main.rendered = ->
	Tracker.autorun ->
		FlowRouter.watchPathChange()
		if FlowRouter.current().path is '/'
			$('#header_list_button').hide()
		else
			$('#header_list_button').show()

		if Session.equals('hideWelcome',true)
			$('#welcome').hide()
			$('#header').show()
			$('body').css('height','auto')
		else
			$('#header').hide()
			$('#welcome').show()
			$('body').css('height','100%')
