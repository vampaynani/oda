class U6A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id: 'inst' , src: 'inst.png'}
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
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U6_A3_Instructions.mp3', id:'instructions'}
		]
		@game =
			steps : [ ##no se como tengan que organizarse cada imagen tiene una frase que debe mostrar. Falta completar aqui las frases
				{img:'aBank', frase:'I need some money', targets: ['a','bank']}
				{img:'aBusstop', frase:'I need to take a bus.', targets: ['a','bus','stop']}
				{img:'aCandystore', frase:'I want a box of chocolates.', targets: ['a','candy','store']}
				{img:'aGasstation', frase:'I need some gas.', targets: ['a','gas','station']}
				{img:'aGrocerystore', frase:'I need some groceries.', targets: ['a','grocery','store']}
				{img:'aHospital', frase:'I need a doctor', targets: ['a','hospital']}
				{img:'aLibrary', frase:'I need a book', targets: ['a','library']}
				{img:'aMovietheater', frase:'I want to watch a movie.', targets: ['a','movie','theater']}
				{img:'aPetstore', frase:'I need some dog food.', targets: ['a','pet','store']}
				{img:'aPolicestation', frase:'I have a problem! I need some help!', targets: ['a','police','station']}
				{img:'aPostoffice', frase:'I need to send a postcard.', targets: ['a','post','office']}
				{img:'aShoestore', frase:'I need some sandals.', targets: ['a','shoe','store']}
				{img:'anInternetcafe', frase:'I need to send an e-mail.', targets: ['an','Internet','cafe']}
			]
			opt1:[
				{i:1, t:'a', x:52, y:30}
				{i:2, t:'an', x:88, y:60}
			]
			opt2:[
				{i:1, t:'cafe', x:40, y:50}
				{i:2, t:'stop', x:48, y:140}
				{i:3, t:'library', x:130, y:90}
				{i:4, t:'grocery', x:148, y:170}
				{i:5, t:'police', x:112, y:214}
				{i:6, t:'candy', x:248, y:52}
				{i:7, t:'post', x:282, y:120}
				{i:8, t:'animal', x:304, y:210}
				{i:9, t:'bus', x:400, y:42}
				{i:10, t:'theater', x:378, y:132}
				{i:11, t:'pet', x:506, y:66}
				{i:12, t:'shoe', x:480, y:200}
				{i:13, t:'gas', x:606, y:50}
				{i:14, t:'station', x:546, y:142}
				{i:15, t:'store', x:654, y:92}
				{i:16, t:'hospital', x:610, y:208}
				{i:17, t:'bank', x:756, y:50}
				{i:18, t:'internet', x:726, y:150}
				{i:19, t:'movie', x:766, y:222}
				{i:20, t:'office', x:836, y:96}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@steps = @shuffleNoRepeat @game.steps, 11
		@intento = 0
		stepsimg = (step.img for step in @steps)
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read and drag the words to make questions.', 80, 200
		imgs = @createSprite 'images', stepsimg, null, stageSize.w / 2, 470, 'mc'
		imgs.scaleX = imgs.scaleY = 0.7
		@addToMain imgs

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 10, 0
		@setDropper(1).setNube1().setNube2().introEvaluation()
	setDropper: (step) ->
		@step = step
		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.y = @library.images.y + 20
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		frase = @createText 'frase', @steps[step - 1].frase,'48px Quicksand','#333', 380, 220, 'center'
		@addToLibrary frase
		dropper.addChild frase

		isThere = @createText 'isThere', 'Is there','48px Quicksand','#333', 0, 300
		dropper.addChild isThere

		for i in [0..@steps[step - 1].targets.length - 1] by 1
			h = new WordContainer "h#{i}", '', '#FFF', '#F00', 220 * i + isThere.getMeasuredWidth() + 20, 310, 200, 44
			h.index = i
			dropper.addChild h
			@addToLibrary h
		question = @createText 'q', '?','48px Quicksand','#333', @steps[step - 1].targets.length * 230 + isThere.getMeasuredWidth() - 20, 300
		dropper.addChild question

		dropper.x = stageSize.w / 2 - (question.x + question.getMeasuredWidth()) / 2
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 300
		container.y = @library.dropper.y + 400
		container.name = 'nube1'
		
		back = @createBitmap 'backNube1', 'n1', 0, 0
		container.addChild back

		for opt in @game.opt1
			d = new DroppableText "n1d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 500
		container.y = @library.dropper.y + 400
		container.name = 'nube2'
		
		back = @createBitmap 'backNube2', 'n2', 0, 0
		container.addChild back

		for opt in @game.opt2
			d = new DroppableText "n2d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 40, delay: 0.7}
		TweenLite.from @library.images, 1, {alpha: 0, y: @library.images.y + 40, delay: 0.7}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 40, delay: 0.9}
		TweenLite.from @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 40, delay: 1.1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for opt in @game.opt1
			@library["n1d#{opt.i}"].updateDrops @library.h0
			@library["n1d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n1d#{opt.i}"].initDragListener()
		for opt in @game.opt2
			if @steps[@step - 1].targets.length is 3
				@library["n2d#{opt.i}"].updateDrops @library.h1, @library.h2
			else
				@library["n2d#{opt.i}"].updateDrops @library.h1
			@library["n2d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n2d#{opt.i}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			createjs.Sound.play 'good'
			@finishEvaluation() 
		else
			@warning()
			@intento++
			console.log @intento
			@answer.returnToPlace()
			if @intento is 2
				@intento = 0			
				@clearEvaluation() 
	finishEvaluation: =>
		if @steps[@step - 1].targets.length is 3
			if @library.h0.text.text is '' or @library.h1.text.text is '' or @library.h2.text.text is ''
				return
		else
			if @library.h0.text.text is '' or @library.h1.text.text is ''
				return
		@library['score'].plusOne()	
		@intento = 0			
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for opt in @game.opt1
			@library["n1d#{opt.i}"].visible = true
			@library["n1d#{opt.i}"].returnToPlace()
		for opt in @game.opt2
			@library["n2d#{opt.i}"].visible = true
			@library["n2d#{opt.i}"].returnToPlace()
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 40}
		TweenLite.to @library.images, 0.5, {scaleX: 1, scaleY: 1, alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			@library.images.gotoAndStop @index
			@setDropper @index + 1
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: @library.images.y + 40}
			TweenLite.to @library.images, 0.5, {scaleX: 0.7, scaleY: 0.7, alpha: 1, ease: Back.easeOut}
			for opt in @game.opt1
				@library["n1d#{opt.i}"].updateDrops @library.h0
			for opt in @game.opt2
				if @steps[@step - 1].targets.length is 3
					@library["n2d#{opt.i}"].updateDrops @library.h1, @library.h2
				else
					@library["n2d#{opt.i}"].updateDrops @library.h1
		else
			@finish()
	finish: ->
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 40}
		TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 40}
		super
	window.U6A3 = U6A3