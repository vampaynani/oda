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
		@insertInstructions 'instructions', 'Listen and drag the icons to the correct place on the schedule.', 80, 200
		@insertBitmap 'btnRepeat', 'btnrepeat', 1300, 734
		@insertBitmap 'btnFinished', 'btnfinished', 1300, 828
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 12, 0
		@setPizarra(1).introEvaluation()
	setPizarra: (schedule) ->
		@schedule = schedule
		pizarra = new createjs.Container()
		pizarra.name = 'pizarra'
		pizarra.x = 122
		pizarra.y = 206
		
		board = @createBitmap 'pizarra','pizarra', 334, 62
		
		if schedule is 1
			child = @createBitmap 'girl','girl', 118, 760, 'bl'
			drops = @actividades.girl
			@drags = @actividades.girldrags
		else
			child = @createBitmap 'boy','boy', 118, 760, 'bl'
			drops = @actividades.boy
			@drags = @actividades.boydrags

		actividades = new createjs.Container()
		actividades.name = 'actividades'
		actividades.x = 718
		actividades.y = 226
		@addToLibrary actividades
		
		for i in [0..drops.length - 1]
			c = new createjs.Container()
			c.name = "cont#{i}"
			if i < 5
				c.y = i * 98
			else
				c.x = 270
				c.y = (i - 5) * 98
			if schedule is 1
				if i in [0, 1, 2, 4, 7, 8]
					hit = new createjs.Shape()
					hit.graphics.beginFill('rgba(255,255,255,0.01)').drawRect(-50, -50, 180, 110)
					@setReg hit, 40, -40
					c.addChild hit
				else
					a = @createBitmap drops[i], drops[i], 0, 0, 'tc'
					a.scaleX = a.scaleY = 80 / a.image.height
					c.addChild a
			else
				if i in [1, 2, 5, 7, 8, 9]
					hit = new createjs.Shape()
					hit.graphics.beginFill('rgba(255,255,255,0.01)').drawRect(-50, -50, 180, 110)
					@setReg hit, 40, -40
					c.addChild hit
				else
					a = @createBitmap drops[i], drops[i], 0, 0, 'tc'
					a.scaleX = a.scaleY = 80 / a.image.height
					c.addChild a
			@addToLibrary c
			actividades.addChild c
		pizarra.addChild board, child, actividades

		for i in [0..@drags.length - 1]
			if i % 2 is 0
				c = new Droppable "#{@drags[i]}", (@preload.getResult @drags[i]), i, 200 * i + 100, 880, @stage, actividades.children
			else
				c = new Droppable "#{@drags[i]}", (@preload.getResult @drags[i]), i, 200 * i + 100, 800, @stage, actividades.children	
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
		TweenLite.from @library.pizarra, 1, {alpha: 0, y: @library.pizarra.y + 40, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [0..@drags.length - 1]
			@library["#{@drags[i]}"].initDragListener()
			@library["#{@drags[i]}"].addEventListener 'dropped', @evaluateDrop
		@library.btnRepeat.addEventListener 'click', @repeatSound
		@library.btnFinished.addEventListener 'click', @evaluateAnswer
		createjs.Sound.play "sche#{@schedule}"
	evaluateDrop: (e) =>
		@answer = e.target
		@drop = e.drop

		@answer.visible = off
		v = @createBitmap @answer.name, @answer.name, 0, 40
		v.scaleX = v.scaleY = 0.6
		@setReg v, v.width / 2, v.height / 2
		@drop.addChild v
	evaluateAnswer: (e) =>
		@library.btnRepeat.removeEventListener 'click', @repeatSound
		@library.btnFinished.removeEventListener 'click', @evaluateAnswer
		createjs.Sound.stop()
		if @schedule is 1
			answers = @actividades.girl
		else
			answers = @actividades.boy
		for i in [0..answers.length - 1] by 1
			if @library["cont#{i}"].children.length > 1
				if @library["cont#{i}"].children[1].name is answers[i]
					@blink @library["cont#{i}"]
					@library.score.plusOne()
		setTimeout @finishEvaluation, 4 * 1000
	finishEvaluation: =>
		TweenLite.to @library.pizarra, 1, {alpha: 0, y: @library.pizarra.y + 40, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < 2
			@setPizarra @index + 1
			for i in [0..@drags.length - 1]
				@library["#{@drags[i]}"].initDragListener()
				@library["#{@drags[i]}"].addEventListener 'dropped', @evaluateDrop
			@library.btnRepeat.addEventListener 'click', @repeatSound
			@library.btnFinished.addEventListener 'click', @evaluateAnswer
			createjs.Sound.stop()
			createjs.Sound.play "sche#{@schedule}"
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "sche#{@schedule}"
	finish: ->
		TweenLite.to @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y - 10}
		TweenLite.to @library.btnFinished, 1, {alpha :0, y: @library.btnFinished.y - 10}
		super
	window.U7A2 = U7A2