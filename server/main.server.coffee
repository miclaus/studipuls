Meteor.startup ->

	# prevent FlowRouter from init
	FlowRouter.wait()


	### Accounts settings ###

	before = new Date
	before_hours = before.getHours() - 1

	before.setHours before_hours

	Accounts.removeOldGuests before
	AccountsGuest.anonymous = true


	# init FlowRouter
	FlowRouter.initialize();
