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
		@pos = x:x, y:y
		@addChild @bitmap
	onInitEvaluation: =>
		@blink on
		@addEventListener 'mousedown', @handleMouseDown
	handleMouseDown: (e) =>
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
	returnToPlace: ->
		TweenLite.to @, 0.5, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: 1, scaleX: 1, scaleY: 1, onComplete: @blinkAgain }
	window.Draggable = Draggable