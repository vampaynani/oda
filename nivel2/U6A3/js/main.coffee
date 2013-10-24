class U1A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
		    {id: 'inst' , src: 'texto_look.png'}
		    {id: 'c1' , src: 'circle1.png'}
		    {id: 'c2' , src: 'circle2.png'}
		    {id: 'aBank', src:'a-bank.png'}
			{id: 'aBusstop', src:'a-bus-stop.png'}
			{id: 'aCandystore', src:'a-candy-store.png'}
			{id: 'aGasstation', src:'a-gas-station.png'}
			{id: 'aGrocerystore', src:'a-grocery-store.png'}
			{id: 'aHospital', src:'a-hospital.png'}
			{id: 'aLibrary', src:'a-library.png'}
			{id: 'aMovietheater', src:'a-movie-theater.png'}
			{id: 'aPetstore', src:'a-pet-store.png'}
			{id: 'aPolicestation', src:'a-police-station.png'}
			{id: 'aPostoffice', src:'a-post-office.png'}
			{id: 'aRestaurant', src:'a-restaurant.png'}
			{id: 'aShoestore', src:'a-shoe-store.png'}
			{id: 'anAnimalhospital', src:'an-animal-hospital.png'}
			{id: 'anInternetcafe', src:'an-Internet-cafe.png'}
			{id: 'n1', src:'tag_preposition.png'}
			{id: 'n2', src:'tag_words.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_Instructions.mp3', id:'instructions'}
		]
		
		@info = [ ##no se como tengan que organizarse cada imagen tiene una frase que debe mostrar. Falta completar aqui las frases
			{img:'cafe', frase:''}
			{img:'stop', frase:'I need to take a bus.'}
			{img:'library', frase:''}
			{img:'grocery', frase:'I need some groceries.'}
			{img:'police', frase:'I have a problem! I need some help!'}
			{img:'candy', frase:'I want a box of chocolates.'}
			{img:'post', frase:'I need to send a postcard.'}
			{img:'animal', frase:''}
			{img:'bus', frase:''}
			{img:'theater', frase:'I want to watch a movie.'}
			{img:'pet', frase:'I need some dog food.'}
			{img:'shoe', frase:'I need some sandals.'}
			{img:'gas', frase:'I need some gas.'}
			{img:'station', frase:''}
			{img:'store', frase:''}
			{img:'hospital', frase:''}
			{img:'bank', frase:''}
			{img:'internet', frase:'I need to send an e-mail.'}
			{img:'movie', frase:''}
			{img:'office', frase:''}

		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		Imgs = @createSprite 'images', ['aBank' , 'aBusstop' , 'aCandystore' , 'aGasstation' , 'aGrocerystore' , 'aHospital' , 'aLibrary' , 'aMovietheater' , 'aPetstore' , 'aPolicestation' , 'aPostoffice' , 'aRestaurant' , 'aShoestore' , 'anAnimalhospital' , 'anInternetcafe'], null, stageSize.w / 2, 215, 'mc'
		Imgs.scaleX = Imgs.scaleY = 0.3
		@addToMain Imgs

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setDropper().setNube1().setNube2().introEvaluation()
	setDropper: ->
		dropper = new createjs.Container()
		dropper.x = stageSize.w / 2 - 160
		dropper.y = @library['images'].y + 10
		dropper.name = 'dropper'

		frase = new createjs.Text @info[1].frase,'24px Arial','#333'
		frase.x = 160
		frase.y = 110
		frase.textAlign = 'center'
		dropper.addChild frase

		isThere = new createjs.Text 'Is there','24px Arial','#333'
		isThere.x = 0
		isThere.y = 140
		dropper.addChild isThere
		h1 = new WordContainer 'h1', '', '', '#f00', 90, 145, 40, 22
		h2 = new WordContainer 'h2', '', '', '#f00', 140, 145, 90, 22
		h3 = new WordContainer 'h3', '', '', '#f00', 240, 145, 55, 22
		question = new createjs.Text '?','24px Arial','#333'
		question.x = 300
		question.y = 140
		dropper.addChild question

		dropper.addChild  h1, h2, h3
		@addToLibrary h1, h2, h3
		@addToMain dropper
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 100
		container.y = @library['dropper'].y + 180
		container.name = 'nube1'
		back = @createBitmap 'backNube1', 'n1', 0, 0
		p1n1 = new DraggableText 'p1n1', "a", 0, 26,15
		p2n1 = new DraggableText 'p2n1', "an", 1, 44, 30
		container.addChild back, p1n1, p2n1
		@addToLibrary back, p1n1, p2n1
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 250
		container.y = @library['dropper'].y + 180
		container.name = 'nube2'
		back = @createBitmap 'backNube2', 'n2', 0, 0

		p1n2 = new DraggableText 'p1n2', "cafe", 0, 20,25 
		p2n2 = new DraggableText 'p2n2', "stop", 1, 24,70 
		p3n2 = new DraggableText 'p3n2', "library", 2, 65,45 
		p4n2 = new DraggableText 'p4n2', "grocery", 3, 74,85 
		p5n2 = new DraggableText 'p5n2', "police", 4, 56,107
		p6n2 = new DraggableText 'p6n2', "candy", 5, 124,26 
		p7n2 = new DraggableText 'p7n2', "post", 6, 141,60 
		p8n2 = new DraggableText 'p8n2', "animal", 7, 152,105 
		p9n2 = new DraggableText 'p9n2', "bus", 8, 200,21
		p10n2 = new DraggableText 'p10n2', "theater", 9, 189,66 
		p11n2 = new DraggableText 'p11n2', "pet", 10, 253,33 
		p12n2 = new DraggableText 'p12n2', "shoe", 11, 240,100 
		p13n2 = new DraggableText 'p13n2', "gas", 12, 303,25 
		p14n2 = new DraggableText 'p14n2', "station", 13, 273,71 
		p15n2 = new DraggableText 'p15n2', "store", 14, 327,46 
		p16n2 = new DraggableText 'p16n2', "hospital", 15, 305,104 
		p17n2 = new DraggableText 'p17n2', "bank", 16, 378,25 
		p18n2 = new DraggableText 'p18n2', "internet", 17, 363,75 
		p19n2 = new DraggableText 'p19n2', "movie", 18, 383,111 
		p20n2 = new DraggableText 'p20n2', "office", 19, 418,48 

		container.addChild back, p1n2, p2n2, p3n2, p4n2, p5n2, p6n2, p7n2, p8n2, p9n2, p10n2, p11n2, p12n2, p13n2, p14n2, p15n2, p16n2, p17n2, p18n2, p19n2, p20n2
		@addToLibrary back, p1n2, p2n2, p3n2, p4n2, p5n2, p6n2, p7n2, p8n2, p9n2, p10n2, p11n2, p12n2, p13n2, p14n2, p15n2, p16n2, p17n2, p18n2, p19n2, p20n2
		@addToMain container
		@
	introEvaluation: ->
		super
		for i in [1..2] by 1
			@observer.subscribe 'init_evaluation', @library['p'+i+'n1'].onInitEvaluation
		for i in [1..4] by 1
			@observer.subscribe 'init_evaluation', @library['p'+i+'n2'].onInitEvaluation
		for i in [1..5] by 1
			@observer.subscribe 'init_evaluation', @library['p'+i+'n3'].onInitEvaluation
		
		@library['characters'].currentFrame = @index
		@library['characters'].scaleX = 1
		@library['characters'].scaleY = 1
		@library['characters'].alpha = 1
		
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 50, delay: 1}
		TweenLite.from @library['dropper'], 1, {alpha: 0, y: @library['dropper'].y + 20, delay: 1.2}
		TweenLite.from @library['nube1'], 1, {alpha: 0, y: @library['nube1'].y + 20, delay: 1.4}
		TweenLite.from @library['nube2'], 1, {alpha: 0, y: @library['nube2'].y + 20, delay: 1.5}
		TweenLite.from @library['nube3'], 1, {alpha: 0, y: @library['nube3'].y + 20, delay: 1.6, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library['h1'].blink()
		@blink @library['backNube1']
		for i in [1..2] by 1
			@library['p'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		false
	evaluateAnswer1: (e) =>
		@answer = e.target
		pt = @library['h1'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h1'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w1
				@answer.visible = false
				@library['h1'].changeText @answer.text.text
				@library['h1'].blink off
				@blink @library['backNube1'], off
				@library['h2'].blink()
				@blink @library['backNube2']
				for i in [1..4] by 1
					@library['p'+i+'n2'].addEventListener 'drop', @evaluateAnswer2
				false
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateAnswer2: (e) =>
		@answer = e.target
		pt = @library['h2'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h2'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w2
				@answer.visible = false
				@library['h2'].changeText @answer.text.text
				@library['h2'].blink off
				@blink @library['backNube2'], off
				@library['h3'].blink()
				@blink @library['backNube3']
				for i in [1..5] by 1
					@library['p'+i+'n3'].addEventListener 'drop', @evaluateAnswer3
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateAnswer3:(e) =>
		@answer = e.target;
		pt = @library['h3'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h3'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w3
				@answer.visible = false
				@library['h3'].changeText @answer.text.text
				@library['h3'].blink off
				@blink @library['backNube3'], off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		song = createjs.Sound.play @answers[@index].sound
		song.addEventListener 'complete', @clearEvaluation
	clearEvaluation: (e) =>
		for i in [1..2] by 1
			@library['p'+i+'n1'].visible = true
			@library['p'+i+'n1'].returnToPlace()
		for i in [1..4] by 1
			@library['p'+i+'n2'].visible = true
			@library['p'+i+'n2'].returnToPlace()
		for i in [1..5] by 1
			@library['p'+i+'n3'].visible = true
			@library['p'+i+'n3'].returnToPlace()
		for i in [1..3] by 1
			@library['h'+i].changeText ''
		TweenLite.to @library['characters'], 0.5, {scaleX: 1.5, scaleY: 1.5, alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['characters'].currentFrame = @index
			@library['h1'].blink()
			@blink @library['backNube1']
			TweenLite.to @library['characters'], 0.5, {scaleX: 1, scaleY: 1, alpha: 1, ease: Back.easeOut}
			for i in [1..2] by 1
				@library['p'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		else
			@finish()
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		super
	window.U1A1 = U1A1