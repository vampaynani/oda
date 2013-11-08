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
 			{id: 'btnfinished', src:'btn_finished.png'}
			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'dragble2', src:'dragble_bella.png'}
			{id: 'dragble3', src:'dragble_benny.png'}
			{id: 'dragble1', src:'dragble_hana.png'}
			{id: 'dragble8', src:'dragble_julia.png'}
			{id: 'dragble7', src:'dragble_oliver.png'}
			{id: 'dragble4', src:'dragble_phillip.png'}
			{id: 'dragble5', src:'dragble_renee.png'}
			{id: 'dragble6', src:'dragble_stuart.png'}
			{id: 'image6', src:'image_bella.png'}
			{id: 'image4', src:'image_benny.png'}
			{id: 'image5', src:'image_hana.png'}
			{id: 'image2', src:'image_julia.png'}
			{id: 'image1', src:'image_oliver.png'}
			{id: 'image3', src:'image_phillip.png'}
			{id: 'image8', src:'image_renee.png'}
			{id: 'image7', src:'image_start.png'}
			{id: 'correct', src:'Mark0001.png'}
			{id: 'wrong', src:'Mark0002.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@preguntas = [
			{tipo:'texto', imagen:'toastMilkJuice', pregunta:"What's for breakfast?", opcionUno:'Cereal. milk and juice', opcionDos:'Toast, milk and juice'}
			{tipo:'texto', imagen:'zebras', pregunta:'Do zebras live in the grasslands?', opcionUno:'Yes, they do.', opcionDos:"No, they don't."}
			{tipo:'imagen', pregunta:'It has fins and scales. What is it?', opcionUno:'fish', opcionDos:'parrot'}
			{tipo:'imagen', pregunta:'This animal is endangered', opcionUno:'rhino', opcionDos:'snake'}
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'btnfinished', 'btnfinished', 387, 541
		@insertBitmap 'btnrepeat', 'btnrepeat', 264, 541
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setKids().introEvaluation()
	setKids: ->
		caras = new createjs.Container()
		caras.x = 90
		caras.y = 150
		for i in [1..4]
			c = @createBitmap 'image'+i, 'image'+i, (145*i)-145, 0
			caras.addChild c
		for i in [5..8]
			c = @createBitmap 'image'+i, 'image'+i, (145*i)-145*5, 190
			caras.addChild c
		for i in [1..8]
			d = @createBitmap 'dragble'+i, 'dragble'+i, 630, i*37, 'tc'
			caras.addChild d
		@addToMain caras
		@
	setQuestion:  ->
		question = new createjs.Container()
		question.x = 0
		question.y = 0	

		for i in [1..1]
			if @preguntas[i].tipo == 'texto'
				v = @createBitmap @preguntas[i].imagen, @preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2+30, 'mc'
				v.scaleX = v.scaleY = 0.5
				question.addChild v
				@addToLibrary v

				text = new createjs.Text @preguntas[i].pregunta,'24px Arial','#333'
				text.x = stageSize.w / 2
				text.y = 140
				text.textAlign = 'center'
				question.addChild text

				opciones = new createjs.Container()

				uno = new ClickableText @preguntas[i].opcionUno, @preguntas[i].opcionUno, i, 0, 0
				opciones.addChild uno

				diagonal = new createjs.Text ' / ','24px Arial','#333'
				diagonal.x = uno.x + uno.width
				diagonal.y = 0
				opciones.addChild diagonal

				dos = new ClickableText @preguntas[i].opcionDos, @preguntas[i].opcionDos, i,  diagonal.x + 24, 0
				opciones.addChild dos

				total = uno.width + dos.width + 20

				opciones.x = stageSize.w / 2 - total / 2;
				opciones.y = 490;
				question.addChild opciones
			else if @preguntas[i].tipo = 'imagen'
				text = new createjs.Text @preguntas[i].pregunta,'24px Arial','#333'
				text.x = 0
				text.y = 140
				question.addChild text

				v = @createBitmap @preguntas[i].opcionUno, @preguntas[i].opcionUno, stageSize.w / 4, stageSize.h / 2+30, 'mc'
				v.scaleX = v.scaleY = 0.3
				question.addChild v
				@addToLibrary v
				v = @createBitmap @preguntas[i].opcionDos, @preguntas[i].opcionDos, (stageSize.w / 4)*3, stageSize.h / 2+30, 'mc'
				v.scaleX = v.scaleY = 0.3
				question.addChild v
				@addToLibrary v

		@addToMain question
		@
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