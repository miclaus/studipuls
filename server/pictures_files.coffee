# NOTE - dev only
#PicturesFiles.remove {}

### publications ###

Meteor.publish 'picturesFiles', ->
	return PicturesFiles.find()

### permissions ###

PicturesFiles.allow {
	insert   : -> true
	update   : -> true
	remove   : -> false
	download : -> true
}


# PicturesFiles.on 'stored', (fileObj, storeName) ->
#     console.warn 'files stored'
#     console.warn fileObj
#
#     url = fileObj.url({ store: storeName });
#
#     console.warn url
