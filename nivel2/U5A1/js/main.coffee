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
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U5_A1_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U5_A1_calendar1.mp3', id:'cal1'}
		    {src:'sounds/TU2_U5_A1_calendar2.mp3', id:'cal2'}
		]
		@game =
			finales:[
				{x:190, y:186}
				{x:294, y:200}
				{x:395, y:208}
				{x:200, y:248}
				{x:310, y:250}
				{x:397, y:263}
				{x:218, y:316}
				{x:332, y:314}
				{x:415, y:317}
				{x:216, y:380}
				{x:340, y:372}
				{x:456, y:370}
			]
			drags:[
				{x:'70', y:'508'}
				{x:'157', y:'527'}
				{x:'228', y:'505'}
				{x:'302', y:'513'}
				{x:'389', y:'503'}
				{x:'465', y:'514'}
				{x:'539', y:'512'}
				{x:'635', y:'521'}
			]
			drops:[
				{id:'cal1Dragble8', tgt:'cal1Final3'}
				{id:'cal1Dragble4', tgt:'cal1Final4'}
				{id:'cal1Dragble6', tgt:'cal1Final10'}
				{id:'cal1Dragble7', tgt:'cal1Final7'}
				{id:'cal1Dragble1', tgt:'cal1Final12'}
				{id:'cal1Dragble5', tgt:'cal1Final5'}
				{id:'cal1Dragble2', tgt:'cal1Final1'}
				{id:'cal1Dragble3', tgt:'cal1Final8'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 95
		@insertBitmap 'btnRepeat', 'btnRepeat', 598, 245
		@insertBitmap 'btnFinished', 'btnFinished', 598, 292
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@setCalendar(1).introEvaluation()
	setCalendar: (calendar) ->
		@calendar = calendar
		cal = new createjs.Container()
		cal.name = 'calendar'
		cal.x = 60
		cal.y = 0	
		@insertBitmap 'propCalendar', 'propCalendar', 60, 128
		for i in [1..12]
			hit = new createjs.Shape()
			hit.graphics.beginFill('rgba(255,255,255,0.1)').drawRect(-25, -25, 90, 55)
			c = new createjs.Container()
			c.name = "cal#{calendar}Final#{i}"
			c.x = @game.finales[i-1].x
			c.y = @game.finales[i-1].y
			v = @createBitmap "", "cal#{calendar}Final#{i}", 0, 0
			if calendar is 1
				if i isnt 2 and i isnt 6 and i isnt 9 and i isnt 11
					v.visible = off
					c.addChild v, hit
				else
					c.addChild v
			cal.addChild c
			@addToLibrary c
		for i in [1..8]
			v = new Draggable "cal#{calendar}Dragble#{i}", (@preload.getResult "cal#{calendar}Dragble#{i}"), i, @game.drags[i-1].x, @game.drags[i-1].y
			v.onInitEvaluation()
			cal.addChild v
			@addToLibrary v
		@addToMain cal
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['btnRepeat'], 1, {alpha :0, y: @library['btnRepeat'].y + 20, delay: 0.5}
		TweenLite.from @library['btnFinished'], 1, {alpha: 0, y: @library['btnFinished'].y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..8]
			@library["cal#{@calendar}Dragble#{i}"].addEventListener 'drop', @evaluateDrop
		@library['btnRepeat'].addEventListener 'click', @repeatSound
		@library['btnFinished'].addEventListener 'click', @evaluateAnswer
		createjs.Sound.play "cal#{@calendar}"
	evaluateDrop: (e) =>
		@answer = e.target
		dropped = off
		for drop in @game.drops
			pt = @library[drop.tgt].globalToLocal @stage.mouseX, @stage.mouseY
			if @library[drop.tgt].hitTest pt.x, pt.y
				if drop.id is @answer.name
					dropped = on
					@answer.visible = false;
					@library[drop.tgt].children[0].visible = true
				else
					@warning()
					@answer.returnToPlace()
		if not dropped then @answer.returnToPlace()
	evaluateAnswer: (e) =>
		for i in [1..8]
			if @library["cal#{@calendar}Dragble#{i}"].visible is off
				@library.score.plusOne()
		@finishEvaluation()
	finishEvaluation: =>
		TweenLite.to @library.calendar, 1, {alpha:0, y:@library.calendar.y - 20}
		TweenLite.to @library.propCalendar, 1, {alpha:0, y:@library.propCalendar.y - 20}
		@nextEvaluation()
	nextEvaluation: =>
		###
		@index++
		if @index < @game.drops.length
			@setCalendar @index + 1
			for i in [1..8]
				@library["cal#{@calendar}Dragble#{i}"].addEventListener 'drop', @evaluateDrop
				@library['btnRepeat'].addEventListener 'click', @repeatSound
				@library['btnFinished'].addEventListener 'click', @evaluateAnswer
				createjs.Sound.stop()
				createjs.Sound.play "cal#{@calendar}"
		else
		###
		@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "cal#{@calendar}"
	finish: ->
		createjs.Sound.stop()
		TweenLite.to @library['btnRepeat'], 1, {alpha :0, y: @library['btnRepeat'].y + 20}
		TweenLite.to @library['btnFinished'], 1, {alpha: 0, y: @library['btnFinished'].y + 20}
		super
	window.U5A1 = U5A1