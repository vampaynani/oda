class DroppableText
	constructor: (name, text, index, x, y, stage, drops=[])->
		@initialize name, text, index, x, y, stage, drops
	DroppableText.prototype = new createjs.Container()
	DroppableText::Container_initialize = DroppableText::initialize
	DroppableText::initialize = (name, text, index, x, y, stage, drops)->
		@Container_initialize()
		@name = name
		@index = index
		@x = x
		@y = y
		@pos = x:x, y:y
		@stage = stage
		@drops = drops
		@text = new createjs.Text text, '16px Quicksand', '#333333'
		@hit = new createjs.Shape()
		@hit.graphics.beginFill('#000').drawRect(-5, -5, @text.getMeasuredWidth() + 10, @text.getMeasuredHeight() + 10)
		@text.hitArea = @hit
		@inPlace = off
		@addChild @text
		false
	createHitArea: (w, h)->
		switch @text.textAlign
			when 'left' then @hit.graphics.c().beginFill('#000').drawRect(0, 0, w, h)
			when 'center' then @hit.graphics.c().beginFill('#000').drawRect(-w/2, 0, w, h)
			when 'right' then @hit.graphics.c().beginFill('#000').drawRect(-w, 0, w, h)
		@text.hitArea = @hit
	setHitArea: ->
		w = @text.getMeasuredWidth()
		h = @text.getMeasuredHeight()
		switch @text.textAlign
			when 'left' then @hit.graphics.c().beginFill('#000').drawRect(0, 0, w, h)
			when 'center' then @hit.graphics.c().beginFill('#000').drawRect(-w/2, 0, w, h)
			when 'right' then @hit.graphics.c().beginFill('#000').drawRect(-w, 0, w, h)
		@text.hitArea = @hit
	updateDrops: (drop, drops...) ->
		@drops = []
		if @isArray drop
			for o in drop
				@drops.push o
		else
			@drops.push drop
			for o in drops
				@drops.push o
		@drops
	isArray: ( value ) ->
		Array.isArray value || (value) ->
			{}.toString.call( value ) is '[object Array]'
	initDragListener: =>
		@addEventListener 'mousedown', @handleMouseDown
	endDragListener: =>
		@removeEventListener 'mousedown', @handleMouseDown
	onInitEvaluation: =>
		@addEventListener 'mousedown', @handleMouseDown
	handleMouseDown: (e) =>
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
			if @drops.length > 0
				@evaluateDrop e
			else
				@dispatchEvent 'drop'
			false
		false
	evaluateDrop: (e) ->
		object = null
		dropped = false
		for drop in @drops
			pt = drop.globalToLocal @stage.mouseX, @stage.mouseY
			if drop.hitTest pt.x, pt.y
				object = drop
				dropped = true
		if dropped
			@dispatchEvent {type:'dropped', drop:object}
		else
			@returnToPlace()
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.2, {alpha:.2, repeat:-1, yoyo:true}  if state
	blinkAgain: =>
		TweenLite.killTweensOf @
		@blink on
	putInPlace: (position, alpha=1, scaleX=1, scaleY=1) ->
		@inPlace = on
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: position.x, y: position.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	returnToPlace: (alpha=1, scaleX=1, scaleY=1) ->
		TweenLite.to @, 0.5, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	window.DroppableText = DroppableText