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
			{id: 'pas1', src:'pas1.png'}
			{id: 'pas2', src:'pas2.png'}
			{id: 'pas3', src:'pas3.png'}
			{id: 'pas4', src:'pas4.png'}


		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@textos =
			pasaporte1:[
				'Eric Schmidt'
				'Germany'
				'blue'
				'brown'
				'1 m 10 cm'
			]
			nino1:{
				linea1:[
					'I have'
					'blue'
					'eyes. I have straight'
					'brown'
					"hair. I'm"
					'1 m 10 cm'
					'tall.'  
				]
				linea2:[
					"My name's"
					'Eric Schmidt'
					"I'm from Germany."
				]
			}
			pasaporte2:[
				'Melanie Murphy'
				'Ireland'
				'green'
				'red'
				'1 m 7 cm'
			]
			pasaporte3:[
				'Cassandra Wang'
				'China'
				'dark brown'
				'black'
				'1 m 15 cm'
			]
			pasaporte4:[
				'Saul Peterson'
				'Canada'
				'light brown'
				'blonde'
				'1 m 14 cm'
			]
			positions:[
				{x:'65', y:'22'}
				{x:'77', y:'50'}
				{x:'84', y:'78'}
				{x:'90', y:'106'}
				{x:'68', y:'134'}
			]


		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setPassports().setTexto().introEvaluation()
	setPassports: ->
		p1 = new createjs.Container()
		p2 = new createjs.Container()	
		p3 = new createjs.Container()	
		p4 = new createjs.Container()

		p1.x = 130
		p1.y = 130
		p2.y = 135
		p2.x = 430
		p3.x = 130
		p3.y = 304
		p4.x = 434
		p4.y = 304

		fondo1 = @createBitmap 'pas1', 'pas1', 0, 1
		p1.addChild fondo1
		for i in [0..4]
			t = new DraggableText @textos.pasaporte1[i], @textos.pasaporte1[i], i, @textos.positions[i].x,  @textos.positions[i].y
			p1.addChild t
		fondo2 = @createBitmap 'pas2', 'pas2', 0, -4
		p2.addChild fondo2
		for i in [0..4]
			t = new DraggableText @textos.pasaporte2[i], @textos.pasaporte2[i], i, @textos.positions[i].x,  @textos.positions[i].y
			p2.addChild t
		fondo3 = @createBitmap 'pas3', 'pas3', 0, 1
		p3.addChild fondo3
		for i in [0..4]
			t = new DraggableText @textos.pasaporte3[i], @textos.pasaporte3[i], i, @textos.positions[i].x,  @textos.positions[i].y
			p3.addChild t
		fondo4 = @createBitmap 'pas4', 'pas4', -3, 3
		p4.addChild fondo4
		for i in [0..4]
			t = new DraggableText @textos.pasaporte4[i], @textos.pasaporte4[i], i, @textos.positions[i].x,  @textos.positions[i].y
			p4.addChild t

		@addToMain p1
		@addToMain p2
		@addToMain p3
		@addToMain p4
		@
	setTexto:->
		l1 = new  createjs.Container()
		l1.x = 0
		l1.y = 520
		todo = 0
		for i in [0..@textos.nino1.linea1.length-1]
			if ( i % 2 == 0 )
				txt = new createjs.Text @textos.nino1.linea1[i],'24px Arial','#333'
				console.log 'impar'
				txt.x = todo
				todo = txt.getMeasuredWidth() + 8 + txt.x
			else
				txt = new WordContainer 'q1', @textos.nino1.linea1[i], '', '#f00', 30, 0, 10, 10
				console.log 'par'
				txt.x = todo
				todo = txt.w + 15 + txt.x
			console.log todo
			l1.addChild txt
		l1.x = (( 800 - todo ) / 2 )+35
		l2 = new  createjs.Container()
		l2.x = 0
		l2.y = 550
		todo = 0
		for i in [0..@textos.nino1.linea2.length-1]
			if ( i % 2 == 0 )
				txt = new createjs.Text @textos.nino1.linea2[i],'24px Arial','#333'
				console.log 'impar'
				txt.x = todo
				todo = txt.getMeasuredWidth() + 8 + txt.x
			else
				txt = new WordContainer 'q1', @textos.nino1.linea2[i], '', '#f00', 30, 0, 10, 10
				console.log 'par'
				txt.x = todo
				todo = txt.w + 15 + txt.x
			console.log todo
			l2.addChild txt
		l2.x = (( 800 - todo ) / 2 )+35

		@addToMain l1
		@addToMain l2
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