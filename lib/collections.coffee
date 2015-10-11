# Pictures
# _id, createdAt, url, room, likes

@Pictures = new Meteor.Collection('pictures')


# PicturesFiles
# TODO - write available properties

imageStore = new FS.Store.GridFS('original')

@PicturesFiles = new FS.Collection('moments',
	stores : [ imageStore ]
)


# Comments
# _id, createdAt, pictureId -> pictures._id, message

@Comments = new Meteor.Collection('comments')


# Chatrooms
# _id, name, users

@Chatrooms = new Meteor.Collection('chatrooms')
