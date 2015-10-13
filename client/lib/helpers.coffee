thumbnail = (base64, maxWidth, maxHeight) ->

	# Max size for thumbnail
	maxWidth  = 500 if typeof(maxWidth)  is 'undefined'
	maxHeight = 500 if typeof(maxHeight) is 'undefined'

	# Create and initialize two canvas
	canvas      = document.createElement('canvas')
	ctx         = canvas.getContext('2d')
	canvasCopy  = document.createElement('canvas')
	copyContext = canvasCopy.getContext('2d')

	# Create original image
	img = new Image
	img.src = base64

	# Determine new ratio based on max size
	ratio = 1
	if img.width > maxWidth
		ratio = maxWidth / img.width
	else if img.height > maxHeight
		ratio = maxHeight / img.height

	# Draw original image in second canvas
	canvasCopy.width  = img.width
	canvasCopy.height = img.height
	copyContext.drawImage img, 0, 0

	# Copy and resize second canvas to first canvas
	canvas.width = img.width * ratio;
	canvas.height = img.height * ratio;
	ctx.drawImage( canvasCopy, 0, 0, canvasCopy.width, canvasCopy.height, 0, 0, canvas.width, canvas.height )

	# return
	canvas.toDataURL()
