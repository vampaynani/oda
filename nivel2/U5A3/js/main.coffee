class U5A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'imageApril', src:'image_april.png'}
			{id: 'imageAugust', src:'image_august.png'}
			{id: 'imageChristmas', src:'image_christmas.png'}
			{id: 'imageDecember', src:'image_december.png'}
			{id: 'imageEaster', src:'image_easter.png'}
			{id: 'imageFall', src:'image_fall.png'}
			{id: 'imageFebruary', src:'image_february.png'}
			{id: 'imageJanuary', src:'image_january.png'}
			{id: 'imageJuly', src:'image_july.png'}
			{id: 'imageJune', src:'image_june.png'}
			{id: 'imageMarch', src:'image_march.png'}
			{id: 'imageMay', src:'image_may.png'}
			{id: 'imageNovember', src:'image_november.png'}
			{id: 'imageOctober', src:'image_october.png'}
			{id: 'imageSeptember', src:'image_september.png'}
			{id: 'imageSpring', src:'image_spring.png'}
			{id: 'imageSummer', src:'image_summer.png'}
			{id: 'imageThanksgiving', src:'image_thanksgiving.png'}
			{id: 'imageValentine', src:'image_valentine.png'}
			{id: 'imageWinter', src:'image_winter.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [	
		]
		@imagenes = [
			{id: 'imageApril', x:'592', y:'175'}
			{id: 'imageAugust', x:'495', y:'522'}
			{id: 'imageChristmas', x:'715', y:'520'}
			{id: 'imageDecember', x:'99', y:'298'}
			{id: 'imageEaster', x:'603', y:'431'}
			{id: 'imageFall', x:'91', y:'202'}
			{id: 'imageFebruary', x:'328', y:'184'}
			{id: 'imageJanuary', x:'190', y:'172'}
			{id: 'imageJuly', x:'617', y:'529'}
			{id: 'imageJune', x:'724', y:'402'}
			{id: 'imageMarch', x:'459', y:'171'}
			{id: 'imageMay', x:'719', y:'290'}
			{id: 'imageNovember', x:'107', y:'405'}
			{id: 'imageOctober', x:'236', y:'515'}
			{id: 'imageSeptember', x:'359', y:'529'}
			{id: 'imageSpring', x:'637', y:'284'}
			{id: 'imageSummer', x:'137', y:'493'}
			{id: 'imageThanksgiving', x:'276', y:'437'}
			{id: 'imageValentine', x:'205', y:'251'}
			{id: 'imageWinter', x:'304', y:'184'}
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setQuestion().introEvaluation()
	setQuestion:  ->
		seasons = new createjs.Container()

		for i in [0..19]
			img = @createBitmap @imagenes[i].id, @imagenes[i].id, @imagenes[i].x, @imagenes[i].y, 'mc'
			img.scaleX = img.scaleY = 0.5
			seasons.addChild img

		largo = 7
		letras = new createjs.Container()
		palabra = new createjs.Container()

		for i in [1..largo]
			letra = new createjs.Text 'a','24px Arial','#333'
			letra.x = (i*30)
			letra.y = 0
			letras.addChild letra

			guion = new WordContainer 'l'+1, '', '', '#f39234', (i*40), 50, 32, 22
			palabra.addChild guion
			@addToLibrary guion

		letras.y = palabra.y = 300
		palabra.x = stageSize.w / 2 - (largo * 40)/2
		letras.x = stageSize.w / 2 - (largo * 30)/2
		seasons.x = 0
		seasons.y = 0
		@addToMain seasons
		@addToMain palabra
		@addToMain letras
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
	window.U5A3 = U5A3