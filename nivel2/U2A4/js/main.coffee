class U2A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'finish', src: 'finish-btn.png'}
    		{id:'repeat', src: 'repeat-btn.png'}
    		{id:'clockbox', src: 'clock-container.png'}
    		{id:'mc1', src: 'meg-clock-1.png'}
    		{id:'mc2', src: 'meg-clock-2.png'}
		    {id:'mc3', src: 'meg-clock-3.png'}
		    {id:'mc4', src: 'meg-clock-4.png'}
		    {id:'mc5', src: 'meg-clock-5.png'}
		    {id:'mc6', src: 'meg-clock-6.png'}
		    {id:'m1', src: 'meg-wakes.png'}
		    {id:'m2', src: 'meg-breakfast.png'}
		    {id:'m3', src: 'meg-leaves.png'}
		    {id:'m4', src: 'meg-dishes.png'}
		    {id:'m5', src: 'meg-dinner.png'}
		    {id:'m6', src: 'meg-sleep.png'}
		    {id:'jc1', src: 'jim-clock-1.png'}
		    {id:'jc2', src: 'jim-clock-2.png'}
		    {id:'jc3', src: 'jim-clock-3.png'}
		    {id:'jc4', src: 'jim-clock-4.png'}
		    {id:'jc5', src: 'jim-clock-5.png'}
		    {id:'jc6', src: 'jim-clock-6.png'}
		    {id:'j1', src: 'jim-shower.png'}
		    {id:'j2', src: 'jim-breakfast.png'}
		    {id:'j3', src: 'jim-leaves.png'}
		    {id:'j4', src: 'jim-bus.png'}
		    {id:'j5', src: 'jim-cat.png'}
		    {id:'j6', src: 'jim-tv.png'}
		    {id:'imgwrong', src: 'wrong.png'}
		    {id:'imgcorrect', src: 'correct.png'}
		]
		sounds = [
			{src:'sounds/TU2_U2_A4_instructions.mp3', id:'instructions'}
			{src:'sounds/TU2_U2_A4_Meg.mp3', id:'meg'}
			{src:'sounds/TU2_U2_A4_UncleJim.mp3', id:'jim'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers =[
			{
				name: 'meg'
				values: [
					{q: 'sh1', a: 'mc3'}
					{q: 'sh2', a: 'mc6'}
					{q: 'sh3', a: 'mc4'}
					{q: 'sh4', a: 'mc2'}
					{q: 'sh5', a: 'mc5'}
					{q: 'sh6', a: 'mc1'}
				]
			}
			{
				name: 'jim'
				values: [
					{q: 'sh1', a: 'jc4'}
					{q: 'sh2', a: 'jc5'}
					{q: 'sh3', a: 'jc1'}
					{q: 'sh4', a: 'jc2'}
					{q: 'sh5', a: 'jc6'}
					{q: 'sh6', a: 'jc3'}
				]
			}
		]
		@clocks = [
			{x: 970, y: 26}
			{x: 1054, y: 160}
			{x: 970, y: 290}
			{x: 1054, y: 422}
			{x: 970, y: 552}
			{x: 1054, y: 686}
		]
		@drops = [
			{x: 24, y: 10}
			{x: 440, y: 10}
			{x: 24, y: 306}
			{x: 440, y: 306}
			{x: 24, y: 610}
			{x: 440, y: 610}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the clocks to the correct picture.', 80, 200
		@insertBitmap 'repeat', 'repeat', 1090, 1080
		@insertBitmap 'finish', 'finish', 1326, 1080
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 12, 0
		@setMeg()
		@introEvaluation()
	setMeg: ->
		meg = new createjs.Container()
		meg.x = 234;
		meg.y = 248;
		@current = meg.name = 'meg'
		
		m1 = @createBitmap 'megWakes', 'm1', 30, 26
		m2 = @createBitmap 'megBreakfast', 'm2', 446, 26
		m3 = @createBitmap 'megLeaves', 'm3', 30, 322
		m4 = @createBitmap 'megDishes', 'm4', 446, 322
		m5 = @createBitmap 'megDinner', 'm5', 30, 626
		m6 = @createBitmap 'megSleep', 'm6', 446, 626
		meg.addChild m1, m2, m3, m4, m5, m6

		for i in [1..6] by 1
			sh = new createjs.Shape()
			sh.graphics.beginFill('#FFF').setStrokeStyle( 2 ).beginStroke('#333').drawRoundRect(0, 0, 132, 84, 10)
			sh.x = @drops[i - 1].x
			sh.y = @drops[i - 1].y
			sh.name = 'sh'+i
			@addToLibrary sh
			meg.addChild sh

			

		for i in [1..6] by 1
			mc = new Draggable 'mc'+i, @preload.getResult('mc'+i), i, @clocks[i - 1].x, @clocks[i - 1].y
			mc.addEventListener 'drop', @evaluateDrop
			@observer.subscribe 'init_meg_evaluation', mc.onInitEvaluation
			@addToLibrary mc
			meg.addChild mc

		@addToMain meg
	setJim: ->
		jim = new createjs.Container()
		jim.x = 234;
		jim.y = 248;
		@current = jim.name = 'jim'
		
		
		j1 = @createBitmap 'jimShower', 'j1', 30, 26
		j2 = @createBitmap 'jimBreakfast', 'j2', 446, 26
		j3 = @createBitmap 'jimLeaves', 'j3', 30, 322
		j4 = @createBitmap 'jimBus', 'j4', 446, 322
		j5 = @createBitmap 'jimCat', 'j5', 30, 626
		j6 = @createBitmap 'jimTv', 'j6', 446, 626
		jim.addChild j1, j2, j3, j4, j5, j6

		for i in [1..6] by 1
			sh = new createjs.Shape()
			sh.graphics.beginFill('#FFF').setStrokeStyle( 2 ).beginStroke('#000').drawRoundRect(0, 0, 132, 84, 10)
			sh.x = @drops[i - 1].x
			sh.y = @drops[i - 1].y
			sh.name = 'sh'+i
			@addToLibrary sh
			jim.addChild sh
		
		for i in [1..6] by 1
			jc = new Draggable 'jc'+i, @preload.getResult('jc'+i), i, @clocks[i - 1].x, @clocks[i - 1].y
			jc.addEventListener 'drop', @evaluateDrop
			@observer.subscribe 'init_jim_evaluation', jc.onInitEvaluation
			@addToLibrary jc
			jim.addChild jc

		@addToMain jim
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha: 0, x: 0, delay: 0.5}
		TweenMax.from @library['meg'], 1, {alpha: 0, x: @library['meg'].x + 100, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@observer.notify 'init_' + @answers[@index].name + '_evaluation'
		@library['repeat'].addEventListener 'click', @playSound
		@library['finish'].addEventListener 'click', @evaluateAnswer
		@sound = @answers[@index].name
		@playSound()
	evaluateDrop: (e) =>
		@answer = e.target
		dropped = off
		i = 1
		until dropped is on or i > 6
			hit = @library['sh'+i]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
				@answer.x = hit.x
				@answer.y = hit.y
				@answer.blink off
				dropped = on
			else
				i++
				@answer.returnToPlace()
		@
	evaluateAnswer: (e) =>
		@library['repeat'].removeEventListener 'click', @playSound
		@library['finish'].removeEventListener 'click', @evaluateAnswer
		for i in [1..6] by 1
			answer = @answers[@index].values[i - 1]
			res = @createSprite 'resultado', ['imgwrong', 'imgcorrect'], null, (@library[answer.a].x) + 75, @library[answer.a].y
			if @library[answer.q].x is @library[answer.a].x and @library[answer.q].y is @library[answer.a].y
				@library['score'].plusOne()
				res.currentFrame = 1
				#r = @createBitmap 'correct', 'correct', (@drops[i - 1].x) + 75, @drops[i - 1].y
			else
				res.currentFrame = 0
				#insert tache
				#r = @createBitmap 'wrong', 'wrong', (@drops[i - 1].x) + 75, @drops[i - 1].y
			@library[@current].addChild res
		setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		createjs.Sound.stop @sound
		TweenLite.to @library[@answers[@index].name], 0.5, {alpha: 0, x: stageSize.w, ease:Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@setJim()
			TweenMax.from @library['jim'], 1, {alpha: 0, x: @library['jim'].x + 100, delay: 1, onComplete: @initEvaluation}
		else
			@finish()
	playSound: =>
		createjs.Sound.stop @sound
		createjs.Sound.play @sound
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		TweenLite.to @library['repeat'], 1, {alpha: 0, x: @x + 40}
		TweenLite.to @library['finish'], 1, {alpha: 0, x: @x + 40}
		TweenLite.to @library['jim'], 1, {alpha: 0, x: @library['jim'].x + 100}
		super
	window.U2A4 = U2A4