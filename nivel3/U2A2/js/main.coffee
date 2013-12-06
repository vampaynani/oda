class U2A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'finish', src: 'finish-btn.png'}
    		{id:'repeat', src: 'repeat-btn.png'}
    		{id:'clockbox', src: 'clock-container.png'}
    		{id:'mc1', src: 'mag-clock-1.png'}
    		{id:'mc2', src: 'mag-clock-2.png'}
		    {id:'mc3', src: 'mag-clock-3.png'}
		    {id:'mc4', src: 'mag-clock-4.png'}
		    {id:'mc5', src: 'mag-clock-5.png'}
		    {id:'mc6', src: 'mag-clock-6.png'}
		    {id:'m1', src: 'mag-eggs.png'}
		    {id:'m2', src: 'mag-chickens.png'}
		    {id:'m3', src: 'mag-sheep.png'}
		    {id:'m4', src: 'mag-butter.png'}
		    {id:'m5', src: 'mag-berries.png'}
		    {id:'m6', src: 'mag-bake.png'}
		    {id:'jc1', src: 'bob-clock-1.png'}
		    {id:'jc2', src: 'bob-clock-2.png'}
		    {id:'jc3', src: 'bob-clock-3.png'}
		    {id:'jc4', src: 'bob-clock-4.png'}
		    {id:'jc5', src: 'bob-clock-5.png'}
		    {id:'jc6', src: 'bob-clock-6.png'}
		    {id:'j1', src: 'bob-cow.png'}
		    {id:'j2', src: 'bob-vegetables.png'}
		    {id:'j3', src: 'bob-go.png'}
		    {id:'j4', src: 'bob-compost.png'}
		    {id:'j5', src: 'bob-ground.png'}
		    {id:'j6', src: 'bob-clean.png'}
		    {id:'imgwrong', src: 'wrong.png'}
		    {id:'imgcorrect', src: 'correct.png'}
		]
		sounds = [
			{src:'sounds/TU2_U2_A4_instructions.mp3', id:'instructions'}

			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =[
			{
				name: 'mag'
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
				name: 'bob'
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
			{x: 485, y: 13}
			{x: 527, y: 79}
			{x: 485, y: 145}
			{x: 527, y: 211}
			{x: 485, y: 276}
			{x: 527, y: 343}
		]
		@drops = [
			{x: 12, y: 5}
			{x: 220, y: 5}
			{x: 12, y: 153}
			{x: 220, y: 153}
			{x: 12, y: 305}
			{x: 220, y: 305}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the clocks to the correct picture.', 40, 100
		@insertBitmap 'repeat', 'repeat', 545, 539
		@insertBitmap 'finish', 'finish', 663, 539
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setmag()
		@introEvaluation()
	setmag: ->
		mag = new createjs.Container()
		mag.x = 117
		mag.y = 124
		@current = mag.name = 'mag'


		m1 = @createBitmap 'magEggs', 'm1', 15, 13
		m2 = @createBitmap 'magChickens', 'm2', 223, 13
		m3 = @createBitmap 'magSheep', 'm3', 15, 161
		m4 = @createBitmap 'magButter', 'm4', 223, 161
		m5 = @createBitmap 'magBerries', 'm5', 15, 313
		m6 = @createBitmap 'magBake', 'm6', 223, 313
		mag.addChild m1, m2, m3, m4, m5, m6

		for i in [1..6] by 1
			sh = @createBitmap 'clockbox', 'clockbox',@drops[i - 1].x, @drops[i - 1].y
			sh.name = 'sh'+i
			@addToLibrary sh
			mag.addChild sh
		
		for i in [1..6] by 1
			mc = new Draggable 'mc'+i, @preload.getResult('mc'+i), i, @clocks[i - 1].x, @clocks[i - 1].y
			mc.addEventListener 'drop', @evaluateDrop
			@observer.subscribe 'init_mag_evaluation', mc.onInitEvaluation
			@addToLibrary mc
			mag.addChild mc

		@addToMain mag
	setbob: ->
		bob = new createjs.Container()
		bob.x = 117
		bob.y = 124
		@current = bob.name = 'bob'
		
		
		j1 = @createBitmap 'bobCow', 'j1', 15, 13
		j2 = @createBitmap 'bobVegetables', 'j2', 223, 13
		j3 = @createBitmap 'bobGo', 'j3', 15, 161
		j4 = @createBitmap 'bobCompost', 'j4', 223, 161
		j5 = @createBitmap 'bobGround', 'j5', 15, 313
		j6 = @createBitmap 'bobClean', 'j6', 223, 313
		bob.addChild j1, j2, j3, j4, j5, j6

		for i in [1..6] by 1
			sh = @createBitmap 'clockbox', 'clockbox',@drops[i - 1].x, @drops[i - 1].y
			sh.name = 'sh'+i
			@addToLibrary sh
			bob.addChild sh
		
		for i in [1..6] by 1
			jc = new Draggable 'jc'+i, @preload.getResult('jc'+i), i, @clocks[i - 1].x, @clocks[i - 1].y
			jc.addEventListener 'drop', @evaluateDrop
			@observer.subscribe 'init_bob_evaluation', jc.onInitEvaluation
			@addToLibrary jc
			bob.addChild jc

		@addToMain bob
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha: 0, x: 0, delay: 0.5}
		TweenMax.from @library['mag'], 1, {alpha: 0, x: @library['mag'].x + 50, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@observer.notify 'init_' + @game[@index].name + '_evaluation'
		@library['repeat'].addEventListener 'click', @playSound
		@library['finish'].addEventListener 'click', @evaluateAnswer
		@sound = @game[@index].name
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
			res = @createSprite 'resultado', ['imgwrong', 'imgcorrect'], null, (@drops[i - 1].x) + 75, @drops[i - 1].y
			answer = @game[@index].values[i - 1]
			if @library[answer.q].x is @library[answer.a].x and @library[answer.q].y is @library[answer.a].y
				res.currentFrame = 1
				@library['score'].plusOne()
			else
				res.currentFrame = 0
			@library[@current].addChild res

		setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		createjs.Sound.stop @sound
		TweenLite.to @library[@game[@index].name], 0.5, {alpha: 0, x: stageSize.w, ease:Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @game.length
			@setbob()
			TweenMax.from @library['bob'], 1, {alpha: 0, x: @library['bob'].x + 50, delay: 1, onComplete: @initEvaluation}
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
		TweenLite.to @library['repeat'], 1, {alpha: 0, x: @x + 20}
		TweenLite.to @library['finish'], 1, {alpha: 0, x: @x + 20}
		TweenLite.to @library['bob'], 1, {alpha: 0, x: @library['bob'].x + 50}
		super
	window.U2A2 = U2A2