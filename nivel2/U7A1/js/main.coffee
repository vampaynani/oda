class U1A1 extends Oda
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
				p1:'hers', x1:'527', y1:'389', l1:'60',
				p2:'toothpaste', x2:'295', y2:'168', l2:'104'
			}
			{
				id:'hersWhose', 
				p1:'hers', x1: '485', y1: '378', l1: '57',
				p2:'Whose', x2: '277',	y2: '168', l2: '70'
			}
			{
				id:'hisTowel', 
				p1:'his', x1:'582', y1:'372', l1:'57', 
				p2:'towel', x2:'301', y2:'168', l2:'110'
			}
			{
				id:'hisWhose', 
				p1:'his', x1:'529', y1:'390', l1:'55',
				p2:'Whose', x2:'228', y2:'168', l2:'70'
			}
			{
				id:'mineBackpack', 
				p1:'mine', x1:'580', y1:'372', l1:'55',
				p2:'backpack', x2:'348', y2:'168', l2:'110'
			}
			{
				id:'mineSwimsuit', 
				p1:'mine', x1:'445', y1:'394', l1:'55',
				p2:'swimsuit', x2:'298', y2:'168', l2:'110'
			}
			{
				id:'mineWhose', 
				p1:'mine', x1:'421', y1:'384',  l1:'57',
				p2:'Whose', x2:'227', y2:'168', l2:'70'
			}
			{
				id:'yoursWhose', 
				p1:'yours', x1:'535', y1:'372',  l1:'56',
				p2:'whose', x2:'284', y2:'168', l2:'70'
			}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U1_A1_Instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setEscena().setNube().introEvaluation()
	setEscena: ->
		i = 7

		esc = new createjs.Container()
		esc.x = 0
		esc.y = 0

		im = @createBitmap @escenas[i].id,  @escenas[i].id, stageSize.w /2, stageSize.h/2, 'mc'
		p1 = new WordContainer 'p1', '', '#fef2e7', '#f39234', @escenas[i].x1, @escenas[i].y1, @escenas[i].l1, 30
		p2 = new WordContainer 'p2', '', '#fef2e7', '#f39234', @escenas[i].x2, @escenas[i].y2, @escenas[i].l2, 30
		esc.addChild im, p1, p2

		@addToLibrary p1, p2
		@addToMain esc
		@
	setNube: ->
		container = new createjs.Container()
		container.x = -20
		container.y = 25
		container.name = 'nube1'
		back = @createBitmap 'cloud', 'cloud', 238, 412
		p1n = new DraggableText 'p1n', 'mine', 0, 284, 473
		p2n = new DraggableText 'p2n', 'Whose', 1, 261, 521
		p3n = new DraggableText 'p3n', 'yours', 2, 347, 454
		p4n = new DraggableText 'p4n', 'backpack', 3, 347, 506
		p5n = new DraggableText 'p5n', 'towel', 4, 418, 431
		p6n = new DraggableText 'p6n', 'his', 5, 500, 441
		p7n = new DraggableText 'p7n', 'swimsuit', 6, 452, 473
		p8n = new DraggableText 'p8n', 'toothpaste', 7, 451, 527
		p9n = new DraggableText 'p9n', 'hers', 8, 542, 498
		container.addChild back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n
		@addToLibrary back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n
		@addToMain container
		@
	
	introEvaluation: ->
		super
		@	
	initEvaluation: (e) =>
		super
		@library['h1'].blink()
		@blink @library['backNube1']
		for i in [1..2] by 1
			@library['p'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		false
	evaluateAnswer1: (e) =>
		@answer = e.target
		pt = @library['h1'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h1'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w1
				@answer.visible = false
				@library['h1'].changeText @answer.text.text
				@library['h1'].blink off
				@blink @library['backNube1'], off
				@library['h2'].blink()
				@blink @library['backNube2']
				for i in [1..4] by 1
					@library['p'+i+'n2'].addEventListener 'drop', @evaluateAnswer2
				false
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateAnswer2: (e) =>
		@answer = e.target
		pt = @library['h2'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h2'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w2
				@answer.visible = false
				@library['h2'].changeText @answer.text.text
				@library['h2'].blink off
				@blink @library['backNube2'], off
				@library['h3'].blink()
				@blink @library['backNube3']
				for i in [1..5] by 1
					@library['p'+i+'n3'].addEventListener 'drop', @evaluateAnswer3
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateAnswer3:(e) =>
		@answer = e.target;
		pt = @library['h3'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h3'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w3
				@answer.visible = false
				@library['h3'].changeText @answer.text.text
				@library['h3'].blink off
				@blink @library['backNube3'], off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		song = createjs.Sound.play @answers[@index].sound
		song.addEventListener 'complete', @clearEvaluation
	clearEvaluation: (e) =>
		for i in [1..2] by 1
			@library['p'+i+'n1'].visible = true
			@library['p'+i+'n1'].returnToPlace()
		for i in [1..4] by 1
			@library['p'+i+'n2'].visible = true
			@library['p'+i+'n2'].returnToPlace()
		for i in [1..5] by 1
			@library['p'+i+'n3'].visible = true
			@library['p'+i+'n3'].returnToPlace()
		for i in [1..3] by 1
			@library['h'+i].changeText ''
		TweenLite.to @library['characters'], 0.5, {scaleX: 1.5, scaleY: 1.5, alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['characters'].currentFrame = @index
			@library['h1'].blink()
			@blink @library['backNube1']
			TweenLite.to @library['characters'], 0.5, {scaleX: 1, scaleY: 1, alpha: 1, ease: Back.easeOut}
			for i in [1..2] by 1
				@library['p'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		else
			@finish()
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		TweenLite.to @library['dropper'], 1, {alpha: 0, y: @library['dropper'].y + 20, delay: 0.2}
		TweenLite.to @library['nube1'], 1, {alpha: 0, y: @library['nube1'].y + 20, delay: 0.1}
		TweenLite.to @library['nube2'], 1, {alpha: 0, y: @library['nube2'].y + 20, delay: 0.1}
		TweenLite.to @library['nube3'], 1, {alpha: 0, y: @library['nube3'].y + 20, delay: 0.1,}
		super
	window.U1A1 = U1A1