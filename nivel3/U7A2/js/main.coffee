class U7A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id: 'c1' , src: 'circle1.png'}
		    {id: 'c2' , src: 'circle2.png'}
			{id: 'cloud', src:'tag_verb.png'}

			{id:'candance', src:'can-dance.png'}
			{id:'caneat', src:'can-eat.png'}
			{id:'canfly', src:'can-fly.png'}
			{id:'cantfind', src:'cant-find.png'}
			{id:'cantgo', src:'cant-go.png'}
			{id:'cantplay', src:'cant-play.png'}
			{id:'couldeat', src:'could-eat.png'}
			{id:'couldgo', src:'could-go.png'}
			{id:'couldplay', src:'could-play.png'}
			{id:'couldntdance', src:'couldnt-dance.png'}
			{id:'couldnteat', src:'couldnt-eat.png'}
			{id:'couldntfly', src:'couldnt-fly.png'}
	
		]
		@escenas = [
			{ 
				id:'couldplay',
				p1:3,  x1:206, y1:400, l1:72,
				p2:10, x2:282, y2:400, l2:67
			}
			{ 
				id:'cantplay',
				p1:2,  x1:268, y1:400, l1:67,
				p2:10, x2:340, y2:400, l2:67
			}
			{ 
				id:'couldeat',
				p1:3, x1:270, y1:400, l1:67,
				p2:9, x2:345, y2:400, l2:50
			}
			{ 
				id:'couldgo',
				p1:3, x1:359, y1:368, l1:71,
				p2:6, x2:435, y2:368, l2:42
			}
			{ 
				id:'cantgo',
				p1:2,  x1:290, y1:400, l1:67,
				p2:6,  x2:362, y2:400, l2:40
			}
			{ 
				id:'couldntdance',
				p1:4, x1:310, y1:400, l1:100,
				p2:5, x2:413, y2:400, l2:80
			}
			{ 
				id:'candance',
				p1:1, x1:225, y1:400, l1:50,
				p2:5, x2:280, y2:400, l2:80
			}
			{ 
				id:'couldnteat',
				p1:4, x1:386, y1:368, l1:100,
				p2:9, x2:490, y2:368, l2:50
			}
			{ 
				id:'caneat',
				p1:1,  x1:225, y1:400, l1:50,
				p2:9,  x2:280, y2:400, l2:50
			}
			{ 
				id:'couldntfly',
				p1:4, x1:497, y1:400, l1:100,
				p2:8, x2:605, y2:400, l2:40
			}
			{ 
				id:'canfly',
				p1:1, x1:275, y1:400, l1:50,
				p2:8, x2:330, y2:400, l2:50
			}
			{ 
				id:'cantfind',
				p1:2,  x1:210, y1:400, l1:67,
				p2:11, x2:280, y2:400, l2:60
			}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U7_A2_Instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]

		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look at the images and drag the missing words.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 24, 0
		@library.score.txtCount.color = "#BFD951"
		@library.score.txtTotal.color = "#0096DB"
		@setEscena(1).setNube().introEvaluation()
	setEscena: (scene) ->
		if not @library.scene
			esc = new createjs.Container()
			esc.name = 'scene'
			@addToMain esc
		else
			@library.scene.removeAllChildren()
			esc = @library.scene
		
		i = scene - 1
		im = @createBitmap @escenas[i].id,  @escenas[i].id, stageSize.w /2, stageSize.h/2 - 10, 'mc'
		im.scaleX = im.scaleY = 0.75
		p1 = new WordContainer 'p1', '', '#eff9fe', '#0098d7', @escenas[i].x1, @escenas[i].y1, @escenas[i].l1, 30
		p2 = new WordContainer 'p2', '', '#eff9fe', '#0098d7', @escenas[i].x2, @escenas[i].y2, @escenas[i].l2, 30
		p1.text.font = p2.text.font = '20px Quicksand'
		esc.addChild im, p1, p2
		@addToLibrary p1, p2
		
		for i in [1..11] by 1
			if @library["p#{i}n"] then @library["p#{i}n"].updateDrops @library.p1, @library.p2
		@
	setNube: ->
		container = new createjs.Container()
		container.x = 136
		container.y = 462
		container.name = 'nube1'
		back = @createBitmap 'cloud', 'cloud', 0, 0
		back2 = @createBitmap 'cloud', 'cloud', 317, 0
		p1n = new DroppableText 'p1n', "can", 1, 42, 26, @stage, [@library.p1, @library.p2]
		p2n = new DroppableText 'p2n', "can't", 2, 49, 49, @stage, [@library.p1, @library.p2]
		p3n = new DroppableText 'p3n', "could", 3, 119, 26, @stage, [@library.p1, @library.p2]
		p4n = new DroppableText 'p4n', "couldn't", 4, 144, 51, @stage, [@library.p1, @library.p2]
		p5n = new DroppableText 'p5n', "dance", 5, 349, 21, @stage, [@library.p1, @library.p2]
		p6n = new DroppableText 'p6n', "go", 6, 421, 37, @stage, [@library.p1, @library.p2]
		p7n = new DroppableText 'p7n', "catch", 7, 460, 16, @stage, [@library.p1, @library.p2]
		p8n = new DroppableText 'p8n', "fly", 8, 342, 47, @stage, [@library.p1, @library.p2]
		p9n = new DroppableText 'p9n', "eat", 9, 382, 60, @stage, [@library.p1, @library.p2]
		p10n = new DroppableText 'p10n', "play", 10, 460, 62, @stage, [@library.p1, @library.p2]
		p11n = new DroppableText 'p11n', "find", 11, 510, 43, @stage, [@library.p1, @library.p2]

	
		container.addChild back, back2, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n, p10n, p11n
		@addToLibrary back, back2, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n, p10n, p11n
		@addToMain container

		for i in [1..11] by 1
			@library["p#{i}n"].addEventListener 'dropped', @evaluateAnswer
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0}
		TweenLite.from @library.scene, 1, {alpha :0, y: @library.scene.y - 10}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y - 10, ease: Quart.easeOut, delay:0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..11] by 1
			@library["p#{i}n"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @escenas[@index][e.drop.name]
			@answer.visible = false
			@drop.changeText @answer.text.text
			@finishEvaluation()
			createjs.Sound.play 'good'
			if @intento is 0
				@library['score'].plusOne()
			@intento = 0

		else
			@warning()
			@intento = 1
			@answer.returnToPlace()
	finishEvaluation: =>
		if @library.p1.text.text is '' or @library.p2.text.text is ''
			return
		else
			setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for i in [1..11] by 1
			@library["p#{i}n"].visible = true
			@library["p#{i}n"].returnToPlace()
		@library.p1.changeText ''
		@library.p2.changeText ''
		TweenLite.to @library.scene, 0.5, {alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		@intento = 0
		if @index < @escenas.length
			@setEscena @index + 1
			TweenLite.to @library.scene, 0.5, {alpha: 1, ease: Back.easeOut}
		else
			@finish()
	finish: ->
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y - 10, ease: Quart.easeOut}
		super
	window.U7A1 = U7A1