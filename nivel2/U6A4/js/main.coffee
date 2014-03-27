class U6A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id:'library', src:'library.png'}
			{id:'park', src:'park.png'}
			{id:'playingpark', src:'playing-park.png'}
			{id:'policestation', src:'police-station.png'}
			{id:'restaurant', src:'restaurant.png'}
			{id:'sendingmails', src:'sending-mails.png'}
			{id:'shoppinggrocery', src:'shopping-grocery.png'}
			{id:'shoppingmall', src:'shopping-mall.png'}
			{id:'waitingbus', src:'waiting-bus.png'}
			{id:'watchingmovie', src:'watching-movie.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U6_A4_Instructions.mp3', id:'instructions'}
		]
		@game =
			steps : [
				{txt:'They are waiting at the bus stop', img:'waitingbus'}
				{txt:'They are watching a movie at the movie theater', img:'watchingmovie'}
				{txt:'She is shopping at the grocery store', img:'shoppinggrocery'}
				{txt:'They are reading a book at the park', img:'park'}
				{txt:'She is checking out books at the library', img:'library'}
				{txt:'They are asking for help at the police station', img:'policestation'}
				{txt:'He is eating dinner at a restaurant', img:'restaurant'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@success = 1
		@steps = @shuffle @game.steps
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look at the pictures and unscramble the words to make sentences.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 8, 0
		@setScenario( 1 ).introEvaluation()
	setScenario: (sce) ->
		if @library.scenario
			scenario = @library.scenario
		else
			scenario = new createjs.Container()
			scenario.name = 'scenario'
		scenario.removeAllChildren()
		scenario.alpha = 1

		v = @createBitmap @steps[sce - 1].img, @steps[sce - 1].img, stageSize.w / 2, stageSize.h / 2 - 100, 'mc'
		v.scaleX = v.scaleY = 0.7
		scenario.addChild v
		@addToLibrary scenario
		@addToMain scenario
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.scenario, 0.5, {alpha: 0, y: @library.scenario.y + 40, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@setQuestion @index
	setQuestion: (question) ->
		palabras = new createjs.Container()
		frase = new createjs.Container()
		col = @steps[@index].txt.split ' '
		@scrambled = @shuffle col
		for i in [1..@scrambled.length]
			if @scrambled[i - 1] isnt ' '
				palabra = new DraggableText "t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 180, 0
				palabra.text.font = '40px Quicksand'
				palabra.text.textAlign = 'center'
				palabra.createHitArea 160, 60
				palabra.addEventListener 'drop', @evaluateAnswer
				palabra.onInitEvaluation()
				@addToLibrary palabra
				palabras.addChild palabra
			if col[i - 1] isnt ' '
				wc = new WordContainer "l#{i}", '', 'rgba(238,238,238,0.3)','#F00', i * 200, 0, 180, 60
				wc.index = col[i - 1]
				wc.hitter = null
				wc.addEventListener 'mousedown', (e) ->
					cwc = e.currentTarget
					cwc.addEventListener 'pressmove', (ev) ->
						if cwc.hitter
							cwc.changeText ''
							cwc.hitter.visible = on
							cwc.hitter.returnToPlace()
				@addToLibrary wc
				frase.addChild wc
		frase.name = 'frase'
		frase.y = 840
		frase.x = stageSize.w / 2 - @scrambled.length * 200 / 2 - 100
		@addToMain frase
		
		palabras.name = 'palabras'
		palabras.y = 740
		palabras.x = stageSize.w / 2 - @scrambled.length * 180 / 2
		@addToMain palabras

		TweenLite.from [frase, palabras], 1, {alpha:0}
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = off
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				pt = @library["l#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
				if @library["l#{i}"].hitTest pt.x, pt.y
					#if @answer.index is @library["l#{i}"].index
					if @library["l#{i}"].text.text is ''
						@answer.visible = off
						@library["l#{i}"].hitter = @answer
						@library["l#{i}"].changeText @answer.index#@library["l#{i}"].index
						dropped = on
		if not dropped then @answer.returnToPlace() else @finishEvaluation()
	finishEvaluation: =>
		col = @steps[@index].txt.split ' '
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				if @library["l#{i}"].text.text is ''
					return
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				if @library["l#{i}"].text.text isnt col[i-1]
					@success = 0
		if @success is 1
			createjs.Sound.play 'good'
			@library.score.plusOne()
		else
			createjs.Sound.play 'wrong'
			@success = 1
			for i in [1..@scrambled.length]
				@library["l#{i}"].text.text = col[i-1]
		setTimeout @nextEvaluation, 2 * 1000

	nextEvaluation: =>
		TweenLite.to @library.scenario, 0.5, {alpha: 0}
		TweenLite.to @library.palabras, 1, {alpha: 0, y: @library.palabras.y - 40, ease: Back.easeOut}
		TweenLite.to @library.frase, 1, {alpha: 0, y: @library.frase.y - 40, ease: Back.easeOut}

		@index++
		if @index < @steps.length
			@setQuestion @index
			@setScenario @index + 1
			TweenLite.from @library.scenario, 0.5, {alpha: 1}
			TweenLite.to @library.palabras, 1, {alpha: 1, ease: Back.easeOut}
			TweenLite.to @library.frase, 1, {alpha: 1, ease: Back.easeOut}
		else
			@finish()
	finish: ->
		super
	window.U6A4 = U6A4