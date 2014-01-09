class U8A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
 			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			
			{id: 'propbg', src:'prop_bg.png'}
			{id: 'propwords', src:'prop_words.png'}
			{id: 'img1', src:'img_1.png'}
			{id: 'img2', src:'img_2.png'}
			{id: 'img3', src:'img_3.png'}
			{id: 'img4', src:'img_4.png'}
			{id: 'img5', src:'img_5.png'}
			{id: 'img6', src:'img_6.png'}
			{id: 'img7', src:'img_7.png'}
			{id: 'img8', src:'img_8.png'}
			{id: 'img9', src:'img_9.png'}
			{id: 'img10', src:'img_10.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U8_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			images: [
				{id:'img1', x:660, y:208}
				{id:'img2', x:642, y:295}
				{id:'img3', x:594, y:399}
				{id:'img4', x:487, y:445}
				{id:'img5', x:275, y:366}
				{id:'img6', x:407, y:223}
				{id:'img7', x:-8, y:287}
				{id:'img8', x:430, y:409}
				{id:'img9', x:490, y:300}
				{id:'img10', x:658, y:414}
			]
			steps:[
				{pattern:["#wc", "climbed out of the water first?", "#br", "Honupo'okea, the Great Mother Turtle."], targets:['Who']}#flor derecha
				{pattern:["#wc", "did Honupo'okea create a nest with her flippers?", "#br", "She created a nest for her egg."], targets:['Why']}#matorral derecho
				{pattern:["#wc", "waited in the water while Honupo'okea built her nest?", "#br", "Honu'ea, the Great Father Turtle."], targets:['Who']}#cangrejo
				{pattern:["#wc", "did the egg look like?", "#br", "It was completely round and smooth."], targets:['What']}#caracol
				{pattern:["#wc", "did Honupo'okea cover the egg?", "#br", "She brushed soft, Black sand over it."], targets:['how']}#tortuga
				{pattern:["#wc", "did the two turtles create next?", "#br", "They created a pool of fresh water."], targets:['What']}#flor izquierda
				{pattern:["#wc", "did the two turtles go after that?", "#br", "They returned to the ocean."], targets:['Where']}#matorral izquierdo
				{pattern:["#wc", "did Honupo'okea come back to the beach?", "#br", "When her egg was going to hatch."], targets:['When']}#estrella
				{pattern:["#wc", "wasn't Kauila a turtle at the end?", "#br", "She became a human girl."], targets:['why']}#niña
				{pattern:["#wc", "does Kauila live now?", "#br", "She continues to live by her pool of fresh water."], targets:['Where']}#agua
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Find and click on ten objects. Then drag the words to complete the questions.', 40, 100
		#@setMenu()
		@steps = @game.steps

		@setScene().setWords()
		@setDropper( 1 ).introEvaluation()
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 20, 0
	setScene: ->
		escena = new createjs.Container()
		escena.name = 'escena'
		fondo = @createBitmap 'propbg', 'propbg', -14, 120
		escena.addChild fondo
		for i in [1..10]
			m = @createBitmap @game.images[i - 1].id, @game.images[i - 1].id, @game.images[i - 1].x,  @game.images[i - 1].y 
			escena.addChild m
		@addToMain escena
		@
	setWords: ->
		palabras = new createjs.Container()
		palabras.name = 'palabras'

		palabras.x = 163
		palabras.y = 443
		fondo = @createBitmap 'propwords', 'propwords', 0, 0
		palabras.addChild fondo
		p1 = new DroppableText "p1", 'When', 'When', 30, 14, @stage
		p2 = new DroppableText "p2", 'Who', 'Who', 110, 14, @stage
		p3 = new DroppableText "p3", 'What', 'What', 180, 14, @stage
		p4 = new DroppableText "p4", 'Where', 'Where', 250, 14, @stage
		p5 = new DroppableText "p5", 'Why', 'Why', 335, 14, @stage
		p6 = new DroppableText "p6", 'How', 'How', 410, 14, @stage
		@addToLibrary p1, p2, p3, p4, p5, p6
		palabras.addChild p1, p2, p3, p4, p5, p6

		@addToMain palabras
	setDropper: (step) ->
		@step = step
		if @library.dropper and @mainContainer.contains @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.x = 220
			dropper.y = 500
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()
		
		i = 0
		j = 0
		npos = 0
		@targets = new Array()
		for t in @steps[step - 1].pattern
			ny = j * 30 + 7
			if t is '#br'
				npos = 0
				j++
			else if t is '#wc'
				txt = @steps[step - 1].targets[i]
				h = new WordContainer "h#{i}", "#{txt}", '#FFF', '#F00', npos, ny
				h.text.font = '17px Quicksand'
				h.index = i
				dropper.addChild h
				@addToLibrary h
				@targets.push h
				npos += h.width + 7
				i++
			else
				h = @createText '', t,'17px Quicksand','#333', npos, ny
				dropper.addChild h
				npos += h.getMeasuredWidth() + 12
				console.log npos
				if j is 0
					dropper.x =  stageSize.w / 2 - npos / 2 - 12
				else 
					h.x = stageSize.w / 2 - npos / 2 - 12 - dropper.x
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.palabras, 1, {alpha: 0, delay: 1}
		TweenLite.from @library.escena, 1, {alpha: 0, delay: 1}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..6] by 1
			@library["p#{i}"].updateDrops @targets
			@library["p#{i}"].addEventListener 'dropped', @evaluateAnswer
			@library["p#{i}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			@finishEvaluation()
			if @intento is 0 
				@library['score'].plusOne()
			@intento = 0

		else
			@warning()
			@intento = 1
			@answer.returnToPlace()
	finishEvaluation: =>
		createjs.Sound.play 'good'
		for target in @targets
			if target.text.text is ''
				return
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for i in [1..6] by 1
			@library["p#{i}"].visible = true
			@library["p#{i}"].returnToPlace()
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			@setDropper @index + 1
			for i in [1..6] by 1
				@library["p#{i}"].updateDrops @targets
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 500}
		else
			@finish()
	finish: ->
		super
	window.U8A5 = U8A5