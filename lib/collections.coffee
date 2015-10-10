# Pictures
# _id, createdAt, url, room, likes

@Pictures = new Meteor.Collection('pictures')

# Comments
# _id, createdAt, pictureId, message

@Comments = new Meteor.Collection('comments')

# Chatrooms
# _id, name, users

@Chatrooms = new Meteor.Collection('chatrooms')
