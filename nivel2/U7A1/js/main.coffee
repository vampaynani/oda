class U7A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id: 'inst' , src: 'inst.png'}
		    {id: 'c1' , src: 'circle1.png'}
		    {id: 'c2' , src: 'circle2.png'}
			{id: 'cloud', src:'cloud.png'}
			{id: 'hersToothpaste', src:'hers-toothpaste.png'}
			{id: 'hersWhose', src:'hers-whose.png'}
			{id: 'hisTowel', src:'his-towel.png'}
			{id: 'hisWhose', src:'his-whose.png'}
			{id: 'mineBackpack', src:'mine-backpack.png'}
			{id: 'mineSwimsuit', src:'mine-swimsuit.png'}
			{id: 'mineWhose', src:'mine-whose.png'}
			{id: 'yoursWhose', src:'yours-whose.png'}		
		]
		@escenas = [
			{
				id:'hersToothpaste', 
				p1:8, x1: 1053, y1: 770, l1: 122,
				p2:7, x2: 598, y2: 340, l2: 208
			}
			{
				id:'hersWhose', 
				p1:8, x1: 952, y1: 752, l1: 116,
				p2:1, x2: 554,	y2: 342, l2: 140
			}
			{
				id:'hisTowel', 
				p1:5, x1:1164, y1:744, l1:104, 
				p2:4, x2:602, y2:336, l2:220
			}
			{
				id:'hisWhose', 
				p1:5, x1:1058, y1:780, l1:110,
				p2:1, x2:456, y2:336, l2:140
			}
			{
				id:'mineBackpack', 
				p1:0, x1:1160, y1:744, l1:110,
				p2:3, x2:696, y2:336, l2:220
			}
			{
				id:'mineSwimsuit', 
				p1:0, x1:890, y1:788, l1:110,
				p2:6, x2:596, y2:336, l2:220
			}
			{
				id:'mineWhose', 
				p1:0, x1:842, y1:768,  l1:114,
				p2:1, x2:454, y2:336, l2:140
			}
			{
				id:'yoursWhose', 
				p1:2, x1:1070, y1:744, l1:112,
				p2:1, x2:568, y2:336, l2:140
			}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U7_A1_Instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]

		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read, look and drag the words to complete the sentences.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 16, 0
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
		im = @createBitmap @escenas[i].id,  @escenas[i].id, stageSize.w /2, stageSize.h/2, 'mc'
		p1 = new WordContainer 'p1', '', '#eff9fe', '#0098d7', @escenas[i].x1, @escenas[i].y1, @escenas[i].l1, 60
		p2 = new WordContainer 'p2', '', '#eff9fe', '#0098d7', @escenas[i].x2, @escenas[i].y2, @escenas[i].l2, 60
		p1.text.font = p2.text.font = '40px Quicksand'
		esc.addChild im, p1, p2
		@addToLibrary p1, p2
		
		for i in [1..9] by 1
			if @library["p#{i}n"] then @library["p#{i}n"].updateDrops @library.p1, @library.p2
		@
	setNube: ->
		container = new createjs.Container()
		container.x = -20
		container.y = 25
		container.name = 'nube1'
		back = @createBitmap 'cloud', 'cloud', 476, 824
		p1n = new DroppableText 'p1n', 'mine', 0, 568, 946, @stage, [@library.p1, @library.p2]
		p2n = new DroppableText 'p2n', 'Whose', 1, 522, 1042, @stage, [@library.p1, @library.p2]
		p3n = new DroppableText 'p3n', 'yours', 2, 694, 908, @stage, [@library.p1, @library.p2]
		p4n = new DroppableText 'p4n', 'backpack', 3, 694, 1012, @stage, [@library.p1, @library.p2]
		p5n = new DroppableText 'p5n', 'towel', 4, 836, 862, @stage, [@library.p1, @library.p2]
		p6n = new DroppableText 'p6n', 'his', 5, 1000, 882, @stage, [@library.p1, @library.p2]
		p7n = new DroppableText 'p7n', 'swimsuit', 6, 904, 946, @stage, [@library.p1, @library.p2]
		p8n = new DroppableText 'p8n', 'toothpaste', 7, 902, 1054, @stage, [@library.p1, @library.p2]
		p9n = new DroppableText 'p9n', 'hers', 8, 1084, 996, @stage, [@library.p1, @library.p2]
		
		container.addChild back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n
		@addToLibrary back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n
		@addToMain container

		for i in [1..9] by 1
			@library["p#{i}n"].addEventListener 'dropped', @evaluateAnswer
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0}
		TweenLite.from @library.scene, 1, {alpha :0, y: @library.scene.y - 20}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y - 20, ease: Quart.easeOut, delay:0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..9] by 1
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
		for i in [1..9] by 1
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
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y - 20, ease: Quart.easeOut}
		super
	window.U7A1 = U7A1