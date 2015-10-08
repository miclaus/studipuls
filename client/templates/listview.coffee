Template.listview.rendered = ->
	Deps.autorun ->
		if Session.equals('hideWelcome',true)
			$('#listview').show()

Template.listview.helpers {
	chatrooms : ->
		console.warn 'TODO - get all chatrooms from db'
		chatrooms = [
			{ name : 'Audimax', 				  code : 'audimax', 	   description : 'This is the beautiful Audimax', 					  onlineCount : 32, momentsCount : 128 },
			{ name : 'Aula', 					  code : 'aula', 		   description : 'This is the georgeous Aula', 						  onlineCount : 32, momentsCount : 128 },
			{ name : 'Experimentelle Medien Lab', code : 'experimentelle-media-lab', description : 'This is the magnificent Experimentelle Medien Lab', onlineCount : 32, momentsCount : 128 },
			{ name : 'Interactive Media Lab', 	  code : 'interactive-media-lab',    description : 'This is the wonderful Interactive Media Lab', 	  onlineCount : 32, momentsCount : 128 },
			{ name : 'Videostudio', 			  code : 'videostudio',    description : 'This is the visual Videostudio', 					  onlineCount : 32, momentsCount : 128 },
			{ name : 'Audio Studio A', 			  code : 'audio-a', 		   description : 'This is the amazing Audio Studio A', 				  onlineCount : 32, momentsCount : 128 },
			{ name : 'Audio Studio B', 			  code : 'audio-b', 		   description : 'This is the great Audio Studio B', 				  onlineCount : 32, momentsCount : 128 },
			{ name : 'Audio Studio C', 			  code : 'audio-c', 		   description : 'This is the dreadful Audio Studio C', 			  onlineCount : 32, momentsCount : 128 }
		]
}

Template.listview.events {
	'focus #search_chatrooms' : ->
		console.warn 'search_chatrooms gained focus'
		$(window).scrollTo(0);

	'click .chatrooms-item' : ->
		FlowRouter.go('/' + this.code );
}
