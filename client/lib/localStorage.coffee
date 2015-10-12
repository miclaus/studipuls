@localStorageData = []

Meteor.startup ->
	if localStorage.getItem('likedPictures')
		localStorageData.push(JSON.parse(localStorage.getItem('likedPictures')))
	localStorage.setItem 'likedPictures', JSON.stringify(localStorageData)

@saveDataToLocalStorage = (data) ->
  localStorageData = []
  
  # Parse the serialized data back into an aray of objects
  localStorageData = JSON.parse(localStorage.getItem('likedPictures'))
  
  # Push the new data onto the array
  localStorageData.push data
  
  # console.log localStorageData
  
  # Re-serialize the array back into a string and store it in localStorage
  localStorage.setItem 'likedPictures', JSON.stringify(localStorageData)
  return
