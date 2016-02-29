searchChatrooms = ->
  searchQuery = $.trim( Session.get 'searchQuery' )
  searchQuery = searchQuery.replace('/', '') # prevent invalid regex pattern injection
  searchQuery = searchQuery  || ''

  if searchQuery isnt ''
    chatrooms = Chatrooms.find( name : {
      $regex    : searchQuery,
      $options : 'i'
    }).fetch()

  else
    chatrooms = Chatrooms.find().fetch()

  # calculate users and moments count
  _.each chatrooms, (chatroom) ->
    roomPictures = Pictures.find({ room : chatroom.code }).fetch();
    chatroom.users = UserData.find({ room : chatroom.code }).fetch().length
    chatroom.moments = roomPictures.length
    # get most loved moment
    mostLovedMoment = _.max roomPictures, (picture) -> picture.likes
    ###
    console.info 'mostLovedMoment : '
    console.info mostLovedMoment
    ###
    chatroom.thumb = if mostLovedMoment then mostLovedMoment.url else ''

  chatrooms


resetSearchQuery = ->
  Session.set 'searchQuery', ''
  $('#search_chatrooms').val ''

###
Template.listview.onCreated ->
  self = this
  self.autorun ->
    self.subscribe 'chatrooms'
    self.subscribe 'pictures'
    self.subscribe 'userdata'
###

Template.listview.rendered = ->
  Tracker.autorun ->
  # animation to/from listview
  if Session.equals 'hideWelcome', true
    $('#listview').fadeIn 300
  else
    $('#listview').hide()


Template.listview.onDestroyed = ->
  resetSearchQuery()


Template.listview.helpers {
  chatrooms : ->
    searchChatrooms()
}


Template.listview.events
  'click .list-chatroom-item': ->
    FlowRouter.go('/' + @code)
    resetSearchQuery()

  'focus #search_chatrooms': (event) ->
    $(event.target).keypress()

  'keyup #search_chatrooms': ->
    searchQuery = $( event.target ).val()
    Session.set 'searchQuery', searchQuery
    searchChatrooms()
