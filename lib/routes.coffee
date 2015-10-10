# List View
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

# Chatroom View
FlowRouter.route '/:chatroom', 
    name   : 'chatroom'
    action : (params, queryParams) ->
        # TODO check if chatroom/route exists, if not 404 page
        Session.set('chatroom',params.chatroom)
        BlazeLayout.render 'main',
            top: 'header'
            main: 'chatroom'

    # track active users
    triggersEnter: [ (context, redirect) ->
        chatroomId = Chatrooms.findOne({name : context.params.chatroom})._id
        Chatrooms.update { _id : chatroomId },
            $inc: { users: 1 }
    ]

    triggersExit: [ (context, redirect) ->
        chatroomId = Chatrooms.findOne({name : context.params.chatroom})._id
        Chatrooms.update { _id : chatroomId },
            $inc: { users: -1 }
    ]

# Picture View
FlowRouter.route '/:chatroom/:pictureId',
    name   : 'picture'
    action : (params, queryParams) ->
        Session.set('chatroom',params.chatroom)
        Session.set('pictureId',params.pictureId)
        
        BlazeLayout.render 'main',
            top  : 'header'
            main : 'picture'