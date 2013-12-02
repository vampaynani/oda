class U3A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'flecha1', src:'flecha_1.png'}
			{id: 'flecha2', src:'flecha_2.png'}
			{id: 'flecha3', src:'flecha_3.png'}
			{id: 'flecha4', src:'flecha_4.png'}
			{id: 'flecha5', src:'flecha_5.png'}
			{id: 'image1dragble', src:'image_1_dragble.png'}
			{id: 'image2dragble', src:'image_2_dragble.png'}
			{id: 'image3dragble', src:'image_3_dragble.png'}
			{id: 'image4dragble', src:'image_4_dragble.png'}
			{id: 'image5dragble', src:'image_5_dragble.png'}
			{id: 'saladstep1', src:'image_1_dropArea.png'}
			{id: 'saladstep2', src:'image_2_dropArea.png'}
			{id: 'saladstep3', src:'image_3_dropArea.png'}
			{id: 'saladstep4', src:'image_4_dropArea.png'}
			{id: 'saladstep5', src:'image_5_dropArea.png'}
			{id: 'saladline1', src:'verso_1_dropArea.png'}
			{id: 'saladline2', src:'verso_2_dropArea.png'}
			{id: 'saladline3', src:'verso_3_dropArea.png'}
			{id: 'saladline4', src:'verso_4_dropArea.png'}
			{id: 'saladline5', src:'verso_5_dropArea.png'}
			{id: 'caterpillarlabel', src:'caterpillar_label.png'}
			{id: 'btnfinished', src:'btn_finished.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@salad = 
			drags:[
				{id:'image1dragble'}
				{id:'image2dragble'}
				{id:'image3dragble'}
				{id:'image4dragble'}
				{id:'image5dragble'}
			]
			texts:[
				{t: "Wake up now. I can't believe my eyes! Leaving the cocoon. What a big surprise!", x:'98', y:'417'}
				{t: "Then you are a caterpillar, long and green, With one goal in life--to eat, eat, eat!", x:'230', y:'460'}
				{t:"Now you are a butterfly with wings so new. Fly far away, up into the blue!", x:'134', y:'504'}
				{t: "Build a little house called cocoon. Sleep a little while. I'll see you very soon!", x:'99', y:'547'}
				{t: "Tiny little eggs under a leaf, Oh so difficult for me to see!", x:'329', y:'547'}
			]
		
		@positions = 
			dragsImg:[
				{x:'550',y:'506'}
				{x:'630',y:'506'}
				{x:'590',y:'438'}
				{x:'501',y:'438'}
				{x:'677',y:'438'}
			]		
			steps:[
				{x:'482',y:'184'}
				{x:'565',y:'130'}
				{x:'656',y:'175'}
				{x:'622',y:'268'}
				{x:'517',y:'278'}
			]
			flechas:[
				{x:'478',y:'273'}
				{x:'511',y:'140'}
				{x:'652',y:'134'}
				{x:'727',y:'261'}
				{x:'595',y:'360'}
			]
			ready: {x:431,y:539}
			start: {x:284,y:539}
			score: {x:86,y:191}
			titulo: {x: 228, y: 136}
		@answers =
			salad: [
				{t:'saladstep1', d:'d2'}
				{t:'saladstep2', d:'d5'}
				{t:'saladstep3', d:'d1'}
				{t:'saladstep4', d:'d4'}
				{t:'saladstep5', d:'d3'}
				{t:'dt2', d:'saladline1'}
				{t:'dt3', d:'saladline2'}
				{t:'dt1', d:'saladline3'}
				{t:'dt5', d:'saladline4'}
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
			l = @createBitmap 'saladline'+i, 'saladline', s.x, s.y, 'mc'
			f = @createBitmap 'saladstep'+i, 'saladstep', @positions.steps[i-1].x, @positions.steps[i-1].y
			#s.scaleX = s.scaleY = 0.46
			@addToLibrary s, l
			salad.addChild s, l



		label = @createBitmap 'label', 'caterpillarlabel', @positions.titulo.x, @positions.titulo.y, 'mc'

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