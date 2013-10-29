class DraggableText
	constructor: (name, text, index, x, y)->
		@initialize name, text, index, x, y
	DraggableText.prototype = new createjs.Container()
	DraggableText::Container_initialize = DraggableText::initialize
	DraggableText::initialize = (name, text, index, x, y)->
		@Container_initialize()
		@name = name
		@index = index
		@x = x
		@y = y
		@pos = x:x, y:y
		@text = new createjs.Text text, '16px Arial', '#333333'
		@hit = new createjs.Shape()
		@hit.graphics.beginFill('#000').drawRect(0, 0, @text.getMeasuredWidth(), @text.getMeasuredHeight())
		@text.hitArea = @hit
		@inPlace = off
		@addChild @text
		false
	setHitArea: ->
		w = @text.getMeasuredWidth()
		h = @text.getMeasuredHeight()
		switch @text.textAlign
			when 'left' then @hit.graphics.c().beginFill('#000').drawRect(0, 0, w, h)
			when 'center' then @hit.graphics.c().beginFill('#000').drawRect(-w/2, 0, w, h)
			when 'right' then @hit.graphics.c().beginFill('#000').drawRect(-w, 0, w, h)
		@text.hitArea = @hit
	initDragListener: =>
		@addEventListener 'mousedown', @handleMouseDown
	onInitEvaluation: =>
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
		TweenMax.to @, 0.2, {alpha:.2, repeat:-1, yoyo:true}  if state
	blinkAgain: =>
		TweenLite.killTweensOf @
		@blink on
	putInPlace: (position) ->
		@inPlace = on
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: position.x, y: position.y, alpha: 1 }
	returnToPlace: ->
		TweenLite.to @, 0.5, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: 1 }
	window.DraggableText = DraggableText