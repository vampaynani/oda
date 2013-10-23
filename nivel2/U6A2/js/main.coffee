class U4A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'lineasapple', src:'lineas_apple.png'}
			{id: 'lineasorange', src:'lineas_orange.png'}
			{id: 'lineaspear', src:'lineas_pear.png'}
			{id: 'calles', src:'calles.png'}
			{id: 'map1', src:'map_1.png'}
			{id: 'map2', src:'map_2.png'}
			{id: 'map3', src:'map_3.png'}
			{id: 'bus', src:'place_bus.png'}
			{id: 'cafe', src:'place_cafe.png'}
			{id: 'hospital', src:'place_hospital.png'}
			{id: 'library', src:'place_library.png'}
			{id: 'museum', src:'place_museum.png'}
			{id: 'pet', src:'place_pet.png'}
			{id: 'restaurant', src:'place_restaurant.png'}
			{id: 'school', src:'place_school.png'}
			{id: 'theater', src:'place_theater.png'}


		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@mapas =
			mapa1:['theater', 'hospital', 'restaurant']
			mapa2:['bus', 'museum', 'school']
			mapa3:['library', 'cafe', 'pet']

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'repeatbtn', 'repeatbtn',  stageSize.w / 2, 570, 'mc'
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setMap().introEvaluation()
	setMap: ->
		mapa = new createjs.Container()
		mapa.x = 150
		mapa.y = 180

		fondo = @createBitmap 'map1', 'map1', -50, -40
		calles = @createBitmap 'calles', 'calles', -50, -30

		d1 = @createBitmap @mapas.mapa1[0], @mapas.mapa1[0], 650, 55, 'mc'
		d2 = @createBitmap @mapas.mapa1[1], @mapas.mapa1[1], 650, 155, 'mc'
		d3 = @createBitmap @mapas.mapa1[2], @mapas.mapa1[2], 650, 255, 'mc'
		d1.scaleX = d1.scaleY = d2.scaleX = d2.scaleY = d3.scaleX = d3.scaleY = 0.7
 
		mapa.addChild d1, d2, d3, calles, fondo
		@addToLibrary d1, d2, d3, calles, fondo
		
		@addToMain mapa
	introEvaluation: ->
		super
		###
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
		###
	initEvaluation: (e) =>
		super
		@library['characters'].currentFrame = @answers[@index].id
		createjs.Sound.play @answers[@index].sound
		TweenLite.to @library['characters'], 0.5, {alpha: 1, y: stageSize.h - 180, ease: Quart.easeOut}
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropname'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropname'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.blink off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
		@answer.returnToPlace()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['score'].updateCount( @index )
			@library['characters'].alpha = 1
			@library['characters'].y = stageSize.h - 180
			@library['characters'].currentFrame = @answers[@index].id
			createjs.Sound.play @answers[@index].sound
			TweenLite.from @library['characters'], 0.5, {alpha: 0, y: @library['characters'].y + 20, ease: Quart.easeOut}
		else
			@finish()
	repeatSound: =>
		createjs.Sound.play @answers[@index].sound
	finish: ->
		super
		for i in [1..6] by 1
			@library['name'+i].blink off
	window.U4A6 = U4A6