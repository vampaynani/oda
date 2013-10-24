class U4A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
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
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@info = 
			im1:['park','They','are','reading','a','book','at','the','park']		
			im2:['library','She', 'is', 'checking', 'out', 'books', 'at', 'the', 'library']
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setFrase().introEvaluation()
	setFrase: ->
		question = new createjs.Container()

		v = @createBitmap @info.im1[0], @info.im1[0], stageSize.w / 2, stageSize.h / 2-50, 'mc'
		v.scaleX = v.scaleY = 0.3
		@addToMain v
		@addToLibrary v

		todos = ancho = 0
		for i in [1..8]
			q = new DraggableText @info.im1[i], @info.im1[i], i, ancho, 400
			ancho = q.width + q.x + 10
			todos = todos + q.width + 10

			wc = new WordContainer "h"+i, '', '', '#f00', (i*80), 450, 75, 22
			question.addChild q 
			@addToMain wc
 		question.x = (stageSize.w / 2) - (todos / 2)
		question.y = 0		 
		@addToMain question
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
	window.U4A6 = U4A6