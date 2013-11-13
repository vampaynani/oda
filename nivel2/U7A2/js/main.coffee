class U7A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
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
			{id: 'boypropswimming', src:'boy/prop_swimming.png'}
			{id: 'boyproptennis', src:'boy/prop_tennis.png'}
			{id: 'boy', src:'boy/prop_boy.png'}
			{id: 'girldragblecanoeing', src:'girl/dragble_canoeing.png'}
			{id: 'girldragblefishing', src:'girl/dragble_fishing.png'}
			{id: 'girldragblehiking', src:'girl/dragble_hiking.png'}
			{id: 'girldragblesoccer', src:'girl/dragble_soccer.png'}
			{id: 'girldragbleswimming', src:'girl/dragble_swimming.png'}
			{id: 'girldragblevolleyball', src:'girl/dragble_volleyball.png'}
			{id: 'girlpropclean', src:'girl/prop_clean.png'}
			{id: 'girlproprest', src:'girl/prop_rest.png'}
			{id: 'girlpropriding', src:'girl/prop_riding.png'}
			{id: 'girlproptennis', src:'girl/prop_tennis.png'}
			{id: 'girl', src:'girl/prop_girl.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U7_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U7_A2_schedule1.mp3', id:'sche1'}
		    {src:'sounds/TU2_U7_A2_schedule2.mp3', id:'sche2'}
		]
		@game =
			actividades:
				boy:['boypropbaseball', 'boydragbleclean', 'boydragbleread', 'boypropbasketball', 'boyproptennis', 'boydragblecanoeing', 'boypropswimming', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing']
				boydrags:[ 'boydragbleclean', 'boydragbleread', 'boydragblecanoeing', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing']
				girl:['girldragbleswimming','girldragblehiking','girldragblesoccer','girlpropclean','girldragblecanoeing','girlpropriding','girlproprest','girldragblevolleyball','girldragblefishing','girlproptennis']
				girldrags:['girldragbleswimming','girldragblehiking','girldragblesoccer','girldragblecanoeing','girldragblevolleyball','girldragblefishing']
		super null, manifest, sounds
	setStage: ->
		super
		@actividades = @game.actividades
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'btnRepeat', 'btnrepeat', 650, 367
		@insertBitmap 'btnFinished', 'btnfinished', 650, 414
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 6, 0
		@setPizarra(1).introEvaluation()
	setPizarra: (schedule) ->
		@schedule = schedule
		pizarra = new createjs.Container()
		pizarra.name = 'pizarra'
		pizarra.x = 61
		pizarra.y = 103	
		
		board = @createBitmap 'pizarra','pizarra', 167,31
		
		if schedule is 1
			child = @createBitmap 'girl','girl', 59,380,'bl'
			drops = @actividades.girl
			@drags = @actividades.girldrags
		else
			child = @createBitmap 'boy','boy', 59,380,'bl'
			drops = @actividades.boy
			@drags = @actividades.boydrags

		actividades = new createjs.Container()
		actividades.name = 'actividades'
		actividades.x = 359
		actividades.y = 113

		for i in [0..drops.length - 1]
			if i < 5
				a = @createBitmap drops[i], drops[i], 0, i*49, 'tc'
			else
				j = i - 5
				a = @createBitmap drops[i], drops[i], 135, j*49, 'tc'
			a.scaleX = a.scaleY = 40 / a.image.height
			if i in [0, 1, 2, 4, 7, 8]
				a.visible = off
			@addToLibrary a
			actividades.addChild a
		pizarra.addChild board, child, actividades

		for i in [0..@drags.length - 1]
			if i % 2 is 0
				c = new Droppable "dr#{@drags[i]}", (@preload.getResult @drags[i]), i, 100*i + 50, 440, @stage, actividades.children
			else
				c = new Droppable "dr#{@drags[i]}", (@preload.getResult @drags[i]), i, 100*i + 50, 400, @stage, actividades.children	
			c.scaleX = c.scaleY = 0.9
			@addToLibrary c
			pizarra.addChild c

		@addToMain pizarra
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y - 5, delay: 0.5}
		TweenLite.from @library.btnFinished, 1, {alpha :0, y: @library.btnFinished.y - 5, delay: 0.5}
		TweenLite.from @library.pizarra, 1, {alpha: 0, y: @library.pizarra.y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [0..@drags.length - 1]
			@library["dr#{@drags[i]}"].initDragListener()
			@library["dr#{@drags[i]}"].addEventListener 'dropped', @evaluateDrop
		@library.btnRepeat.addEventListener 'click', @repeatSound
		@library.btnFinished.addEventListener 'click', @evaluateAnswer
		createjs.Sound.play "sche#{@schedule}"
	evaluateDrop: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.name is "dr#{@drop.name}"
			@drop.visible = on
			@answer.visible = off
		else
			@answer.returnToPlace 1, 0.9, 0.9
			@warning()
	evaluateAnswer: (e) =>
		for i in [0..@drags.length - 1]
			if @library[@drags[i]].visible is on
				@library.score.plusOne()
		@finishEvaluation()
	finishEvaluation: =>
		createjs.Sound.stop()
		TweenLite.to @library.pizarra, 1, {alpha: 0, y: @library.pizarra.y + 20, onComplete: @nextEvaluation}
	nextEvaluation: =>
		###
		@index++
		if @index < @answers.length
			@library['score'].updateCount( @index )
			@library['characters'].alpha = 1
			@library['characters'].y = stageSize.h - 180
			@library['characters'].currentFrame = @answers[@index].id
			createjs.Sound.play @answers[@index].sound
			TweenLite.from @library['characters'], 0.5, {alpha: 0, y: @library['characters'].y + 20, ease: Quart.easeOut}
		else
		###
		@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "sche#{@schedule}"
	finish: ->
		TweenLite.to @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y - 5}
		TweenLite.to @library.btnFinished, 1, {alpha :0, y: @library.btnFinished.y - 5}
		super
	window.U7A2 = U7A2