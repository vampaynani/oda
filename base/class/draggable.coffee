class Draggable
	constructor: (name, image, index, x, y)->
		@initialize name, image, index, x, y
	Draggable.prototype = new createjs.Container()
	Draggable::Container_initialize = Draggable::initialize
	Draggable::initialize = (name, image, index, x, y)->
		@Container_initialize()
		@name = name
		@bitmap = new createjs.Bitmap image
		@index = index
		@x = x
		@y = y
		@width = image.width
		@height = image.height
		@pos = x:x, y:y
		hit = new createjs.Shape()
		hit.graphics.beginFill('rgba(0,0,0,0.5)').drawRect(0, 0, image.width, image.height)
		@hitArea = hit
		@inPlace = off
		@addChild @bitmap
	onInitEvaluation: =>
		@addEventListener 'mousedown', @handleMouseDown
	onStopEvaluation: =>
		@removeEventListener 'mousedown', @handleMouseDown
	initDragListener: =>
		@addEventListener 'mousedown', @handleMouseDown
	endDragListener: =>
		@removeEventListener 'mousedown', @handleMouseDown
	handleMouseDown: (e) =>
		TweenMax.killTweensOf @
		TweenLite.killTweensOf @
		@alpha = 1
		posX = e.stageX / stageSize.r
		posY = e.stageY / stageSize.r
		offset = x: posX - @x, y: posY - @y
		@x = posX - offset.x
		@y = posY - offset.y
		@addEventListener 'pressmove', (ev)=>
			posX = ev.stageX / stageSize.r
			posY = ev.stageY / stageSize.r
			@x = posX - offset.x
			@y = posY - offset.y
			false
		@addEventListener 'pressup', (ev)=>
			@removeAllEventListeners 'pressmove'
			@removeAllEventListeners 'pressup'
			@dispatchEvent 'drop'
			false
		false
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@alpha = 1
		TweenMax.to @, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	blinkAgain: =>
		TweenLite.killTweensOf @
		@blink on
	putInPlace: (position, alpha=1, scaleX=1, scaleY=1) ->
		@inPlace = on
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: position.x, y: position.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	returnToPlace: (alpha=1,scaleX=1,scaleY=1, blink=false) ->
		if not blink
			TweenLite.to @, 0.5, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
		else
			TweenLite.to @, 0.5, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY, onComplete: @blinkAgain }
	takeMeOut: ->
		TweenLite.to @, 0.5, { ease: Linear.easeNone, delay: 0.1, x: @pos.x, y: @pos.y, alpha: 0, onComplete: @killMe }
	window.Draggable = Draggable