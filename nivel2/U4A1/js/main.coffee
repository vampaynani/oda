class U4A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'scoreYou', src:'score_you.png'}
			{id: 'scoreComputer', src:'score_computer.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}

			{id: 'borde1', src:'border0001.png'}
			{id: 'borde2', src:'border0002.png'}
			{id: 'borde3', src:'border0003.png'}
 			{id: 'beak', src:'beak.png'}
			{id: 'bear', src:'bear.png'}
			{id: 'camel', src:'camel.png'}
			{id: 'chimpanzee', src:'chimpanzee.png'}
			{id: 'claws', src:'claws.png'}
			{id: 'crocodile', src:'crocodile.png'}
			{id: 'dolphin', src:'dolphin.png'}
			{id: 'eagle', src:'eagle.png'}
			{id: 'elephant', src:'elephant.png'}
			{id: 'feathers', src:'feathers.png'}
			{id: 'fins', src:'fins.png'}
			{id: 'fish', src:'fish.png'}
			{id: 'fox', src:'fox.png'}
			{id: 'frog', src:'frog.png'}
			{id: 'fur', src:'fur.png'}
			{id: 'giraffe', src:'giraffe.png'}
			{id: 'gorilla', src:'gorilla.png'}
			{id: 'jaguar', src:'jaguar.png'}
			{id: 'lion', src:'lion.png'}
			{id: 'list', src:'list.txt'}
			{id: 'monkey', src:'monkey.png'}
			{id: 'octopus', src:'octopus.png'}
			{id: 'owl', src:'owl.png'}
			{id: 'panda', src:'panda.png'}
			{id: 'parrot', src:'parrot.png'}
			{id: 'paws', src:'paws.png'}
			{id: 'penguin', src:'penguin.png'}
			{id: 'polarbear', src:'polar-bear.png'}
			{id: 'python', src:'python.png'}
			{id: 'rhino', src:'rhino.png'}
			{id: 'scales', src:'scales.png'}
			{id: 'sea-turtle', src:'sea-turtle.png'}
			{id: 'shark', src:'shark.png'}
			{id: 'snake', src:'snake.png'}
			{id: 'tail', src:'tail.png'}
			{id: 'tiger', src:'tiger.png'}
			{id: 'whale', src:'whale.png'}
			{id: 'whiskers', src:'whiskers.png'}
			{id: 'wings', src:'wings.png'}
			{id: 'zebra', src:'zebra.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A1_instructions.mp3', id:'instructions'}
		    {id:'beakSound', src:'sounds/beak.mp3'}
			{id:'bearSound', src:'sounds/bear.mp3'}
			{id:'camelSound', src:'sounds/camel.mp3'}
			{id:'chimpanzeeSound', src:'sounds/chimpanzee.mp3'}
			{id:'clawsSound', src:'sounds/claws.mp3'}
			{id:'crocodileSound', src:'sounds/crocodile.mp3'}
			{id:'dolphinSound', src:'sounds/dolphin.mp3'}
			{id:'eagleSound', src:'sounds/eagle.mp3'}
			{id:'elephantSound', src:'sounds/elephant.mp3'}
			{id:'feathersSound', src:'sounds/feathers.mp3'}
			{id:'finsSound', src:'sounds/fins.mp3'}
			{id:'fishSound', src:'sounds/fish.mp3'}
			{id:'foxSound', src:'sounds/fox.mp3'}
			{id:'frogSound', src:'sounds/frog.mp3'}
			{id:'furSound', src:'sounds/fur.mp3'}
			{id:'giraffeSound', src:'sounds/giraffe.mp3'}
			{id:'gorillaSound', src:'sounds/gorilla.mp3'}
			{id:'jaguarSound', src:'sounds/jaguar.mp3'}
			{id:'lionSound', src:'sounds/lion.mp3'}
			{id:'listSound', src:'sounds/list.txt'}
			{id:'monkeySound', src:'sounds/monkey.mp3'}
			{id:'octopusSound', src:'sounds/octopus.mp3'}
			{id:'owlSound', src:'sounds/owl.mp3'}
			{id:'pandaSound', src:'sounds/panda.mp3'}
			{id:'parrotSound', src:'sounds/parrot.mp3'}
			{id:'pawsSound', src:'sounds/paws.mp3'}
			{id:'penguinSound', src:'sounds/penguin.mp3'}
			{id:'polarbearSound', src:'sounds/polar-bear.mp3'}
			{id:'pythonSound', src:'sounds/python.mp3'}
			{id:'rhinoSound', src:'sounds/rhino.mp3'}
			{id:'scalesSound', src:'sounds/scales.mp3'}
			{id:'sea-turtleSound', src:'sounds/sea-turtle.mp3'}
			{id:'sharkSound', src:'sounds/shark.mp3'}
			{id:'snakeSound', src:'sounds/snake.mp3'}
			{id:'tailSound', src:'sounds/tail.mp3'}
			{id:'tigerSound', src:'sounds/tiger.mp3'}
			{id:'whaleSound', src:'sounds/whale.mp3'}
			{id:'whiskersSound', src:'sounds/whiskers.mp3'}
			{id:'wingsSound', src:'sounds/wings.mp3'}
			{id:'zebraSound', src:'sounds/zebra.mp3'}
		]
		@answers = [	
		]
		@animals = [
 			{id: 'beak'}
			{id: 'bear'}
			{id: 'camel'}
			{id: 'chimpanzee'}
			{id: 'claws'}
			{id: 'crocodile'}
			{id: 'dolphin'}
			{id: 'eagle'}
			{id: 'elephant'}
			{id: 'feathers'}
			{id: 'fins'}
			{id: 'fish'}
			{id: 'fox'}
			{id: 'frog'}
			{id: 'fur'}
			{id: 'giraffe'}
			{id: 'gorilla'}
			{id: 'jaguar'}
			{id: 'lion'}
			{id: 'list'}
			{id: 'monkey'}
			{id: 'octopus'}
			{id: 'owl'}
			{id: 'panda'}
			{id: 'parrot'}
			{id: 'paws'}
			{id: 'penguin'}
			{id: 'polarbear'}
			{id: 'python'}
			{id: 'rhino'}
			{id: 'scales'}
			{id: 'sea-turtle'}
			{id: 'shark'}
			{id: 'snake'}
			{id: 'tail'}
			{id: 'tiger'}
			{id: 'whale'}
			{id: 'whiskers'}
			{id: 'wings'}
			{id: 'zebra'}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'scoreComputer', 'scoreComputer', 19, 463
		@insertBitmap 'scoreYou', 'scoreYou', 19, 370
		@insertBitmap 'repeatbtn', 'repeatbtn', 395, 536
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setCardsYou().setCardsPc().introEvaluation()
	setCardsYou: ->
		cartas = new createjs.Container()
		cartas.x = 100
		cartas.y = 145
		cartas.name = 'cartas'
		texto = new createjs.Text 'You','22px Arial','#333'
		texto.x = 150
		texto.y = -25
		cartas.addChild texto
		for h in [0..2]
			for i in [0..2]
				borde= @createSprite 'borde', ['borde1', 'borde2', 'borde3'], null, i*112, h*130, 'tl'
				cartas.addChild borde 
				@addToLibrary borde
				animal = @createBitmap @animals[i].id, @animals[i].id, i*112, h*130
				animal.scaleX = animal.scaleY = 0.36333
				cartas.addChild animal
				@addToLibrary animal
		@addToMain cartas
		@
	setCardsPc: ->
		cartaspc = new createjs.Container()
		cartaspc.x = 449
		cartaspc.y = 145
		cartaspc.name = 'cartaspc'
		texto = new createjs.Text 'Computer','22px Arial','#333'
		texto.x = 117
		texto.y = -25
		cartaspc.addChild texto
		for h in [0..2]
			for i in [0..2]
				borde= @createSprite 'borde', ['borde1', 'borde2', 'borde3'], null, i*112, h*130, 'tl'
				cartaspc.addChild borde 
				@addToLibrary borde
				animal = @createBitmap @animals[i].id, @animals[i].id, i*112, h*130
				animal.scaleX = animal.scaleY = 0.36333
				cartaspc.addChild animal
				@addToLibrary animal
		@addToMain cartaspc
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
	window.U4A1 = U4A1