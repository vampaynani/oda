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
			{id: 'snowy', src:'snowing_image.png'}
			{id: 'rainy', src:'raining_image.png'}
			{id: 'cloudy', src:'cloudy_image.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U5_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U5_A2_raining.mp3', id:'sraining'}
		    {src:'sounds/TU2_U5_A2_cloudy.mp3', id:'scloudy'}
		    {src:'sounds/TU2_U5_A2_snowing.mp3', id:'ssnowing'}
		    {src:'sounds/TU2_U5_A2_sunny.mp3', id:'ssunny'}
		    {src:'sounds/TU2_U5_A2_windy.mp3', id:'swindy'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			steps: [
				{
					id:'windy'
					texts:[
						'my jacket.'
						'my sweater.'
					]
				}
				{
					id:'sunny'
					texts:[
						'my swimsuit.'
						'my jacket.'
					]
				}
				{
					id:'rainy'
					texts:[
						'my raincoat.'
						'my umbrella.'
					]
				}
				{
					id:'snowy'
					texts:[
						'my boots.'
						'my coat.'
					]
				}
				{
					id:'cloudy'
					texts:[
						'my swimsuit.'
						'my jeans.'
					]
				}
			]

		super null, manifest, sounds
	filterByID: (x) => 
		x isnt @selected
	setStage: ->
		super
		steps = @shuffle @game.steps
		steps = (step.id for step in steps)
		i = 0
		@selected = steps[i]
		stepsView = steps.filter @filterByID
		stepsView = @shuffle stepsView
		choose = new ChooseBitmap 'chooser', (@preload.getResult @selected), (@preload.getResult stepsView[0]), 2, 0, 200
		choose.addEventListener 'selection', (e)->
			console.log e
		@addToMain choose
		###
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
		opciones.addChild sujeto

		uno = new ClickableText 'want', 'want', 1, sujeto.x + sujeto.getMeasuredWidth(), 0
		uno.setFont '24px Arial'
		opciones.addChild uno

		diagonal = new createjs.Text ' / ','24px Arial','#333'
		diagonal.x = uno.x + uno.width
		opciones.addChild diagonal

		dos = new ClickableText " don't want","don't want ", 2,  diagonal.x + 24, 0
		dos.setFont '24px Arial'
		opciones.addChild dos

		frase = new createjs.Text @textos[0],'24px Arial','#333'
		frase.x = dos.x + dos.width
		opciones.addChild frase

		total = uno.width + dos.width + 12 + sujeto.getMeasuredWidth() + frase.getMeasuredWidth() + diagonal.getMeasuredWidth()
		
		opciones.x = (stageSize.w / 2) - total / 2
		opciones.y = 400;
		@addToMain opciones

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@introEvaluation()
		###
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