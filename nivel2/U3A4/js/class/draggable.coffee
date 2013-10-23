class Draggable
	constructor: (name, image, index, x, y, position='tl')->
		@initialize name, image, index, x, y, position
	Draggable.prototype = new createjs.Container()
	Draggable::Container_initialize = Draggable::initialize
	Draggable::initialize = (name, image, index, x, y, position)->
		@Container_initialize()
		@name = name
		@bitmap = new createjs.Bitmap image
		@index = index
		@x = x
		@y = y
		@width = image.width
		@height = image.height
		@pos = x:x, y:y
		@inPlace = off
		@addChild @bitmap
	setReg: (obj, regX, regY) ->
		obj.regX = regX
		obj.regY = regY
		obj
	initDragListener: =>
		@addEventListener 'mousedown', @handleMouseDown
	onInitEvaluation: =>
		@blink on
		@addEventListener 'mousedown', @handleMouseDown
	onStopEvaluation: =>
		@blink off
		@removeEventListener 'mousedown', @handleMouseDown
	handleMouseDown: (e) =>
		TweenLite.killTweensOf @
		posX = e.stageX / stageSize.r
		posY = e.stageY / stageSize.r
		offset = x: posX - @x, y: posY - @y
		@x = posX - offset.x
		@y = posY - offset.y
		e.addEventListener 'mousemove', (ev)=>
			posX = ev.stageX / stageSize.r
			posY = ev.stageY / stageSize.r
			@x = posX - offset.x
			@y = posY - offset.y
			false
		e.addEventListener 'mouseup', (ev)=>
			@dispatchEvent 'drop'
			false
		false
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	blinkAgain: =>
		TweenLite.killTweensOf @
		@blink on
	killMe: =>
		TweenLite.killTweensOf @
		@.parent.removeChild @
	putInPlace: (position) ->
		@inPlace = on
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: position.x, y: position.y, alpha: 1 }
	returnToPlace: ->
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: 1 }
	takeMeOut: ->
		TweenLite.to @, 0.5, { ease: Linear.easeNone, delay: 0.1, x: @pos.x, y: @pos.y, alpha: 0, onComplete: @killMe }
	window.Draggable = Draggable