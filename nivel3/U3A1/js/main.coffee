class U3A1 extends Oda
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

			{id: 'dragbledontlike', src: 'dragble_dontlike.png'}
			{id: 'dragblehate', src: 'dragble_hate.png'}
			{id: 'dragblelike', src: 'dragble_like.png'}
			{id: 'dragblelove', src: 'dragble_love.png'}
			{id: 'fondo', src: 'fondo.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U7_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U7_A2_schedule1.mp3', id:'sche1'}
		    {src:'sounds/TU2_U7_A2_schedule2.mp3', id:'sche2'}
		]
		@game =
			gustos:
				chic1:['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove']
				chic2:['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove']
				chic3:['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove']
				chic4:['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove']
				faces:['dragblelove', 'dragblelike', 'dragbledontlike', 'dragblehate']
			actividades:
				boy:['boypropbaseball', 'boydragbleclean', 'boydragbleread', 'boypropbasketball', 'boyproptennis', 'boydragblecanoeing', 'boypropswimming', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing']
				boydrags:[ 'boydragbleclean', 'boydragbleread', 'boydragblecanoeing', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing']
				girl:['girldragbleswimming','girldragblehiking','girldragblesoccer','girlpropclean','girldragblecanoeing','girlpropriding','girlproprest','girldragblevolleyball','girldragblefishing','girlproptennis']
				girldrags:['girldragbleswimming','girldragblehiking','girldragblesoccer','girldragblecanoeing','girldragblevolleyball','girldragblefishing']
		super null, manifest, sounds
	setStage: ->
		super
		@actividades = @game.gustos
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the icons to the correct place on the schedule.', 40, 100
		@insertBitmap 'btnRepeat', 'btnrepeat', 650, 367
		@insertBitmap 'btnFinished', 'btnfinished', 650, 414
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setPizarra(1).introEvaluation()
	setPizarra: (schedule) ->
		@schedule = schedule
		pizarra = new createjs.Container()
		pizarra.name = 'pizarra'
		pizarra.x = 61
		pizarra.y = 103	
		
		fondo = @createBitmap 'fondo','fondo', 167,31
		
		if schedule is 1
			drops = @actividades.chic1
			@drags = @actividades.faces
		else
			child = @createBitmap 'boy','boy', 59,380,'bl'
			drops = @actividades.boy
			@drags = @actividades.boydrags

		actividades = new createjs.Container()
		actividades.name = 'actividades'
		actividades.x = 359
		actividades.y = 113
		@addToLibrary actividades
		
		for i in [0..drops.length - 1]
			c = new createjs.Container()
			c.name = "cont#{i}"
			if i < 5
				c.y = i * 49
			else
				c.x = 135
				c.y = (i - 5) * 49
			if schedule is 1
				hit = new createjs.Shape()
				hit.graphics.beginFill('rgba(255,255,255,1)').drawRect(-25, -25, 90, 55)
				@setReg hit, 20, -20
				c.addChild hit

			@addToLibrary c
			actividades.addChild c
		pizarra.addChild fondo, child, actividades

		for i in [0..@drags.length - 1]
			c = new Droppable "#{@drags[i]}", (@preload.getResult @drags[i]), i, 100*i + 50, 400, @stage, actividades.children	
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
			@library["#{@drags[i]}"].initDragListener()
			@library["#{@drags[i]}"].addEventListener 'dropped', @evaluateDrop
		@library.btnRepeat.addEventListener 'click', @repeatSound
		@library.btnFinished.addEventListener 'click', @evaluateAnswer
		createjs.Sound.play "sche#{@schedule}"
	evaluateDrop: (e) =>
		@answer = e.target
		@drop = e.drop

		@answer.visible = off
		v = @createBitmap @answer.name, @answer.name, 0, 20
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
		TweenLite.to @library.pizarra, 1, {alpha: 0, y: @library.pizarra.y + 20, onComplete: @nextEvaluation}
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
		TweenLite.to @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y - 5}
		TweenLite.to @library.btnFinished, 1, {alpha :0, y: @library.btnFinished.y - 5}
		super
	window.U3A1 = U3A1