window.stageSize || = {
	w: 800
	h: 600
	r: 1
}

Array::toDictionary = (key) ->
	dict = {}
	dict[obj[key]] = obj for obj in this when obj[key]?
	dict
Array::where = (query) ->
	return [] if typeof query isnt "object"
	hit = Object.keys(query).length
	@filter (item) ->
		match = 0
		for key, val of query
			match += 1 if item[key] is val
		if match is hit then true else false
Array::unique = ->
	output = {}
	output[@[key]] = @[key] for key in [0...@length]
	value for key, value of output

class Oda
	# ====================
	# Base
	# ====================
	constructor: ( @imgurl = 'imgs/', manifest, sounds ) ->
		def_manifest = [
			{id: 'sg', src: "#{ @imgurl }start_game.png"},
      		{id: 'pa', src: "#{ @imgurl }play_again.png"}  
		]
		@assets = new Array()
		@manifest = for item in manifest
			{ id:"#{ item.id }", src:"#{ @imgurl + item.src}" }
		
		Array::push.apply @manifest, def_manifest
		Array::push.apply @manifest, sounds
	initialize: ->
		@initStage().initContainer().initPreloader().resize()
		@
	initStage: ->
		@stage = new createjs.Stage 'oda'
		createjs.Ticker.addEventListener 'tick', @stage
		createjs.Ticker.setFPS 60
		createjs.Touch.enable @stage
		@stage.enableMouseOver()
		@
	initContainer: ->
		@mainContainer = new createjs.Container()
		@mainContainer.regX = stageSize.w / 2
		@mainContainer.regY = stageSize.h / 2
		@stage.addChild @mainContainer
		@
	initPreloader: ->
		@preload = new createjs.LoadQueue false
		@loadStep = 0
		@barHeight = 7
		@barWidth = 35
		@loaderColor = $('#oda').data('loadercolor') ? '#E62922';

		@loaderBar = new createjs.Container()
		@loaderBar.x = stageSize.w / 2
		@loaderBar.y = stageSize.h / 2

		for i in [1..13] by 1
			bgBar = new createjs.Shape()
			bgBar.graphics.setStrokeStyle(1).beginStroke(@loaderColor).beginFill(@loaderColor).drawRoundRect(0, 0, @barWidth, @barHeight, 5)
			bgBar.regX = -20
			bgBar.regY = @barHeight / 2
			bgBar.rotation = (i-1) * 30
			bgBar.alpha = 0.05
			bgBar.name = 'bar' + i.toString()
			@loaderBar.addChild bgBar

		@preload.installPlugin createjs.Sound
		@preload.addEventListener 'progress', @handleProgress
		@preload.addEventListener 'complete', @handleComplete
		@preload.loadManifest @manifest
		@mainContainer.addChild @loaderBar
		TweenLite.from @loaderBar, 1, (alpha: 0.1, ease: Quart.easeOut)
		@
	handleProgress: (e) =>
		percent = Math.round @preload.progress * 100
		if e.loaded >= @loadStep / 12 and @loadStep < 12
			@showBar "bar#{ @loadStep + 1 }"
			@loadStep++
	handleComplete: =>
		@preload.removeEventListener 'progress', @handleProgress
		@preload.removeEventListener 'complete', @handleComplete
		TweenLite.to @loaderBar, 1, (alpha:0, ease: Quart.easeOut)
		@setStage()
	showBar: (name) ->
		TweenLite.to (@loaderBar.getChildByName name), 2.5, (alpha: 1, ease: Quart.easeOut)
	setStage: ->
		@index = 0
		@observer = new Observer()
	introEvaluation: ->
		if @library.score
			@library.score.reset() if @library['score']
	playInstructions: (oda) ->
		if dealersjs.mobile.isIOS() or dealersjs.mobile.isAndroid()
			oda.insertBitmap 'start', 'sg', stageSize.w / 2, stageSize.h / 2, 'mc'
			oda.library['start'].addEventListener 'click', oda.initMobileInstructions
			TweenLite.from oda.library['start'], 0.3, { alpha: 0, y: oda.library['start'].y + 20 }
		else
			inst = createjs.Sound.play 'instructions'
			inst.addEventListener 'complete', oda.initEvaluation
	initMobileInstructions: (e) =>
		e.target.removeEventListener 'click', @initMobileInstructions
		createjs.Sound.stop()
		inst = createjs.Sound.play 'instructions'
		inst.addEventListener 'complete', @initEvaluation
		TweenLite.to @library['start'], 0.3, { alpha: 0, y: @library['start'].y + 20, onComplete: @removeMobileInstructions, onCompleteParams: [@] }
	removeMobileInstructions: (oda) ->
		oda.mainContainer.removeChild(oda.library['start']);
	initEvaluation: (e) =>
		@observer.notify 'init_evaluation'
	finish: ->
		@insertBitmap 'play_again', 'pa', stageSize.w / 2, stageSize.h / 2, 'mc'
		@library['play_again'].addEventListener 'click', @handlePlayAgain
		TweenLite.from @library['play_again'], 0.5, { alpha: 0, y: @library['play_again'].y - 20 }
	handlePlayAgain: (e) =>
		@library['play_again'].removeEventListener 'click', @handlePlayAgain
		TweenLite.to @library['play_again'], 0.5, { alpha: 0, y: @library['play_again'].y - 20, onComplete: @playAgain }
	playAgain: =>
    	@mainContainer.removeAllChildren()
    	@setStage()
	warning: ->
		createjs.Sound.play 'wrong'
		TweenMax.to @mainContainer, 0.1, (x: @mainContainer.x + 10, repeat: 6, yoyo: true, onComplete:@warningComplete)
		@
	warningComplete: =>
		@mainContainer.x = @stage.canvas.width / 2
	resize: ->
		w = window.innerWidth
		h = window.innerHeight
		stageSize.r = Math.min w / stageSize.w, h / stageSize.h
		@mainContainer.scaleX = stageSize.r
		@mainContainer.scaleY = stageSize.r

		$('#oda').width w
		@stage.canvas.width = w
		@stage.canvas.height = h

		@mainContainer.x = @stage.canvas.width / 2
		@mainContainer.y = @stage.canvas.height / 2
		@
	tick: ->
		@stage.update()

	# ====================
	# Helpers
	# ====================
	insertInstructions: (name, text, x, y) ->
		inst = new createjs.Container()
		inst.name = name
		inst.x = x
		inst.y = y
		triangle = new createjs.Shape()
		triangle.graphics.beginFill('#bcd748').moveTo(0,0).lineTo(8,5).lineTo(0,10)
		triangle.y = 5
		text = @createText 'insttext', text, '16px Roboto', '#000', 14, 0
		inst.addChild triangle, text
		@addToMain inst
	createBitmap: (name, id, x, y, position = 'tl') ->
		img = @preload.getResult(id)
		bmp = new createjs.Bitmap img
		bmp.x = x
		bmp.y = y
		bmp.width = img.width
		bmp.height = img.height
		bmp.name = name
		switch position
			when 'tc' then @setReg bmp, img.width / 2, 0
			when 'tr' then @setReg bmp, img.width, 0
			when 'ml' then @setReg bmp, 0, img.height / 2
			when 'mc' then @setReg bmp, img.width / 2, img.height / 2
			when 'mr' then @setReg bmp, img.width, img.height / 2
			when 'bl' then @setReg bmp, 0, img.height
			when 'bc' then @setReg bmp, img.width / 2, img.height
			when 'br' then @setReg bmp, img.width, img.height
			else @setReg bmp, 0, 0
		bmp
	insertBitmap: (name, id, x, y, position = 'tl') ->
		bmp = @createBitmap name, id, x, y, position
		@addToMain bmp
		bmp
	createSprite: (name, imgs, anim=null, x, y, position = 'tl') ->
		spriteImgs = for img in imgs
			@preload.getResult img
		w = spriteImgs[0].width
		h = spriteImgs[0].height
		sprite = new createjs.SpriteSheet (images: spriteImgs, animations: anim, frames: {width: w, height: h})
		animation = new createjs.Sprite sprite
		animation.x = x
		animation.y = y
		animation.width = w
		animation.height = h
		animation.name = name
		animation.currentFrame = 0
		switch position
			when 'tc' then @setReg animation, animation.width / 2, 0
			when 'tr' then @setReg animation, animation.width, 0
			when 'ml' then @setReg animation, 0, animation.height / 2
			when 'mc' then @setReg animation, animation.width / 2, animation.height / 2
			when 'mr' then @setReg animation, animation.width, animation.height / 2
			when 'bl' then @setReg animation, 0, animation.height
			when 'bc' then @setReg animation, animation.width / 2, animation.height
			when 'br' then @setReg animation, animation.width, animation.height
			else @setReg animation, 0, 0
		animation
	insertSprite: (name, imgs, anim=null, x, y, position = 'tl') ->
		animation = @createSprite name, imgs, anim, x, y, position
		@addToMain animation
		animation
	createText: (name, t, f, c, x, y, align = 'left') ->
		text = new createjs.Text t,f,c
		text.name = name
		text.x = x
		text.y = y
		text.textAlign = align
		text
	insertText: (name, t, f, c, x, y, align = 'left') ->
		text = @createText name, t, f, c, x, y, align
		@addToMain text
		text
	addToMain: (objs...) ->
		@addToLibrary objs
		for o in objs
			@mainContainer.addChild o
		@mainContainer
	addToLibrary: (obj, objs...) ->
		if @isArray obj
			for o in obj
				@assets.push o
		else
			@assets.push obj
			for o in objs
				@assets.push o
		@library = @assets.toDictionary 'name'
		@library
	setReg: (obj, regX, regY) ->
		obj.regX = regX
		obj.regY = regY
		obj
	setPosition: (obj, x, y) ->
		obj.x = x
		obj.y = y
		obj

	# ====================
	# Utilites
	# ====================
	shuffleNoRepeat: (a, len) ->
		copy = a[..]
		shuffle = Array()
		for i in [1..len]
			rand = Math.round Math.random() * (copy.length - 1)
			shuffle.push copy[rand]
			copy.splice rand, 1
		shuffle
	shuffle: (a) ->
		copy = a[..]
		for i in [copy.length - 1..0]
			j = Math.floor Math.random() * ( i + 1 )
			[copy[i], copy[j]] = [copy[j], copy[i]]
		copy
	clone: (obj) ->
		if not obj? or typeof obj isnt 'object'
			return obj
		if obj instanceof Date
			return new Date(obj.getTime()) 
		if obj instanceof RegExp
			flags = ''
			flags += 'g' if obj.global?
			flags += 'i' if obj.ignoreCase?
			flags += 'm' if obj.multiline?
			flags += 'y' if obj.sticky?
			return new RegExp(obj.source, flags) 
		newInstance = new obj.constructor()
		for key of obj
			newInstance[key] = @clone obj[key]
		return newInstance
	isArray: ( value ) ->
		Array.isArray value || (value) ->
			{}.toString.call( value ) is '[object Array]'
	debuggable: (obj) ->
		KEYCODE_ENTER = 13;
		KEYCODE_SPACE = 32;
		KEYCODE_UP = 38;
		KEYCODE_DOWN = 40;
		KEYCODE_LEFT = 37;
		KEYCODE_RIGHT = 39;	
		@debugged = obj
		document.addEventListener 'keyup', (e) =>
			switch e.keyCode
				when KEYCODE_UP then @debugged.y -= 10
				when KEYCODE_DOWN then @debugged.y += 10
				when KEYCODE_LEFT then @debugged.x -= 10
				when KEYCODE_RIGHT then @debugged.x += 10
			console.log @debugged.x, @debugged.y
		@debugged.addEventListener 'mousedown', (e) =>
			posX = e.stageX / stageSize.r
			posY = e.stageY / stageSize.r
			offset = x: posX - @debugged.x, y: posY - @debugged.y
			@debugged.x = posX - offset.x
			@debugged.y = posY - offset.y
			e.addEventListener 'mousemove', (ev) =>
				posX = ev.stageX / stageSize.r
				posY = ev.stageY / stageSize.r
				@debugged.x = posX - offset.x
				@debugged.y = posY - offset.y
				false
			e.addEventListener 'mouseup', (ev) =>
				console.log @debugged
			@debugged
		@debugged
	blink: (obj, state=on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state

	window.Oda = Oda