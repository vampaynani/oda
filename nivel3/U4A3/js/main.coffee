class U6A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id: 'inst' , src: 'inst.png'}
		    {id: 'c1' , src: 'circle1.png'}
		    {id: 'c2' , src: 'circle2.png'}

		    {id: 'btnConfused', src:'btn_confused.png'}
			{id: 'btnDirty', src:'btn_dirty.png'}
			{id: 'btnEnergetic', src:'btn_energetic.png'}
			{id: 'btnHot', src:'btn_hot.png'}
			{id: 'btnSick', src:'btn_sick.png'}
			{id: 'btnTired', src:'btn_tired.png'}
			{id: 'faceConfused', src:'face_confused.png'}
			{id: 'faceDirty', src:'face_dirty.png'}
			{id: 'faceEnergetic', src:'face_energetic.png'}
			{id: 'faceHot', src:'face_hot.png'}
			{id: 'faceSick', src:'face_sick.png'}
			{id: 'faceTired', src:'face_tired.png'}
			{id: 'n2', src:'tag_answer.png'}
			{id: 'n3', src:'tag_pronoun.png'}
			{id: 'n1', src:'tag_verb.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U6_A3_Instructions.mp3', id:'instructions'}
		]
		@game =
			steps : [ ##no se como tengan que organizarse cada imagen tiene una frase que debe mostrar. Falta completar aqui las frases
				{face:'faceSick', img:'btnSick', frase:"When I'm sick, I ", targets: ['go','to the doctor']}
				{face:'faceConfused', img:'btnConfused', frase:"When I'm confused, I ", targets: ['ask','my teacher', 'a question']}
				{face:'faceTired', img:'btnTired', frase:"When I'm tired, I ", targets: ['go','to bed']}
				{face:'faceHot', img:'btnHot', frase:"When I'm hot, I ", targets: ['sit','in front of', 'a fan']}
				{face:'faceDirty', img:'btnDirty', frase:"When I'm dirty, I ", targets: ['take','a shower']}
				{face:'faceEnergetic', img:'btnEnergetic', frase:"When I'm energetic, I ", targets: ['go','roller skating']}
			]
			opt1:[
				{i:1, t:'go', x:31, y:36}
				{i:2, t:'take', x:69, y:21}
				{i:3, t:'ask', x:67, y:70}
				{i:4, t:'sit', x:117, y:47}
			]
			opt2:[
				{i:1, t:'my teacher', x:36, y:36}
				{i:2, t:'in front of', x:16, y:93}
				{i:3, t:'to bed', x:67, y:132}
				{i:4, t:'a shower', x:164, y:25}
				{i:5, t:'to the doctor', x:116, y:69}
				{i:6, t:'roller skating', x:134, y:113}
			]
			opt3:[
				{i:1, t:'a question', x:22, y:21}
				{i:2, t:'a fan', x:43, y:57}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@steps = @shuffleNoRepeat @game.steps, 6
		@intento = 0
		stepsimg = (step.img for step in @steps)
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		for i in [0..@game.steps.length-1]
			if i < 3
				escena = @createSprite 'images', stepsimg, null, (215*i)+200, 235, 'tc'
			else
				escena = @createSprite 'images', stepsimg, null, (215*i)-445, 380, 'tc'
			escena.scaleX = escena.scaleY = 0.8
			escena.currentFrame = i
			@addToMain escena


		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@setDropper(1).setNube1().setNube2().setNube3().introEvaluation()
	setDropper: (step) ->
		@step = step

		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.x = 70
			dropper.y = 140
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		face = @createBitmap 'face', @steps[step].face, 0,0
		frase = @createText 'frase', @steps[step - 1].frase,'28px Quicksand','#333', 100,20
		@addToLibrary frase
		dropper.addChild frase, face


		for i in [0..@steps[step - 1].targets.length - 1] by 1
			h = new WordContainer "h#{i}", '', '#FFF', '#F00', (120*i  + 10)+130+frase.getMeasuredWidth(), 25, 110, 22
			h.index = i
			dropper.addChild h
			@addToLibrary h
		question = @createText 'q', '.','28px Quicksand','#333', @steps[step - 1].targets.length*120 + 140 + frase.getMeasuredWidth(), 20
		dropper.addChild question

		#dropper.x = stageSize.w / 2 - (question.x + question.getMeasuredWidth()) / 2
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 110
		container.y = 452
		container.name = 'nube1'
		
		back = @createBitmap 'backNube1', 'n1', 0, 0
		container.addChild back

		for opt in @game.opt1
			d = new DroppableText "n1d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 312
		container.y = 395
		container.name = 'nube2'
		
		back = @createBitmap 'backNube2', 'n2', 0, 0
		container.addChild back

		for opt in @game.opt2
			d = new DroppableText "n2d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	setNube3: ->
		container = new createjs.Container()
		container.x = 626
		container.y = 459
		container.name = 'nube3'
		
		back = @createBitmap 'backNube3', 'n3', 0, 0
		container.addChild back

		for opt in @game.opt3
			d = new DroppableText "n3d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		#TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 0.7}
		TweenLite.from @library.images, 1, {alpha: 0, y: @library.images.y + 20, delay: 0.7}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20, delay: 0.9}
		TweenLite.from @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20, delay: 1.1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library['images'].addEventListener 'click', @evaluateAnswer
		for opt in @game.opt1
			@library["n1d#{opt.i}"].updateDrops @library.h0
			@library["n1d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n1d#{opt.i}"].initDragListener()
		for opt in @game.opt2
			@library["n2d#{opt.i}"].updateDrops @library.h1
			@library["n2d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n2d#{opt.i}"].initDragListener()
		for opt in @game.opt3
			@library["n3d#{opt.i}"].updateDrops @library.h2
			@library["n3d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n3d#{opt.i}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			createjs.Sound.play 'good'
			@finishEvaluation() 
		else
			@warning()
			@intento++
			console.log @intento
			@answer.returnToPlace()
			if @intento is 2
				@intento = 0			
				@clearEvaluation() 
	finishEvaluation: =>
		if @steps[@step - 1].targets.length is 3
			if @library.h0.text.text is '' or @library.h1.text.text is '' or @library.h2.text.text is ''
				return
		else
			if @library.h0.text.text is '' or @library.h1.text.text is ''
				return
		@library['score'].plusOne()	
		@intento = 0			
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for opt in @game.opt1
			@library["n1d#{opt.i}"].visible = true
			@library["n1d#{opt.i}"].returnToPlace()
		for opt in @game.opt2
			@library["n2d#{opt.i}"].visible = true
			@library["n2d#{opt.i}"].returnToPlace()
		for opt in @game.opt3
			@library["n3d#{opt.i}"].visible = true
			@library["n3d#{opt.i}"].returnToPlace()		
		#TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20}
		TweenLite.to @library.images, 0.5, {scaleX: 1, scaleY: 1, alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			@library.images.currentFrame = @index
			@setDropper @index + 1
			#TweenLite.to @library.dropper, 0.5, {alpha: 1, y: @library.images.y + 10}
			TweenLite.to @library.images, 0.5, {scaleX: 0.3, scaleY: 0.3, alpha: 1, ease: Back.easeOut}
			for opt in @game.opt1
				@library["n1d#{opt.i}"].updateDrops @library.h0
			for opt in @game.opt2
				@library["n2d#{opt.i}"].updateDrops @library.h1
			for opt in @game.opt3
				@library["n3d#{opt.i}"].updateDrops @library.h2
		else
			@finish()
	finish: ->
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20}
		TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20}
		super
	window.U6A3 = U6A3