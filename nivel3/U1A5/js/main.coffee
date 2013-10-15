class U1A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'bg', src:'bg.png'}
 			
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@textos =
			positions:[
				{x:'121', y:'189'}
				{x:'121', y:'286'}
				{x:'121', y:'324'}
				{x:'410', y:'189'}
				{x:'410', y:'272'}
			]
			parrafo1:[
				'"Can I help you?" asks a voice. Megan and',
				'Paul turn around and see a thin old man with',
				"thick glasses. The man isn't wearing shoes",
				"but he's wearing bright yellow and orange",
				'socks. The kids laugh.'
			]
			parrafo2:[
				'the mas asks. "Um, yes," Paul replies,'
			]
			parrafo3:[
				'                   says the old man, as he opens',
				'the tent. The kids follow him inside. There are',
				'books everywhere. "Here you are," says the',
				'man.'
			]
			parrafo4:[
				'He gives a heavy purple book to paul. It smells',
				'old. Paul and Megan say                     but then',
				'they notice that the old man is no longer there.',
				'They look at each other, surprised. Paul opens the',
				'book, and a purple light comes out of the pages.'
			]
			parrafo5:[
				'Suddenly, Paul and Megan are riding on the back',
				'of a beautiful purple dragon. They are flying',
				'high in the air. Below they see rivers, lakes',
				'and forests.'
			]
			drags:[
				"Are you looking for a particular book?",
				"We're looking for a book about rain,",
				"Follow me,",
				"It's the Magic Rain Book.",
				"Thank you,"
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'bg', 'bg', 0, 0
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setCuento().setDropper().introEvaluation()
	setCuento:  ->
		text = new createjs.Text 'Episode 1','13px Arial','#333'
		text.x = 641
		text.y = 146
		@addToMain text
		for i in [1..5] by 1
			for j in [0..@textos["parrafo#{i}"].length]
				text = new createjs.Text @textos["parrafo#{i}"][j],'13px Arial','#333'
				text.x = @textos.positions[i-1].x
				text.y = @textos.positions[i-1].y - (-j*15)
				@addToMain text
			text = new DraggableText @textos.drags[i-1], '"'+@textos.drags[i-1]+'"', i, 643, 349 + 35*i
			@addToMain text
		@
	setDropper: ->
		dropper = new createjs.Container()
		dropper.x = 0
		dropper.y = 0
		dropper.name = 'dropper'
		
		h1 = new WordContainer 'h1', '', '', '#f39234', 120, 271, 231, 13
		h2 = new WordContainer 'h2', '', '', '#f39234', 120, 302, 210, 13
		h3 = new WordContainer 'h3', '', '', '#f39234', 120, 325, 70, 13
		h4 = new WordContainer 'h4', '', '', '#f39234', 152, 370, 144, 13
		h5 = new WordContainer 'h5', '', '', '#f39234', 558, 206, 75, 13
		dropper.addChild h1, h2, h3, h4, h5
		@addToLibrary h1, h2, h3, h4, h5
		@addToMain dropper
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
	window.U1A5 = U1A5