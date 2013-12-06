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
				{x:'68', y:'182'}
				{x:'68', y:'251'}
				{x:'68', y:'288'}
				{x:'68', y:'310'}
				{x:'68', y:'346'}
				{x:'68', y:'400'}
				{x:'410', y:'182'}
				{x:'410', y:'201'}
				{x:'410', y:'221'}
				{x:'410', y:'285'}
				{x:'410', y:'322'}
				{x:'410', y:'390'}
			]
			parrafo1:[
				'Two heavy          at the end of the hallway open',
				'suddenly. The dining room is full of light. There is a long',
				'         with big, soft chairs around it. There are some',
				'trees growing in the room, there is a waterfall.'
			]
			parrafo2:[
				'The air is full of delicious smells--roasted turkey, soup,',
				'vegetables, homemade bread and cherry pie.'
			]
			parrafo3:[
				"Paul's               growls. He's hungry!"
			]
			parrafo4:[
				'The king sits at the end of the table and invites the',
				'children to sit down next to him.'
			]
			parrafo5:[
				'A golden             in the middle of the table starts to flow.',
				'Musicians with          enter the room and start to play',
				'a beautiful tune.',
			]
			parrafo6:[
				'Servants serve the food to the king and the children.'
				'Paul takes a drink from his       .'
			]
			parrafo7:[
				'The clear liquid is cool and sweet.'
			]
			parrafo8:[
				'"It'+'s delicious!" he says.'
			]
			parrafo9:[
				"It's the water that collects in the flowers at night" ,
				'says the king, "it tastes sweet, just like the           ! The',
				'unicorns and dragons help us collect the water from the',
				'flowers."'
			]
			parrafo10:[
				'Megan remembers Amedrah, the purple dragon. "Is there',
				'a way for us to get back home?" she asks the king.'
			]
			parrafo11:[
				'"Yes, of course. You can leave at any time. Just close your' ,
				'        and imagine that Amedrah is flying here. But',
				'you and Paul are here for a good reason. You have an',
				'important               to ask me!"'
			]
			parrafo12:[
				'Megan looks at Paul. How does the king know? Megan'
				'says, "You'+"'re right- Our town, Lakeville, is in            ."
				'We need your help."'
			]
			drags:[
				{id:'doors', x:'701', y:'492'}
				{id:'table', x:'665', y:'547'}
				{id:'stomach*', x:'731', y:'532'}
				{id:'fountain', x:'557', y:'497'}
				{id:'flutes', x:'496', y:'484'}
				{id:'cup', x:'595', y:'542'}
				{id:'flowers', x:'574', y:'459'}
				{id:'eyes', x:'659', y:'468'}
				{id:'question', x:'518', y:'533'}
				{id:'trouble', x:'634', y:'511'}
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'bg', 'bg', 0, 54

		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setCuento().setDropper().introEvaluation()
	setCuento:  ->
		text = new createjs.Text 'Episode 2','13px Arial','#333'
		text.x = 641
		text.y = 146
		@addToMain text
		for i in [1..12] by 1
			for j in [0..@textos["parrafo#{i}"].length]
				text = new createjs.Text @textos["parrafo#{i}"][j],'13px Arial','#333'
				text.x = @textos.positions[i-1].x
				text.y = @textos.positions[i-1].y - (-j*15)
				@addToMain text
		for i in [1..10]
			text = new DraggableText @textos.drags[i-1].id, @textos.drags[i-1].id, i, @textos.drags[i-1].x, @textos.drags[i-1].y
			@addToMain text
		@
	setDropper: ->
		dropper = new createjs.Container()
		dropper.x = 0
		dropper.y = 0
		dropper.name = 'dropper'
		
		h1 = new WordContainer 'h1', '', '', '#f39234', 130, 184, 35, 13
		h2 = new WordContainer 'h2', '', '', '#f39234', 69, 213, 33, 13
		h3 = new WordContainer 'h3', '', '', '#f39234', 105, 290, 55, 13
		h4 = new WordContainer 'h4', '', '', '#f39234', 122, 348, 47, 13
		h5 = new WordContainer 'h5', '', '', '#f39234', 156, 364, 35, 13
		h6 = new WordContainer 'h6', '', '', '#f39234', 664, 238, 42, 13
		h7 = new WordContainer 'h7', '', '', '#f39234', 409, 339, 30, 13
		h8 = new WordContainer 'h8', '', '', '#f39234', 467, 369, 52, 13
		h9 = new WordContainer 'h9', '', '', '#f39234', 667, 408, 45, 13
		dropper.addChild h1, h2, h3, h4, h5, h6, h7, h8, h9
		@addToLibrary h1, h2, h3, h4, h5, h6, h7, h8, h9
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