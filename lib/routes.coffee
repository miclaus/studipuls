FlowRouter.route '/', {
    name   : 'listview'
    action : (params, queryParams) ->
        console.warn 'list route:'

        BlazeLayout.render 'main', {
            main : 'listview'
        }
}

FlowRouter.route '/:chatroom', {
    name   : 'chatroom'
    action : (params, queryParams) ->
        console.warn 'chatroom route:'
        console.log 'Params:', params
        console.log 'Query Params:', queryParams
}
