class U3A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 
			{id:'guia1', src: 'guia1.png'}
			{id:'guia2', src: 'guia2.png'}
			{id:'guia3', src: 'guia3.png'}
			{id:'guia4', src: 'guia4.png'}

			{id:'btnsalad', src: 'btn_salad.png'}
			{id:'btnsandwich', src: 'btn_sandwich.png'}
			{id:'propsalad', src: 'prop_salad.png'}
			{id:'propsandwich', src: 'prop_sandwich.png'}

			{id:'wrong', src: 'wrong.png'}
			{id:'correct', src: 'correct.png'}

			{id:'chefAgain', src: 'chef/chef_again.png'}
			{id:'chefSalad', src: 'chef/chef_salad.png'}
			{id:'chefSandwich', src: 'chef/chef_sandwich.png'}
			{id:'1cubierto1', src: 'chef/cubierto_10001.png'}
			{id:'1cubierto2', src: 'chef/cubierto_10002.png'}
			{id:'2cubierto1', src: 'chef/cubierto_20001.png'}
			{id:'2cubierto2', src: 'chef/cubierto_20002.png'}
			{id:'3cubierto1', src: 'chef/cubierto_30001.png'}
			{id:'3cubierto2', src: 'chef/cubierto_30002.png'}
			{id:'4cubierto1', src: 'chef/cubierto_40001.png'}
			{id:'4cubierto2', src: 'chef/cubierto_40002.png'}
			{id:'5cubierto1', src: 'chef/cubierto_50001.png'}
			{id:'5cubierto2', src: 'chef/cubierto_50002.png'}
			{id:'6cubierto1', src: 'chef/cubierto_60001.png'}
			{id:'6cubierto2', src: 'chef/cubierto_60002.png'}
			{id:'7cubierto1', src: 'chef/cubierto_70001.png'}
			{id:'7cubierto2', src: 'chef/cubierto_70002.png'}
			{id:'8cubierto1', src: 'chef/cubierto_80001.png'}
			{id:'8cubierto2', src: 'chef/cubierto_80002.png'}
			{id:'9cubierto1', src: 'chef/cubierto_90001.png'}
			{id:'9cubierto2', src: 'chef/cubierto_90002.png'}
			{id:'10cubierto1', src: 'chef/cubierto_100001.png'}
			{id:'10cubierto2', src: 'chef/cubierto_100002.png'}
			{id:'11cubierto1', src: 'chef/cubierto_110001.png'}
			{id:'11cubierto2', src: 'chef/cubierto_110002.png'}
			{id:'12cubierto1', src: 'chef/cubierto_120001.png'}
			{id:'12cubierto2', src: 'chef/cubierto_120002.png'}
			{id:'13cubierto1', src: 'chef/cubierto_130001.png'}
			{id:'13cubierto2', src: 'chef/cubierto_130002.png'}
			{id:'14cubierto1', src: 'chef/cubierto_140001.png'}
			{id:'14cubierto2', src: 'chef/cubierto_140002.png'}
			{id:'15cubierto1', src: 'chef/cubierto_150001.png'}
			{id:'15cubierto2', src: 'chef/cubierto_150002.png'}

			{id:'saladbtnready', src: 'salad/btn_ready.png'}
			{id:'saladbtnstart', src: 'salad/btn_start.png'}
			{id:'sandwichbtnready', src: 'sandwich/btn_ready.png'}
			{id:'sandwichbtnstart', src: 'sandwich/btn_start.png'}

			{id:'saladStart4Final3', src: 'salad/final_CutFruit.png'}
			{id:'saladStart1Final5', src: 'salad/final_Eat.png'}
			{id:'saladStart2Final4', src: 'salad/final_MixFruit.png'}
			{id:'saladStart5Final2', src: 'salad/final_WashFruit.png'}
			{id:'saladStart3Final1', src: 'salad/final_WashHands.png'}
			{id:'saladlabel', src: 'salad/label_fruit.png'}

			{id:'sandwichStart4Final4', src: 'sandwich/final_Bread.png'}
			{id:'sandwichStart3Final5', src: 'sandwich/final_Eat.png'}
			{id:'sandwichStart5Final2', src: 'sandwich/final_Spread.png'}
			{id:'sandwichStart1Final3', src: 'sandwich/final_Turkey.png'}
			{id:'sandwichStart2Final1', src: 'sandwich/final_Wash.png'}
			{id:'sandwichlabel', src: 'sandwich/label_sandwich.png'}

			{id:'saladstep', src: 'salad/step.png'}
			{id:'sandwichstep', src: 'sandwich/step.png'}
			{id:'saladline', src: 'salad/line.png'}
			{id:'sandwichline', src: 'sandwich/line.png'}

			{id:'saladnumber1', src: 'salad/number_1.png'}
			{id:'saladnumber2', src: 'salad/number_2.png'}
			{id:'saladnumber3', src: 'salad/number_3.png'}
			{id:'saladnumber4', src: 'salad/number_4.png'}
			{id:'saladnumber5', src: 'salad/number_5.png'}
			{id:'sandwichnumber1', src: 'sandwich/number_1.png'}
			{id:'sandwichnumber2', src: 'sandwich/number_2.png'}
			{id:'sandwichnumber3', src: 'sandwich/number_3.png'}
			{id:'sandwichnumber4', src: 'sandwich/number_4.png'}
			{id:'sandwichnumber5', src: 'sandwich/number_5.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U3_A3_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'swrong'}
		]
		@salad = 
			drags:[
				{id:'saladStart1Final5'}
				{id:'saladStart2Final4'}
				{id:'saladStart3Final1'}
				{id:'saladStart4Final3'}
				{id:'saladStart5Final2'}
			]
			texts:[
				{t:'Wash the fruit.',x:'165',y:'487'}
				{t:'Wash your hands.',x:'294',y:'456'}
				{t:'  Mix the fruit.  ',x:'430',y:'487'}
				{t:'  Serve and eat!  ',x:'553',y:'456'}
				{t:'  Cut the fruit.  ',x:'696',y:'487'}
			]
		@sandwich =
			drags:[
				{id:'sandwichStart1Final3'}
				{id:'sandwichStart2Final1'}
				{id:'sandwichStart3Final5'}
				{id:'sandwichStart4Final4'}
				{id:'sandwichStart5Final2'}
			]
			texts:[
				{t:'Put slices of turkey on the bread.',x:'165',y:'487'}
				{t:'Wash your hands.',x:'294',y:'456'}
				{t:'Spread mayonnaise on the bread.',x:'430',y:'487'}
				{t:'Eat your sandwich!',x:'553',y:'456'}
				{t:'Put the two slices of bread together.',x:'696',y:'487'}
			]
		@positions = 
			dragsImg:[
				{x:'160',y:'195'}
				{x:'284',y:'195'}
				{x:'407',y:'195'}
				{x:'531',y:'195'}
				{x:'654',y:'195'}
			]		
			steps:[
				{x:77, y:296}
				{x:219,y:296}
				{x:360,y:296}
				{x:502,y:296}
				{x:644,y:296}
			]
			ready: {x:431,y:539}
			start: {x:284,y:539}
			score: {x:86,y:191}
			titulo: {x:410,y:131}
		@answers =
			sandwich: [
				{t:'sandwichstep1', d:'d2'}
				{t:'sandwichstep2', d:'d5'}
				{t:'sandwichstep3', d:'d1'}
				{t:'sandwichstep4', d:'d4'}
				{t:'sandwichstep5', d:'d3'}
				{t:'dt2', d:'sandwichline1'}
				{t:'dt3', d:'sandwichline2'}
				{t:'dt1', d:'sandwichline3'}
				{t:'dt5', d:'sandwichline4'}
				{t:'dt4', d:'sandwichline5'}
			]
			salad: [
				{t:'saladstep1', d:'d3'}
				{t:'saladstep2', d:'d5'}
				{t:'saladstep3', d:'d4'}
				{t:'saladstep4', d:'d2'}
				{t:'saladstep5', d:'d1'}
				{t:'dt2', d:'saladline1'}
				{t:'dt1', d:'saladline2'}
				{t:'dt5', d:'saladline3'}
				{t:'dt3', d:'saladline4'}
				{t:'dt4', d:'saladline5'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@setStart()
	setStart:  ->
		@insertBitmap 'propsalad', 'propsalad', 412, 361, 'tc'
		@insertBitmap 'btnsalad', 'btnsalad', 412, 450, 'tc'
		@insertBitmap 'propsandwich', 'propsandwich', 412, 149, 'tc'
		@insertBitmap 'btnsandwich', 'btnsandwich', 412, 244, 'tc'
		@library['btnsalad'].addEventListener 'click', @setSalad
		@library['btnsandwich'].addEventListener 'click', @setSandwich
		@
	removeStart: ->
		@library['btnsalad'].removeEventListener 'click', @setSalad
		@library['btnsandwich'].removeEventListener 'click', @setSandwich
		
		TweenLite.to @library['btnsalad'], 0.5, {alpha:0}
		TweenLite.to @library['propsalad'], 0.5, {alpha:0}
		TweenLite.to @library['btnsandwich'], 0.5, {alpha:0}
		TweenLite.to @library['propsandwich'], 0.5, {alpha:0}
	setSandwich: (e) =>
		@removeStart()
		
		sandwich = new createjs.Container()
		@current = sandwich.name = 'sandwich'

		for i in [1..5] by 1
			s = @createBitmap 'sandwichstep'+i, 'sandwichstep', @positions.steps[i-1].x, @positions.steps[i-1].y
			n = @createBitmap 'sandwichnumber'+i, 'sandwichnumber'+i, s.x + 56, s.y + 43, 'mc'
			l = @createBitmap 'sandwichline'+i, 'sandwichline', s.x - 10, s.y + 90
			s.scaleX = s.scaleY = 0.46
			@addToLibrary s, l
			sandwich.addChild s, n, l

		label = @createBitmap 'label', 'sandwichlabel', @positions.titulo.x, @positions.titulo.y, 'tc'
		ready = new Button 'btnready', (@preload.getResult 'sandwichbtnready'), 'ready', @positions.ready.x, @positions.ready.y
		start = new Button 'btnstart', (@preload.getResult 'sandwichbtnstart'), 'start', @positions.start.x, @positions.start.y
		counter = new Counter 'counter', 60, '#56bb5b', @positions.score.x, @positions.score.y
		sandwich.addChild label, ready, start, counter
		@addToLibrary counter, ready, start

		for i in [1..@sandwich.drags.length] by 1
			value = @sandwich.drags[i - 1]
			v = new Draggable "d#{i}", (@preload.getResult value.id), i, @positions.dragsImg[i-1].x, @positions.dragsImg[i-1].y
			v.scaleX = v.scaleY = 0.46
			@observer.subscribe 'init_sandwich', v.initDragListener
			v.addEventListener 'drop', @evaluateImageDrop
			sandwich.addChild v
			@addToLibrary v

		for i in [1..@sandwich.texts.length] by 1
			value = @sandwich.texts[i - 1]
			v = new DraggableText "dt#{i}", value.t, i, value.x, value.y
			v.text.font = '20px Arial'
			v.text.lineHeight = 40
			v.text.lineWidth = 200
			v.text.textAlign = 'center'
			v.scaleX = v.scaleY = 0.46
			v.setHitArea()
			@observer.subscribe 'init_sandwich', v.initDragListener
			v.addEventListener 'drop', @evaluateTextDrop
			sandwich.addChild v
			@addToLibrary v

		@addToMain sandwich
		@introEvaluation()
		@
	setSalad: (e) =>
		@removeStart()
		salad = new createjs.Container()
		@current = salad.name = 'salad'

		for i in [1..5] by 1
			s = @createBitmap 'saladstep'+i, 'saladstep', @positions.steps[i-1].x, @positions.steps[i-1].y
			n = @createBitmap 'saladnumber'+i, 'saladnumber'+i, s.x + 56, s.y + 43, 'mc'
			l = @createBitmap 'saladline'+i, 'saladline', s.x - 10, s.y + 90
			s.scaleX = s.scaleY = 0.46
			@addToLibrary s, l
			salad.addChild s, n, l

		label = @createBitmap 'label', 'saladlabel', @positions.titulo.x, @positions.titulo.y, 'tc'
		ready = new Button 'btnready', (@preload.getResult 'saladbtnready'), 'ready', @positions.ready.x, @positions.ready.y
		start = new Button 'btnstart', (@preload.getResult 'saladbtnstart'), 'start', @positions.start.x, @positions.start.y
		counter = new Counter 'counter', 60, '#eb2d3d', @positions.score.x, @positions.score.y
		salad.addChild label, ready, start, counter
		@addToLibrary counter, ready, start

		for i in [1..@salad.drags.length] by 1
			value = @salad.drags[i - 1]
			v = new Draggable "d#{i}", (@preload.getResult value.id), i, @positions.dragsImg[i-1].x, @positions.dragsImg[i-1].y
			v.scaleX = v.scaleY = 0.46
			@observer.subscribe 'init_salad', v.initDragListener
			v.addEventListener 'drop', @evaluateImageDrop
			salad.addChild v
			@addToLibrary v

		for i in [1..@salad.texts.length] by 1
			value = @salad.texts[i - 1]
			v = new DraggableText "dt#{i}", value.t, i, value.x, value.y
			v.text.font = '20px Arial'
			v.text.lineHeight = 40
			v.text.lineWidth = 200
			v.text.textAlign = 'center'
			v.scaleX = v.scaleY = 0.46
			v.setHitArea()
			@observer.subscribe 'init_salad', v.initDragListener
			v.addEventListener 'drop', @evaluateTextDrop
			salad.addChild v
			@addToLibrary v

		@addToMain salad
		@introEvaluation()
		@
	introEvaluation: ->
		super
		TweenLite.from @library.btnstart, 0.5, {alpha: 0}
		@playInstructions(@)
	initEvaluation: (e) =>
		super
		@library.btnstart.blink()
		@library.btnstart.addEventListener 'click', @startGame
	startGame: (e) =>
		@observer.notify "init_#{@current}"
		@library.btnstart.removeEventListener 'click', @startGame
		@library.btnstart.blink(off)
		@library.btnready.addEventListener 'click', @evaluateAnswer
		@library.btnready.blink()
		TweenLite.to @library.btnstart, 0.5, {alpha: 0}
		@library.counter.addEventListener 'timer_complete', @endGame
		@library.counter.start()
	evaluateImageDrop: (e) =>
		@answer = e.target
		dropped = off
		i = 1
		until dropped is on or i > 5
			hit = @library["#{@current}step#{i}"]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
				@answer.putInPlace {x: hit.x, y: hit.y}, 1, @answer.scaleX, @answer.scaleY
				dropped = on
			else
				i++
		if not dropped
			@answer.returnToPlace 1, @answer.scaleX, @answer.scaleY
	evaluateTextDrop: (e) =>
		@answer = e.target
		dropped = off
		i = 1
		until dropped is on or i > 5
			hit = @library["#{@current}line#{i}"]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
				if @current is 'sandwich'
					@answer.putInPlace {x: hit.x + hit.width / 2, y: hit.y + 10}, 1, @answer.scaleX, @answer.scaleY
				if @current is 'salad'
					@answer.putInPlace {x: hit.x + hit.width / 2, y: hit.y + 7}, 1, @answer.scaleX, @answer.scaleY
				dropped = on
			else
				i++
		if not dropped
			@answer.returnToPlace 1, @answer.scaleX, @answer.scaleY
	evaluateAnswer: (e) =>
		@complete = on
		@library.btnready.removeEventListener 'click', @evaluateAnswer
		@library.btnready.blink(off)
		@library.counter.stop()
		for value in @answers[@current]
			pt = @library[value.t].localToLocal 5, 5, @library[value.d]
			if @library[value.t].name.length > 3
				npt = @library[value.t].localToLocal 0, 0, @mainContainer
			else
				npt = @library[value.d].localToLocal 0, 0, @mainContainer
			if @library[value.t].hitTest pt.x, pt.y
				@library.score.plusOne()
				r = @createBitmap 'correct', 'correct', npt.x, npt.y
			else
				@complete = off
				r = @createBitmap 'wrong', 'wrong', npt.x, npt.y
			@library[@current].addChild r
		setTimeout @finishEvaluation, 2 * 1000
	endGame: (e) =>
		@complete = off
		@finishEvaluation()
	finishEvaluation: =>
		if not @complete
			@insertBitmap 'chefAgain', 'chefAgain', 400, 600, 'bc'
		else
			if @current is 'salad'
				@insertBitmap 'chefSalad', 'chefSalad', 400, 600, 'bc'
			if @current is 'sandwich'
				@insertBitmap 'chefSandwich', 'chefSandwich', 400, 600, 'bc'
		TweenLite.to @library[@current], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @finish}
	finish: =>
		super
	window.U3A3 = U3A3