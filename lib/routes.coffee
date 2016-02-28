### List View ###

FlowRouter.route '/',

    name   : 'listview'

    action : (params, queryParams) ->
        ###
        console.warn 'route: list'
        console.info 'params:', params
        console.info 'query params:', queryParams
        ###

        BlazeLayout.render 'main',
            top  : 'header'
            main : 'listview'

    triggersEnter : [ (params, queryParams) ->
        Meteor.call 'updateUserRoom', null
    ]


### Chatroom View ###

FlowRouter.route '/:chatroom',

    name   : 'chatroom'

    action : (params, queryParams) ->
        # console.warn 'route "chatroom" action :'
        # console.info Accounts.user()

        # TODO check if chatroom/route exists, if not 404 page

        chatroom = Chatrooms.findOne { code : params.chatroom }

        if chatroom
            Session.set 'chatroom',     chatroom.code
            Session.set 'chatroomName', chatroom.name

            BlazeLayout.render 'main',
                top  : 'header'
                main : 'chatroom'

        else
            FlowRouter.go 'notFound'


    triggersEnter : [ (context, redirect) ->
        # console.warn 'route "chatroom" triggersEnter :'

        Meteor.call 'updateUserRoom', context.params.chatroom
    ]


### Picture View ###

FlowRouter.route '/:chatroom/:pictureId',

    name   : 'picture'

    action : (params, queryParams) ->
        Session.set 'chatroom',  params.chatroom
        Session.set 'pictureId', params.pictureId

        BlazeLayout.render 'main',
            top  : 'header'
            main : 'picture'


    triggersEnter : [ (context, redirect) ->
        Meteor.call 'updateUserRoom', context.params.chatroom
    ]


### Not found route ###

FlowRouter.notFound =
	action : ->
		BlazeLayout.render 'main',
			top   : 'header'
			main  : 'notFound'
