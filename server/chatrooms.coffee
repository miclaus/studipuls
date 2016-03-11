# NOTE dev only
#Chatrooms.remove {}

if Chatrooms.find().count() == 0
  chatrooms = [
    { name : 'Studenten Lounge', code : 'lounge',      users : 0, moments : 0 }
    { name : 'Besucher Lounge',  code : 'guest',       users : 0, moments : 0 }
    { name : 'Aula',             code : 'aula',        users : 0, moments : 0 }
    { name : 'Mensa',            code : 'mensa',       users : 0, moments : 0 }
    { name : 'Bibliothek',       code : 'biblio',      users : 0, moments : 0 }
    { name : 'Langeweile',       code : 'boring',      users : 0, moments : 0 }
    { name : 'Rosis',            code : 'rosis',       users : 0, moments : 0 }
    { name : 'Random Shots',     code : 'random',       users : 0, moments : 0 }
  ]
# else
#   # NOTE temp hack to add new rooms
#   alreadyChatrooms = Chatrooms.find().fetch();
#   foundNewRoom = false
#   _.each alreadyChatrooms, (chatroom) ->
#     if chatroom.name is 'Random Sh*t'
#       foundNewRoom = true
#     else if chatroom.name is 'Lift Links' or chatroom.name is 'Lift Rechts'
#       console.log chatroom._id
#       Chatrooms.remove chatroom._id
#   Chatrooms.insert { name : 'Random Sh*t', code : 'random', users : 0, moments : 0 } if not foundNewRoom


  _.each chatrooms, (chatroom) ->
        Chatrooms.insert chatroom

### publications ###

Meteor.publish 'chatrooms', ->
  Chatrooms.find()

### permissions ###

Chatrooms.allow {
  insert   : -> false
  update   : -> true
  remove   : -> false
}
