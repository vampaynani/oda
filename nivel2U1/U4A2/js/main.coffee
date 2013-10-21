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
		    {src:'sounds/TU2_U4_A2_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@linea1 = [
			'g', 'i', 'a', 'n', 't', 'p', 'a', 'n', 'd', 'a'
		]
		@linea2 = [
			'p', 's', 'e', 'a', 't', 'u', 'r', 't', 'l', 'e'
		]
		@linea3 = [
			'o', 'u', 's', 'q', 'f', 'a', 't', 'y', 'i', 'j'
		]
		@linea4 = [
			'l', 'g', 'e', 'x', 'k', 'e', 'j', 'd', 'o', 'a'
		]
		@linea5 = [
			'a', 'e', 'd', 'o', 'l', 'p', 'h', 'i', 'n', 'g'
		]
		@linea6 = [
			'r', 'a', 'n', 'h', 'y', 'j', 'i', 'n', 'b', 'u'
		]
		@linea7 = [
			'b', 'g', 'o', 'r', 'i', 'l', 'l', 'a', 't', 'a'
		]
		@linea8 = [
			'e', 'l', 'k', 'd', 'o', 'z', 'p', 'l', 'n', 'r'
		]
		@linea9 = [
			'a', 'e', 'o', 'f', 'e', 'a', 'd', 'o', 'f', 'l'
		]
		@linea10 = [
			'r', 'b', 'l', 'u', 'e', 'w', 'h', 'a', 'l', 'e'
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
		sopa = new createjs.Container()
		sopa.x = 297
		sopa.y = 148
		for h in [0..9]
			for i in [0..9]
				letra = new createjs.Text @['linea'+(h+1)][i],'20px Arial','#333'
				letra.x = i*26
				letra.y = h*26
				sopa.addChild letra
		@addToMain sopa
		@
	introEvaluation: ->
		super
		###
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
		###
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