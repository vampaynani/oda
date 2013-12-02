class U1A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id:'btnFalse' , src:'btn_false.png'}
			{id:'btnTrue' , src:'btn_true.png'}
			{id:'lugar1' , src:'aquarium.png'}
			{id:'lugar2' , src:'museum.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			scenes : [
				{	
					answers: [
						{text:"Dana and Jake aren't watching a movie.", respuestas:off}
						{text:"Dave and John are swimming with the dolphins.", respuestas:on}
						{text:"Emma and Doris aren't feeding the elephants.", respuestas:on}
						{text:"Alison isn't taking a nap.", respuestas:off}
						{text:"Dave and John aren't feeding the dolphins.", respuestas:on}
						{text:"Alison is eating a hamburger.", respuestas:off}
						{text:"Carl is taking a photograph.", respuestas:off}
						{text:"Mitch is eating a hamburger.", respuestas:on}
						{text:"Mitch and Stella are eating a snack.", respuestas:on}
						{text:"Stella isn't eating a banana.", respuestas:on}
						{text:"Emma and Doris aren't feeding the turtles.", respuestas:off}
						{text:"Carl is talking on his cell phone.", respuestas:on}
					]
				}
				{
					answers: [
						{text:"Spot is taking a picture.", respuestas:off}
						{text:"Diana is explaining the exhibit.", respuestas:on}
						{text:"Kyle is buying a snack.", respuestas:off}
						{text:"Katie isn't sitting down.", respuestas:on}
						{text:"Spot is posing for a picture.", respuestas:on}
						{text:"Ava isn't posing for a picture.", respuestas:on}
						{text:"Ava isn't listening to the guide.", respuestas:on}
						{text:"Katie isn't taking a nap.", respuestas:off}
						{text:"Zoe isn't watching the performance.", respuestas:off}
						{text:"Phil and Arthur aren't eating popcorn.", respuestas:on}
						{text:"Diana is listening to the guide.", respuestas:off}
						{text:"Lindsey is looking for souvenirs.", respuestas:on}
					]
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@escena = 1
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		#@insertBitmap 'btnfalse', 'btnfalse', 457, 541
		#@insertBitmap 'btntrue', 'btntrue', 330, 541
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 14, 0
		@setScene(1).setClick().introEvaluation()
	setScene: (scene) ->
		@scene = @game.scenes[scene - 1]
		@answers = @shuffleNoRepeat @scene.answers, 7
		@insertBitmap 'boy', "lugar#{scene}",  stageSize.w / 2, 490, 'bc'

		@
	setClick:  ->
		@insertBitmap 'btnfalse', 'btnFalse',407, 571
		@insertBitmap 'btntrue', 'btnTrue',  280, 571
		@library.btnfalse.index = off
		@library.btntrue.index = on
		@library.btntrue.addEventListener 'click', @evaluateAnswer
		@library.btnfalse.addEventListener 'click', @evaluateAnswer
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0}
		TweenLite.from @library.boy, 1, {alpha: 0, y: @library.boy.y - 10, ease: Quart.easeOut}
		TweenLite.from @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 10, ease: Quart.easeOut, delay: 0.5}
		TweenLite.from @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 10, ease: Quart.easeOut, delay:0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@insertText 'frases', @answers[@index].text, '20px Quicksand', '#333', stageSize.w / 2, 520, 'center'
		TweenLite.from @library.frases, 0.5, {alpha: 0, y: @library.frases - 10, ease: Quart.easeOut}
	evaluateAnswer: (e) =>
		@answer = e.target
		if @answer.index is @answers[@index].respuestas
			@library.score.plusOne()
			createjs.Sound.play 'good'
		else
			@warning()
		@finishEvaluation()	
	finishEvaluation: =>
		TweenLite.to @library.frases, 0.5, {alpha: 0, y: @library.frases.y - 20, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library.frases.text = @answers[@index].text
			TweenLite.to @library.frases, 0.5, {alpha: 1, y: @library.frases.y + 20, ease: Back.easeOut}
		else
			if @escena is 1
				@index = 0
				@escena = 2
				TweenLite.to @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 10, ease: Quart.easeOut}
				TweenLite.to @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 10, ease: Quart.easeOut}
				TweenLite.to @library.boy, 1, {alpha: 0, y: @library.boy.y - 10, ease: Quart.easeOut}
				TweenLite.to @library.frases, 0.5, {alpha: 0, y: @library.frases - 10, ease: Quart.easeOut}
				@setScene(2).setClick().initEvaluation()
			else
				@finish()
	finish: ->
		super
		TweenLite.to @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 10, ease: Quart.easeOut}
		TweenLite.to @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 10, ease: Quart.easeOut}
		TweenLite.to @library.boy, 1, {alpha: 0, y: @library.boy.y - 10, ease: Quart.easeOut}
		TweenLite.to @library.frases, 0.5, {alpha: 0, y: @library.frases - 10, ease: Quart.easeOut}
	###	
	setAquarium:  ->
		aquarium = new createjs.Container()
		aquarium.x = 120
		aquarium.y = 80

		fondo = @createBitmap 'aqPropbg', 'aqPropbg', 15, 75
		aquarium.addChild fondo
		@addToLibrary fondo

		for i in [0..8]
			label = @createBitmap @personaje.aquarium[i].id, @personaje.aquarium[i].id, @personaje.aquarium[i].x, @personaje.aquarium[i].y
			aquarium.addChild label
			@addToLibrary label
			
		for i in [0..0]
			text = new createjs.Text @preguntas.aquarium[i].statement,'24px Arial','#333'
			text.x = stageSize.w / 2 - 75
			text.y = 420
			text.textAlign = 'center'
			aquarium.addChild text

		@addToMain aquarium
		@
	setMuseum:  ->
		museum = new createjs.Container()
		museum.x = 120
		museum.y = 60

		fondo = @createBitmap 'smPropbg', 'smPropbg', 73, 22
		museum.addChild fondo
		@addToLibrary fondo

		for i in [0..7]
			label = @createBitmap @personaje.museum[i].id, @personaje.museum[i].id, @personaje.museum[i].x, @personaje.museum[i].y
			museum.addChild label
			@addToLibrary label
			
		for i in [0..0]
			text = new createjs.Text @preguntas.museum[i].statement,'24px Arial','#333'
			text.x = stageSize.w / 2 - 75
			text.y = 440
			text.textAlign = 'center'
			museum.addChild text

		@addToMain museum
		@
	introEvaluation: ->
		super
		
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
		
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
	###
	window.U1A3 = U1A3