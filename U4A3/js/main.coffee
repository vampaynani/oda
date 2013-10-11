class U4A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'animalsfeathers', src:'animals_feathers.png'}
			{id: 'animalbeak', src:'animal_beak.png'}
			{id: 'animalclaws', src:'animal_claws.png'}
			{id: 'animalfins', src:'animal_fins.png'}
			{id: 'animalfur', src:'animal_fur.png'}
			{id: 'animalpaws', src:'animal_paws.png'}
			{id: 'animalscales', src:'animal_scales.png'}
			{id: 'animaltail', src:'animal_tail.png'}
			{id: 'animalwhiskers', src:'animal_whiskers.png'}
			{id: 'animalwings', src:'animal_wings.png'}
			{id: 'bodybeak', src:'body_beak.png'}
			{id: 'bodyclaws', src:'body_claws.png'}
			{id: 'bodyfeathers', src:'body_feathers.png'}
			{id: 'bodyfins', src:'body_fins.png'}
			{id: 'bodyfur', src:'body_fur.png'}
			{id: 'bodypaws', src:'body_paws.png'}
			{id: 'bodyscales', src:'body_scales.png'}
			{id: 'bodytail', src:'body_tail.png'}
			{id: 'bodywhiskers', src:'body_whiskers.png'}
			{id: 'bodywings', src:'body_wings.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A3_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@letra = [
			'Animals, animals everywhere!',	'Some have wings and fly through the air,',	'Some have feathers. Some have scales.', 'Some have fur, and some have tails!',
			'Some have whiskers. Some have claws.', 'Some have fins, and some have paws.',
			'Some have beaks, and some can speak!', 'Animals, animals everywhere!'
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setAnimals().setParts().setText().introEvaluation()
	setParts: ->
		@insertBitmap 'bodybeak', 'bodybeak', 414, 454
		@insertBitmap 'bodyclaws', 'bodyclaws', 154, 167
		@insertBitmap 'bodyfeathers', 'bodyfeathers', 561, 167
		@insertBitmap 'bodyfins', 'bodyfins', 154, 418
		@insertBitmap 'bodyfur', 'bodyfur', 560, 418
		@insertBitmap 'bodypaws', 'bodypaws', 646, 283
		@insertBitmap 'bodyscales', 'bodyscales', 281, 131
		@insertBitmap 'bodytail', 'bodytail', 414, 131
		@insertBitmap 'bodywhiskers', 'bodywhiskers', 280, 454
		@insertBitmap 'bodywings', 'bodywings', 69, 283
		@
	setAnimals: ->
		@insertBitmap 'animalbeak', 'animalbeak', 414, 454
		@insertBitmap 'animalclaws', 'animalclaws', 151, 133
		@insertBitmap 'animalsfeathers', 'animalsfeathers', 553, 156
		@insertBitmap 'animalfins', 'animalfins', 87, 398
		@insertBitmap 'animalfur', 'animalfur', 552, 345
		@insertBitmap 'animalpaws', 'animalpaws', 646, 283
		@insertBitmap 'animalscales', 'animalscales', 265, 131
		@insertBitmap 'animaltail', 'animaltail', 414, 105
		@insertBitmap 'animalwhiskers', 'animalwhiskers', 280, 450
		@insertBitmap 'animalwings', 'animalwings', 47, 285
		@
	setText: ->
		cancion = new createjs.Container()
		cancion.x = 290
		cancion.y = 270
		for i in [0..9]
			text = new createjs.Text @letra[i],'13px Arial','#333'
			text.x = 0
			text.y = i*18
			cancion.addChild text
		@addToMain cancion
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
	window.U4A3 = U4A3