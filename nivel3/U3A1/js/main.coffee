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
		    {id:'imgwrong', src: 'wrong.png'}
		    {id:'imgcorrect', src: 'correct.png'}
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
		@insertBitmap 'btnRepeat', 'btnrepeat', 480, 540
		@insertBitmap 'btnFinished', 'btnfinished', 610, 540
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 24, 0
		
		@insertBitmap 'fondo','fondo', stageSize.w / 2, 130, 'tc'
		@setPizarra(1).introEvaluation()
	setPizarra: (schedule) ->
		@schedule = schedule
		@pizarra = new createjs.Container()
		@pizarra.name = 'pizarra'
		@pizarra.x = 0
		@pizarra.y = 0	

		actividades = new createjs.Container()
		@current = actividades.name = "actividades#{schedule}"
		actividades.x = 280 
		actividades.y = 223
		@addToLibrary actividades
		
		@drops = "@actividades.chic#{@schedule}"

		@drags = @actividades.faces


		for i in [0..5]
			c = new createjs.Container()
			c.name = "cont#{i}"
			c.y = i * 49 
			c.x = 0 + ((schedule - 1) * 125)
			
			hit = new createjs.Shape()
			hit.graphics.beginFill('rgba(0,0,0,1)').drawRect(-25, -25, 90, 45)
			@setReg hit, 20, -20
			c.addChild hit

			@addToLibrary c
			actividades.addChild c
		@addToMain actividades

		for i in [0..@drags.length - 1]
			c = new Droppable "#{@drags[i]}", (@preload.getResult @drags[i]), i, 70*i + 150, 540, @stage, actividades.children	
			#c.scaleX = c.scaleY = 0.9
			@addToLibrary c
			@pizarra.addChild c

		@addToMain @pizarra
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
		#@answer.visible = off
		@answer.returnToPlace()
		v = @createBitmap @answer.name, @answer.name, 0, 20
		v.scaleX = v.scaleY = 0.6
		@setReg v, v.width / 2, v.height / 2
		@drop.addChild v
	evaluateAnswer: (e) =>
		@library.btnRepeat.removeEventListener 'click', @repeatSound
		@library.btnFinished.removeEventListener 'click', @evaluateAnswer
		createjs.Sound.stop()
		if @schedule is 1
			answers = @actividades.chic1
		else if @schedule is 2
			answers = @actividades.chic2
		else if @schedule is 3
			answers = @actividades.chic3
		else 
			answers = @actividades.chic4

		for i in [0..answers.length - 1] by 1
			res = @createSprite 'resultado', ['imgwrong', 'imgcorrect'], null, @library["cont#{i}"].x + 25, @library["cont#{i}"].y
			res.scaleY = res.scaleX = 0.5
			if @library["cont#{i}"].children.length > 1
				if @library["cont#{i}"].children[1].name is answers[i]
					#@blink @library["cont#{i}"]
					@library.score.plusOne()
					res.currentFrame = 1
				else
					res.currentFrame = 0
			@library[@current].addChild res
		setTimeout @nextEvaluation, 4 * 1000
	finishEvaluation: =>
		TweenLite.to @library.pizarra, 1, {alpha: 0, y: @library.pizarra.y + 20, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < 4
			@pizarra.removeAllChildren()

			@setPizarra(@index + 1)
			for i in [0..@drags.length - 1]
				@library["#{@drags[i]}"].initDragListener()
				@library["#{@drags[i]}"].addEventListener 'dropped', @evaluateDrop
			@library.btnRepeat.addEventListener 'click', @repeatSound
			@library.btnFinished.addEventListener 'click', @evaluateAnswer
			createjs.Sound.stop()
			#createjs.Sound.play "sche#{@schedule}"
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "sche#{@schedule}"
	finish: ->
		TweenLite.to @library.pizarra, 1, {alpha :0}
		TweenLite.to @library.actividades1, 1, {alpha :0}
		TweenLite.to @library.actividades2, 1, {alpha :0}
		TweenLite.to @library.actividades3, 1, {alpha :0}
		TweenLite.to @library.actividades4, 1, {alpha :0}
		TweenLite.to @library.fondo, 1, {alpha :0}
		TweenLite.to @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y - 5}
		TweenLite.to @library.btnFinished, 1, {alpha :0, y: @library.btnFinished.y - 5}
		super
	window.U3A1 = U3A1