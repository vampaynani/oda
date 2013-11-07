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
 			{id: 'n1', src:'question.png'}
			{id: 'scene1', src:'scenebrazil.png'}
			{id: 'scene2', src:'scenechina.png'}
			{id: 'scene3', src:'sceneindia.png'}
			{id: 'n2', src:'verb.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@textos =
			esc1:{
				nube1:[
					{p:'When', x:'25', y:'35'}
					{p:'What', x:'90', y:'22'}
					{p:'Where', x:'70', y:'70'}
				]
				nube2:[
					{p:'celebrate', x:'26', y:'20'}
					{p:'do', x:'50', y:'72'}
					{p:'wear', x:'85', y:'58'}
				]
				preguntas:[
					{question1:'Where', frase1:'do they ', question2:'celebrate', frase2:'Reveillon?', answer:'In Brazil.'}
					{question1:'When', frase1:'do they ', question2:'celebrate', frase2:'Reveillon?', answer:'On January 1st.'}
					{question1:'What', frase1:'do they ', question2:'wear', frase2:'?', answer:'White clothes.'}
				]
			}


		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setScene().setQuestion().introEvaluation()
	setScene: ->
		escena = 1
		@insertBitmap 'scene'+escena, 'scene'+escena, stageSize.w / 2, 150, 'tc'

		nube1 = new createjs.Container()
		nube1.x = 210
		nube1.y = 480
		n1 = @createBitmap 'n1', 'n1', 0, 0
		t1n1 = new DraggableText 't1n1', @textos.esc1.nube1[0].p, 0, @textos.esc1.nube1[0].x, @textos.esc1.nube1[0].y 
		t2n1 = new DraggableText 't2n1', @textos.esc1.nube1[1].p, 1, @textos.esc1.nube1[1].x, @textos.esc1.nube1[1].y
		t3n1 = new DraggableText 't3n1', @textos.esc1.nube1[2].p, 2, @textos.esc1.nube1[2].x, @textos.esc1.nube1[2].y
		#t4n1 = new DraggableText 't3n1', "There are", 3, 15, 25 
		nube1.addChild n1, t1n1, t2n1, t3n1#, t4n1

		nube2 = new createjs.Container()
		nube2.x = 440
		nube2.y = 480
		n2 = @createBitmap 'n2', 'n2', 0, 0
		t1n2 = new DraggableText 't0n2', @textos.esc1.nube2[0].p, 0, @textos.esc1.nube2[0].x, @textos.esc1.nube2[0].y 
		t2n2 = new DraggableText 't1n2', @textos.esc1.nube2[1].p, 1, @textos.esc1.nube2[1].x, @textos.esc1.nube2[1].y
		t3n2 = new DraggableText 't2n2', @textos.esc1.nube2[2].p, 2, @textos.esc1.nube2[2].x, @textos.esc1.nube2[2].y
		#t4n2 = new DraggableText 't3n2', "There are", 3, 15, 25 
		nube2.addChild n2, t1n2, t2n2, t3n2#, t4n2


		@addToMain nube1
		@addToMain nube2
		@
	setQuestion:  ->
		question = new createjs.Container()
		question.x = 0
		question.y = 410	

		for i in [2..2]
			txt1 = new createjs.Text 'Q: ','24px Arial','#333'
			txt1.x = 0

			q1 = new WordContainer 'q1',@textos.esc1.preguntas[i].question1, '#ccc', '#f00', 30, 0, 10, 10
			q1.x = 30

			txt2 = new createjs.Text @textos.esc1.preguntas[i].frase1,'24px Arial','#333'
			txt2.x = q1.w + q1.x + 20

			q2 = new WordContainer 'q2',@textos.esc1.preguntas[i].question2, '#ccc', '#f00', 30, 0, 10, 10
			q2.x = txt2.x + txt2.getMeasuredWidth()

			txt3 = new createjs.Text @textos.esc1.preguntas[i].frase2,'24px Arial','#333'
			txt3.x = q2.w + q2.x + 20


			txt4 = new createjs.Text 'A: ','24px Arial','#333'
			txt4.x = 0

			txt5 = new createjs.Text @textos.esc1.preguntas[i].answer,'24px Arial','#333'
			txt5.x = 30
			txt4.y = txt5.y = 30

			question.addChild txt1, q1, txt2, q2, txt3, txt4, txt5

			todo = txt3.x + txt3.getMeasuredWidth()
			question.x = (800 - todo) /2
			console.log todo
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