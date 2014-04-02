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
		@on 'mousedown', @handleMouseDown
	@endDragListener = =>
		@off 'mousedown', @handleMouseDown
	Behaviors

window.d2oda.actions ?= class Actions
	@fadeOut = (ignoreY = false, ignoreCurrentAlpha = false) ->
		TweenMax.killTweensOf @
		TweenLite.killTweensOf @
		if @alpha is 0 and ignoreCurrentAlpha is false
			if ignoreY
				TweenLite.from @, 0.5, {alpha: 1}
			else
				@y -= 20
				TweenLite.from @, 0.5, {alpha: 1, y: @y + 20}
		else
			if ignoreY
				TweenLite.to @, 0.5, {alpha: 0}
			else
				@y += 20 
				TweenLite.to @, 0.5, {alpha: 0, y: @y - 20}
	@fadeIn = (ignoreY = false, ignoreCurrentAlpha = false) ->
		TweenMax.killTweensOf @
		TweenLite.killTweensOf @
		if @alpha is 1 and ignoreCurrentAlpha is false
			if ignoreY
				TweenLite.from @, 0.5, {alpha: 0} 
			else
				@y -= 20
				TweenLite.from @, 0.5, {alpha: 0, y: @y + 20}
		else 
			if ignoreY
				TweenLite.to @, 0.5, {alpha: 1}
			else
				@y += 20
				TweenLite.to @, 0.5, {alpha: 1, y: @y - 20}
	@pulse = (state=on) ->
		TweenMax.killTweensOf @
		TweenLite.killTweensOf @
		@alpha = 1
		TweenMax.to @, 0.5, {scaleX: 0.8, scaleY: 0.8, repeat: -1, yoyo: true}  if state
	@blink = (state=on) ->
		TweenMax.killTweensOf @
		TweenLite.killTweensOf @
		@alpha = 1
		TweenMax.to @, 0.5, {alpha: 0.2, repeat: -1, yoyo: true}  if state
	@hide = ->
		@visible = false
	@setInOrigin = ->
		@x = @pos.x
		@y = @pos.y
	@putInPlace = (position, alpha=1, scaleX=1, scaleY=1) ->
		TweenMax.killTweensOf @
		TweenLite.killTweensOf @
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: position.x, y: position.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	@returnToPlace = (alpha=1, scaleX=1, scaleY=1) ->
		TweenMax.killTweensOf @
		TweenLite.killTweensOf @
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
		animation = new createjs.Sprite sprite
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

window.d2oda.evaluator ?= class Evaluator
	@success = null
	@evaluate = (type, dispatcher, target) ->
		console.log type, dispatcher, target
		if type instanceof Function
			type(dispatcher, target)
			return
		switch type
			when 'repeat' then @evaluateRepeat()
			when 'finish' then @evaluateFinish(target)
			when 'global_01' then @evaluateGlobal01(dispatcher)
			when 'click_O1' then @evaluateClick01(dispatcher, target)
			when 'click_O1_01' then @evaluateClick01_01(dispatcher, target)
			when 'click_02' then @evaluateClick02(dispatcher, target)
			when 'click_03' then @evaluateClick03(dispatcher, target)
			when 'drop_01' then @evaluateDrop01(dispatcher, target)
			when 'drop_02' then @evaluateDrop02(dispatcher, target)
			when 'drop_02_01' then @evaluateDrop02_01(dispatcher, target)
			when 'drop_02_02' then @evaluateDrop02_02(dispatcher, target)
			when 'drop_03' then @evaluateDrop03(dispatcher, target)
			when 'drop_04' then @evaluateDrop04(dispatcher, target)
			when 'clon_01' then @evaluateClon01(dispatcher, target)
			when 'switch_01' then @evaluateSwitch01(dispatcher, target)
			when 'choose_01' then @evaluateChoose01(dispatcher)
			when 'show_choose_01' then @evaluateShowChoose01(dispatcher, target)
			when 'hangman_click_01' then @evaluateHangmanClick01(dispatcher, target)
			when 'show_click_01' then @evaluateShowClick01(dispatcher, target)
			when 'phrase_drop_01' then @evaluatePhraseDrop01(dispatcher, target)
			when 'phrase_drop_02' then @evaluatePhraseDrop02(dispatcher, target)
			when 'phrase_drop_03' then @evaluatePhraseDrop03(dispatcher, target)
			when 'sprite_drop_01' then @evaluateSpriteDrop01(dispatcher, target)
			when 'word_drop_01' then @evaluateWordDrop01(dispatcher, target)
			when 'word_complete_01' then @evaluateWordComplete01(dispatcher, target)
	@evaluateRepeat = () ->
		createjs.Sound.stop()
		createjs.Sound.play lib.scene.snd
	@evaluateFinish = (target) ->
		if lib[target].droptargets
			for drop in lib[target].droptargets
				drop.showEvaluation()
				if drop.complete
					lib.score.plusOne()
		else if lib[target].group
			for tgt in lib[target].group
				if lib[tgt].complete
					lib.score.plusOne()
		lib.scene.success false
	@evaluateGlobal01 = (dispatcher) ->
		if lib[dispatcher].index is @success
			lib.scene.success()
		else
			lib.scene.fail()
	@evaluateGlobal02 = (dispatcher) ->
		if lib[dispatcher].index is @success
			lib.scene.success()
			lib.scene.nextStep()
		else
			lib.scene.fail()
	@evaluateHangmanClick01 = (dispatcher, target) ->
		failed = true
		lib[dispatcher].visible = off
		for droptarget in lib[target].droptargets
			if lib[dispatcher].index is droptarget.success
				droptarget.update {complete: true}
				failed = false
		if failed
			lib.scene.fail()
			lib.hangman.current++
			if lib.hangman.current >= lib.hangman.group.length
				lib.hangman.current = 0
				lib.scene.nextStep() 
			else
				lib.hangman.update {type:'fadeIn', target: lib.hangman.group[lib.hangman.current]}
		else
			complete = true
			for droptarget in lib[target].droptargets
				complete = false if not droptarget.complete
		if complete then lib.scene.success()
	@evaluateShowClick01 = (dispatcher, target) ->
		lib[target].update {type:'fadeIn', target: lib[dispatcher].index}
	@evaluateWordDrop01 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.complete = true
			target.update()
			lib[dispatcher].afterSuccess()
			target.parent.currentTarget++
			if target.parent.currentTarget is target.parent.droptargets.length
				lib[target.parent.target][target.parent.fx]()
				lib.scene.success()
				target.parent.onComplete()
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluateWordComplete01 = (dispatcher, target) ->
		index = lib[dispatcher].oncomplete.index
		lib[target].words[index].enabled = on
	@evaluateClick01 = (dispatcher, target) ->
		answer = lib[dispatcher].index
		droptargets = lib[target].droptargets
		currentTarget = lib[target].currentTarget
		if answer is droptargets[currentTarget].success
			droptargets[currentTarget].complete = true
			droptargets[currentTarget].update()
			lib[target].currentTarget++
			if lib[target].currentTarget is droptargets.length
				lib.scene.success()
		else
			lib.scene.fail()
	@evaluateClick01_01 = (dispatcher, target) ->
		answer = lib[dispatcher].index
		droptargets = lib[target].droptargets
		currentTarget = lib[target].currentTarget
		if answer is droptargets[currentTarget].success
			droptargets[currentTarget].complete = true
			droptargets[currentTarget].update()
			lib[target].currentTarget++
			if lib[target].currentTarget is droptargets.length
				#lib.scene.success()
				next = lib[target].nextGroup
				lib.score.plusOne()
				createjs.Sound.play 's/good'
				lib[next].setInvisible false
		else
			lib.scene.fail()
	@evaluateClick02 = (dispatcher, target) ->
		if lib[dispatcher].index is lib[target].success
			lib[target].complete = true
			lib[dispatcher].updateState()
			lib.scene.success()
		else
			lib.scene.fail()
	@evaluateClick03 = (dispatcher, target) ->
		targets = lib[target].targets
		currentTarget = lib[target].currentTarget		
		if lib[dispatcher].index is lib[target].success
			targets[currentTarget].complete = true
			lib[target].fadeOut targets[currentTarget]
			lib.scene.success false
			createjs.Sound.play 's/good'
			lib[target].currentTarget++
		else 
			lib[target].warnings++
			lib.scene.fail()
			if lib[target].warnings is 3
				lib.score.stop()
				lib.game.nextScene()
	@evaluateDrop01 = (dispatcher, target) ->
		lib[dispatcher].afterSuccess {x: target.x, y: target.y}
		if lib[dispatcher].index is target.success
			target.update()
		else 
			target.update false
	@evaluateDrop02 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.complete = true
			target.update()
			lib[dispatcher].afterSuccess()
			lib.scene.success()
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluateDrop02_01 = (dispatcher, target) ->
		complete = true
		if lib[dispatcher].index is target.success
			target.update lib[dispatcher].label.text, true
		else 
			target.update lib[dispatcher].label.text, false
		lib[dispatcher].afterSuccess()
		for drop in lib[dispatcher].droptargets
			if drop.text.text is '' then complete = false
		if not complete then return
		for drop in lib[dispatcher].droptargets
			drop.showEvaluation()
			if drop.complete
				lib.score.plusOne()
		lib.scene.success false
	@evaluateDrop02_02 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.update {complete: true}
			lib[dispatcher].afterSuccess()
			lib.scene.success()
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluateDrop03 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.complete = true
			target.update()
			lib[dispatcher].afterSuccess()
			target.parent.currentTarget++
			if target.parent.currentTarget is target.parent.droptargets.length
				lib[target.parent.target].fadeOut()
				lib.scene.success()
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluatePhraseDrop01 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.complete = true
			target.update()
			lib[dispatcher].afterSuccess()
			target.parent.currentTarget++
			lib.score.plusOne()
			createjs.Sound.play 's/good'
			if target.parent.currentTarget is target.parent.droptargets.length
				lib.scene.success false
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluatePhraseDrop02 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.complete = true
			target.update()
			lib[dispatcher].afterSuccess()
			target.parent.currentTarget++
			if target.parent.currentTarget is target.parent.droptargets.length
				lib.scene.success()
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluatePhraseDrop03 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.complete = true
			target.update()
			lib[dispatcher].afterSuccess()
			target.parent.currentTarget++
			if target.parent.currentTarget is target.parent.droptargets.length
				target.parent.fadeOut()
				target.parent.hideLabel()
				lib.scene.success()
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluateSpriteDrop01 = (dispatcher, target) ->
		if lib[dispatcher].index is target.parent.success
			target.parent.nextStep()
			lib[dispatcher].afterSuccess()
			lib.scene.success true, false
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluateDrop04 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.update {complete:true}
			lib[dispatcher].afterSuccess()
			target.parent.evaluateWords()
		else
			lib[dispatcher].afterFail()
			lib.scene.fail()
	@evaluateClon01 = (dispatcher, target) ->
		if lib[dispatcher].index is target.success
			target.update true, lib[dispatcher].bmpid
		else
			target.update false, lib[dispatcher].bmpid
		lib[dispatcher].afterSuccess()
	@evaluateSwitch01 = (dispatcher, target) ->
		if lib[dispatcher].index is lib[target].success
			lib[target].doSwitch()
			lib.scene.success()
		else
			lib.scene.fail()
	@evaluateShowChoose01 = (dispatcher, target) ->
		TweenMax.killTweensOf lib[dispatcher]
		TweenLite.killTweensOf lib[dispatcher]
		lib[dispatcher].alpha = 1
		lib[dispatcher].scaleX = scaleY = 1
		index  = lib[dispatcher].index - 1
		if d2oda.utilities.isArray(target)
			for t in target
				i = lib[t].group[index]
				g = lib[t].update {type:'fadeIn', target:i}
	@evaluateChoose01 = (dispatcher) ->
		lib.scene.choose = lib[dispatcher].index
		lib.scene.success false
	Evaluator


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
Array::compare = (array) ->
	i = @length
	if i isnt array.length then return false
	while i-- 
		if @[i] isnt array[i] then return false
	return true;
Array::merge = (other) -> Array::push.apply @, other

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
		inst = lib.instructions.playSound 's/instructions'
		e.target.removeEventListener 'click', @initMobileInstructions
		inst.addEventListener 'complete', @initGame
		TweenLite.to lib.start, 0.3, { alpha: 0, y: lib.start.y + 20, onComplete: @removeMobileInstructions}
	removeMobileInstructions: =>
		lib.mainContainer.removeChild lib.start
	initGame: =>
		lib.game.start()
	endGame: =>
		createjs.Sound.stop()
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
		createjs.Ticker.addEventListener 'tick', @stage
		createjs.Ticker.setFPS 60
		createjs.Touch.enable @stage
		@stage.enableMouseOver(50)
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
		@current = 0
		if opts.invisible
			@setInvisible true, false
	update: (opts) ->
		console.log @name, opts
		switch opts.type
			when 'blinkAll'
				for item in @group
					lib[item].blink()
			when 'pulseAll'
				for item in @group
					lib[item].pulse()
			when 'pulse'
				for item in @group
					TweenMax.killTweensOf lib[item]
					TweenLite.killTweensOf lib[item]
				if opts.target then lib[opts.target].pulse()
			when 'blink'
				for item in @group
					TweenMax.killTweensOf lib[item]
					TweenLite.killTweensOf lib[item]
				if opts.target then lib[opts.target].blink()
			when 'fadeIn'
				for item in @group
					TweenMax.killTweensOf lib[item]
					TweenLite.killTweensOf lib[item]
					lib[item].alpha = 0
					if not opts.target
						ignoreY = opts.ignoreY ? false
						ignoreCurrentAlpha = opts.ignoreCurrentAlpha ? false
						lib[item].fadeIn ignoreY, ignoreCurrentAlpha
				if opts.target
					ignoreY = opts.ignoreY ? false
					ignoreCurrentAlpha = opts.ignoreCurrentAlpha ? false
					lib[opts.target].fadeIn ignoreY, ignoreCurrentAlpha
			when 'fadeOut'
				for item in @group
					TweenMax.killTweensOf lib[item]
					TweenLite.killTweensOf lib[item]
					if not opts.target
						ignoreY = opts.ignoreY ? false
						ignoreCurrentAlpha = opts.ignoreCurrentAlpha ? false
						lib[item].fadeOut ignoreY, ignoreCurrentAlpha
				if opts.target
					ignoreY = opts.ignoreY ? false
					ignoreCurrentAlpha = opts.ignoreCurrentAlpha ? false
					lib[opts.target].fadeOut ignoreY, ignoreCurrentAlpha
			when 'success'
				@target = opts.targetGroup
				@next = opts.nextGroup
				@success = opts.success
				lib[@target].setInvisible()
				lib[@next].setInvisible()
				@setInvisible false
			when 'choose'
				@setInvisible false
			when 'hide'
				@setInvisible()
	setInvisible: (status=true, fade=true) ->
		if status
			for item in @group
				if fade then TweenLite.to lib[item], 0.5, {alpha: 0} else lib[item].alpha = 0
		else
			for item in @group
				if fade then TweenLite.to lib[item], 0.5, {alpha: 1} else lib[item].alpha = 1
	doSwitch: ->
		lib[@target].update {type:'fadeIn', target: @success}
		lib[@next].setInvisible false
		@setInvisible()
	doChoose: (choosenone) ->
		@choosen = choosenone
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
		createjs.Sound.play 's/good' 
		if @block is on
			@block = off
			return
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
		@playing = false
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
			@playing = true
			@states[@currentState].played = true
			snd = createjs.Sound.play @states[@currentState].sound
			snd.addEventListener 'complete', @instructionsComplete
			snd
	next: =>
		@currentState++
		if @states.length > 1 and @currentState < @states.length
			@label.text = @states[@currentState].text
			TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
			@playSound()
	prev: =>
		@currentState--
		if @currentState >= 0
			@label.text = @states[@currentState].text
			TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
		else
			@currentState++
	instructionsComplete: =>
		@playing = false
		@dispatchEvent {type:'complete'}
	window.Instructions = Instructions

class WriteContainer extends Component
	WriteContainer.prototype = new createjs.Container()
	WriteContainer::Container_initialize = WriteContainer::initialize
	constructor: (opts) ->
		@initialize opts
	WriteContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		@x = opts.x
		@y = opts.y
		@name = opts.name ? opts.id
		font = opts.font ? 'Arial 20px'
		fcolor = opts.color ? '#333'
		@stroke = opts.stroke ? 3
		@scolor = opts.scolor ? '#333'
		@bcolor = opts.bcolor ? '#FFF'
		align = opts.align ? ''
		@mainText = @createText '#{@name}_main', '', font, fcolor, 0, 0, align
		@pastText = @createText '#{@name}_past', '', font, fcolor, 0, @mainText.getMeasuredHeight() + opts.margin, align
		@pastText.text = ''
		@back = new createjs.Shape()
		@back.y = @mainText.getMeasuredHeight() + opts.margin
		@add @back, false
		@add @pastText, false
		@add @mainText, false
		@addEventListener 'click', @openPrompt
	openPrompt: =>
		verb = prompt "Enter the past simple form of #{@mainText.text}"
		@pastText.text = verb
		if verb is @success
			@complete = true
	update: (opts) ->
		@pastText.text = opts.success
		@mainText.text = opts.text
		@success = opts.success
		@complete = false
		@back.graphics.c().f(@bcolor).dr(0, 0, @pastText.getMeasuredWidth(), @pastText.getMeasuredHeight()).ss(@stroke).s(@scolor).mt(0, @pastText.getMeasuredHeight()).lt(@pastText.getMeasuredWidth(), @pastText.getMeasuredHeight())
		@back.x = -@pastText.getMeasuredWidth() / 2
		@pastText.text = ''
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	isComplete: ->
		true

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
		@scaleX = opts.scale ? 1
		@scaleY = opts.scale ? 1
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

class TextContainer extends Component
	TextContainer.prototype = new createjs.Container()
	TextContainer::Container_initialize = TextContainer::initialize
	constructor: (opts) ->
		@initialize opts
	TextContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		font = opts.font ? '20px Arial'
		fcolor = opts.fcolor ? '#333'
		align = opts.align ? ''
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@scaleX = opts.scale ? 1
		@scaleY = opts.scale ? 1
		t = @createText @name, opts.text, font, fcolor, 0, 0, align
		if opts.lineWidth then t.lineWidth = opts.lineWidth
		@width = t.getMeasuredWidth()
		@height = t.getMeasuredHeight()
		@mouseEnabled = true
		@add t, false
	isComplete: ->
		TweenLite.killTweensOf @
		TweenMax.killTweensOf @
		@alpha = 1
		true

class SpriteContainer extends Component
	SpriteContainer.prototype = new createjs.Container()
	SpriteContainer::Container_initialize = SpriteContainer::initialize
	constructor: (opts) ->
		@initialize opts
	SpriteContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		align = opts.align ? ''
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@scaleX = opts.scale ? 1
		@scaleY = opts.scale ? 1
		@sprite = @createSprite "sp_#{@name}", opts.imgs, opts.frames, 0, 0, align
		@width = @sprite.width
		@height = @sprite.height
		@mouseEnabled = true
		@droptargets = new Array()
		@observer = new ComponentObserver()
		@add @sprite, false
	prevFrame: ->
		@sprite.currentFrame--
	nextFrame: ->
		@sprite.currentFrame++
	nextStep: ->
		if @storyboard.length > 0 
			@sprite.gotoAndStop @storyboard[@sprite.currentFrame]
			TweenLite.from @, 0.3, {alpha: 0}
	goto: (frame) ->
		@sprite.gotoAndStop frame
	update:(opts) ->
		@droptargets = [@sprite]
		@success = opts.success
		@storyboard = opts.storyboard
		if opts.goto then @goto opts.goto
		@observer.notify ComponentObserver.UPDATED
	isComplete: ->
		TweenLite.killTweensOf @
		TweenMax.killTweensOf @
		if @alpha isnt 0 then @alpha = 1
		@sprite.currentFrame > 0

class DragContainer extends Component
	DragContainer.prototype = new createjs.Container()
	DragContainer::Container_initialize = DragContainer::initialize
	constructor: (opts) ->
		@initialize opts
	DragContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		Module.extend @, d2oda.utilities
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@pos = {x: @x, y: @y}
		@index = opts.index
		@eval = opts.eval
		@droptargets = new Array()
		b = @createBitmap @name, opts.id, 0, 0
		@bmpname = opts.name
		@bmpid = opts.id
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
			when 'inplace' then @afterFail = @putInPlace
			when 'return' then @afterFail = @returnToPlace
			when 'origin' then @afterFail = @setInOrigin
		@add b, false
		if @isArray opts.target 
			@target = opts.target
		else
			@target = lib[opts.target]
		if @target 
			if @isArray @target
				for t in @target
					lib[t].observer.subscribe ComponentObserver.UPDATED, @update
			else 
				@target.observer.subscribe ComponentObserver.UPDATED, @update
		@on 'mousedown', @handleMouseDown
	update: (opts) =>
		if @isArray @target
			alldrops = new Array()
			for t in @target
				alldrops.merge lib[t].droptargets
			@droptargets = alldrops
		else
			@droptargets = @target.droptargets
	handleMouseDown: (e) =>
		posX = e.stageX / d2oda.stage.r
		posY = e.stageY / d2oda.stage.r
		offset = x: posX - @x, y: posY - @y
		@x = posX - offset.x
		@y = posY - offset.y
		@on 'pressmove', (ev)=>
			posX = ev.stageX / d2oda.stage.r
			posY = ev.stageY / d2oda.stage.r
			@x = posX - offset.x
			@y = posY - offset.y
			false
		@on 'pressup', (ev)=>
			@removeAllEventListeners 'pressmove'
			@removeAllEventListeners 'pressup'
			if @droptargets and @droptargets.length > 0
				@evaluateDrop e
			else
				@dispatchEvent {type:'drop'}
			false
		false
	evaluateDrop: (e) =>
		target = null
		dropped = false
		for drop in @droptargets
			pt = drop.globalToLocal oda.stage.mouseX, oda.stage.mouseY
			if drop.hitTest pt.x, pt.y
				if drop instanceof createjs.Sprite
					if drop.parent.alpha > 0
						target = drop
						dropped = true
				else
					target = drop
					dropped = true
		if dropped
			d2oda.evaluator.evaluate @eval, @name, target
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
		Module.extend @, d2oda.actions
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.utilities
		@x = opts.x
		@y = opts.y
		@txtFont = '20px Arial'
		@txtColor = '#333'
		@txtAlign = 'left'
		@index = opts.index
		@name = opts.name ? opts.id
		@scale = opts.scale ? 1
		@states = opts.states
		@currentState = 0
		@overTween = opts.overTween ? true
		@setImageText @states[@currentState].img, @states[@currentState].txt
		@alpha = opts.alpha ? 1
		if @isArray opts.target 
			@target = opts.target
		else
			@target = lib[opts.target]
		if opts.target then @target = lib[opts.target]
		if @overTween
			@addEventListener 'mouseover', =>
				if opts.overScale
					TweenLite.to @, 0.5, {scaleX: opts.overScale, scaleY: opts.overScale}
				else
					TweenLite.to @, 0.5, {scaleX: 1.2, scaleY: 1.2}
			@addEventListener 'mouseout', =>
				TweenLite.to @, 0.5, {scaleX: @scale, scaleY: @scale}
		@addEventListener 'click', =>
			if opts.isRepeat
				d2oda.evaluator.evaluate 'repeat'
			else if opts.isFinish
				d2oda.evaluator.evaluate 'finish', null, opts.target
			else
				d2oda.evaluator.evaluate opts.eval, @name, opts.target
	setImageText: (img, txt) ->
		@removeAllChildren()
		@alpha = 1
		if img
			x = img.x ? 0
			y = img.y ? 0
			align = img.align ? ''
			b = @createBitmap '#{@name}_img', img.name, x, y, align
			if img.scale then b.scaleX = b.scaleY = img.scale
			@add b, false
		if txt
			text = txt.text ? ''
			@txtFont = txt.font ? @txtFont
			@txtColor = txt.color ? @txtColor
			x = txt.x ? 0
			y = txt.y ? 0
			@txtAlign = txt.align ? @txtAlign
			t = @createText '#{@name}_txt', text, @txtFont, @txtColor, x, y, @txtAlign
			if txt.lineWidth then t.lineWidth = txt.lineWidth
			hit = new createjs.Shape()
			hit.graphics.beginFill('#000').drawRect(-5, -3, t.getMeasuredWidth() + 10, t.getMeasuredHeight() + 6)
			t.hitArea = hit
			@add t, false
	updateState: () ->
		@currentState++
		if @currentState < @states.length
			TweenLite.killTweensOf @
			@setImageText @states[@currentState].img, @states[@currentState].txt
			@scaleX = @scaleY = @scale
			if @states[@currentState].removeListeners
				@removeAllEventListeners()
			TweenLite.from @, 0.3, {alpha: 0}
		else
			@currentState--
	update: (opts) ->
		TweenLite.killTweensOf @
		@setImageText opts.img, opts.txt
		TweenLite.from @, 0.5, {alpha: 0}
	isComplete: ->
		true

class ChooseContainer extends Component
	ChooseContainer.prototype = new createjs.Container()
	ChooseContainer::Container_initialize = ChooseContainer::initialize
	constructor: (opts) ->
		@initialize opts
	ChooseContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = opts.x
		@y = opts.y
		@name = opts.name ? opts.id
		@target = opts.target
		@eval = opts.eval
		@label = opts.label
		@caption = opts.caption
		@bullets = opts.bullets
	update: (opts) ->
		@removeAllChildren()
		switch opts.type
			when 'img'
				opt1 = @createBitmap "#{@name}_opt1", opts.opt1, 0, 100, 'tr'
				opt1.index = 1

				opt2 = @createBitmap "#{@name}_opt2", opts.opt2, 0, 100
				opt2.index = 2				
			when 'txt'
				if opts.img
					bmp = @insertBitmap "#{@name}_img", opts.img.name, opts.img.x, opts.img.y, 'tc'
					if opts.img.scale then bmp.scaleY = bmp.scaleX = opts.img.scale
				
				lineWidth = if @bullets.lineWidth then @bullets.lineWidth else 200
				@insertText "separator", '/', @bullets.font, @bullets.color, 0, 400, 'center'

				opt1 = @createText "#{@name}_opt1", opts.opt1, @bullets.font, @bullets.color, -20, 400, 'right'
				if @bullets.lineWidth then opt1.lineWidth = @bullets.lineWidth
				hito1 = new createjs.Shape()
				hito1.graphics.beginFill('#000').drawRect(-opt1.getMeasuredWidth() - 5, -3, opt1.getMeasuredWidth() + 10, opt1.getMeasuredHeight() + 6)
				opt1.hitArea = hito1
				opt1.index = 1

				opt2 = @createText "#{@name}_opt2", opts.opt2, @bullets.font, @bullets.color, 20, 400, 'left'
				if @bullets.lineWidth then opt2.lineWidth = @bullets.lineWidth
				hito2 = new createjs.Shape()
				hito2.graphics.beginFill('#000').drawRect(-5, -3, opt2.getMeasuredWidth() + 10, opt2.getMeasuredHeight() + 6)
				opt2.hitArea = hito2
				opt2.index = 2
				
		@add opt1
		opt1.addEventListener 'mouseover', =>
			TweenLite.to opt1, 0.5, {alpha: 0.5}
		opt1.addEventListener 'mouseout', =>
			TweenLite.to opt1, 0.5, {alpha: 1}
		opt1.addEventListener 'click', =>
			d2oda.evaluator.evaluate @eval, "#{@name}_opt1", @target

		@add opt2
		opt2.addEventListener 'mouseover', =>
			TweenLite.to opt2, 0.5, {alpha: 0.5}
		opt2.addEventListener 'mouseout', =>
			TweenLite.to opt2, 0.5, {alpha: 1}
		opt2.addEventListener 'click', =>
			d2oda.evaluator.evaluate @eval, "#{@name}_opt2", @target

		if opts.label then @insertText "#{@name}_label", opts.label, @label.font, @label.color, 0, 40, 'center'
		if opts.caption then @insertText "#{@name}_caption", opts.caption, @caption.font, @caption.color, 0, 360, 'center'
		TweenLite.from @, 0.5, {alpha: 0}
	isComplete: ->
		true

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
	isComplete: ->
		@complete

class CloneCompleterContainer extends Component
	CloneCompleterContainer.prototype = new createjs.Container()
	CloneCompleterContainer::Container_initialize = CloneCompleterContainer::initialize
	constructor: (opts) ->
		@initialize opts
	CloneCompleterContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@name = opts.name ? opts.id
		@x = opts.x ? 0
		@y = opts.y ? 0
		@uwidth = opts.uwidth ? 100
		@uheight = opts.uheight ? 100
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update:(opts) ->
		@removeAllChildren()
		@droptargets = new Array()
		i = 0
		npos = 0
		for c in opts.containers
			if c.opts then gropts = c.opts else gropts = opts
			child = new CloneContainer gropts, c.type, c.success, c.x, c.y, @uwidth, @uheight
			@droptargets.push child
			@add child, false
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	isComplete: ->
		true

class CloneContainer extends Component
	CloneContainer.prototype = new createjs.Container()
	CloneContainer::Container_initialize = CloneContainer::initialize
	constructor: (opts, type, success, x, y, width, height) ->
		@initialize opts, type, success, x, y, width, height
	CloneContainer::initialize = (opts, type, success, x, y, width, height) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@name = opts.name ? opts.id
		@x = x ? 0
		@y = y ? 0
		@width = width
		@height = height
		@success = success
		@complete = if @success isnt '#empty' then false else true
		@img = null
		child = new createjs.Shape()
		child.graphics.beginFill('#FFF').drawRect(0, 0, @width, @height)
		child.alpha = 0.1
		@add child, false
	showEvaluation: () ->
		if @complete
			@insertBitmap 'correct', 'correct', @width, @height / 2, 'ml'
		else
			@insertBitmap 'wrong', 'wrong', @width, @height / 2, 'ml'
	update: (complete = true, img = '') ->
		if @img isnt null
			@removeChild @img
		@img = @createBitmap 'img', img, @width / 2, @height / 2, 'mc'
		@img.scaleX = @img.scaleY = (@height - 5) / @img.height
		@add @img, false
		@complete = complete

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
		Module.extend @, d2oda.actions
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
		@textlist = new Array()
	hideLabel: () ->
		console.log @label
		if @label isnt '' then TweenLite.to lib[@label], 0.5, {alpha:0}
	update: (opts) ->
		@removeAllChildren()
		@label = opts.label ? ''
		if opts.h2
			align = opts.h2.align ? ''
			h2 = @createText 'h2', opts.h2.text, @font, @color, opts.h2.x, opts.h2.y, align
			@add h2, false
		if opts.nextGroup
			@nextGroup = opts.nextGroup
		i = 0
		npos = 0
		ypos = -5
		maxWidth = 0
		for t in opts.pattern
			if t is '#tcpt'
				txt = opts.targets[i]
				h = new TextCompleterContainer txt, @font, @fcolor, @bcolor, @scolor, @stroke, npos, ypos
				@droptargets.push h
				@textlist.push h
				@add h, false
				npos += h.width + @margin
				maxWidth = npos if npos > maxWidth
				i++
			else if t is '#rtn'
				h = @createText 'txt', 'BLANK', @font, @fcolor, npos, 0
				maxWidth = npos if npos > maxWidth
				npos = 0
				ypos += h.getMeasuredHeight() + h.getMeasuredHeight() * 0.2
			else
				h = @createText 'txt', t, @font, @fcolor, npos, ypos
				@textlist.push h
				@add h, false
				npos += h.getMeasuredWidth() + @margin
				maxWidth = npos if npos > maxWidth
		@width = maxWidth
		@setPosition @align
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	isComplete: ->
		for target in @droptargets
			if target.complete is false
				return false
		return true

class PhraseCloneContainer extends Component
	PhraseCloneContainer.prototype = new createjs.Container()
	PhraseCloneContainer::Container_initialize = PhraseCloneContainer::initialize
	constructor: (opts) ->
		@initialize opts
	PhraseCloneContainer::initialize = (opts) ->
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
				h = new TextCloneContainer txt, @font, @fcolor, @bcolor, @scolor, @stroke, npos, -5
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
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	isComplete: ->
		true

class TextCloneContainer extends Component
	TextCloneContainer.prototype = new createjs.Container()
	TextCloneContainer::Container_initialize = TextCloneContainer::initialize
	constructor: (opts, font, fcolor, bcolor, scolor, stroke, x, y) ->
		@initialize opts, font, fcolor, bcolor, scolor, stroke, x, y
	TextCloneContainer::initialize = (opts, font, fcolor, bcolor, scolor, stroke, x, y) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@x = x
		@y = y
		@success = opts.success ? opts.text
		@text = @createText 'txt', opts.text, font, fcolor, 0, -5
		@width = opts.width ? @text.getMeasuredWidth()
		@height = opts.height ? @text.getMeasuredHeight()
		@complete = false
		@back = new createjs.Shape()
		@back.graphics.f(bcolor).dr(0, 0, @width, @height).ss(stroke).s(scolor).mt(0, @height).lt(@width, @height)
		@add @back, false
		@add @text, false
		@text.text = ''
	setRectOutline: (bcolor, stroke, scolor) ->
		@back.graphics.f(bcolor).ss(stroke).s(scolor).dr(0, 0, @width, @height)
	showEvaluation: () ->
		if @complete
			@insertBitmap 'correct', 'correct', @width, @height / 2, 'ml'
		else
			@insertBitmap 'wrong', 'wrong', @width, @height / 2, 'ml'
	update: (text, complete = true) ->
		@complete = complete
		@text.text = text
		@text.textAlign = 'center'
		@text.x = @width / 2
		TweenLite.from @, 0.3, {alpha: 0}

class WordSearchContainer extends Component
	WordSearchContainer.prototype = new createjs.Container()
	WordSearchContainer::Container_initialize = WordSearchContainer::initialize
	constructor: (opts) ->
		@initialize opts
	WordSearchContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@name = opts.name ? opts.id
		@x = opts.x
		@y  = opts.y
		@font = opts.font ? '20px Arial'
		@fcolor = opts.fcolor ? '#333'
		@bcolor = opts.bcolor ? '#FFF'
		@shcolor = opts.shcolor ? '#F00'
		@shape = opts.shape ? 'rect'
		@uwidth = opts.uwidth ? 100
		@uheight = opts.uheight ? 100
		@radius = opts.radius ? 0
		@allComplete = false
		@observer = new ComponentObserver()
		@droptargets = new Array()
		@path = new Array()
		@addEventListener 'mousedown', (e) =>
			@path = new Array()
			@getLetterContainer()
			@addEventListener 'pressmove', (ev) =>
				@getLetterContainer()
			@addEventListener 'pressup', (ev) =>
				@removeAllEventListeners 'pressmove'
				@removeAllEventListeners 'pressup'
				found = false
				upath = @path.unique()
				unames = (coord.name for coord in upath)
				unames.sort()
				for word in @words
					if word.enabled
						lcoords = new Array()
						wcoords = word.coords.sort()
						for key in [0...wcoords.length]
							lcoords[key] = "l#{wcoords[key]}"
						foundAWord = lcoords.compare(unames)
						if foundAWord
							found = true
							word.complete = true
							if word.fx then lib[word.target][word.fx]() else lib[word.target].fadeOut()
							lib.scene.success()
				if not found
					for ltc in upath
						ltc.showShape off
					lib.scene.fail()
			false
	getLetterContainer: () ->
		pt = @globalToLocal oda.stage.mouseX, oda.stage.mouseY
		oup = @getObjectUnderPoint pt.x, pt.y
		ltc = oup.parent
		if ltc and ltc instanceof LetterContainer
			ltc.showShape()
			@path.push ltc
	update: (opts) ->
		@removeAllChildren()
		@words = opts.words
		#for k in [1..]
		i = 0
		j = 0
		for row in opts.matrix
			for column in row
				olc = new LetterContainer {text:column, width: @uwidth, height: @uheight, radius: @radius}, @font, @fcolor, @bcolor, @shcolor, @shape, j * @uwidth, i * @uheight
				olc.name = "l#{j}_#{i}"
				@add olc
				@droptargets.push olc
				j++
			j = 0
			i++
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	isComplete: ->
		complete = true
		for word in @words
			if word.complete is false
				complete = false
		complete

class CrossWordsContainer extends Component
	CrossWordsContainer.prototype = new createjs.Container()
	CrossWordsContainer::Container_initialize = CrossWordsContainer::initialize
	constructor: (opts) ->
		@initialize opts
	CrossWordsContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@name = opts.name ? opts.id
		@x = opts.x
		@y  = opts.y
		@font = opts.font ? '20px Arial'
		@fcolor = opts.fcolor ? '#333'
		@bcolor = opts.bcolor ? '#FFF'
		@stroke = opts.stroke ? 2
		@scolor = opts.scolor ? '#FFF'
		@uwidth = opts.uwidth ? 100
		@uheight = opts.uheight ? 100
		@allComplete = false
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update: (opts) ->
		@removeAllChildren()
		@words = opts.words
		for k in [1..@words.length]
			txt = @insertText "txt#{k}", "#{k}", @font, @fcolor, @words[k-1].x, @words[k-1].y
			if @words[k-1].eval
				txt.eval = @words[k-1].eval
				txt.target = @words[k-1].target
				txt.index = @words[k-1].index
				txt.addEventListener 'click', (e) =>
					d2oda.evaluator.evaluate e.target.eval, e.target.name, e.target.target
		i = 0
		j = 0
		for row in opts.matrix
			for column in row
				if column isnt '#'
					if column is '-'
						tcc = new createjs.Shape()
						tcc.graphics.f('#999').ss(@stroke).s(@scolor).dr(0, 0, @uwidth, @uheight)
						tcc.x = j * @uwidth
						tcc.y = i * @uheight
					else
						tcc = new TextCompleterContainer {text:column, width:@uwidth, height:@uheight}, @font, @fcolor, @bcolor, @scolor, @stroke, j * @uwidth, i * @uheight
						tcc.name = "l#{j}#{i}"
						tcc.setRectOutline @bcolor, @stroke, @scolor
					@add tcc
					@droptargets.push tcc
				j++
			j = 0
			i++
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	fadeOut: (obj) ->
		TweenMax.killTweensOf obj
		TweenLite.killTweensOf obj
		TweenLite.to obj, 0.5, {alpha: 0, y: obj.y - 20}
	evaluateWords: () ->
		for word in @words
			coords = word.coords
			wordComplete = true
			for obj in coords
				if not lib["l#{obj}"].complete
					wordComplete = false
			if not word.complete
				if wordComplete
					word.complete = true
					if lib[word.target] then @fadeOut lib[word.target]
					if lib["number#{word.target}"] then @fadeOut lib["number#{word.target}"]
					createjs.Sound.play "s/#{word.target}"
					lib.scene.success()
	isComplete: () ->
		@allComplete = true
		for word in @words
			if not word.complete
				@allComplete = false
		@allComplete

class ABCContainer extends Component
	ABCContainer.prototype = new createjs.Container()
	ABCContainer::Container_initialize = ABCContainer::initialize
	constructor: (opts) ->
		@initialize opts
	ABCContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@eval = opts.eval
		@target = opts.target
		abc = 'abcdefghijklmnopqrstuvwxyz'
		abcarr = abc.split ''
		@abccollection = new Array()
		i = 0
		for letter in abcarr
			if i >= 13
				_x = (i - 13) * (opts.uwidth + opts.margin)
				_y = opts.uheight
			else
				_x = i * (opts.uwidth + opts.margin)
				_y = 0
			if opts.clickable
				lopts = {id:"abc_#{i}", x: _x, y: _y, index: letter, target: @target, eval: @eval, states:[{txt:{text:letter, font: opts.font, color: opts.fcolor}}]}
				d = new ButtonContainer lopts
			else
				lopts = {id:"abc_#{i}", x: _x, y: _y, index: letter, target: @target, eval: @eval, text: letter, font: opts.font, color: opts.fcolor, afterSuccess: 'origin',afterFail: 'return'}
				d = new LetterDragContainer lopts
			@abccollection.push d
			@add d
			i++
		@width = _x + opts.uwidth
		@height = _y * 2
		@setPosition 'mc'
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	update: (opts) ->
		if opts.reset
			for letter in @abccollection 
				letter.visible = true
	isComplete: ->
		true

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
		@eval = opts.eval
		@currentTarget = 0
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update: (opts) ->
		@removeAllChildren()
		@droptargets = new Array()
		@target = opts.target
		word = opts.word.split ''
		
		i = 0
		if opts.prev
			@prev = @insertText 'prevTxt', opts.prev, @font, @fcolor, 0, 0
			npos = @prev.getMeasuredWidth() + @margin
		else
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
		npos = if @prev then @prev.getMeasuredWidth() + @margin else 0
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	isComplete: () ->
		for target in @droptargets
			if target.complete is false
				return false
		return true

class ScrambledWordContainer extends Component
	ScrambledWordContainer.prototype = new createjs.Container()
	ScrambledWordContainer::Container_initialize =ScrambledWordContainer::initialize
	constructor: (opts) ->
		@initialize opts
	ScrambledWordContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
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
		@oncomplete = opts.oncomplete ? null
		@eval = opts.eval
		@currentTarget = 0
		@observer = new ComponentObserver()
		@droptargets = new Array()
	update: (opts) ->
		@removeAllChildren()
		@target = opts.target
		@fx = opts.fx ? 'fadeOut'
		word = opts.word.split ''
		scrambledWord = @shuffle word
		i = 0
		if opts.prev
			@prev = @insertText 'prevTxt', opts.prev, @font, @fcolor, 0, 0
			npos = @prev.getMeasuredWidth() + @margin
		else
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
		npos = if @prev then @prev.getMeasuredWidth() + @margin else 0
		for scrambledLetter in scrambledWord
			#create drag
			if scrambledLetter isnt ' '
				opts = {id:"l#{@name}#{i}", x: npos, y: -h.height, index: scrambledLetter, target: @name, eval:@eval, text: scrambledLetter, font: @font, color: @fcolor, afterSuccess: 'hide',afterFail: 'return'}
				d = new LetterDragContainer opts
				@add d
				npos += @uwidth + @margin
				i++
		@observer.notify ComponentObserver.UPDATED
		TweenLite.from @, 0.3, {alpha: 0, y: @y - 10}
	onComplete: () ->
		d2oda.evaluator.evaluate @oncomplete.function, @name, @oncomplete.target
	isComplete: () ->
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
		@text = @createText 'txt', opts.text, font, fcolor, 0, -2
		@width = opts.width ? @text.getMeasuredWidth()
		@height = opts.height ? @text.getMeasuredHeight()
		@complete = false
		@back = new createjs.Shape()
		@back.graphics.f(bcolor).dr(0, 0, @width, @height).ss(stroke).s(scolor).mt(0, @height).lt(@width, @height)
		@add @back, false
	setRectOutline: (bcolor, stroke, scolor) ->
		@back.graphics.f(bcolor).ss(stroke).s(scolor).dr(0, 0, @width, @height)
	update: (opts) ->
		if opts and opts.complete then @complete = opts.complete
		@text.textAlign = 'center'
		@text.x = @width / 2
		@add @text, false
		TweenLite.from @, 0.3, {alpha: 0}

class LetterContainer extends Component
	LetterContainer.prototype = new createjs.Container()
	LetterContainer::Container_initialize = LetterContainer::initialize
	constructor: (opts, font, fcolor, bcolor, shcolor, shape, x, y) ->
		@initialize opts, font, fcolor, bcolor, shcolor, shape, x, y
	LetterContainer::initialize = (opts, font, fcolor, bcolor, shcolor, shape, x, y) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		Module.extend @, d2oda.utilities
		@mouseChildren = off
		@x = x
		@y = y
		@name = "ltc_#{opts.name}" ? "ltc_#{opts.text}"
		@success = opts.success ? opts.text
		@text = @createText 'txt', opts.text, font, fcolor, opts.width/2, opts.height/2 - 15, 'center'
		@width = opts.width
		@height = opts.height
		@radius = opts.radius ? '20'
		@complete = false
		@selectionEnabled = off
		@back = new createjs.Shape()
		@shape = new createjs.Shape()
		@back.graphics.f(bcolor).dr(0, 0, @width, @height)
		switch shape
			when 'rect' then @shape.graphics.f(shcolor).dr(0, 0, @width, @height)
			when 'round' then @shape.graphics.f(shcolor).rr(0, 0, @width, @height, @radius)
			when 'circle' then @shape.graphics.f(shcolor).dc(@width/2, @height/2, @radius)
		@add @back, false
		@add @shape, false
		@add @text, false
		@shape.visible = off
	showShape: (visible = on) ->
		@shape.visible = visible
	update: (opts) ->
		@complete = true

class LetterDragContainer extends Component
	LetterDragContainer.prototype = new createjs.Container()
	LetterDragContainer::Container_initialize = LetterDragContainer::initialize
	constructor: (opts) ->
		@initialize opts
	LetterDragContainer::initialize = (opts) ->
		@Container_initialize()
		Module.extend @, d2oda.methods
		Module.extend @, d2oda.actions
		Module.extend @, d2oda.utilities
		@name = opts.name ? opts.id
		@x = opts.x
		@y = opts.y
		@pos = {x: @x, y: @y}
		@index = opts.index
		if @isArray opts.target 
			@target = opts.target
		else
			@target = lib[opts.target]
		@droptargets = new Array()
		@eval = opts.eval
		@label = @createText 'txt', opts.text, opts.font, opts.color, 0, 0
		@width = @label.getMeasuredWidth()
		@height = @label.getMeasuredHeight()
		switch opts.afterSuccess
			when 'hide' then @afterSuccess = @hide
			when 'inplace' then @afterSuccess = @putInPlace
			when 'return' then @afterSuccess = @returnToPlace
			when 'origin' then @afterSuccess = @setInOrigin
		switch opts.afterFail
			when 'hide' then @afterFail = @hide
			when 'inplace' then @afterFail = @putInPlace
			when 'return' then @afterFail = @returnToPlace
			when 'origin' then @afterFail = @setInOrigin
		hit = new createjs.Shape()
		hit.graphics.beginFill('#000').drawRect(-5, -3, @label.getMeasuredWidth() + 10, @label.getMeasuredHeight() + 6)
		@label.hitArea = hit
		@add @label, false
		if @target 
			if @isArray @target
				for t in @target
					lib[t].observer.subscribe ComponentObserver.UPDATED, @update
			else 
				@target.observer.subscribe ComponentObserver.UPDATED, @update
		@addEventListener 'mousedown', @handleMouseDown
	update: (opts) =>
		if @isArray @target
			alldrops = new Array()
			for t in @target
				alldrops.merge lib[t].droptargets
			@droptargets = alldrops
		else
			@droptargets = @target.droptargets
	handleMouseDown: (e) =>
		posX = e.stageX / d2oda.stage.r
		posY = e.stageY / d2oda.stage.r
		offset = x: posX - @x, y: posY - @y
		@x = posX - offset.x
		@y = posY - offset.y
		@addEventListener 'pressmove', (ev)=>
			posX = ev.stageX / d2oda.stage.r
			posY = ev.stageY / d2oda.stage.r
			@x = posX - offset.x
			@y = posY - offset.y
			false
		@addEventListener 'pressup', (ev)=>
			@removeAllEventListeners 'pressmove'
			@removeAllEventListeners 'pressup'
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
			d2oda.evaluator.evaluate @eval, @name, target
			@dispatchEvent {type: 'dropped', drop: target}
		else
			@returnToPlace @alpha, @scaleX, @scaleY

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
	isComplete: () ->
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
		if @stack[@currentScene].chooseEnabled
			@stack[@currentScene].visible = false
			@currentScene = @stack[@currentScene].choose 
		else 
			@currentScene++
		if @stack.length > 1 and @currentScene < @stack.length
			if not @stack[@currentScene].chooseEnabled then @stack[@currentScene - 1].visible = false
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
		if lib.score.type is 'clock' then lib.score.stop()
		@dispatchEvent {type: 'complete'}
	setCurrent: ->
		lib.scene = @stack[@currentScene]
		lib.scene.visible = true
	window.SceneStack = SceneStack

class SceneFactory
	makeChild: (opts) ->
		switch opts.type
			#containers
			when 'abc' then new ABCContainer opts
			when 'drg' then new DragContainer opts
			when 'grd' then new GridContainer opts
			when 'txt' then new TextContainer opts
			when 'img' then new ImageContainer opts
			when 'lbl' then new LabelContainer opts
			when 'cln' then new CloneContainer opts
			when 'wrt' then new WriteContainer opts
			when 'spr' then new SpriteContainer opts
			when 'btn' then new ButtonContainer opts
			when 'stps' then new StepsContainer opts
			when 'chs' then new ChooseContainer opts
			when 'cwd' then new CrossWordsContainer opts
			when 'wsch' then new WordSearchContainer opts
			when 'ldrg' then new LetterDragContainer opts
			when 'pcct' then new PhraseCloneContainer opts
			when 'wcpt' then new WordCompleterContainer opts
			when 'swct' then new ScrambledWordContainer opts
			when 'ccpt' then new CloneCompleterContainer opts
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
		@choose = scene.answers.choose ? 0
		answers = scene.answers.collection[..]
		
		if scene.answers.mixed is true
			@answers = d2oda.utilities.shuffle answers
		else
			@answers = answers

		@chooseEnabled = scene.answers.chooseEnabled

		switch scene.answers.type
			when 'steps'
				@observer.subscribe SceneObserver.NEXT_STEP, @next
			when 'limit'
				@answers = d2oda.utilities.shuffleNoRepeat @answers, scene.answers.limit
				@observer.subscribe SceneObserver.NEXT_STEP, @next

		if scene.containers.length > 0 
			for container in scene.containers
				c = @factory.makeChild container
				@add c
		
		if scene.groups.length > 0 
			for group in scene.groups
				g = @factory.makeChild group
				lib[group.id] = g
	init: ->
		if lib.score.type is 'clock'
			lib.score.start()
			lib.score.addEventListener 'count_complete', lib.game.nextScene
		@setStep()
	success: (plusOne = true, stopSound = true) ->
		if stopSound then createjs.Sound.stop()
		if plusOne then lib.score.plusOne()
		step = @answers[@currentStep]
		if step && step.length > 0
			for target in step
				if target.name isnt 'snd' and target.name isnt 'global' and lib[target.name].isComplete() is false
					return false
		@nextStep()
	sndsuccess: () =>
		@success false
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
		if lib.instructions.playing
			lib.instructions.addEventListener 'complete', @setStep
		else
			console.log 'setStep'
			step = @answers[@currentStep]
			if step && step.length > 0
				for target in step
					switch target.name
						when 'global'
							d2oda.evaluator.success = target.opts.success
							false
						when 'snd'
							@snd = target.opts.id
							createjs.Sound.stop()
							snd = createjs.Sound.play target.opts.id
							if target.opts.successoncomplete
								snd.addEventListener 'complete', @sndsuccess
							false
						else
							lib[target.name].update target.opts
	nextStep: ->
		console.log 'next step'
		@observer.notify SceneObserver.NEXT_STEP
	window.Scene = Scene