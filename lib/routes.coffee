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
            console.error 'show 404'


    # track active users
    triggersEnter: [ (context, redirect) ->
        # console.warn 'route "chatroom" triggersEnter :'
        # console.info Accounts.user()
        # console.info Accounts.userId()

        chatroomId = Chatrooms.findOne({ code : context.params.chatroom })._id

        Chatrooms.update { _id : chatroomId },
            $inc: { users : 1 }
    ]


    triggersExit: [ (context, redirect) ->
        # console.warn 'route "chatroom" triggersExit :'
        # console.info Accounts.user()
        # console.info Accounts.userId()

        chatroomId = Chatrooms.findOne({ code : context.params.chatroom })._id

        Chatrooms.update { _id : chatroomId },
            $inc: { users : -1 }
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


### 404 ###

# TODO ...
