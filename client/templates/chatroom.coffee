## remove user from active sessions if browser reloads/window closed
hotcodepush = false

Meteor._reload.onMigrate ->
  hotcodepush = true
  [ true ]

window.addEventListener 'pagehide', (e) ->
  if not hotcodepush
    chatroom = Session.get('chatroom')
    chatroomId = Chatrooms.findOne({name : chatroom})._id
    Chatrooms.update { _id : chatroomId },
        $inc: { users: -1 }
  return

Template.chatroom.rendered = ->
	Deps.autorun ->
		if Session.equals('hideWelcome',true)
			$('#chatroom').show()
		else
			$('#chatroom').hide()

Template.chatroom.helpers {
	room : ->
		Session.get('chatroom')
	users : ->
		chatroom = Session.get('chatroom')
		Chatrooms.findOne({name : chatroom}).users
	moments : ->
		chatroom = Session.get('chatroom')
		Pictures.find({room : chatroom}).fetch().length
	pictures : ->
		chatroom = Session.get('chatroom')
		pictures = Pictures.find({room : chatroom}, {sort: {createdAt: -1}}).fetch()
} 

Template.chatroom.events {
	'click #chatroom_pictures' : (event) ->
		pictureId = $(event.target).attr('data-ref')
		chatroom = Session.get('chatroom')
		FlowRouter.go('/' + chatroom + '/' + pictureId)
}