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
			{id: 'final', src:'fondofinal.png'}
			{id: 'cancion', src:'cancion.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U5_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U5_A2_song.mp3', id:'song'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			answers:[
				{a:"was", x:45, y:0}
				{a:"were", x:32, y:1}
				{a:"was", x:48, y:2}
				{a:"was", x:220, y:2}
				{a:"wasn't", x:32, y:3}
				{a:"weren't", x:32, y:4}
				{a:"weren't", x:255, y:4}
				{a:"was", x:32, y:5}
				{a:"were", x:65, y:6}
				{a:"was", x:65, y:7}
				{a:"was", x:32, y:8}
				{a:"was", x:0, y:9}
			] 
		


		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'final', 'final', 650, 100, 'tc'
		@insertInstructions 'instructions', 'Drag the verbs to complete the song.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 16, 0
		@setcancion().setDropper().introEvaluation()
	setcancion: ->
		cancion = new createjs.Container()
		cancion.x = 47
		cancion.y = 120
		cancion.name = 'cancion'

		fondo = @createBitmap 'cancion', 'cancion', 0, 0
		fondo.scaleX = fondo.scaleY = 0.7
		cancion.addChild fondo

		v1 = new DroppableText 'v1', "was", 0, 15,  12, @stage
		v2 = new DroppableText 'v2', "wasn't", 1, 55,  12, @stage
		v3 = new DroppableText 'v3', "were", 2, 110,  12, @stage
		v4 = new DroppableText 'v4', "weren't", 3, 155,  12, @stage
		v1.text.font = v2.text.font = v3.text.font = v4.text.font = '14px Quicksand'

		@addToLibrary v1, v2, v3, v4
		cancion.addChild v1, v2, v3, v4

		@addToMain cancion
		@
	setDropper: ->
		dropper = new createjs.Container()
		dropper.x = 70
		dropper.y = 190
		dropper.name = 'dropper'
		console.log @game.answers.length

		for i in [0..@game.answers.length - 1]
			h = new WordContainer "h#{i}", '', '', '',  @game.answers[i].x,  @game.answers[i].y * 30.5, 85, 25
			h.text.font = '20px Quicksand'
			h.index = i
			dropper.addChild h
			@addToLibrary h
			console.log @game.answers[i].a

		@addToMain dropper
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.cancion, 1, {alpha: 0, delay: 1}
		TweenLite.to @library.final, 0, {alpha: 0}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..4] by 1
			@library["v#{i}"].addEventListener 'dropped', @evaluateAnswer
			@library["v#{i}"].initDragListener()
	evaluateAnswer: (e) =>

	finishEvaluation: =>
		createjs.Sound.play 'song'
		TweenLite.from @library.final, 1, {alpha: 0}
		setTimeout @clearEvaluation, 1 * 10000
	clearEvaluation: (e) =>
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20, onComplete: @nextEvaluation}
		@finish()
	finish: ->
		TweenLite.to @library.cancion, 1, {alpha: 0}
		super
	window.U5A2 = U5A2