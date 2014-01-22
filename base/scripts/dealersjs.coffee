###

LIBRARY

###
window.dealersjs ?= {}
window.d2oda ?= {}
window.lib ?= {}

window.dealersjs.mobile ?= class Mobile
	@user_agent = navigator.userAgent.toLowerCase()
	@isIOS = ->
    	if true in [@isIpad(),@isIphone(), @isIpod()] then true else false
    @isIpad = ->
    	@user_agent.indexOf('ipad') > -1
    @isIphone = ->
    	@user_agent.indexOf('iphone') > -1
    @isIpod = ->
    	@user_agent.indexOf('ipod') > -1
    @isAndroid = ->
    	@user_agent.indexOf('android') > -1
    @isMobile = ->
    	@user_agent.indexOf('mobile') > -1
    Mobile

window.d2oda.utilities ?= class Utilities
	@shuffleNoRepeat = (a, len) ->
		copy = a[..]
		shuffle = Array()
		for i in [1..len]
			rand = Math.round Math.random() * (copy.length - 1)
			shuffle.push copy[rand]
			copy.splice rand, 1
		shuffle
	@shuffle = (a) ->
		copy = a[..]
		for i in [copy.length - 1..0]
			j = Math.floor Math.random() * ( i + 1 )
			[copy[i], copy[j]] = [copy[j], copy[i]]
		copy
	@clone = (obj) ->
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
	@isArray = ( value ) ->
		Array.isArray value || (value) ->
		{}.toString.call( value ) is '[object Array]'
	Utilities

window.d2oda.behaviors ?= class Behaviors
	@initDragListener = =>
		@addEventListener 'mousedown', @handleMouseDown
	@endDragListener = =>
		@removeEventListener 'mousedown', @handleMouseDown
	Behaviors

window.d2oda.actions ?= class Actions
	@fadeOut = ->
		if @alpha is 1 then TweenLite.to @, 0.5, {alpha: 0, y: @y - 20} else TweenLite.from @, 0.5, {alpha: 1, y: @y + 20}
	@fadeIn = ->
		if @alpha is 0 then TweenLite.to @, 0.5, {alpha: 1, y: @y - 20} else TweenLite.from @, 0.5, {alpha: 0, y: @y + 20}
	@blink = (state=on) ->
		TweenMax.killTweensOf @
		@alpha = 1
		TweenMax.to @, 0.5, {alpha: 0.2, repeat: -1, yoyo: true}  if state
	@hide = ->
		@visible = false
	@setInOrigin = ->
		@x = @pos.x
		@y = @pos.y
	@putInPlace = (position, alpha=1, scaleX=1, scaleY=1) ->
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: position.x, y: position.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	@returnToPlace = (alpha=1, scaleX=1, scaleY=1) ->
		TweenLite.to @, 0.5, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	#takeMeOut: ->
		#TweenLite.to @, 0.5, { ease: Linear.easeNone, delay: 0.1, x: @pos.x, y: @pos.y, alpha: 0, onComplete: @killMe }
	Actions

window.d2oda.methods ?= class Methods
	@createBitmap = (name, id, x, y, position = 'tl') ->
		img = lib.preloader.preload.getResult id
		bmp = new createjs.Bitmap img
		bmp.x = x
		bmp.y = y
		bmp.width = img.width
		bmp.height = img.height
		bmp.name = name
		@setPosition position, bmp
		bmp
	@insertBitmap = (name, id, x, y, position = 'tl') ->
		bmp = @createBitmap name, id, x, y, position
		@add bmp
		bmp
	@createText = (name, t, f, c, x, y, align = 'left') ->
		text = new createjs.Text t,f,c
		text.name = name
		text.x = x
		text.y = y
		text.textAlign = align
		text
	@insertText = (name, t, f, c, x, y, align = 'left') ->
		text = @createText name, t, f, c, x, y, align
		@add text
		text
	@createSprite = (name, imgs, anim=null, x, y, position = 'tl') ->
		spriteImgs = for img in imgs
			lib.preloader.preload.getResult img
		w = spriteImgs[0].width
		h = spriteImgs[0].height
		sprite = new createjs.SpriteSheet (images: spriteImgs, animations: anim, frames: {width: w, height: h})
		animation = new createjs.BitmapAnimation sprite
		animation.x = x
		animation.y = y
		animation.width = w
		animation.height = h
		animation.name = name
		animation.currentFrame = 0
		@setPosition position, animation
		animation
	@insertSprite = (name, imgs, anim=null, x, y, position = 'tl') ->
		animation = @createSprite name, imgs, anim, x, y, position
		@add animation
		animation
	@setPosition = (position, obj = null) ->
		if not obj then obj = @
		switch position
			when 'tc' then @setReg obj, obj.width / 2, 0
			when 'tr' then @setReg obj, obj.width, 0
			when 'ml' then @setReg obj, 0, obj.height / 2
			when 'mc' then @setReg obj, obj.width / 2, obj.height / 2
			when 'mr' then @setReg obj, obj.width, obj.height / 2
			when 'bl' then @setReg obj, 0, obj.height
			when 'bc' then @setReg obj, obj.width / 2, obj.height
			when 'br' then @setReg obj, obj.width, obj.height
			else @setReg obj, 0, 0
	@setReg = (obj, regX, regY) ->
		obj.regX = regX
		obj.regY = regY
		obj
	@add = (child, toLibrary = true) ->
		@addChild child
		if toLibrary then lib[child.name] = child
	@delay = (time, fn, args...) ->
  		setTimeout fn, time, args...
	Methods

window.d2oda.stage ?= 
	w: 800
	h: 600
	r: 1

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

###

BASE CLASSES

###
class Oda
	constructor: ->
		lib.preloader = new Preloader()
		lib.mainContainer = new MainContainer()
		assetsurl = 'assets/'
		
		def_manifest = [
			{id: 'sg', src: "#{ assetsurl }start_game.png"},
      		{id: 'pa', src: "#{ assetsurl }play_again.png"},
      		{id: 's/boing', src: "#{ assetsurl }boing.mp3"},
      		{id: 's/good', src: "#{ assetsurl }good.mp3"},
      		{id: 's/wrong', src: "#{ assetsurl }wrong.mp3"}  
		]

		@manifest = for item in @manifest
			{ id:"#{ item.id }", src:"#{ assetsurl + item.src}" }
		
		Array::push.apply @manifest, def_manifest

		@_setStage().resize()
		
		lib.preloader.addEventListener 'complete', @setGame
		lib.preloader.load @manifest
	resize: ->
		w = window.innerWidth
		h = window.innerHeight
		d2oda.stage.r = Math.min w / d2oda.stage.w, h / d2oda.stage.h
		lib.mainContainer.scaleX = d2oda.stage.r
		lib.mainContainer.scaleY = d2oda.stage.r

		$('#oda').width w
		@stage.canvas.width = w
		@stage.canvas.height = h

		lib.mainContainer.x = @stage.canvas.width / 2
		lib.mainContainer.y = @stage.canvas.height / 2
		@
	setGame: =>
		lib.mainContainer.removeAllChildren()
		gameinstance = d2oda.utilities.clone @game
		lib.game = new Game gameinstance
		@playInstructions()
	playInstructions: =>
		if dealersjs.mobile.isIOS() or dealersjs.mobile.isAndroid()
			lib.mainContainer.insertBitmap 'start', 'sg', d2oda.stage.w / 2, d2oda.stage.h / 2, 'mc'
			lib.start.addEventListener 'click', @initMobileInstructions
			TweenLite.from lib.start, 0.3, { alpha: 0, y: lib.start + 20 }
		else
			inst = lib.instructions.playSound 's/instructions'
			inst.addEventListener 'complete', @initGame
	initMobileInstructions: (e) =>
		createjs.Sound.stop()
		inst = lib.instructions.playSound 's/instructions'
		e.target.removeEventListener 'click', @initMobileInstructions
		inst.addEventListener 'complete', @initGame
		TweenLite.to lib.start, 0.3, { alpha: 0, y: lib.start.y + 20, onComplete: @removeMobileInstructions}
	removeMobileInstructions: =>
		lib.mainContainer.removeChild lib.start
	initGame: =>
		lib.game.start()
	endGame: =>
		lib.mainContainer.insertBitmap 'play_again', 'pa', d2oda.stage.w / 2, d2oda.stage.h / 2, 'mc'
		lib.play_again.addEventListener 'click', @handlePlayAgain
		TweenLite.from lib.play_again, 0.5, { alpha: 0, y: lib.play_again.y - 20 }
	handlePlayAgain: (e) =>
		lib.play_again.removeEventListener 'click', @handlePlayAgain
		TweenLite.to lib.play_again, 0.5, { alpha: 0, y: lib.play_again.y - 20, onComplete: @playAgain }
	playAgain: =>
		@setGame()
	tick: ->
		@stage.update()
	_setStage: ->
		@stage = new createjs.Stage 'oda'
		createjs.Ticker.addListener @
		createjs.Ticker.setFPS 60
		createjs.Touch.enable @stage
		@stage.enableMouseOver()
		@stage.addChild lib.mainContainer
		lib.preloader.mainContainer = lib.mainContainer
		@
	window.Oda = Oda

class Preloader
	constructor: ->
		@initialize()
	Preloader.prototype = new createjs.EventDispatcher()
	Preloader::EventDispatcher_initialize = Preloader::initialize
	Preloader::initialize = ->
		@EventDispatcher_initialize()
		@preload = new createjs.LoadQueue false
		@loadStep = 0
		@barHeight = 7
		@barWidth = 35
		@loaderColor = $('#oda').data('loadercolor') ? '#E62922';

		@loaderBar = new createjs.Container()
		@loaderBar.x = d2oda.stage.w / 2
		@loaderBar.y = d2oda.stage.h / 2

		for i in [1..13] by 1
			bgBar = new createjs.Shape()
			bgBar.graphics.setStrokeStyle(1).beginStroke(@loaderColor).beginFill(@loaderColor).drawRoundRect(0, 0, @barWidth, @barHeight, 5)
			bgBar.regX = -20
			bgBar.regY = @barHeight / 2
			bgBar.rotation = (i-1) * 30
			bgBar.alpha = 0.05
			bgBar.name = 'bar' + i.toString()
			@loaderBar.addChild bgBar
	load: (manifest) ->
		@preload.installPlugin createjs.Sound
		@preload.addEventListener 'progress', @handleProgress
		@preload.addEventListener 'complete', @handleComplete
		@preload.loadManifest manifest
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
		@dispatchEvent type:'complete'
		TweenLite.to @loaderBar, 1, (alpha:0, ease: Quart.easeOut)
	showBar: (name) ->
		TweenLite.to (@loaderBar.getChildByName name), 2.5, (alpha: 1, ease: Quart.easeOut)
	window.Preloader = Preloader

moduleKeywords = ['extended', 'included']
class Module
	@extend: (obj, props) ->
		for key, value of props when key not in moduleKeywords
			obj[key] = value
		props.extended?.apply(obj)
		obj
	@include: (obj, props) ->
		for key, value of props when key not in moduleKeywords
			obj::[key] = value
		props.included?.apply(obj)
		obj
	window.Module = Module

class MainContainer
	constructor: ->
		@initialize()
	MainContainer.prototype = new createjs.Container()
	MainContainer::Container_initialize = MainContainer::initialize
	MainContainer::initialize = ->
		Module.extend @, d2oda.methods
		@Container_initialize()
		@name = 'mainContainer'
		@regX = d2oda.stage.w / 2
		@regY = d2oda.stage.h / 2
	warning: ->
		createjs.Sound.play 's/wrong'
		@prevX = @x
		TweenMax.to @, 0.1, (x: @x + 10, repeat: 6, yoyo: true, onComplete:@warningComplete)
		@
	warningComplete: =>
		@x = @prevX

	window.MainContainer = MainContainer

class Observer
	constructor: ->
		@subscribers = []
	notify: (item) ->
		subscriber.callback(item) for subscriber in @subscribers when subscriber.item is item
	subscribe: (to, onNotify) ->
		@subscribers.push {'item':to, 'callback':onNotify}

class GameObserver extends Observer
	@NEXT_SCENE: 'next_scene'
	@PREV_SCENE: 'prev_scene'
	@START: 'start'
	window.GameObserver = GameObserver

class Game
	constructor: (game) ->
		@initialize game
	Game.prototype = new createjs.EventDispatcher()
	Game::EventDispatcher_initialize = Game::initialize
	Game::initialize = (game) ->
		@observer = new GameObserver()
		@setHeader(game.header).setInstructions(game.instructions).setScore(game.score).setScenes(game.scenes)
	setHeader: (header) ->
		lib.mainContainer.insertBitmap 'header', header, d2oda.stage.w / 2, 0, 'tc'
		TweenLite.from lib.header, 0.5, {alpha: 0, y: lib.header.y - 20}
		@
	setInstructions: (instructions) ->
		lib.instructions = new Instructions instructions
		lib.mainContainer.add lib.instructions, false
		if instructions.states.length > 1
			@observer.subscribe GameObserver.NEXT_SCENE, lib.instructions.next
			@observer.subscribe GameObserver.PREV_SCENE, lib.instructions.prev
		@
	setScore: (score) ->
		lib.score = new Score score
		lib.mainContainer.add lib.score
		@
	setScenes: (scenes) ->
		lib.scenes = new SceneStack scenes
		lib.mainContainer.add lib.scenes, false
		@observer.subscribe GameObserver.NEXT_SCENE, lib.scenes.next
		@observer.subscribe GameObserver.PREV_SCENE, lib.scenes.prev
		@
	start: ->
		lib.scene.init()
		lib.scenes.addEventListener 'complete', @finish
	finish: ->
		oda.endGame()
	nextScene: =>
		@observer.notify GameObserver.NEXT_SCENE
	prevScene: =>
		@observer.notify GameObserver.PREV_SCENE
	window.Game = Game
###

COMPONENTS CLASSES

###
class ComponentGroup
	constructor: (opts) ->
		Module.extend @, d2oda.methods
		@name = opts.id
		@group = opts.group	
	update: (opts) ->
		switch opts.type
			when 'blink'
				for item in @group
					TweenMax.killTweensOf lib[item]
					TweenLite.killTweensOf lib[item]
					lib[item].alpha = 1
				lib[opts.target].blink()
	isComplete: ->
		true
	window.ComponentGroup = ComponentGroup

class ComponentObserver extends Observer
	@UPDATED: 'component_update'
	window.ComponentObserver = ComponentObserver

class Component
	constructor: ->
	next: ->
	prev: ->
	update: ->

class Score extends Component
	Score.prototype = new createjs.Container()
	Score::Container_initialize = Score::initialize
	constructor: (opts) ->
		@initialize opts
	Score::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = opts.x
		@y = opts.y
		@counter = opts.init
		@type = opts.type
		switch opts.type
			when 'points'
				@block = off
				front = @createBitmap 'front', opts.aimg, 0, 0
				back = @createBitmap 'back', opts.bimg, 0, 0
				@count = @createText 'init', opts.init, '24px Quicksand', opts.acolor, 0, 0, 'center'
				@total = @createText 'total', opts.total, '24px Quicksand', opts.bcolor, 0, 0, 'center'
				back.x = front.width / 4 * 2
				back.y = front.height / 4 * 2
				@total.x = back.x + back.width / 2
				@total.y = back.y + back.height / 2 - @total.getMeasuredHeight() / 2
				@count.x = front.x + front.width / 2
				@count.y = front.y + front.height / 2 - @count.getMeasuredHeight() / 2
				@addChild back, front, @count, @total
			when 'clock'
				front = @createBitmap 'front', opts.aimg, 0, 0
				@count = @createText 'init', opts.init, '24px Quicksand', opts.acolor, 0, 0, 'center'
				@count.x = front.x + front.width / 2
				@count.y = front.y + front.height / 2 - @count.getMeasuredHeight() / 2
				@addChild front, @count
	start: ->
		@interval = setInterval @minusOne, 1000
	stop: ->
		clearInterval @interval
	reset: ->
		@counter = 0
		@updateCount @counter
	minusOne: =>
		@counter--
		@updateCount @counter
		if @counter is 0
			@stop()
			@dispatchEvent {type: 'count_complete' }
	plusOne: ->
		if @block is on
			@block = off
			return
		createjs.Sound.play 's/good' 
		@counter++
		@updateCount @counter
	enableBlock: ->
		@block = on
	updateTotal: (txt) ->
		@total.text = txt
	updateCount: (txt) ->
		@count.text = txt
	window.Score = Score

class Instructions extends Component
	Instructions.prototype = new createjs.Container()
	Instructions::Container_initialize = Instructions::initialize
	constructor: (opts) ->
		@initialize opts
	Instructions::initialize = (opts) ->
		@Container_initialize()
		@x = opts.x
		@y = opts.y
		@states = opts.states
		@currentState = 0
		triangle = new createjs.Shape()
		triangle.graphics.beginFill('#bcd748').moveTo(0,0).lineTo(8,5).lineTo(0,10)
		triangle.y = 5
		@label = new createjs.Text @states[@currentState].text, '16px Roboto', '#000'
		@label.x = 14
		@addChild triangle, @label
		TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
	playSound: ->
		if not @states[@currentState].played
			@states[@currentState].played = true
			createjs.Sound.play @states[@currentState].sound
	next: =>
		@currentState++
		if @states.length > 1 and @currentState < @states.length
			@playSound()
			@label.text = @states[@currentState].text
			TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
		else
			@dispatchEvent {type:'complete'}
	prev: =>
		@currentState--
		if @currentState >= 0
			@label.text = @states[@currentState].text
			TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
		else
			@currentState++
	window.Instructions = Instructions

class ImageContainer extends Component
	ImageContainer.prototype = new createjs.Container()
	ImageContainer::Container_initialize = ImageContainer::initialize
	constructor: (opts) ->
		@initialize opts
	ImageContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		align = opts.align ? ''
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		b = @createBitmap @name, opts.id, 0, 0, align
		@width = b.width
		@height = b.height
		@mouseEnabled = true
		@add b, false
	isComplete: ->
		TweenLite.killTweensOf @
		TweenMax.killTweensOf @
		@alpha = 1
		true

class DragContainer extends Component
	DragContainer.prototype = new createjs.Container()
	DragContainer::Container_initialize = DragContainer::initialize
	constructor: (opts) ->
		@initialize opts
	DragContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@pos = {x: @x, y: @y}

		@index = opts.index
		@target = lib[opts.target]
		@droptargets = new Array()
		b = @createBitmap @name, opts.id, 0, 0
		@width = b.width
		@height = b.height
		@setPosition opts.align
		switch opts.afterSuccess
			when 'hide' then @afterSuccess = @hide
			when 'inplace' then @afterSuccess = @putInPlace
			when 'return' then @afterSuccess = @returnToPlace
			when 'origin' then @afterSuccess = @setInOrigin
		switch opts.afterFail
			when 'hide' then @afterFail = @hide
			when 'inplace' then @afterSuccess = @putInPlace
			when 'return' then @afterFail = @returnToPlace
			when 'origin' then @afterFail = @setInOrigin
		@add b, false
		
		if @target then @target.observer.subscribe ComponentObserver.UPDATED, @update
		@addEventListener 'mousedown', @handleMouseDown
	update: (opts) =>
		@droptargets = @target.droptargets
	handleMouseDown: (e) =>
		posX = e.stageX / d2oda.stage.r
		posY = e.stageY / d2oda.stage.r
		offset = x: posX - @x, y: posY - @y
		@x = posX - offset.x
		@y = posY - offset.y
		e.addEventListener 'mousemove', (ev)=>
			posX = ev.stageX / d2oda.stage.r
			posY = ev.stageY / d2oda.stage.r
			@x = posX - offset.x
			@y = posY - offset.y
			false
		e.addEventListener 'mouseup', (ev)=>
			if @droptargets and @droptargets.length > 0
				@evaluateDrop e
			else
				@dispatchEvent {type:'drop'}
			false
		false
	evaluateDrop: (e) ->
		target = null
		dropped = false
		for drop in @droptargets
			pt = drop.globalToLocal oda.stage.mouseX, oda.stage.mouseY
			if drop.hitTest pt.x, pt.y
				target = drop
				dropped = true
		if dropped
			target.evaluate @
			@dispatchEvent {type: 'dropped', drop: target}
		else
			@returnToPlace @alpha, @scaleX, @scaleY

class LetterDragContainer extends Component
	LetterDragContainer.prototype = new createjs.Container()
	LetterDragContainer::Container_initialize = LetterDragContainer::initialize
	constructor: (opts) ->
		@initialize opts
	LetterDragContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@pos = {x: @x, y: @y}

		@index = opts.index
		@target = lib[opts.target]
		@droptargets = new Array()
		t = @createText 'txt', opts.text, opts.font, opts.color, 0, 0
		@width = t.getMeasuredWidth()
		@height = t.getMeasuredHeight()
		switch opts.afterSuccess
			when 'hide' then @afterSuccess = @hide
			when 'inplace' then @afterSuccess = @putInPlace
			when 'return' then @afterSuccess = @returnToPlace
			when 'origin' then @afterSuccess = @setInOrigin
		switch opts.afterFail
			when 'hide' then @afterFail = @hide
			when 'inplace' then @afterSuccess = @putInPlace
			when 'return' then @afterFail = @returnToPlace
			when 'origin' then @afterFail = @setInOrigin
		hit = new createjs.Shape()
		hit.graphics.beginFill('#000').drawRect(-5, -3, t.getMeasuredWidth() + 10, t.getMeasuredHeight() + 6)
		t.hitArea = hit
		@add t, false
		
		if @target then @target.observer.subscribe ComponentObserver.UPDATED, @update
		@addEventListener 'mousedown', @handleMouseDown
	update: (opts) =>
		@droptargets = @target.droptargets
	handleMouseDown: (e) =>
		posX = e.stageX / d2oda.stage.r
		posY = e.stageY / d2oda.stage.r
		offset = x: posX - @x, y: posY - @y
		@x = posX - offset.x
		@y = posY - offset.y
		e.addEventListener 'mousemove', (ev)=>
			posX = ev.stageX / d2oda.stage.r
			posY = ev.stageY / d2oda.stage.r
			@x = posX - offset.x
			@y = posY - offset.y
			false
		e.addEventListener 'mouseup', (ev)=>
			if @droptargets and @droptargets.length > 0
				@evaluateDrop e
			else
				@dispatchEvent {type:'drop'}
			false
		false
	evaluateDrop: (e) ->
		target = null
		dropped = false
		for drop in @droptargets
			pt = drop.globalToLocal oda.stage.mouseX, oda.stage.mouseY
			if drop.hitTest pt.x, pt.y
				target = drop
				dropped = true
		if dropped
			@target.evaluate @, target
			@dispatchEvent {type: 'dropped', drop: target}
		else
			@returnToPlace @alpha, @scaleX, @scaleY

class ButtonContainer extends Component
	ButtonContainer.prototype = new createjs.Container()
	ButtonContainer::Container_initialize = ButtonContainer::initialize
	constructor: (opts) ->
		@initialize opts
	ButtonContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = opts.x
		@y = opts.y
		@index = opts.index
		@name = opts.name ? opts.id
		@scale = opts.scale ? 1
		@states = opts.states
		@currentState = 0
		@setImageText()
		if opts.target then @target = lib[opts.target]
		@addEventListener 'mouseover', =>
			TweenLite.to @, 0.5, {scaleX: 1.2, scaleY: 1.2}
		@addEventListener 'mouseout', =>
			TweenLite.to @, 0.5, {scaleX: @scale, scaleY: @scale}
		@addEventListener 'click', =>
			if opts.isFinish
				@target.evaluate()
			else if opts.isRepeat
				createjs.Sound.stop()
				createjs.Sound.play lib.scene.snd
			else
				@target.evaluate @
	setImageText: () ->
		@removeAllChildren()
		if @states[@currentState].img
			img = @states[@currentState].img
			x = img.x ? 0
			y = img.y ? 0
			align = img.align ? ''
			b = @createBitmap 'img', img.name, x, y, align
			@add b, false
		if @states[@currentState].txt
			txt = @states[@currentState].txt
			text = txt.text ? ''
			font = txt.font ? '20px Arial'
			color = txt.color ? '#333'
			x = txt.x ? 0
			y = txt.y ? 0
			align = txt.align ? ''
			t = @createText 'txt', text, font, color, x, y, align
			hit = new createjs.Shape()
			hit.graphics.beginFill('#000').drawRect(-5, -3, t.getMeasuredWidth() + 10, t.getMeasuredHeight() + 6)
			t.hitArea = hit
			@add t, false
	update: () ->
		@currentState++
		if @currentState < @states.length
			TweenLite.killTweensOf @
			@setImageText()
			@scaleX = @scale
			@scaleY = @scale
			if @states[@currentState].removeListeners
				@removeAllEventListeners()
			TweenLite.from @, 0.3, {alpha: 0}
		else
			@currentState--

class LabelContainer extends Component
	LabelContainer.prototype = new createjs.Container()
	LabelContainer::Container_initialize = LabelContainer::initialize
	constructor: (opts) ->
		@initialize opts
	LabelContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = opts.x
		@y = opts.y
		@name = opts.name ? opts.id
		font = opts.font ? 'Arial 20px'
		color = opts.color ? '#333'
		align = opts.align ? ''
		@text = @createText 'txt', '', font, color, 0, 0, align
		@add @text, false
	update: (opts) ->
		@text.text = opts.text
		@success = opts.success
		@complete = false
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	evaluate: (obj) ->
		if obj.index is @success
			@complete = true
			obj.update()
			lib.scene.success()
		else
			lib.scene.fail()
	isComplete: ->
		return @complete

class StepsContainer extends Component
	StepsContainer.prototype = new createjs.Container()
	StepsContainer::Container_initialize = StepsContainer::initialize
	constructor: (opts) ->
		@initialize opts
	StepsContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@name = opts.name ? opts.id
		@x = opts.x ? 0
		@y = opts.y ? 0
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update:(opts) ->
		@removeAllChildren()
		i = 0
		npos = 0
		for c in opts.containers
			if c.opts then gropts = c.opts else gropts = opts
			child = new StepContainer gropts, c.type, c.success, c.x, c.y
			@droptargets.push child
			@add child, false
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	evaluate: ->
		for target in @droptargets
			target.showEvaluation()
			if target.complete
				lib.score.plusOne()
		lib.scene.success false
	isComplete: ->
		true

class StepContainer extends Component
	StepContainer.prototype = new createjs.Container()
	StepContainer::Container_initialize = StepContainer::initialize
	constructor: (opts, type, success, x, y) ->
		@initialize opts, type, success, x, y
	StepContainer::initialize = (opts, type, success, x, y) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = x ? 0
		@y = y ? 0
		@width = opts.width ? opts.radius
		@height = opts.height ? opts.radius
		@success = success
		@complete = false
		switch type
			 when 'rshp'
			 	child = new createjs.Shape()
			 	child.graphics.beginFill(opts.bcolor).setStrokeStyle(opts.stroke).beginStroke(opts.scolor).drawRoundRect(0, 0, opts.width, opts.height, opts.radius)
		@add child, false
	showEvaluation: () ->
		if @complete
			@insertBitmap 'correct', 'correct', @width, @height / 2, 'ml'
		else
			@insertBitmap 'wrong', 'wrong', @width, @height / 2, 'ml'
	update: (complete = true) ->
		@complete = complete
	evaluate: (obj) ->
		obj.afterSuccess {x: @x, y: @y}
		if obj.index is @success
			@update()
		else 
			@update false

class GridContainer extends Component
	GridContainer.prototype = new createjs.Container()
	GridContainer::Container_initialize = GridContainer::initialize
	constructor: (opts) ->
		@initialize opts
	GridContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.utilities
		@x = opts.x ? 0
		@y = opts.y ? 0
		@columns = opts.columns ? 1
		@rows = opts.rows ? 1
		@uwidth = opts.uwidth ? 100
		@uheight = opts.uheight ? 100
		@name = opts.name ? opts.id
		@currentTarget = 0
		@warnings = 0
		@targets = new Array()
		if opts.label
			font = opts.label.font ? 'Arial 20px'
			color = opts.label.color ? '#333'
			align = opts.label.align ? ''
			x = opts.label.x ? 0
			y = opts.label.y ? 0
			@text = @createText 'txt', '', font, color, x, y, align
			@add @text
		@cells = if opts.mixed then @shuffle opts.cells else opts.cells
		switch opts.align
			when 'evenodd'
				currentCol = 0
				currentRow = 0
				for cell in @cells
					if currentRow % 2 is 0
						x = currentCol * @uwidth
					else
						x = ((@columns - 1) - currentCol) * @uwidth
					b = @insertBitmap cell.img, cell.img, x, currentRow * @uheight, 'mc'
					@targets.push b
					currentCol++
					if currentCol is @columns
						currentCol = 0
						currentRow++
	update: (opts) ->
		cell = @cells[@currentTarget]
		@success = cell.success
		@text.text = cell.txt
		@targets[@currentTarget].complete = false
		@blink @targets[@currentTarget]
		TweenLite.from @text, 0.3, {alpha: 0, y: @text.y - 10}
	fadeOut: (obj) ->
		TweenMax.killTweensOf obj
		TweenLite.killTweensOf obj
		TweenLite.to obj, 0.5, {alpha: 0, y: obj.y - 20}
	blink: (obj, state=on) ->
		TweenMax.killTweensOf obj
		objalpha = 1
		TweenMax.to obj, 0.5, {alpha: 0.2, repeat: -1, yoyo: true}  if state
	evaluate: (obj) ->
		if obj.index is @success
			@targets[@currentTarget].complete = true
			@fadeOut @targets[@currentTarget]
			lib.scene.success false
			createjs.Sound.play 's/good'
			@currentTarget++
		else 
			@warnings++
			lib.scene.fail()
			if @warnings is 3
				lib.score.stop()
				lib.game.nextScene()
	isComplete: ->
		for target in @targets
			if target.complete is false
				return false
		return true

class PhraseCompleterContainer extends Component
	PhraseCompleterContainer.prototype = new createjs.Container()
	PhraseCompleterContainer::Container_initialize = PhraseCompleterContainer::initialize
	constructor: (opts) ->
		@initialize opts
	PhraseCompleterContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = opts.x
		@y = opts.y
		@margin = opts.margin ? 10
		@font = opts.font ? '20px Arial'
		@fcolor = opts.fcolor ? '#333'
		@bcolor = opts.bcolor ? '#FFF'
		@scolor = opts.scolor ? '#333'
		@stroke = opts.stroke ? 3
		@name = opts.name ? opts.id
		@align = opts.align ? ''
		@currentTarget = 0
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update: (opts) ->
		@removeAllChildren()
		if opts.h2
			align = opts.h2.align ? ''
			h2 = @createText 'h2', opts.h2.text, @font, @color, opts.h2.x, opts.h2.y, align
			@add h2, false
		i = 0
		npos = 0
		for t in opts.pattern
			if t is '#tcpt'
				txt = opts.targets[i]
				h = new TextCompleterContainer txt, @font, @fcolor, @bcolor, @scolor, @stroke, npos, 5
				@droptargets.push h
				@add h, false
				npos += h.width + @margin
				i++
			else
				h = @createText 'txt', t, @font, @fcolor, npos, -5
				@add h, false
				npos += h.getMeasuredWidth() + @margin
		@width = npos
		@setPosition @align
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	evaluate: (obj) ->
		if obj.index is @droptargets[@currentTarget].success
			@droptargets[@currentTarget].complete = true
			@droptargets[@currentTarget].update()
			@currentTarget++
			if @currentTarget is @droptargets.length
				lib.scene.success()
		else
			lib.scene.fail()
	isComplete: ->
		for target in @droptargets
			if target.complete is false
				return false
		return true

class TextCompleterContainer extends Component
	TextCompleterContainer.prototype = new createjs.Container()
	TextCompleterContainer::Container_initialize = TextCompleterContainer::initialize
	constructor: (opts, font, fcolor, bcolor, scolor, stroke, x, y) ->
		@initialize opts, font, fcolor, bcolor, scolor, stroke, x, y
	TextCompleterContainer::initialize = (opts, font, fcolor, bcolor, scolor, stroke, x, y) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = x
		@y = y
		@success = opts.success ? opts.text
		@text = @createText 'txt', opts.text, font, fcolor, 0, -5
		@width = opts.width ? @text.getMeasuredWidth()
		@height = @text.getMeasuredHeight()
		@complete = false
		back = new createjs.Shape()
		back.graphics.f(bcolor).dr(0, 0, @width, @height).ss(stroke).s(scolor).mt(0, @height).lt(@width, @height)
		@add back, false
	update: (opts) ->
		@add @text, false
		TweenLite.from @, 0.3, {alpha: 0}

class WordCompleterContainer extends Component
	WordCompleterContainer.prototype = new createjs.Container()
	WordCompleterContainer::Container_initialize = WordCompleterContainer::initialize
	constructor: (opts) ->
		@initialize opts
	WordCompleterContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.utilities
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@uwidth = opts.uwidth ? 25
		@bcolor = opts.bcolor ? '#FFF'
		@scolor = opts.scolor ? '#333'
		@fcolor = opts.fcolor ? '#333'
		@font = opts.font ? '20px Arial'
		@stroke = opts.stroke ? 3
		@align = opts.align ? ''
		@margin = opts.margin ? 5
		@currentTarget = 0
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update: (opts) ->
		@removeAllChildren()
		@target = opts.target
		word = opts.word.split ''
		scrambledWord = @shuffle word
		
		i = 0
		npos = 0
		for letter in word
			#create container
			if letter is ' '
				npos+= @margin
			else
				opts = {text: letter, width: @uwidth}
				h = new TextCompleterContainer opts, @font, @fcolor, @bcolor, @scolor, @stroke, npos, 5
				@droptargets.push h
				@add h, false
				npos += @uwidth + @margin
			i++

		@width = npos
		@setPosition @align

		i = 0
		npos = 0
		for scrambledLetter in scrambledWord
			#create drag
			if scrambledLetter isnt ' '
				opts = {id:"l#{i}", x: npos, y: -50, index: scrambledLetter, target: @name, text: scrambledLetter, font: @font, color: @fcolor, afterSuccess: 'hide',afterFail: 'return'}
				d = new LetterDragContainer opts
				@add d, false
				npos += @uwidth + @margin
				i++
			
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	evaluate: (drag, target)->
		if drag.index is target.success
			target.complete = true
			target.update()
			drag.afterSuccess()
			@currentTarget++
			if @currentTarget is @droptargets.length
				lib[@target].fadeOut()
				lib.scene.success()
		else
			drag.afterFail()
			lib.scene.fail()
	isComplete: ->
		for target in @droptargets
			if target.complete is false
				return false
		return true

class ImageWordCompleterContainer extends Component
	ImageWordCompleterContainer.prototype = new createjs.Container()
	ImageWordCompleterContainer::Container_initialize = ImageWordCompleterContainer::initialize
	constructor: (opts) ->
		@initialize opts
	ImageWordCompleterContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = opts.x
		@y = opts.y
		@margin = opts.margin
		@uwidth = opts.uwidth
		@uheight = opts.uheight
		@bcolor = opts.bcolor
		@scolor = opts.scolor
		@stroke = opts.stroke
		@name = opts.name ? opts.id
		@align = opts.align ? ''
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update: (opts) ->
		@removeAllChildren()
		i = 0
		for child in opts.containers
			npos = i * (@uwidth + @margin)
			container = new ImageCompleterContainer child, npos, @uwidth, @uheight, @bcolor, @scolor, @stroke
			@droptargets.push container
			@add container, false
			i++
		@width = (@uwidth + @margin) * (i - 1)
		switch @align
			when 'center'
				@regX = @width / 2
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	isComplete: ->
		for target in @droptargets
			if target.complete is false
				return false
		return true

class ImageCompleterContainer extends Component
	ImageCompleterContainer.prototype = new createjs.Container()
	ImageCompleterContainer::Container_initialize = ImageCompleterContainer::initialize
	constructor: (opts, x, width, height, bgcolor, stcolor, stsize) ->
		@initialize opts, x, width, height, bgcolor, stcolor, stsize
	ImageCompleterContainer::initialize = (opts, x = 0, width = 100, height = 100, bgcolor = '#FFF', stcolor = '#333', stsize = 3) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = x
		@success = opts.success
		@image = opts.img
		@name = opts.name ? opts.id
		@width = width
		@height = height
		@complete = false
		back = new createjs.Shape()
		back.graphics.f(bgcolor).dr(0, 0, width, height).ss(stsize).s(stcolor).mt(0, height).lt(width, height)
		@add back, false
	update: (opts) ->
		b = @createBitmap @image, @image, 0, -5
		if b.width > b.height
			b.scaleX = b.scaleY = @width/b.width
		else
			b.scaleX = b.scaleY = @height/b.height
		@add b, false
		TweenLite.from @, 0.3, {alpha: 0}
	evaluate: (obj) ->
		if obj.index is @success
			@complete = true
			@update()
			obj.afterSuccess()
			lib.scene.success()
		else
			obj.afterFail()
			lib.scene.fail()

class SceneStack extends Component
	SceneStack.prototype = new createjs.Container()
	SceneStack::Container_initialize = SceneStack::initialize
	constructor: (scenes) ->
		@initialize scenes
	SceneStack::initialize = (scenes) ->
		@Container_initialize()
		@stack = []
		@currentScene = 0
		for s in scenes
			scene = new Scene s
			scene.visible = false
			@addChild scene
			@stack.push scene
		@setCurrent()
		TweenLite.from @, 1, {alpha: 0}
	next: =>
		@currentScene++
		if @stack.length > 1 and @currentScene < @stack.length
			@stack[@currentScene - 1].visible = false
			@setCurrent()
			lib.scene.init()
			TweenLite.from @, 1, {alpha: 0}
		else
			TweenLite.to @, 1, {alpha: 0, delay: 1, onComplete: @lastScene}
	prev: =>
		@currentScene--
		if @currentScene >= 0
			@stack[@currentScene + 1].visible = false
			@setCurrent()
			lib.scene.init()
			TweenLite.from @, 1, {alpha: 0}
		else
			@currentScene++
	lastScene: =>
		@dispatchEvent {type: 'complete'}
	setCurrent: ->
		lib.scene = @stack[@currentScene]
		lib.scene.visible = true
	window.SceneStack = SceneStack

class SceneFactory
	makeChild: (opts) ->
		switch opts.type
			#containers
			when 'drg' then new DragContainer opts
			when 'grd' then new GridContainer opts
			when 'img' then new ImageContainer opts
			when 'lbl' then new LabelContainer opts
			when 'btn' then new ButtonContainer opts
			when 'stps' then new StepsContainer opts
			when 'wcpt' then new WordCompleterContainer opts
			when 'pcpt' then new PhraseCompleterContainer opts
			when 'iwcpt' then new ImageWordCompleterContainer opts

			#groups
			when 'grp' then new ComponentGroup opts
	window.SceneFactory = SceneFactory

class SceneObserver extends Observer
	@NEXT_STEP: 'next_step'
	@COMPLETE: 'scene_complete'
	window.SceneObserver = SceneObserver

class Scene extends Component
	Scene.prototype = new createjs.Container()
	Scene::Container_initialize = Scene::initialize
	constructor: (scene) ->
		@initialize scene
	Scene::initialize = (scene) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@factory = new SceneFactory()
		@observer = new SceneObserver()
		@currentStep = 0
		answers = scene.answers.collection[..]
		
		if scene.answers.mixed is true
			@answers = d2oda.utilities.shuffle answers
		else
			@answers = answers

		switch scene.answers.type
			when 'steps' then @observer.subscribe SceneObserver.NEXT_STEP, @next

		for container in scene.containers
			c = @factory.makeChild container
			@add c
		
		for group in scene.groups
			g = @factory.makeChild group
			lib[group.id] = g
	init: ->
		if lib.score.type is 'clock'
			lib.score.start()
			lib.score.addEventListener 'count_complete', lib.game.nextScene
		@setStep()
	success: (plusOne = true) ->
		createjs.Sound.stop()
		if plusOne then lib.score.plusOne()
		step = @answers[@currentStep]
		for target in step
			if target.name isnt 'snd' and lib[target.name].isComplete() is false
				return false
		@nextStep()
	fail: ->
		lib.score.enableBlock()
		lib.mainContainer.warning()
	next: =>
		@currentStep++
		if @currentStep >= @answers.length
			@delay 1000, ->
				lib.game.observer.notify GameObserver.NEXT_SCENE
		else
			@delay 1000, @setStep
	setStep: =>
		step = @answers[@currentStep]
		for target in step
			switch target.name
				when 'snd'
					@snd = target.opts.id
					createjs.Sound.stop()
					createjs.Sound.play target.opts.id
					false
				else
					lib[target.name].update target.opts
	nextStep: ->
		console.log 'next step'
		@observer.notify SceneObserver.NEXT_STEP
	window.Scene = Scene
