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
 			{id: 'greenbg', src:'green/propbg.png'}
			{id: 'greenscreen', src:'green/screen_begreen.png'}

			{id: 'dropAreagreenB', src:'green/dropArea_B.png'}
			{id: 'dropAreagreenE', src:'green/dropArea_E.png'}
			{id: 'dropAreagreenG', src:'green/dropArea_G.png'}
			{id: 'dropAreagreenR', src:'green/dropArea_R.png'}
			{id: 'dropAreagreenE2', src:'green/dropArea_E2.png'}
			{id: 'dropAreagreenE3', src:'green/dropArea_E3.png'}
			{id: 'dropAreagreenN', src:'green/dropArea_N.png'}
			{id: 'greenB', src:'green/outsite_B.png'}
			{id: 'greenE', src:'green/outside_E.png'}
			{id: 'greenG', src:'green/outside_G.png'}
			{id: 'greenR', src:'green/outside_R.png'}
			{id: 'greenE2', src:'green/outside_E2.png'}
			{id: 'greenE3', src:'green/outside_E3.png'}
			{id: 'greenN', src:'green/outside_N.png'}

			{id: 'summerscreen', src:'summer/screen_summer.png'}
			{id: 'summerbg', src:'summer/prop_bg.png'}

			{id: 'dropAreasummerS', src:'summer/dropArea_S.png'}
			{id: 'dropAreasummerU', src:'summer/dropArea_U.png'}
			{id: 'dropAreasummerM', src:'summer/dropArea_M.png'}
			{id: 'dropAreasummerM2', src:'summer/dropArea_M2.png'}
			{id: 'dropAreasummerE', src:'summer/dropArea_E.png'}
			{id: 'dropAreasummerR', src:'summer/dropArea_R.png'}
			{id: 'summerS', src:'summer/sLetra.png'}
			{id: 'summerU', src:'summer/u.png'}
			{id: 'summerM', src:'summer/m.png'}
			{id: 'summerM2', src:'summer/m2.png'}
			{id: 'summerE', src:'summer/e.png'}
			{id: 'summerR', src:'summer/r.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@positions = 
			summerletras:[
				{letra:'summerS', x:'366', y:'185'}
				{letra:'summerU', x:'201', y:'172'} #24 y 10
				{letra:'summerM', x:'428', y:'281'}
				{letra:'summerM2', x:'85', y:'175'}
				{letra:'summerE', x:'162', y:'291'}
				{letra:'summerR', x:'211', y:'98'}
			]
			greenletras:[
				{letra:'greenB', x:'187', y:'119'} # 36 y 20
				{letra:'greenE', x:'49', y:'264'}
				{letra:'greenG', x:'267', y:'209'}
				{letra:'greenR', x:'428', y:'178'}
				{letra:'greenE2', x:'314', y:'220'}
				{letra:'greenE3', x:'470', y:'119'}
				{letra:'greenN', x:'418', y:'245'}
			]

		

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setScene().setFinal().introEvaluation()
	setScene: ->
		escena = new createjs.Container()
		escena.x = 116
		escena.y = 160
		es = 'green'

		fondo = @createBitmap es+'bg', es+'bg', 24,11
		
		text = new createjs.Text '6.They are hiking mountains','24px Arial','#333'
		text.x = stageSize.w / 2
		text.y = 140
		text.textAlign = 'center'
		@addToMain text

		escena.addChild fondo
		if es == 'green'
			for i in [0..6]
				letra = @createBitmap @positions.greenletras[i].letra,@positions.greenletras[i].letra, @positions.greenletras[i].x, @positions.greenletras[i].y, 'mc'
				letra.scaleX = letra.scaleY = 0.43
				drop =  @createBitmap 'dropArea'+@positions.greenletras[i].letra, 'dropArea'+@positions.greenletras[i].letra, (i*75)+25, 430, 'bc'
				if i >= 2
					drop.x = drop.x + 30
				letrafinal = @createBitmap @positions.greenletras[i].letra, @positions.greenletras[i].letra, drop.x, drop.y-7, 'bc'
				if i == 6
					letrafinal.x = letrafinal.x-10
				escena.addChild letra, drop, letrafinal
		else
			for i in [0..5]
				letra = @createBitmap @positions.summerletras[i].letra,@positions.summerletras[i].letra, @positions.summerletras[i].x, @positions.summerletras[i].y, 'mc'
				letra.scaleX = letra.scaleY = 0.43
				drop =  @createBitmap 'dropArea'+@positions.summerletras[i].letra, 'dropArea'+@positions.summerletras[i].letra, (i*85)+65, 430, 'bc'
				letrafinal = @createBitmap @positions.summerletras[i].letra, @positions.summerletras[i].letra, drop.x, drop.y-7, 'bc'
				escena.addChild letra, drop, letrafinal


		@addToMain escena
		@
	setFinal: =>
		es = 'green'

		@insertBitmap es+'screen', es+'screen', stageSize.w / 2, stageSize.h /2, 'mc'
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