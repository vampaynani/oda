class Draggable
	constructor: (name, image, index, x, y, position='tl')->
		@initialize name, image, index, x, y, position
	Draggable.prototype = new createjs.Container()
	Draggable::Container_initialize = Draggable::initialize
	Draggable::initialize = (name, image, index, x, y, position='tl')->
		@Container_initialize()
		@name = name
		@bitmap = new createjs.Bitmap image
		@index = index
		@x = x
		@y = y
		@pos = x:x, y:y
		@addChild @bitmap
		@width = @text.getMeasuredWidth()

		switch position
			when 'tc' then @setReg @, image.width / 2, 0
			when 'tr' then @setReg @, image.width, 0
			when 'ml' then @setReg @, 0, image.height / 2
			when 'mc' then @setReg @, image.width / 2, image.height / 2
			when 'mr' then @setReg @, image.width, image.height / 2
			when 'bl' then @setReg @, 0, image.height
			when 'bc' then @setReg @, image.width / 2, image.height
			when 'br' then @setReg @, image.width, image.height
			else @setReg @, 0, 0
	setReg: (obj, regX, regY) ->
		obj.regX = regX
		obj.regY = regY
		obj
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