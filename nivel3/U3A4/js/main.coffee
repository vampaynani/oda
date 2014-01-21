class U3A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'inst' , src: 'inst.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id: 'n1', src: 'nube1.png'}
		    {id: 'n2', src: 'nube2.png'}
		    {id: 'n3', src: 'nube3.png'}
			{id: 'caras', src:'caras.png'}
			{id: 'img01', src:'imagenes0001.png'}#ballet
			{id: 'img02', src:'imagenes0002.png'}#skate
			{id: 'img03', src:'imagenes0003.png'}#chat
			{id: 'img04', src:'imagenes0004.png'}#drum
			{id: 'img05', src:'imagenes0005.png'}#karate
			{id: 'img06', src:'imagenes0006.png'}#study
			{id: 'img07', src:'imagenes0007.png'}#gimnasia
			{id: 'img08', src:'imagenes0008.png'}#swim
			{id: 'img09', src:'imagenes0009.png'}#violin
			{id: 'img10', src:'imagenes0010.png'}#PCGAMES
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U3_A4_instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
			{src:'sounds/good.mp3', id:'good'}
		]
		@answers = [
			{w1:0, w2:4, w3:5}#ballet
			{w1:3, w2:0, w3:0}#skate
			{w1:3, w2:1, w3:2}#chat
			{w1:1, w2:3, w3:3}#drum
			{w1:0, w2:4, w3:8}#karate
			{w1:0, w2:5, w3:4}#study
			{w1:2, w2:2, w3:7}#gimnasia
			{w1:1, w2:4, w3:9}#swim
			{w1:3, w2:3, w3:1}#violin
			{w1:2, w2:3, w3:6}#PCGAMES

		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look and click on the word to make a sentence.', 40, 100
		@insertSprite 'characters', ['img01','img02','img03','img04','img05','img06','img07','img08','img09','img10'], null, stageSize.w / 2, 235, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@insertBitmap 'caras', 'caras', 670, 120
		
		@setDropper().setNube1().setNube2().setNube3().introEvaluation()
	setDropper: ->
		dropper = new createjs.Container()
		dropper.x = 150
		dropper.y = 541
		dropper.name = 'dropper'
		text = new createjs.Text 'I','26px Quicksand','#333'
		h1 = new WordContainer 'h1', '', '#fff', '#F59743', 20, 0, 167, 30
		h2 = new WordContainer 'h2', '', '#fff', '#F59743', 210, 0, 167, 30
		h3 = new WordContainer 'h3', '', '#fff', '#F59743', 396, 0, 167, 30
		dropper.addChild text, h1, h2, h3
		@addToLibrary h1, h2, h3
		@addToMain dropper
		@
	setNube1: ->
		nube1 = new createjs.Container()
		nube1.x = 72
		nube1.y = 339
		nube1.name = 'nube1'
		
		n1 = @createBitmap 'n1', 'n1', 0, 0
		t1n1 = new DraggableText 't1n1', "love", 0,37,21
		t2n1 = new DraggableText 't2n1', "don't like", 1,54,51
		t3n1 = new DraggableText 't3n1', "hate", 2, 36,79
		t4n1 = new DraggableText 't4n1', "like", 3, 84,99

		nube1.addChild n1, t1n1, t2n1, t3n1, t4n1
		@addToLibrary n1, t1n1, t2n1, t3n1, t4n1
		@addToMain nube1
		@
	setNube2: ->
		nube2 = new createjs.Container()
		nube2.x = 241
		nube2.y = 336
		nube2.name = 'nube2'

		n2 = @createBitmap 'n2', 'n2', 0, 0
		t1n2 = new DraggableText 't1n2', "going", 0,  34,21
		t2n2 = new DraggableText 't2n2', "chatting", 1, 79,49
		t3n2 = new DraggableText 't3n2', "doing", 2, 34,76
		t4n2 = new DraggableText 't4n2', "playing", 3, 99,102
		t5n2 = new DraggableText 't5n2', "taking", 4,  17,106
		t6n2 = new DraggableText 't6n2', "learning", 5, 83,144

		nube2.addChild n2, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2
		@addToLibrary n2, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2
		@addToMain nube2
		@
	setNube3: ->
		nube3 = new createjs.Container()
		nube3.x = 437
		nube3.y = 310
		nube3.name = 'nube3'

		n3 = @createBitmap 'n3', 'n3', 0, 0
		t1n3 = new DraggableText 't1n3', "roller skating", 0, 54,33 
		t2n3 = new DraggableText 't2n3', "the violin", 1,  19,61 
		t3n3 = new DraggableText 't3n3', "online with friends", 2, 43,93 
		t4n3 = new DraggableText 't4n3', "in the school band", 3,  21,127 
		t5n3 = new DraggableText 't5n3', "English", 4,  57,164 
		t6n3 = new DraggableText 't6n3', "ballet class", 5,  193,28 
		t7n3 = new DraggableText 't7n3', "computer games", 6,  164,66 
		t8n3 = new DraggableText 't8n3', "gymnastics", 7,  208,115 
		t9n3 = new DraggableText 't9n3', "karate lessons", 8,  174,160 
		t10n3 = new DraggableText 't10n3', "swimming lessons", 9,  117,191 

		nube3.addChild n3, t1n3, t2n3, t3n3, t4n3, t5n3, t6n3, t7n3, t8n3, t9n3, t10n3
		@addToLibrary n3, t1n3, t2n3, t3n3, t4n3, t5n3, t6n3, t7n3, t8n3, t9n3, t10n3
		@addToMain nube3
		@
	introEvaluation: ->
		super
		for i in [1..4] by 1
			@library['t'+i+'n1'].initDragListener()

		@library['characters'].currentFrame = @index
		@library['characters'].scaleX = 1
		@library['characters'].scaleY = 1
		@library['characters'].alpha = 1
		
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 50, delay: 1}
		TweenLite.from @library['dropper'], 1, {alpha: 0, y: @library['dropper'].y + 20, delay: 1.2}
		TweenLite.from @library['nube1'], 1, {alpha: 0, y: @library['nube1'].y + 20, delay: 1.4}
		TweenLite.from @library['nube2'], 1, {alpha: 0, y: @library['nube2'].y + 20, delay: 1.5}
		TweenLite.from @library['nube3'], 1, {alpha: 0, y: @library['nube3'].y + 20, delay: 1.6, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library['h1'].blink()
		@blink @library['n1']
		for i in [1..4] by 1
			@library['t'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		false
	evaluateAnswer1: (e) =>
		@answer = e.target
		pt = @library['h1'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h1'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w1
				@answer.visible = false
				@library['h1'].changeText @answer.text.text
				@library['h1'].blink off
				@blink @library['n1'], off
				@library['h2'].blink()
				@blink @library['n2']
				createjs.Sound.play 'good'
				for i in [1..6] by 1
					@library['t'+i+'n2'].initDragListener()

				for i in [1..6] by 1
					@library['t'+i+'n2'].addEventListener 'drop', @evaluateAnswer2
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
				@blink @library['n2'], off
				@library['h3'].blink()
				@blink @library['n3']
				createjs.Sound.play 'good'
				for i in [1..10] by 1
					@library['t'+i+'n3'].initDragListener()

				for i in [1..10] by 1
					@library['t'+i+'n3'].addEventListener 'drop', @evaluateAnswer3
				false
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateAnswer3:(e) =>
		@answer = e.target;
		console.log '3'
		pt = @library['h3'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h3'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w3
				@answer.visible = false
				@library['h3'].changeText @answer.text.text
				@library['h3'].blink off
				@blink @library['n3'], off
				setTimeout @finishEvaluation, 1 * 1000
				createjs.Sound.play 'good'
				for i in [1..6] by 1
					@library['t'+i+'n2'].removeEventListener 'drop', @evaluateAnswer2
					@library['t'+i+'n2'].endDragListener()
				for i in [1..10] by 1
					@library['t'+i+'n3'].removeEventListener 'drop', @evaluateAnswer3
					@library['t'+i+'n3'].endDragListener()
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		@clearEvaluation()
	clearEvaluation: (e) =>
		for i in [1..4] by 1
			@library['t'+i+'n1'].visible = true
			@library['t'+i+'n1'].returnToPlace()
		for i in [1..6] by 1
			@library['t'+i+'n2'].visible = true
			@library['t'+i+'n2'].returnToPlace()
		for i in [1..10] by 1
			@library['t'+i+'n3'].visible = true
			@library['t'+i+'n3'].returnToPlace()
		for i in [1..3] by 1
			@library['h'+i].changeText ''
		TweenLite.to @library['characters'], 0.5, {scaleX: 1.5, scaleY: 1.5, alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['characters'].currentFrame = @index
			@library['h1'].blink()
			@blink @library['n1']
			TweenLite.to @library['characters'], 0.5, {scaleX: 1, scaleY: 1, alpha: 1, ease: Back.easeOut}
			for i in [1..2] by 1
				@library['t'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		else
			@finish()
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		TweenLite.to @library['dropper'], 1, {alpha: 0, y: @library['dropper'].y + 20, delay: 0.2}
		TweenLite.to @library['caras'], 1, {alpha: 0, y: @library['caras'].y + 20, delay: 0.2}
		TweenLite.to @library['nube1'], 1, {alpha: 0, y: @library['nube1'].y + 20, delay: 0.1}
		TweenLite.to @library['nube2'], 1, {alpha: 0, y: @library['nube2'].y + 20, delay: 0.1}
		TweenLite.to @library['nube3'], 1, {alpha: 0, y: @library['nube3'].y + 20, delay: 0.1,}
		super
	window.U3A4 = U3A4