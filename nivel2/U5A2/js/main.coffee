class U5A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'windy', src:'windy_image.png'}
			{id: 'sunny', src:'sunny_image.png'}
			{id: 'snowing', src:'snowing_image.png'}
			{id: 'raining', src:'raining_image.png'}
			{id: 'cloudy', src:'cloudy_image.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [	
		]
		@textos = [
			'my pants.'
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100

		v = @createSprite 'choose1', ['windy', 'sunny', 'snowing', 'raining', 'cloudy'], {windy:0, sunny:1, snowing:2, raining:3, cloudy:4}, (stageSize.w / 4) + 25, 251, 'mc'
		v.scaleX = v.scaleY = 0.6
		@addToMain v

		v = @createSprite 'choose2', ['windy', 'sunny', 'snowing', 'raining', 'cloudy'], {windy:0, sunny:1, snowing:2, raining:3, cloudy:4}, (stageSize.w / 4)*3-25, 251, 'mc'
		v.scaleX = v.scaleY = 0.6
		@addToMain v

		opciones = new createjs.Container()


		sujeto = new createjs.Text 'I ','24px Arial','#333'
		sujeto.x = 0
		sujeto.y = 0
		opciones.addChild sujeto

		uno = new ClickableText 'want', 'want', 1, sujeto.x + sujeto.getMeasuredWidth(), 0
		opciones.addChild uno

		diagonal = new createjs.Text ' / ','24px Arial','#333'
		diagonal.x = uno.x + uno.width
		diagonal.y = 0
		opciones.addChild diagonal

		dos = new ClickableText " don't want","don't want ", 2,  diagonal.x + 24, 0
		opciones.addChild dos

		frase = new createjs.Text @textos[0],'24px Arial','#333'
		frase.x = dos.x + dos.width
		frase.y = 0
		opciones.addChild frase

		total = uno.width + dos.width + 12 + sujeto.getMeasuredWidth() + frase.getMeasuredWidth() + diagonal.getMeasuredWidth()
		console.log total

		opciones.x = (stageSize.w / 2) - total / 2
		opciones.y = 400;
		@addToMain opciones

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@.introEvaluation()
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
	window.U5A2 = U5A2