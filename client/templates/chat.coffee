Template.chat.helpers {
	comments : ->
		pictureId = Session.get 'pictureId'

		Comments.find({
			pictureId : pictureId
		}, {
			sort : { createdAt : -1 }
		}).fetch()
}


Template.chat.events {
	'keyup #message' : (event) ->
		if event.keyCode is 13 and $( event.target ).val() isnt ''

			newMessage = $( event.target ).val()
			pictureId  = Session.get 'pictureId'

			Meteor.call 'sendMessage', newMessage, pictureId

			$( event.target ).val ''

			$('html, body').animate {
				scrollTop : $('#wrapper_message').offset().top
			}, 600

		false
}
