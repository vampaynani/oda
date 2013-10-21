class U4A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'bluewhale', src:'bluewhale_img.png'}
			{id: 'dolphin', src:'dolphin_img.png'}
			{id: 'eagle', src:'eagle_img.png'}
			{id: 'giantpanda', src:'giantpanda_img.png'}
			{id: 'polarbear', src:'polarbear_img.png'}
			{id: 'gorilla', src:'gorilla_img.png'}
			{id: 'jaguar', src:'jaguar_img.png'}
			{id: 'lion', src:'lion_img.png'}
			{id: 'seaturttle', src:'seaturttle_img.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U4_A2_instructions.mp3', id:'instructions'}
		]
		@letters = [
			['g', 'i', 'a', 'n', 't', 'p', 'a', 'n', 'd', 'a']
			['p', 's', 'e', 'a', 't', 'u', 'r', 't', 'l', 'e']
			['o', 'u', 's', 'q', 'f', 'a', 't', 'y', 'i', 'j']
			['l', 'g', 'e', 'x', 'k', 'e', 'j', 'd', 'o', 'a']
			['a', 'e', 'd', 'o', 'l', 'p', 'h', 'i', 'n', 'g']
			['r', 'a', 'n', 'h', 'y', 'j', 'i', 'n', 'b', 'u']
			['b', 'g', 'o', 'r', 'i', 'l', 'l', 'a', 't', 'a']
			['e', 'l', 'k', 'd', 'o', 'z', 'p', 'l', 'n', 'r']
			['a', 'e', 'o', 'f', 'e', 'a', 'd', 'o', 'f', 'l']
			['r', 'b', 'l', 'u', 'e', 'w', 'h', 'a', 'l', 'e']
		]
		@answers = [
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setAnimals().setSopa().introEvaluation()
	setAnimals:  ->
		@insertBitmap 'bluewhale', 'bluewhale', 509, 465
		@insertBitmap 'dolphin', 'dolphin', 227, 460
		@insertBitmap 'eagle', 'eagle', 43, 131
		@insertBitmap 'giantpanda', 'giantpanda', 661, 249
		@insertBitmap 'gorilla', 'gorilla', 122, 361
		@insertBitmap 'jaguar', 'jaguar', 142, 132
		@insertBitmap 'lion', 'lion', 586, 130
		@insertBitmap 'seaturttle', 'seaturttle', 590, 372
		@insertBitmap 'polarbear', 'polarbear', 368, 424
		@
	setSopa: ->
		@shapeCanvas = new createjs.Shape()
		sopa = new createjs.Container()
		sopa.x = 297
		sopa.y = 148
		sopa.name = 'sopa'
		for h in [0..@letters.length - 1] by 1
			for i in [0..@letters[h].length - 1] by 1
				letra = new ClickableText @letters[h][i], @letters[h][i], 'l#{h+i}', i * 26, h * 26
				letra.text.font = '20px Arial'
				letra.text.textAlign = 'center'
				sopa.addChild letra
		sopa.addChild @shapeCanvas
		@addToMain sopa
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['sopa'], 1, {alpha :0, y: @library['sopa'].y - 20, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.allFrom [@library['bluewhale'], 
						@library['dolphin'], 
						@library['eagle'], 
						@library['giantpanda'], 
						@library['gorilla'],
						@library['jaguar'],
						@library['lion'],
						@library['seaturttle'],
						@library['polarbear']
						], 1, {alpha: 0, delay: 1.5}, 0.1
	initEvaluation: (e) =>
		super
		@shapeCanvas.graphics.s("rgba(255, 0, 0, 1)").f("rgba(255, 0, 0, 0.5)").rr(20,20,100,50,10)
		@mainContainer.addEventListener 'mousedown', @initDraw
	initDraw: (e) =>
		console.log e
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
		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
		@answer.returnToPlace()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['score'].updateCount( @index )
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
	window.U4A2 = U4A2