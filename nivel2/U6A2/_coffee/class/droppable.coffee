class Droppable
	constructor: (name, image, index, x, y, stage, drops=[])->
		@initialize name, image, index, x, y, stage, drops
	Droppable.prototype = new createjs.Container()
	Droppable::Container_initialize = Droppable::initialize
	Droppable::initialize = (name, image, index, x, y, stage, drops)->
		@Container_initialize()
		@name = name
		@bitmap = new createjs.Bitmap image
		@index = index
		@x = x
		@y = y
		@width = image.width
		@height = image.height
		@pos = x:x, y:y
		@stage = stage
		@drops = drops
		hit = new createjs.Shape()
		hit.graphics.beginFill('rgba(0,0,0,0.5)').drawRect(0, 0, image.width, image.height)
		@hitArea = hit
		@inPlace = off
		@addChild @bitmap
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
			@returnToPlace @alpha, @scaleX, @scaleY
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
	window.Droppable = Droppable