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
		@game = [
			{
				finales:[
					{x:365, y:396}
					{x:588, y:400}
					{x:776, y:424}
					{x:390, y:520}
					{x:612, y:514}
					{x:794, y:530}
					{x:423, y:646}
					{x:650, y:642}
					{x:830, y:634}
					{x:451, y:779}
					{x:680, y:744}
					{x:890, y:750}
				]
				drags:[
					{x:140, y:1016}
					{x:314, y:1054}
					{x:456, y:1010}
					{x:604, y:1026}
					{x:778, y:1006}
					{x:930, y:1028}
					{x:1078, y:1024}
					{x:1270, y:1042}
				]
				drops:[
					{id:'cal1Dragble2', tgt:'cal1Final1'}
					{id:'cal1Dragble8', tgt:'cal1Final3'}
					{id:'cal1Dragble4', tgt:'cal1Final4'}
					{id:'cal1Dragble5', tgt:'cal1Final5'}
					{id:'cal1Dragble7', tgt:'cal1Final7'}
					{id:'cal1Dragble3', tgt:'cal1Final8'}
					{id:'cal1Dragble6', tgt:'cal1Final10'}
					{id:'cal1Dragble1', tgt:'cal1Final12'}
				]
			}
			{
				finales:[
					{x:362, y:386}
					{x:584, y:404}
					{x:776, y:424}
					{x:386, y:510}
					{x:616, y:518}
					{x:794, y:526}
					{x:418, y:640}
					{x:632, y:636}
					{x:848, y:634}
					{x:432, y:770}
					{x:684, y:766}
					{x:916, y:731}
				]
				drags:[
					{x:140, y:1016}
					{x:314, y:1054}
					{x:456, y:1010}
					{x:564, y:1026}
					{x:698, y:1006}
					{x:890, y:1028}
					{x:1078, y:1024}
					{x:1230, y:1042}
				]
				drops:[
					{id:'cal2Dragble3', tgt:'cal2Final1'}
					{id:'cal2Dragble7', tgt:'cal2Final2'}
					{id:'cal2Dragble6', tgt:'cal2Final3'}
					{id:'cal2Dragble5', tgt:'cal2Final4'}
					{id:'cal2Dragble8', tgt:'cal2Final5'}
					{id:'cal2Dragble1', tgt:'cal2Final7'}
					{id:'cal2Dragble2', tgt:'cal2Final9'}
					{id:'cal2Dragble4', tgt:'cal2Final11'}
				]
			}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the pictures to the correct month on the calendar.', 80, 200
		@insertBitmap 'btnRepeat', 'btnRepeat', 1196, 490
		@insertBitmap 'btnFinished', 'btnFinished', 1196, 584
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 16, 0
		@setCalendar(1).introEvaluation()
	setCalendar: (calendar) ->
		@calendar = calendar
		cal = new createjs.Container()
		cal.name = 'calendar'
		cal.x = 120
		cal.y = 0	
		@insertBitmap 'propCalendar', 'propCalendar', 120, 256
		for i in [1..12]
			c = new createjs.Container()
			c.name = "cal#{calendar}Final#{i}"
			c.x = @game[calendar - 1].finales[i - 1].x
			c.y = @game[calendar - 1].finales[i - 1].y
			if calendar is 1
				if i in [2, 6, 9, 11]
					v = @createBitmap "", "cal#{calendar}Final#{i}", 0, 0
					c.addChild v
				else
					hit = new createjs.Shape()
					hit.graphics.beginFill('rgba(255,255,255,0.1)').drawRect(-50, -50, 180, 110)
					c.addChild hit
			else if calendar is 2
				if i in [6, 8, 10, 12]
					v = @createBitmap "", "cal#{calendar}Final#{i}", 0, 0
					c.addChild v
				else
					hit = new createjs.Shape()
					hit.graphics.beginFill('rgba(255,255,255,0.1)').drawRect(-50, -50, 180, 110)
					c.addChild hit
			cal.addChild c
			@addToLibrary c
		for i in [1..8]
			v = new Draggable "cal#{calendar}Dragble#{i}", (@preload.getResult "cal#{calendar}Dragble#{i}"), "cal#{calendar}Final#{i}", @game[calendar - 1].drags[i-1].x, @game[calendar - 1].drags[i-1].y
			v.onInitEvaluation()
			cal.addChild v
			@addToLibrary v
		@addToMain cal
		TweenLite.to cal, 1, {alpha:1, y:0}
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y + 40, delay: 0.5}
		TweenLite.from @library.btnFinished, 1, {alpha: 0, y: @library.btnFinished.y + 40, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..8]
			@library["cal#{@calendar}Dragble#{i}"].addEventListener 'drop', @evaluateDrop
		@library.btnRepeat.addEventListener 'click', @repeatSound
		@library.btnFinished.addEventListener 'click', @evaluateAnswer
		createjs.Sound.play "cal#{@calendar}"
	evaluateDrop: (e) =>
		@answer = e.target
		dropped = off
		for drop in @game[@calendar - 1].drops
			pt = @library[drop.tgt].globalToLocal @stage.mouseX, @stage.mouseY
			if @library[drop.tgt].hitTest pt.x, pt.y
				dropped = on
				@answer.visible = false
				relation = @game[@calendar - 1].drops.where id:@answer.name
				v = @createBitmap relation[0].id, relation[0].tgt, 45, 25
				v.hitter = @answer
				v.addEventListener 'mousedown', (e) ->
					cv = e.currentTarget
					cv.addEventListener 'pressmove', (ev) ->
						if cv.hitter
							cv.removeAllEventListeners()
							parent = cv.parent 
							while parent.children.length > 1
								parent.removeChildAt parent.children.length - 1
							cv.hitter.visible = on
							cv.hitter.returnToPlace()
				@setReg v, v.width / 2, v.height / 2
				@library[drop.tgt].addChild v
		if not dropped then @answer.returnToPlace()
	evaluateAnswer: (e) =>
		@library.btnRepeat.removeEventListener 'click', @repeatSound
		@library.btnFinished.removeEventListener 'click', @evaluateAnswer
		createjs.Sound.stop()
		answers = @game[@calendar - 1].drops
		for i in [1..answers.length] by 1
			if @library[answers[i - 1].tgt].children.length > 1
				if @library[answers[i - 1].tgt].children[1].name is answers[i - 1].id
					@blink @library[answers[i - 1].tgt]
					@library.score.plusOne()
		setTimeout @finishEvaluation, 4 * 1000
	finishEvaluation: =>
		TweenLite.to @library.calendar, 1, {alpha:0, y:@library.calendar.y - 40}
		TweenLite.to @library.propCalendar, 1, {alpha:0, y:@library.propCalendar.y - 40, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @game.length
			@setCalendar @index + 1
			for i in [1..8]
				@library["cal#{@calendar}Dragble#{i}"].addEventListener 'drop', @evaluateDrop
			@library.btnRepeat.addEventListener 'click', @repeatSound
			@library.btnFinished.addEventListener 'click', @evaluateAnswer
			createjs.Sound.stop()
			createjs.Sound.play "cal#{@calendar}"
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "cal#{@calendar}"
	finish: ->
		createjs.Sound.stop()
		TweenLite.to @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y + 40}
		TweenLite.to @library.btnFinished, 1, {alpha: 0, y: @library.btnFinished.y + 40}
		super
	window.U5A1 = U5A1