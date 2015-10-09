# Pictures
# _id, createdAt, url, room, likes

@Pictures = new Meteor.Collection('pictures')

Pictures.attachBehaviour 'timestampable',
  createdAt: 'insertedAt'
  createdBy: false
  updatedAt: false
  updatedBy: false

# Chatrooms
# _id, name, users

@Chatrooms = new Meteor.Collection('chatrooms')
