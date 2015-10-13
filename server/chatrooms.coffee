# NOTE dev only
#Chatrooms.remove {}

if Chatrooms.find().count() == 0
	chatrooms = [
		{ name : 'Audimax', 		 code : 'audimax', 	   users : 0, moments : 0 }
		{ name : 'Aula', 			 code : 'aula', 	   users : 0, moments : 0 }
		{ name : 'Bibliothek', 		 code : 'bibliothek',  users : 0, moments : 0 }
		{ name : 'Hörsaal 1', 		 code : 'hs1', 	       users : 0, moments : 0 }
		{ name : 'Hörsaal 2', 		 code : 'hs2', 	       users : 0, moments : 0 }
		{ name : 'Hörsaal 3', 		 code : 'hs3', 	       users : 0, moments : 0 }
		{ name : 'Kurtis aka Rosis', code : 'kurtis', 	   users : 0, moments : 0 }
		{ name : 'Lift Links', 		 code : 'lift-links',  users : 0, moments : 0 }
		{ name : 'Lift Rechts', 	 code : 'lift-rechts', users : 0, moments : 0 }
		{ name : 'Lounge',      	 code : 'lounge', 	   users : 0, moments : 0 }
		{ name : 'Mensa',       	 code : 'mensa', 	   users : 0, moments : 0 }
		{ name : '2. Stock Terasse', code : 'terasse-2',   users : 0, moments : 0 }
		{ name : '3. Stock Terasse', code : 'terasse-3',   users : 0, moments : 0 }
	]


	_.each chatrooms, (chatroom) ->
        Chatrooms.insert chatroom


Meteor.publish 'chatrooms', ->
	Chatrooms.find()
