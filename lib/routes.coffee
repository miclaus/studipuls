FlowRouter.route '/', {
    name   : 'listview'
    action : (params, queryParams) ->
        console.warn 'route: list'

        BlazeLayout.render 'main', {
            main : 'listview'
        }
}

FlowRouter.route '/:chatroom', {
    name   : 'chatroom'
    action : (params, queryParams) ->
        console.warn 'route: chatroom'
        console.log 'Params:', params
        console.log 'Query Params:', queryParams
}
