class U1A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id: 'n1', src: 'nube1.png'}
		    {id: 'n2', src: 'nube2.png'}
		    {id: 'n3', src: 'nube3.png'}
		    {id: 'gg', src: 'cuadro_naranja.png'}
		    {id: 'p1', src: 'ninos_cantando.png'}
		    {id: 'p2', src: 'ninos_jugando.png'}
		    {id: 'p3', src: 'nina_jugando.png'}
		    {id: 'p4', src: 'ninos_leyendo.png'}
		    {id: 'p5', src: 'nino_flauta.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U1_A1_Instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U1_A1_Im_painting_picture.mp3', id:'picture'}
		    {src:'sounds/TU2_U1_A1_Im_playing_flute.mp3', id:'flute'}
		    {src:'sounds/TU2_U1_A1_Were_playing_outside.mp3', id:'outside'}
		    {src:'sounds/TU2_U1_A1_Were_singing_song.mp3', id:'song'}
		    {src:'sounds/TU2_U1_A1_Were_studying_english.mp3', id:'english'}
			{src:'sounds/wrong.mp3', id:'wrong'}
			{src:'sounds/good.mp3', id:'good'}
		]
		@answers = [
			{w1:1, w2:2, w3:2, sound:'song' }
		    {w1:1, w2:1, w3:4, sound:'outside' }
		    {w1:0, w2:0, w3:0, sound:'picture'}
		    {w1:1, w2:3, w3:1, sound:'english' }
		    {w1:0, w2:1, w3:3, sound:'flute'}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look and drag the parts of the sentences to the speech bubbles.', 40, 100
		@insertSprite 'characters', ['p1','p2','p3','p4','p5'], null, stageSize.w / 2, 235, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setDropper().setNube1().setNube2().setNube3().introEvaluation()
	setDropper: ->
		dropper = new createjs.Container()
		dropper.x = stageSize.w / 2 - 205
		dropper.y = @library['characters'].y + 60
		dropper.name = 'dropper'
		back = @createBitmap 'backDropper','gg', 0, 0
		h1 = new WordContainer 'h1', '', '#fef2e7', '#f39234', 14, 62, 90, 22
		h2 = new WordContainer 'h2', '', '#fef2e7', '#f39234', 118, 62, 122, 22
		h3 = new WordContainer 'h3', '', '#fef2e7', '#f39234', 254, 62, 137, 22
		dropper.addChild back, h1, h2, h3
		@addToLibrary h1, h2, h3
		@addToMain dropper
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 100
		container.y = @library['dropper'].y + 120
		container.name = 'nube1'
		back = @createBitmap 'backNube1', 'n1', 0, 0
		p1n1 = new DraggableText 'p1n1', "I'm", 0, 40, 10
		p2n1 = new DraggableText 'p2n1', "We're", 1, 30, 40
		container.addChild back, p1n1, p2n1
		@addToLibrary back, p1n1, p2n1
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 250
		container.y = @library['dropper'].y + 120
		container.name = 'nube2'
		back = @createBitmap 'backNube2', 'n2', 0, 0
		p1n2 = new DraggableText 'p1n2', "painting", 0, 40, 30
		p2n2 = new DraggableText 'p2n2', "playing", 1, 140, 60
		p3n2 = new DraggableText 'p3n2', "singing", 2, 40, 80
		p4n2 = new DraggableText 'p4n2', "studying", 3, 120, 120
		container.addChild back, p1n2, p2n2, p3n2, p4n2
		@addToLibrary back, p1n2, p2n2, p3n2, p4n2
		@addToMain container
		@
	setNube3: ->
		container = new createjs.Container()
		container.x = 540
		container.y = @library['dropper'].y + 120
		container.name = 'nube3'
		back = @createBitmap 'backNube3', 'n3', 0, 0
		p1n3 = new DraggableText 'p1n3', "a picture.", 0, 110, 40
		p2n3 = new DraggableText 'p2n3', "English.", 1, 20, 50
		p3n3 = new DraggableText 'p3n3', "a song.", 2, 140, 80
		p4n3 = new DraggableText 'p4n3', "the flute.", 3, 30, 100
		p5n3 = new DraggableText 'p5n3', "outside.", 4, 100, 140
		container.addChild back, p1n3, p2n3, p3n3, p4n3, p5n3
		@addToLibrary back, p1n3, p2n3, p3n3, p4n3, p5n3
		@addToMain container
		@
	introEvaluation: ->
		super
		for i in [1..2] by 1
			@library['p'+i+'n1'].initDragListener()

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
				createjs.Sound.play 'good'
				for i in [1..4] by 1
					@library['p'+i+'n2'].initDragListener()

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
				createjs.Sound.play 'good'
				for i in [1..5] by 1
					@library['p'+i+'n3'].initDragListener()
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
				createjs.Sound.play 'good'
				for i in [1..4] by 1
					@library['p'+i+'n2'].removeEventListener 'drop', @evaluateAnswer2
					@library['p'+i+'n2'].endDragListener()
				for i in [1..5] by 1
					@library['p'+i+'n3'].removeEventListener 'drop', @evaluateAnswer3
					@library['p'+i+'n3'].endDragListener()
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		@clearEvaluation()
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