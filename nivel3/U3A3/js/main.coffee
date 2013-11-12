class U4A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'bubble1', src:'1.png'}
 			{id: 'bubble2', src:'2.png'}
 			{id: 'bubble3', src:'3.png'}
 			{id: 'bubble4', src:'4.png'}
 			{id: 'bubble5', src:'5.png'}
 			{id: 'bubble6', src:'6.png'}
 			{id: 'bubble7', src:'7.png'}
 			{id: 'bubble8', src:'8.png'}
 			{id: 'bubble9', src:'9.png'}
 			{id: 'bubble10', src:'10.png'}
 			{id: 'bubble11', src:'11.png'}
 			{id: 'bubble12', src:'12.png'}
 			{id: 'pag1club1', src:'club1.png'}
 			{id: 'pag1club2', src:'club2.png'}
 			{id: 'pag1club3', src:'club3.png'}
 			{id: 'pag1club4', src:'club4.png'}
 			{id: 'pag1club5', src:'club5.png'}
 			{id: 'pag1club6', src:'club6.png'}
 			{id: 'pag2club1', src:'club7.png'}
 			{id: 'pag2club2', src:'club8.png'}
 			{id: 'pag2club3', src:'club9.png'}
 			{id: 'pag2club4', src:'club10.png'}
 			{id: 'pag2club5', src:'club11.png'}
 			{id: 'pag2club6', src:'club12.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]


		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setClubs().introEvaluation()
	setClubs:  ->
		club = new createjs.Container()
		club.x = 240
		club.y = 140	

		q = @createBitmap 'bubble12', 'bubble12',  (stageSize.w / 2) - club.x, 340, 'tc'
		club.addChild q

		for i in [1..6]
 			k = @createBitmap 'pag1club'+i, 'pag1club'+i, (i-1)*160, 0, 'tc'
 			club.addChild k
 			if i >= 4
 				k.x = k.x - 480
 				k.y = 170

		@addToMain club
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
	window.U4A6 = U4A6