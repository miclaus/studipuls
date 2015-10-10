# Pictures
# _id, createdAt, url, room, likes

@Pictures = new Meteor.Collection('pictures')

Pictures.attachBehaviour 'timestampable',
  createdAt: 'createdAt'
  createdBy: false
  updatedAt: false
  updatedBy: false

# Comments
# _id, createdAt, pictureId, message

@Comments = new Meteor.Collection('comments')

Comments.attachBehaviour 'timestampable',
  createdAt: 'createdAt'
  createdBy: false
  updatedAt: false
  updatedBy: false

# Chatrooms
# _id, name, users

@Chatrooms = new Meteor.Collection('chatrooms')
