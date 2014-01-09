###

LIBRARY

###
window.dealersjs ?= {}
window.d2oda ?= {}
window.lib ?= {}

window.dealersjs.mixOf ?= (base, mixins...) ->
	class Mixed extends base
	for mixin in mixins by -1 #earlier mixins override later ones
		console.log "mixin::#{mixin}"
		for name, method of mixin::
			console.log "name,method::#{name},#{method}"
			Mixed::[name] = method
	Mixed
window.dealersjs.mobile ?= class Mobile
	@user_agent: navigator.userAgent.toLowerCase()
    isIOS: ->
    	if @ in [@isIpad(),@isIphone(), @isIpod()] then true else false
    isIpad: ->
    	@user_agent.indexOf('ipad') > -1
    isIphone: ->
    	@user_agent.indexOf('iphone') > -1
    isIpod: ->
    	@user_agent.indexOf('ipod') > -1
    isAndroid: ->
    	@user_agent.indexOf('android') > -1
    isMobile: ->
    	@user_agent.indexOf('mobile') > -1
    Mobile

window.d2oda.behaviors ?= class Behaviors
	initDragListener: =>
		@addEventListener 'mousedown', @handleMouseDown
	endDragListener: =>
		@removeEventListener 'mousedown', @handleMouseDown
	Behaviors

window.d2oda.actions ?= class Actions
	fadeOut: ->
		if @alpha is 1 then TweenLite.to @, 0.5, {alpha: 0, y: @y - 20} else TweenLite.from @, 0.5, {alpha: 1, y: @y + 20}
	fadeIn: ->
		if @alpha is 0 then TweenLite.to @, 0.5, {alpha: 1, y: @y - 20} else TweenLite.from @, 0.5, {alpha: 0, y: @y + 20}
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@alpha = 1
		TweenMax.to @, 0.5, {alpha: 0.2, repeat: -1, yoyo: true}  if state
	putInPlace: (position, alpha=1, scaleX=1, scaleY=1) ->
		@inPlace = on
		TweenLite.to @, 1, { ease: Back.easeOut, delay: 0.1, x: position.x, y: position.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	returnToPlace: (alpha=1, scaleX=1, scaleY=1) ->
		TweenLite.to @, 0.5, { ease: Back.easeOut, delay: 0.1, x: @pos.x, y: @pos.y, alpha: alpha, scaleX: scaleX, scaleY: scaleY }
	#takeMeOut: ->
		#TweenLite.to @, 0.5, { ease: Linear.easeNone, delay: 0.1, x: @pos.x, y: @pos.y, alpha: 0, onComplete: @killMe }
	Actions

window.d2oda.stage ?= 
	w: 800
	h: 600
	r: 1

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
		lib.game = new Game @game
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
		lib.game.end()
	resetGame: =>
		lib.game.reset()
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

class MainContainer
	constructor: ->
		@initialize()
	MainContainer.prototype = new createjs.Container()
	MainContainer::Container_initialize = MainContainer::initialize
	MainContainer::initialize = ->
		@Container_initialize()
		@name = 'mainContainer'
		@regX = d2oda.stage.w / 2
		@regY = d2oda.stage.h / 2
	createBitmap: (name, id, x, y, position = 'tl') ->
		img = lib.preloader.preload.getResult id
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
		@add bmp
		bmp
	createText: (name, t, f, c, x, y, align = 'left') ->
		text = new createjs.Text t,f,c
		text.name = name
		text.x = x
		text.y = y
		text.textAlign = align
		text
	insertText: (name, t, f, c, x, y, align = 'left') ->
		text = @createText name, t, f, c, x, y, align
		@add text
		text
	createSprite: (name, imgs, anim=null, x, y, position = 'tl') ->
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
		@add animation
		animation
	setReg: (obj, regX, regY) ->
		obj.regX = regX
		obj.regY = regY
		obj
	add: (child, toLibrary = true) ->
		@addChild child
		if toLibrary then lib[child.name] = child
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
	window.GameObserver = GameObserver

class Game
	constructor: (game) ->
		@initialize game
	Game.prototype = new createjs.EventDispatcher()
	Game::EventDispatcher_initialize = Game::initialize
	Game::initialize = (game) ->
		@observer = new GameObserver()
		@setHeader(game.header).setInstructions(game.instructions).setScenes(game.scenes)
	setHeader: (header) ->
		lib.mainContainer.insertBitmap 'header', header, d2oda.stage.w / 2, 0, 'tc'
		TweenLite.from lib.header, 0.5, {alpha: 0, y: lib.header.y - 20}
		@
	setInstructions: (instructions) ->
		instructions = new Instructions instructions
		lib.mainContainer.add instructions, false
		#if instructions.steps.length > 1
			#@observer.subscribe GameObserver.NEXT_SCENE, lib.instructions.next
			#@observer.subscribe GameObserver.PREV_SCENE, lib.instructions.prev
		@
	setScenes: (scenes) ->
		lib.scenes = new SceneStack scenes
		lib.mainContainer.add lib.scenes, false
		if scenes.length > 1
			@observer.subscribe GameObserver.NEXT_SCENE, lib.scenes.next
			@observer.subscribe GameObserver.PREV_SCENE, lib.scenes.prev
		@
	start: ->

	nextScene: ->
		@observer.notify GameObserver.NEXT_SCENE
	prevScene: ->
		@observer.notify GameObserver.PREV_SCENE

###

COMPONENTS CLASSES

###
class Component
	Component.prototype = new createjs.Container()
	Component::Container_initialize = Component::initialize
	Component::initialize = ->
		@Container_initialize()
	next: ->
	prev: ->

class Instructions extends Component
	constructor: (instructions) ->
		@initialize instructions
	Instructions::initialize = (instructions) ->
		@x = instructions.x
		@y = instructions.y
		@steps = instructions.steps
		@currentStep = 0
		triangle = new createjs.Shape()
		triangle.graphics.beginFill('#bcd748').moveTo(0,0).lineTo(8,5).lineTo(0,10)
		triangle.y = 5
		@label = new createjs.Text @steps[@currentStep].text, '16px Roboto', '#000'
		@label.x = 14
		@addChild triangle, @label
		TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
	playSound: ->
		if not @steps[@currentStep].played
			@steps[@currentStep].played = true
			createjs.Sound.play @steps[@currentStep].sound
	next: =>
		@currentStep++
		if @steps.length > 1 and @currentStep < @steps.length
			@playSound()
			@label.text = @steps[@currentStep].text
			TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
		else
			@currentStep--
	prev: =>
		@currentStep--
		if @currentStep >= 0
			@label.text = @steps[@currentStep].text
			TweenLite.from @, 0.5, {alpha: 0, x: @x - 20}
		else
			@currentStep++

class SceneStack extends Component
	constructor: (scenes) ->
		@initialize scenes
	SceneStack::initialize = (scenes) ->
		@stack = []
		@currentScene = 0
		for scene in scenes
			sc = new Scene scene
			sc.visible = false
			#@addChild sc
			#@stack.push s
		#@stack[@currentScene].visible = true
		TweenLite.from @, 1, {alpha: 0}
	###
	next: =>
		@currentScene++
		if @stack.length > 1 and @currentScene < @stack.length
			@stack[@currentScene - 1].visible = false
			@stack[@currentScene].visible = true
			TweenLite.from @, 1, {alpha: 0}
		else
			@currentScene--
	prev: =>
		@currentScene--
		if @currentScene >= 0
			@stack[@currentScene + 1].visible = false
			@stack[@currentScene].visible = true
			TweenLite.from @, 1, {alpha: 0}
		else
			@currentScene++
	###
class SceneObserver extends Observer
	@NEXT_STEP: 'next_step'
	@PREV_STEP: 'prev_step'
	window.SceneObserver = SceneObserver

class Scene extends Component
	constructor: (scene) ->
		@initialize scene
	Scene::initialize = (scene) ->
		@observer = new SceneObserver()
		console.log 'initialize'
	nexStep: ->
		@observer.notify SceneObserver.NEXT_STEP
	prevStep: ->
		@observer.notify SceneObserver.PREV_STEP

###

NEW ODA

###
class U2A3 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id:'letraM', src:'letra_M.png'}
			{id:'letraU', src:'letra_U.png'}
			{id:'letraS', src:'letra_S.png'}
			{id:'letraH', src:'letra_H.png'}
			{id:'letraR', src:'letra_R.png'}
			{id:'letraO', src:'letra_O.png'}
			{id:'mush', src:'mush.png'}
			{id:'priceblueberryJam', src:'price_blueberryJam.png'}
			{id:'pricebutter', src:'price_butter.png'}
			{id:'pricecarrots', src:'price_carrots.png'}
			{id:'pricechilis', src:'price_chilis.png'}
			{id:'pricecream', src:'price_cream.png'}
			{id:'priceeggs', src:'price_eggs.png'}
			{id:'pricemushrooms', src:'price_mushrooms.png'}
			{id:'pricepeachJam', src:'price_peachJam.png'}
			{id:'pricepeppers', src:'price_peppers.png'}
			{id:'propabuelita', src:'prop_abuelita.png'}
			{id:'propbg', src:'prop_bg.png'}
			{id:'clue', src:'text_clue.png'}
			{id:'s/instructions', src:'TU3_U2_A3_Instructions.mp3'}
		    {id:'s/instructions2', src:'TU3_U2_A3_Instructions2.mp3'}
		]
		@game = 
			header: 'head'
			instructions: { x: 40, y: 100, steps: [{text:'Instructions 1', sound:'s/instructions', played: false}, {text: 'Instructions 2', sound: 's/instructions2', played: false}]}
			scenes:[
				{
					background: {name: 'propbg', x: 426, y: 308, align: 'mc'}
					components: {
						texts: [
						]
						images: [
							{name: 'abuelita', imgId: 'propabuelita', x:554, y:254, align: 'mc'}
							{imgId: 'letraM', x:501, y:407, align: 'mc'}
							{imgId: 'letraU', x:324, y:408, align: 'mc'}
							{imgId: 'letraS', x:563, y:323, align: 'mc'}
							{imgId: 'letraH', x:303, y:317, align: 'mc'}
							{imgId: 'letraR', x:314, y:213, align: 'mc'}
							{imgId: 'letraO', x:374, y:316, align: 'mc'}
							{name: 'letraO2', imgId: 'letraO', x:454, y:316, align: 'mc'}
							{name: 'letraM2', imgId: 'letraM', x:576, y:163, align: 'mc'}
							{name: 'letraS2', imgId: 'letraS', x:389, y:257, align: 'mc'}
						]
						containers: [
							{type: 'label', name: 'answerlbl', text: '', font: '15px Quicksand', color: '#333', x: 415, y: 530, align: 'center'}
						]
						buttons: [
							{imgId: 'priceblueberryJam', x:521, y:404, align: 'mc', index: 'blueberry', action: 'checkPrice'}
							{imgId: 'pricebutter', x:350, y:218, align: 'mc', index: 'butter', action: 'checkPrice'}
							{imgId: 'pricecarrots', x:584, y:314, align: 'mc', index: 'carrots', action: 'checkPrice'}
							{imgId: 'pricechilis', x:580, y:176, align: 'mc', index: 'chilis', action: 'checkPrice'}
							{imgId: 'pricecream', x:416, y:253, align: 'mc', index: 'cream', action: 'checkPrice'}
							{imgId: 'priceeggs', x:322, y:315, align: 'mc', index: 'eggs', action: 'checkPrice'}
							{imgId: 'pricemushrooms', x:397, y:320, align: 'mc', index: 'mushrooms', action: 'checkPrice'}
							{imgId: 'pricepeachJam', x:347, y:406, align: 'mc', index: 'peach', action: 'checkPrice'}
							{imgId: 'pricepeppers', x:477, y:313, align: 'mc', index: 'peppers', action: 'checkPrice'}
						]
						drags: [
						]
						targets: [
						]
					}
					steps: [
						{type: 'txt', text:'It\'s three dollars and ten cents.', success: 'peach', show: 'letraU'}
						{type: 'txt', text:'They\'re three dollars a kilo.', success: 'carrots', show: 'letraS'}
						{type: 'txt', text:'It\'s ninety-five cents.', success: 'cream', show: 'letraS2'}
						{type: 'txt', text:'It\'s one dollar and fifty cents.', success: 'butter', show: 'letraR'}
						{type: 'txt', text:'They\'re two dollars and seventy-five cents.', success: 'chilis', show: 'letraM2'}
						{type: 'txt', text:'They\'re two dollars and forty cents a kilo.', success: 'peppers', show: 'letraO2'}
						{type: 'txt', text:'They\'re two dollars and seventy-five cents a kilo.', success: 'eggs', show: 'letraH'}
						{type: 'txt', text:'It\'s four dollars and fifty cents.', success: 'blueberry', show: 'letraM'}
						{type: 'txt', text:'They\'re four dollars and five cents a kilo.', success: 'mushrooms', show: 'letraO'}
					]
				}
				{
					background: {name: 'propbg', x: 426, y: 308, align: 'mc'}
					components: {
						texts: [
						]
						images: [
							{name: 'abuelita', imgId: 'propabuelita', x:554, y:254, align: 'mc', index: 15}
						]
						containers: [
						]
						buttons: [
						]
						drags: [
							{type: 'img', imgId: 'letraM', x:501, y:407, align: 'mc'}
							{type: 'img', imgId: 'letraU', x:324, y:408, align: 'mc'}
							{type: 'img', imgId: 'letraS', x:563, y:323, align: 'mc'}
							{type: 'img', imgId: 'letraH', x:303, y:317, align: 'mc'}
							{type: 'img', imgId: 'letraR', x:314, y:213, align: 'mc'}
							{type: 'img', imgId: 'letraO', x:374, y:316, align: 'mc'}
							{type: 'img', name: 'letraO2', imgId: 'letraO', x:454, y:316, align: 'mc'}
							{type: 'img', name: 'letraM2', imgId: 'letraM', x:576, y:163, align: 'mc'}
							{type: 'img', name: 'letraS2', imgId: 'letraS', x:389, y:257, align: 'mc'}
						]
						targets:[
						]
					}
					steps: [
						{type: 'word', text:'mushrooms'}
					]	
				}
			]
		super()
window.oda = new U2A3()#


###
class ContainerFactory
	makeContainer: (opts) ->
		switch opts.type
			when 'label' then new LabelContainer opts

class LabelContainer
	LabelContainer.prototype = new createjs.Container()
	LabelContainer::Container_initialize = LabelContainer::initialize
	LabelContainer::initialize = (opts) ->
		@Container_initialize()
		@name = opts.name
		@x = opts.x
		@y = opts.y
		@text = new createjs.Text opts.text,opts.font,opts.color
		@text.name = opts.name
		@text.textAlign = opts.align ? 'left'
		@addChild @text
		@text
	constructor: (opts) ->
		@initialize opts
	update: (txt) ->
		@text.text = txt
		if @text.alpha is 0 then TweenLite.to @text, 0.5, {alpha: 1, y: 0} else TweenLite.from @text, 0.5, {alpha: 0, y: @text.y + 20}
	delete: ->
		TweenLite.to @text, 0.5, {alpha: 0, y: @text.y + 20}
class U2A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id:'letraM', src:'letra_M.png'}
			{id:'letraU', src:'letra_U.png'}
			{id:'letraS', src:'letra_S.png'}
			{id:'letraH', src:'letra_H.png'}
			{id:'letraR', src:'letra_R.png'}
			{id:'letraO', src:'letra_O.png'}
			{id:'mush', src:'mush.png'}
			{id:'priceblueberryJam', src:'price_blueberryJam.png'}
			{id:'pricebutter', src:'price_butter.png'}
			{id:'pricecarrots', src:'price_carrots.png'}
			{id:'pricechilis', src:'price_chilis.png'}
			{id:'pricecream', src:'price_cream.png'}
			{id:'priceeggs', src:'price_eggs.png'}
			{id:'pricemushrooms', src:'price_mushrooms.png'}
			{id:'pricepeachJam', src:'price_peachJam.png'}
			{id:'pricepeppers', src:'price_peppers.png'}
			{id:'propabuelita', src:'prop_abuelita.png'}
			{id:'propbg', src:'prop_bg.png'}
			{id:'clue', src:'text_clue.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/TU3_U2_A3_Instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U2_A3_Instructions2.mp3', id:'instructions2'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			header:'head'
			scenes:[
				{
					instructions: 'Read the price and click on the correct item.'
					container: {name: 'market'}
					background: {name: 'propbg', x: 426, y: 308, align: 'mc'}
					components: {
						texts: [
						]
						images: [
							{name: 'abuelita', imgId: 'propabuelita', x:554, y:254, align: 'mc'}
							{imgId: 'letraM', x:501, y:407, align: 'mc'}
							{imgId: 'letraU', x:324, y:408, align: 'mc'}
							{imgId: 'letraS', x:563, y:323, align: 'mc'}
							{imgId: 'letraH', x:303, y:317, align: 'mc'}
							{imgId: 'letraR', x:314, y:213, align: 'mc'}
							{imgId: 'letraO', x:374, y:316, align: 'mc'}
							{name: 'letraO2', imgId: 'letraO', x:454, y:316, align: 'mc'}
							{name: 'letraM2', imgId: 'letraM', x:576, y:163, align: 'mc'}
							{name: 'letraS2', imgId: 'letraS', x:389, y:257, align: 'mc'}
						]
						containers: [
							{type: 'label', name: 'answerlbl', text: '', font: '15px Quicksand', color: '#333', x: 415, y: 530, align: 'center'}
						]
						buttons: [
							{imgId: 'priceblueberryJam', x:521, y:404, align: 'mc', index: 'blueberry', action: 'checkPrice'}
							{imgId: 'pricebutter', x:350, y:218, align: 'mc', index: 'butter', action: 'checkPrice'}
							{imgId: 'pricecarrots', x:584, y:314, align: 'mc', index: 'carrots', action: 'checkPrice'}
							{imgId: 'pricechilis', x:580, y:176, align: 'mc', index: 'chilis', action: 'checkPrice'}
							{imgId: 'pricecream', x:416, y:253, align: 'mc', index: 'cream', action: 'checkPrice'}
							{imgId: 'priceeggs', x:322, y:315, align: 'mc', index: 'eggs', action: 'checkPrice'}
							{imgId: 'pricemushrooms', x:397, y:320, align: 'mc', index: 'mushrooms', action: 'checkPrice'}
							{imgId: 'pricepeachJam', x:347, y:406, align: 'mc', index: 'peach', action: 'checkPrice'}
							{imgId: 'pricepeppers', x:477, y:313, align: 'mc', index: 'peppers', action: 'checkPrice'}
						]
						drags: [
						]
						targets: [
						]
					}
					steps: [
						{type: 'txt', text:'It\'s three dollars and ten cents.', success: 'peach', show: 'letraU'}
						{type: 'txt', text:'They\'re three dollars a kilo.', success: 'carrots', show: 'letraS'}
						{type: 'txt', text:'It\'s ninety-five cents.', success: 'cream', show: 'letraS2'}
						{type: 'txt', text:'It\'s one dollar and fifty cents.', success: 'butter', show: 'letraR'}
						{type: 'txt', text:'They\'re two dollars and seventy-five cents.', success: 'chilis', show: 'letraM2'}
						{type: 'txt', text:'They\'re two dollars and forty cents a kilo.', success: 'peppers', show: 'letraO2'}
						{type: 'txt', text:'They\'re two dollars and seventy-five cents a kilo.', success: 'eggs', show: 'letraH'}
						{type: 'txt', text:'It\'s four dollars and fifty cents.', success: 'blueberry', show: 'letraM'}
						{type: 'txt', text:'They\'re four dollars and five cents a kilo.', success: 'mushrooms', show: 'letraO'}
					]
				}
				{
					instructions: 'Read the price and click on the correct item.'
					container: {name: 'market'}
					background: {name: 'propbg', x: 426, y: 308, align: 'mc'}
					components: {
						texts: [
						]
						images: [
							{name: 'abuelita', imgId: 'propabuelita', x:554, y:254, align: 'mc', index: 15}
						]
						containers: [
						]
						buttons: [
						]
						drags: [
							{type: 'img', imgId: 'letraM', x:501, y:407, align: 'mc'}
							{type: 'img', imgId: 'letraU', x:324, y:408, align: 'mc'}
							{type: 'img', imgId: 'letraS', x:563, y:323, align: 'mc'}
							{type: 'img', imgId: 'letraH', x:303, y:317, align: 'mc'}
							{type: 'img', imgId: 'letraR', x:314, y:213, align: 'mc'}
							{type: 'img', imgId: 'letraO', x:374, y:316, align: 'mc'}
							{type: 'img', name: 'letraO2', imgId: 'letraO', x:454, y:316, align: 'mc'}
							{type: 'img', name: 'letraM2', imgId: 'letraM', x:576, y:163, align: 'mc'}
							{type: 'img', name: 'letraS2', imgId: 'letraS', x:389, y:257, align: 'mc'}
						]
						targets:[
						]
					}
					steps: [
						{type: 'word', text:'mushrooms'}
					]	
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@scene = 0
		totalScore = 0
		for i in [0..@game.scenes.length - 1]
			totalScore += @game.scenes[i].steps.length
		@insertBitmap 'header', @game.header, stageSize.w / 2, 0, 'tc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, totalScore, 0
		@setScene().hideLetters().introEvaluation()
	setScene: ->
		currentScene = @game.scenes[@scene]
		
		#Create scene container
		cname = currentScene.container.name ? 'currentContainer'
		if @library[cname]
			c = @library[cname]
		else
			c = new createjs.Container()
			@addToMain c
		
		c.name = cname
		c.x =  currentScene.container.x ? 0
		c.y =  currentScene.container.y ? 0
		c.removeAllChildren()

		#Create background for scene container
		bgname = currentScene.background.name ? 'background'
		bgx = currentScene.background.x ? 0
		bgy = currentScene.background.y ? 0
		bga = currentScene.background.align ? ''
		b = @createBitmap bgname, bgname, bgx, bgy, bga
		c.addChild b

		#Create images for scene container
		for image in currentScene.components.images
			align = image.align ? ''
			name = image.name ? image.imgId
			b = @createBitmap name, image.imgId, image.x, image.y, align
			c.addChild b
			@addToLibrary b
		
		#Create containers for scene container
		factory = new ContainerFactory()
		for container in currentScene.components.containers 
			co = factory.makeContainer container
			c.addChild co
			@addToLibrary co

		#Create buttons for scene container
		for button in currentScene.components.buttons
			align = button.align ? ''
			name = button.name ? button.imgId
			b = @createBitmap name, button.imgId, button.x, button.y, align
			b.index = button.index
			b.addEventListener 'click', @[button.action]
			c.addChild b
			@addToLibrary b

		#Create drags for scene container
		for drag in currentScene.components.drags
			name = drag.name ? drag.imgId
			
			d = new Droppable name, (@preload.getResult drag.imgId), drag.index, drag.x, drag.y, @stage
			@setReg d, d.width / 2, d.height / 2
			d.addEventListener 'click', @[drag.action]
			c.addChild d
			@addToLibrary d

		for image in currentScene.components.images
			if image.index
				@library[image.name].parent.setChildIndex @library[image.name], image.index 
		
		@insertInstructions 'instructions', @game.scenes[@scene].instructions, 40, 100
		@
	hideLetters: ->
		letras = ['letraM', 'letraU', 'letraS', 'letraH', 'letraR', 'letraO', 'letraO2', 'letraM2', 'letraS2']
		for letra in letras
			@library[letra].visible = off
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library[@game.scenes[@scene].container.name], 1, {alpha :0, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: ->
		super
		if @game.scenes[@scene].steps.length > 0
			currentStep = @game.scenes[@scene].steps[@index]
			@library.answerlbl.update currentStep.text
	checkPrice: (e) =>
		currentAnswer = @game.scenes[@scene].steps[@index]
		if e.target.index is currentAnswer.success
			@library.score.plusOne()
		else
			@warning()
		@library[currentAnswer.show].visible = on
		TweenLite.to e.target, 0.5, {alpha: 0}
		@nextStep()
	nextStep: ->
		@index++
		if @index < @game.scenes[@scene].steps.length
			currentStep = @game.scenes[@scene].steps[@index]
			@library.answerlbl.update currentStep.text
		else
			@nextScene()
	nextScene: ->
		@scene++
		if @scene < @game.scenes.length
			@setScene @scene
	finish: ->
		super
	window.U2A3 = U2A3
###