FlowRouter.route '/', {
    name   : 'listview'
    action : (params, queryParams) ->
        console.warn 'route: list'
        console.info 'params:', params
        console.info 'query params:', queryParams

        BlazeLayout.render 'main', {
            top  : 'header'
            main : 'listview'
        }
}

FlowRouter.route '/:chatroom', {
    name   : 'chatroom'
    action : (params, queryParams) ->
        # TODO check if chatroom exists
        Session.set('chatroom',params.chatroom)
        console.warn 'route: chatroom'
        console.info 'params:', params
        console.info 'query params:', queryParams

        BlazeLayout.render 'main', {
            top  : 'header'
            main : 'chatroom'
        }
}
