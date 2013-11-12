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
				{x:'100', y:'182'}
				{x:'100', y:'281'}
				{x:'100', y:'318'}
				{x:'100', y:'355'}
				{x:'100', y:'375'}
				{x:'424', y:'182'}
				{x:'424', y:'233'}
				{x:'424', y:'320'}
				{x:'424', y:'352'}
				{x:'424', y:'285'}
				{x:'424', y:'322'}
				{x:'424', y:'390'}
			]

				
	
			parrafo1:[
				"It's a beautiful fall day in Lakeville. The         are full",
				'of bright red and yellow leaves. There are apples,',
				'peaches and pears on the trees. Paul and Megan are ',
				'standing next to the        , which is full of clear blue',
				'water. They are planting a tree. A cool          blows',
				'gently. Megan remembers the Kingdom of Waters.'

			]
			parrafo2:[
				'"Things are very different now, aren'+"'"+'t they?" she says',
				'to Paul.'
			]
			parrafo3:[
				'"A lot of things are different. There'+ "'s water now for",
				'all the plants and             ," he says.'
			]
			parrafo4:[
				'"For us, too," Megan adds.'
			]
			parrafo5:[
				'The wind blows again. Paul remembers flying with',
				'Amedrah, looking at the lakes and rivers of the',
				'Kingdom of Waters. "Too bad Amerah the dragon'
			]
			parrafo6:[
				"can't visit us here. I want to fly on his          above",
				'Lakeville and see the lake from the air. I bet it looks',
				'beautiful!"'
			]
			parrafo7:[
				"They take the Magic Rain Book out of Paul's",
				"               . They look at the book's cover. in the",
				'bright              , they see something new and',
				'surprising. The little says, "The Kigndom of Waters."',
				'Under the title, it says, "Imagine it is your          !"'
			]
			parrafo8:[
				'"I have an idea," Megan says. "Let'+"'s imagine that",
				'Amedrah the dragon is here with us in our world!"'
			]
			parrafo9:[
				'The kids close their          . The wind starts blowing.',
				'The kids look up. A purple dragon appears in the',
				'clear blue        , Paul and Megan look at each other',
				'and smile.'
			]

			drags:[
				{id:'trees', x:'701', y:'492'}
				{id:'lake', x:'665', y:'547'}
				{id:'wind', x:'731', y:'532'}
				{id:'animals', x:'557', y:'497'}
				{id:'back', x:'496', y:'484'}
				{id:'backpack', x:'595', y:'542'}
				{id:'sunlight', x:'574', y:'459'}
				{id:'world', x:'659', y:'468'}
				{id:'eyes', x:'518', y:'533'}
				{id:'sky', x:'634', y:'511'}
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
		text = new createjs.Text 'Episode 3','13px Arial','#333'
		text.x = 641
		text.y = 146
		@addToMain text
		for i in [1..9] by 1
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
		
		h1 = new WordContainer 'h1', '', '', '#f39234', 323, 184, 30, 13
		h2 = new WordContainer 'h2', '', '', '#f39234', 218, 228, 33, 13
		h3 = new WordContainer 'h3', '', '', '#f39234', 323, 242, 36, 13
		h4 = new WordContainer 'h4', '', '', '#f39234', 202, 335, 47, 13
		h5 = new WordContainer 'h5', '', '', '#f39234', 639, 184, 35, 13
		h6 = new WordContainer 'h6', '', '', '#f39234', 425, 249, 57, 13
		h7 = new WordContainer 'h7', '', '', '#f39234', 459, 264, 53, 13
		h8 = new WordContainer 'h8', '', '', '#f39234', 667, 295, 36, 13
		h9 = new WordContainer 'h9', '', '', '#f39234', 540, 354, 45, 13
		h10 = new WordContainer 'h9', '', '', '#f39234', 482, 384, 30, 13
		dropper.addChild h1, h2, h3, h4, h5, h6, h7, h8, h9, h10
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