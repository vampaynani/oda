class U5A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 	
			{id:'btnFinished', src:'btn_finished.png'}
			{id:'propCalendar', src:'prop_calendar.png'}
			{id:'btnRepeat', src:'btn_repeat.png'}

			{id:'cal1Final2', src:'cal1/cal1final2.png'}
			{id:'cal1Final6', src:'cal1/cal1final6.png'}
			{id:'cal1Final9', src:'cal1/cal1final9.png'}
			{id:'cal1Final11', src:'cal1/cal1final11.png'}
			{id:'cal1Final3', src:'cal1/final_sled.png'}
			{id:'cal1Final4', src:'cal1/final_scooter.png'}
			{id:'cal1Final10', src:'cal1/final_rake.png'}
			{id:'cal1Final7', src:'cal1/final_noshoes.png'}
			{id:'cal1Final12', src:'cal1/final_grandma.png'}
			{id:'cal1Final5', src:'cal1/final_flowers.png'}
			{id:'cal1Final1', src:'cal1/final_chocolate.png'}
			{id:'cal1Final8', src:'cal1/final_cake.png'}
			{id:'cal1Dragble8', src:'cal1/dragble_sled.png'}
			{id:'cal1Dragble4', src:'cal1/dragble_scooter.png'}
			{id:'cal1Dragble6', src:'cal1/dragble_rake.png'}
			{id:'cal1Dragble7', src:'cal1/dragble_noshoes.png'}
			{id:'cal1Dragble1', src:'cal1/dragble_grandma.png'}
			{id:'cal1Dragble5', src:'cal1/dragble_flowers.png'}
			{id:'cal1Dragble2', src:'cal1/dragble_chocolate.png'}
			{id:'cal1Dragble3', src:'cal1/dragble_cake.png'}

			{id:'cal2Final12', src:'cal2/cal2final12.png'}
			{id:'cal2Final6', src:'cal2/cal2final6.png'}
			{id:'cal2Final8', src:'cal2/cal2final8.png'}
			{id:'cal2Final10', src:'cal2/cal2final10.png'}
			{id:'cal2Final9', src:'cal2/final_soccer.png'}
			{id:'cal2Final1', src:'cal2/final_snowman.png'}
			{id:'cal2Final7', src:'cal2/final_pool.png'}
			{id:'cal2Final5', src:'cal2/final_picnic.png'}
			{id:'cal2Final2', src:'cal2/final_kite.png'}
			{id:'cal2Final11', src:'cal2/final_guitar.png'}
			{id:'cal2Final3', src:'cal2/final_eggs.png'}
			{id:'cal2Final4', src:'cal2/final_bike.png'}
			{id:'cal2Dragble2', src:'cal2/dragble_soccer.png'}
			{id:'cal2Dragble3', src:'cal2/dragble_snowman.png'}
			{id:'cal2Dragble1', src:'cal2/dragble_pool.png'}
			{id:'cal2Dragble8', src:'cal2/dragble_picnic.png'}
			{id:'cal2Dragble7', src:'cal2/dragble_kite.png'}
			{id:'cal2Dragble4', src:'cal2/dragble_guitar.png'}
			{id:'cal2Dragble6', src:'cal2/dragble_eggs.png'}
			{id:'cal2Dragble5', src:'cal2/dragble_bike.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U5_A1_instructions.mp3', id:'instructions'}
		]
		@positions =
			finales:[
				{x:'201', y:'204'}
				{x:'314', y:'211'}
				{x:'408', y:'218'}
				{x:'212', y:'265'}
				{x:'331', y:'268'}
				{x:'429', y:'273'}
				{x:'228', y:'331'}
				{x:'347', y:'327'}
				{x:'445', y:'327'}
				{x:'246', y:'399'}
				{x:'364', y:'392'}
				{x:'466', y:'385'}
			]
			drags:[
				{x:'145', y:'528'}
				{x:'232', y:'547'}
				{x:'303', y:'525'}
				{x:'377', y:'533'}
				{x:'464', y:'523'}
				{x:'540', y:'534'}
				{x:'614', y:'532'}
				{x:'710', y:'541'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'btnRepeat', 'btnRepeat', 598, 245
		@insertBitmap 'btnFinished', 'btnFinished', 598, 292
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setCalendar(1).introEvaluation()
	setCalendar: (calendar) ->
		cal = new createjs.Container()
		cal.name = 'calendar'
		cal.x = 60
		cal.y = 0	
		@insertBitmap 'propCalendar', 'propCalendar', 60, 128
		for i in [1..12]
			v = @createBitmap "cal#{calendar}Final#{i}", "cal#{calendar}Final#{i}", @positions.finales[i-1].x, @positions.finales[i-1].y, 'mc'
			cal.addChild v
			@addToLibrary v
		for i in [1..8]
			v = @createBitmap "cal#{calendar}Dragble#{i}", "cal#{calendar}Dragble#{i}", @positions.drags[i-1].x,@positions.drags[i-1].y, 'mc'
			cal.addChild v
			@addToLibrary v
		@addToMain cal
		@
	introEvaluation: ->
		super
		###
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation
		###
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['calendar'], 1, {alpha: 0, y: @library['calendar'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
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
	window.U5A1 = U5A1