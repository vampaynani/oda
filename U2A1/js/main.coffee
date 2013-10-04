class U2A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'n1', src: 'nube1.png'}
			{id: 'n2', src: 'nube2.png'}
			{id: 'n3', src: 'nube3.png'}
			{id: 'n4', src: 'nube4.png'}
			{id: 'casa', src: 'casita.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U2_A1_instructions.mp3', id:'instructions'}
		]
		@answers = [
			{id:2, text:'a cake on the dining room table'}
			{id:0, text:'a cake in the kitchen table' }
			{id:0, text:'a dresser in the bedroom'}
		    {id:3, text:'two bedrooms' }
		    {id:2, text:'a clock in the bedroom'}
		    {id:1, text:'six windows' }
		    {id:1, text:'some books' }
		    {id:1, text:'three people in the house' }
		    {id:0, text:'a fridge' }
		    {id:3, text:'two dresses in the closet' }
		    {id:0, text:'a lamp in the hallway' }
		    {id:2, text:'a cell phone on the dresser' }
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'casa', 'casa', 84, 137
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setDropper().setClouds().introEvaluation()
	setDropper: ->
		@addToMain new WordCompleter 'dropper', '', '', '#FFF', '#E90E2C', 150, 525, 175, 30
		@
	setClouds: ->
		nube1 = new createjs.Container()
		nube1.x = 661
		nube1.y = 130
		nube1.name = 'nube1'
		nube2 = new createjs.Container()
		nube2.x = 654
		nube2.y = 223
		nube2.name = 'nube2'
		nube3 = new createjs.Container()
		nube3.x = 650
		nube3.y = 327
		nube3.name = 'nube3'
		nube4 = new createjs.Container()
		nube4.x = 645
		nube4.y = 425
		nube4.name = 'nube4'
		
		n1 = @createBitmap 'n1', 'n1', 0, 0
		n2 = @createBitmap 'n2', 'n2', 0, 0
		n3 = @createBitmap 'n3', 'n3', 0, 0
		n4 = @createBitmap 'n4', 'n4', 0, 0

		tn1 = new DraggableText 'tn0', "There is", 0, 14, 21 
		tn2 = new DraggableText 'tn1', "There are", 1, 15, 25 
		tn3 = new DraggableText 'tn2', "There isn't", 2, 18, 20 
		tn4 = new DraggableText 'tn3', "There aren't", 3, 20, 25 

		nube1.addChild n1, tn1
		nube2.addChild n2, tn2
		nube3.addChild n3, tn3
		nube4.addChild n4, tn4

		@addToLibrary tn1, tn2, tn3, tn4
		@addToMain nube1, nube2, nube3, nube4
		@
	introEvaluation: ->
		super
		for i in [0..3] by 1
			@observer.subscribe 'init_evaluation', @library['tn'+i].onInitEvaluation
		@library['dropper'].changeText ''
		@library['dropper'].changeLabel @answers[@index].text

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['casa'], 1, {alpha: 0, y: @library['casa'].y + 50, delay: 1}
		TweenLite.from @library['dropper'], 1, {alpha: 0, x: @library['dropper'].x + 50, ease: Quart.easeOut, delay: 3}
		TweenMax.allFrom [@library['nube1'], @library['nube2'], @library['nube3'], @library['nube4']], 1, {alpha: 0, y: stageSize.h, delay: 2, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [0..3] by 1
			@library['tn'+i].addEventListener 'drop', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropper'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropper'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.x = @answer.pos.x
				@answer.y = @answer.pos.y
				@library['dropper'].changeText @answer.text.text
				setTimeout @finishEvaluation, 1 * 1000
			else
				@answer.returnToPlace()	
				@warning()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		createjs.Sound.play 'good'
		TweenLite.to @library['dropper'], 0.5, {alpha: 0, y: stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['dropper'].y = 525
			@library['dropper'].x = 150 + 50
			@library['dropper'].changeText ''
			@library['dropper'].changeLabel @answers[@index].text
			TweenLite.to @library['dropper'], 0.5, {alpha: 1, x: 150, ease: Quart.easeOut}
		else
			@finish()
	finish: ->
		super
	window.U2A1 = U2A1