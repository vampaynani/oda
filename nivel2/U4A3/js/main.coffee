class U4A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'animalfeathers', src:'animals_feathers.png'}
			{id: 'animalbeaks', src:'animal_beak.png'}
			{id: 'animalclaws', src:'animal_claws.png'}
			{id: 'animalfins', src:'animal_fins.png'}
			{id: 'animalfur', src:'animal_fur.png'}
			{id: 'animalpaws', src:'animal_paws.png'}
			{id: 'animalscales', src:'animal_scales.png'}
			{id: 'animaltails', src:'animal_tail.png'}
			{id: 'animalwhiskers', src:'animal_whiskers.png'}
			{id: 'animalwings', src:'animal_wings.png'}
			{id: 'bodybeaks', src:'body_beak.png'}
			{id: 'bodyclaws', src:'body_claws.png'}
			{id: 'bodyfeathers', src:'body_feathers.png'}
			{id: 'bodyfins', src:'body_fins.png'}
			{id: 'bodyfur', src:'body_fur.png'}
			{id: 'bodypaws', src:'body_paws.png'}
			{id: 'bodyscales', src:'body_scales.png'}
			{id: 'bodytails', src:'body_tail.png'}
			{id: 'bodywhiskers', src:'body_whiskers.png'}
			{id: 'bodywings', src:'body_wings.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A3_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U4_A3_animals.mp3', id:'animals'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@letra = [
			'Animals, animals everywhere!',	
			'Some have wings and fly through the air,',	
			'Some have feathers. Some have scales.', 
			'Some have fur, and some have tails!',
			'Some have whiskers. Some have claws.', 
			'Some have fins, and some have paws.',
			'Some have beaks, and some can speak!', 
			'Animals, animals everywhere!'
		]
		@answers = 
			words: [
				{w:'whiskers',x:77,y:72}
				{w:'fur',x:77,y:54}
				{w:'fins',x:77,y:90}
				{w:'beaks',x:77,y:108}
				{w:'wings',x:77,y:18}
				{w:'scales',x:214.5,y:36}
				{w:'paws',x:210,y:90}
				{w:'tails',x:205.5,y:54}
				{w:'claws',x:217,y:72}
				{w:'feathers',x:77,y:36}
			]
			pairs: [
				{b:'bodybeaks', a: 'animalbeaks', x: 464, y: 504, s: off}
				{b:'bodyclaws', a: 'animalclaws', x: 204, y: 217,  s: off}
				{b:'bodyfeathers', a: 'animalfeathers', x: 610, y: 217,  s: off}
				{b:'bodyfins', a: 'animalfins', x: 204, y: 468,  s: off}
				{b:'bodyfur', a: 'animalfur', x: 610, y: 468,  s: off}
				{b:'bodypaws', a: 'animalpaws', x: 696, y: 333,  s: off}
				{b:'bodyscales', a: 'animalscales', x: 331, y: 181,  s: off}
				{b:'bodytails', a: 'animaltails', x: 464, y: 181,  s: off}
				{b:'bodywhiskers', a: 'animalwhiskers', x: 330, y: 504,  s: off}
				{b:'bodywings', a: 'animalwings', x: 119, y: 333,  s: off}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@setParts().setAnimals().setText().introEvaluation()
	setParts: ->
		parts = new createjs.Container()
		parts.name = 'parts'
		for value in @answers.pairs
			m = @insertBitmap value.b, value.b, value.x, value.y, 'mc'
			@addToLibrary m
			parts.addChild m
		@addToMain parts
		@
	setAnimals: ->
		animals = new createjs.Container()
		animals.name = 'animals'
		for value in @answers.pairs
			m = @insertBitmap value.a, value.a, value.x, value.y, 'mc'
			m.alpha = 0
			@addToLibrary m
			animals.addChild m
		@addToMain animals
		@
	setText: ->
		cancion = new createjs.Container()
		cancion.name = 'cancion'
		cancion.x = 290
		cancion.y = 270
		for i in [0..@letra.length - 1] by 1
			text = new createjs.Text @letra[i],'13px Quicksand','#666'
			text.x = 0
			text.y = i * 18
			cancion.addChild text
		for i in [0..@answers.words.length - 1] by 1
			text = new createjs.Text @answers.words[i].w, '13px Quicksand', '#000'
			text.name = "t#{i}"
			text.x = @answers.words[i].x
			text.y = @answers.words[i].y
			@addToLibrary text
			cancion.addChild text
		@addToMain cancion
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['cancion'], 0.5, {alpha :0, y: @library['cancion'].y - 20, delay: 1}
		TweenLite.from @library['parts'], 0.5, {alpha: 0, y: @library['parts'].y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@blink @library["t#{@index}"]
		for value in @answers.pairs
			@library[value.b].addEventListener 'click', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		@animal = @answers.words[@index].w
		if @answer.name is "body#{@answers.words[@index].w}"
			createjs.Sound.play 'good'
			setTimeout @finishEvaluation, 0.5 * 1000
		else
			@warning()
	finishEvaluation: =>
		@blink @library["t#{@index}"], off
		@library.score.plusOne()
		TweenLite.to @library["body#{@animal}"], 1, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library["animal#{@animal}"], 1, {alpha: 1, ease: Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.words.length
			@blink @library["t#{@index}"]
		else
			anim = createjs.Sound.play 'animals'
			anim.addEventListener 'complete', @finish
	blink: (obj, state=on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	finish: =>
		TweenLite.to @library['cancion'], 0.5, {alpha :0, y: @library['cancion'].y - 20}
		TweenLite.to @library['parts'], 0.5, {alpha: 0, y: @library['parts'].y + 20}
		TweenLite.to @library['animals'], 0.5, {alpha: 0, y: @library['animals'].y + 20}
		super
	window.U4A3 = U4A3