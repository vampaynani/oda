class U1A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
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
		    {src:'sounds/TU2_U1_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U1_A2_april.mp3', id:'april'}
		    {src:'sounds/TU2_U1_A2_danielle.mp3', id:'danielle'}
		    {src:'sounds/TU2_U1_A2_holly.mp3', id:'holly'}
		    {src:'sounds/TU2_U1_A2_jess.mp3', id:'jess'}
		    {src:'sounds/TU2_U1_A2_lindsey.mp3', id:'lindsey'}
		    {src:'sounds/TU2_U1_A2_madison.mp3', id:'madison'}
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
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertSprite 'characters', ['p1','p2','p3','p4','p5','p6'], null, 100, stageSize.h - 180
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 6, 0
		@setDropper().setNames().introEvaluation()
	setDropper: ->
		myname = new createjs.Container()
		myname.x = 285
		myname.y = stageSize.h - 70
		myname.name = 'dropname'
		question = @createBitmap 'question', 'q', 0, 0
		h1 = new Droppable 'h1', '#FFFFFF', 250, 0, 120, 22
		myname.addChild question, h1
		@addToLibrary h1
		@addToMain myname
		@
	setNames: ->
		names = new createjs.Container()
		names.x = 120
		names.y = 132
		names.name = 'names'
		faces = @createBitmap 'facesback', 'faces', 69, 0
		repeat = new Button 'btnrepeat', (@preload.getResult 'repeat'), 0, 300, 320
		name1 = new Draggable 'name1', (@preload.getResult 'n1'), 1, 16, 20
		name2 = new Draggable 'name2', (@preload.getResult 'n2'), 2, 4, 260
		name3 = new Draggable 'name3', (@preload.getResult 'n3'), 3, 16, 210
		name4 = new Draggable 'name4', (@preload.getResult 'n4'), 4, 16, 125
		name5 = new Draggable 'name5', (@preload.getResult 'n5'), 5, 4, 78
		name6 = new Draggable 'name6', (@preload.getResult 'n6'), 6, 4, 164

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

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library['characters'].currentFrame = @answers[@index].id
		createjs.Sound.play @answers[@index].sound
		TweenLite.to @library['characters'], 0.5, {alpha: 1, y: stageSize.h - 180, ease: Quart.easeOut}
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
		@library['score'].plusOne()
		@answer.returnToPlace()
		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, delay:0.5, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
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
	window.U1A2 = U1A2