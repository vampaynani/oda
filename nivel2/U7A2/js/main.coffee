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
 			{id: 'btnfinished', src:'btn_finished.png'}
			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'pizarra', src:'pizarra.png'}
			{id: 'boydragblebiking', src:'boy/dragble_biking.png'}
			{id: 'boydragblecanoeing', src:'boy/dragble_canoeing.png'}
			{id: 'boydragbleclean', src:'boy/dragble_clean.png'}
			{id: 'boydragblefishing', src:'boy/dragble_fishing.png'}
			{id: 'boydragbleread', src:'boy/dragble_read.png'}
			{id: 'boydragbleriding', src:'boy/dragble_riding.png'}
			{id: 'boypropbaseball', src:'boy/prop_baseball.png'}
			{id: 'boypropbasketball', src:'boy/prop_basketball.png'}
			{id: 'boy', src:'boy/prop_boy.png'}
			{id: 'boypropswimming', src:'boy/prop_swimming.png'}
			{id: 'boyproptennis', src:'boy/prop_tennis.png'}
			{id: 'girldragblecanoeing', src:'girl/dragble_canoeing.png'}
			{id: 'girldragblefishing', src:'girl/dragble_fishing.png'}
			{id: 'girldragblehiking', src:'girl/dragble_hiking.png'}
			{id: 'girldragblesoccer', src:'girl/dragble_soccer.png'}
			{id: 'girldragbleswimming', src:'girl/dragble_swimming.png'}
			{id: 'girldragblevolleyball', src:'girl/dragble_volleyball.png'}
			{id: 'girlpropclean', src:'girl/prop_clean.png'}
			{id: 'girl', src:'girl/prop_girl.png'}
			{id: 'girlproprest', src:'girl/prop_rest.png'}
			{id: 'girlpropriding', src:'girl/prop_riding.png'}
			{id: 'girlproptennis', src:'girl/prop_tennis.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@actividades =
			boy:['boypropbaseball', 'boydragbleclean', 'boydragbleread', 'boypropbasketball', 'boyproptennis', 'boydragblecanoeing', 'boypropswimming', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing']
			boydrags:[ 'boydragbleclean', 'boydragbleread', 'boydragblecanoeing', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing']
			girl:['girldragbleswimming','girldragblehiking','girldragblesoccer','girlpropclean','girldragblecanoeing','girlpropriding','girlproprest','girldragblevolleyball','girldragblefishing','girlproptennis']
			girldrags:['girldragbleswimming','girldragblehiking','girldragblesoccer','girldragblecanoeing','girldragblevolleyball','girldragblefishing']
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'btnrepeat', 'btnrepeat', 650, 367
		@insertBitmap 'btnfinished', 'btnfinished', 650, 414
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setPizarra().introEvaluation()
	setPizarra:  ->
		pizarra = new createjs.Container()
		pizarra.x = 61
		pizarra.y = 93	

		board = @createBitmap 'pizarra','pizarra', 167,31
		child = @createBitmap 'girl','girl', 59,380,'bl'

		actividades = new createjs.Container()
		actividades.x = 359
		actividades.y = 113

		for i in [0..4]
			a = @createBitmap  @actividades.girl[i], @actividades.girl[i], 0, i*49, 'tc'
			b = @createBitmap  @actividades.girl[i+5], @actividades.girl[i+5], 135, i*49, 'tc'
			a.scaleX = a.scaleY = 40 / a.image.height
			b.scaleX = b.scaleY = 40 / b.image.height
			actividades.addChild a, b
		for i in [0..5]
			c = @createBitmap  @actividades.girldrags[i], @actividades.girldrags[i], (100*i)+50, 400, 'tl'
			if ( i % 2 == 0 )
				c.y = 440
			c.scaleX = c.scaleY = 0.9
			pizarra.addChild c
		pizarra.addChild board, child, actividades
		@addToMain pizarra
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