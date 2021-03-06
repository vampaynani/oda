class U1A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'p1', src: 'image_april.png'}
			{id: 'p2', src: 'image_danielle.png'}
			{id: 'p3', src: 'image_holly.png'}
			{id: 'p4', src: 'image_jess.png'}
			{id: 'p5', src: 'image_lindsey.png'}
			{id: 'p6', src: 'image_madison.png'}
			{id: 'n1', src: 'kid_april.png'}
			{id: 'n2', src: 'kid_danielle.png'}
			{id: 'n3', src: 'kid_holly.png'}
			{id: 'n4', src: 'kid_jess.png'}
			{id: 'n5', src: 'kid_lindsey.png'}
			{id: 'n6', src: 'kid_madison.png'}
			{id: 'repeat', src: 'repeat_btn.png'}
			{id: 'q', src: 'question_name.png'}
			{id: 'faces', src: 'faces_stage.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U1_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U1_A2_april.mp3', id:'april'}
		    {src:'sounds/TU2_U1_A2_danielle.mp3', id:'danielle'}
		    {src:'sounds/TU2_U1_A2_holly.mp3', id:'holly'}
		    {src:'sounds/TU2_U1_A2_jess.mp3', id:'jess'}
		    {src:'sounds/TU2_U1_A2_lindsey.mp3', id:'lindsey'}
		    {src:'sounds/TU2_U1_A2_madison.mp3', id:'madison'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [
			{id:3, sound:'holly'}
			{id:1, sound:'april' }
			{id:5, sound:'lindsey'}
		    {id:4, sound:'jess' }
		    {id:6, sound:'madison'}
		    {id:2, sound:'danielle' }
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and look at the chart. Then drag the names to answer the questions.', 80, 200
		@insertSprite 'characters', ['p1','p2','p3','p4','p5','p6'], null, 200, stageSize.h - 340
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 6, 0
		@intento = false
		@setDropper().setNames().introEvaluation()
	setDropper: ->
		myname = new createjs.Container()
		myname.x = 670
		myname.y = stageSize.h - 140
		myname.name = 'dropname'
		question = @createBitmap 'question', 'q', 0, 0
		h1 = new createjs.Shape new createjs.Graphics().beginFill( '#FFF' ).drawRect( 0, 0, 260, 60 )
		h1.x = 500
		h1.y = -14
		h1.name = 'h1'
		myname.addChild question, h1
		@addToLibrary h1
		@addToMain myname
		@
	setNames: ->
		names = new createjs.Container()
		names.x = 240
		names.y = 264
		names.name = 'names'
		faces = @createBitmap 'facesback', 'faces', 69, 0
		repeat = new Button 'btnrepeat', (@preload.getResult 'repeat'), 0, 600, 640
		name1 = new Draggable 'name1', (@preload.getResult 'n1'), 1, 16, 30
		name2 = new Draggable 'name2', (@preload.getResult 'n2'), 2, 4, 504
		name3 = new Draggable 'name3', (@preload.getResult 'n3'), 3, 16, 413
		name4 = new Draggable 'name4', (@preload.getResult 'n4'), 4, 16, 227
		name5 = new Draggable 'name5', (@preload.getResult 'n5'), 5, 4, 126
		name6 = new Draggable 'name6', (@preload.getResult 'n6'), 6, 4, 318

		name1.addEventListener 'drop', @evaluateAnswer
		name2.addEventListener 'drop', @evaluateAnswer
		name3.addEventListener 'drop', @evaluateAnswer
		name4.addEventListener 'drop', @evaluateAnswer
		name5.addEventListener 'drop', @evaluateAnswer
		name6.addEventListener 'drop', @evaluateAnswer
		repeat.addEventListener 'click', @repeatSound
		
		@addToLibrary name1, name2, name3, name4, name5, name6
		names.addChild faces, repeat, name1, name2, name3, name4, name5, name6
		@addToMain names
		@
	introEvaluation: ->
		super
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].gotoAndStop @answers[@index].id - 1

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 100, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 100, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library['characters'].gotoAndStop @answers[@index].id - 1
		createjs.Sound.play @answers[@index].sound
		for i in [1..6] by 1
			@library['name'+i].blink()
		TweenLite.to @library['characters'], 0.5, {alpha: 1, y: stageSize.h - 340, ease: Quart.easeOut}
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropname'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropname'].hitTest pt.x, pt.y
			console.log @answer.name, 'hit'
			if @answer.index is @answers[@index].id
				createjs.Sound.play 'good'
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@intento = true
				@answer.returnToPlace @answer.alpha, @answer.scaleX, @answer.scaleY, true
		else
			@answer.returnToPlace @answer.alpha, @answer.scaleX, @answer.scaleY, true
	finishEvaluation: =>
		if @intento is false then @library['score'].plusOne()
		@answer.returnToPlace @answer.alpha, @answer.scaleX, @answer.scaleY, true
		TweenLite.to @library['characters'], 0.5, {alpha: 0, delay:0.5, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@intento = false
			@library['characters'].alpha = 1
			@library['characters'].y = stageSize.h - 340
			@library['characters'].gotoAndStop @answers[@index].id - 1
			createjs.Sound.play @answers[@index].sound
			TweenLite.from @library['characters'], 0.5, {alpha: 0, y: @library['characters'].y + 20, ease: Quart.easeOut}
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play @answers[@index].sound
	finish: ->
		TweenLite.to @library['names'], 1, {alpha: 0, y: @library['names'].y + 100, delay: 0.1}
		TweenLite.to @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 100, delay: 0.1}
		TweenLite.to @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 40, delay: 0.1}
		super
		for i in [1..6] by 1
			@library['name'+i].blink off
	window.U1A2 = U1A2