class U2A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'inst' , src: 'inst.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id:'letraM', src:'letra_M.png'}
			{id:'letraU', src:'letra_U.png'}
			{id:'letraS', src:'letra_S.png'}
			{id:'letraH', src:'letra_H.png'}
			{id:'letraR', src:'letra_R.png'}
			{id:'letraO', src:'letra_O.png'}
			{id:'mush', src:'mush.png'}
			{id:'priceblueberryJam', src:'price_blueberryJam.png'}
			{id:'pricebutter', src:'price_butter.png'}
			{id:'pricecarrots', src:'price_carrots.png'}
			{id:'pricechilis', src:'price_chilis.png'}
			{id:'pricecream', src:'price_cream.png'}
			{id:'priceeggs', src:'price_eggs.png'}
			{id:'pricemushrooms', src:'price_mushrooms.png'}
			{id:'pricepeachJam', src:'price_peachJam.png'}
			{id:'pricepeppers', src:'price_peppers.png'}
			{id:'propabuelita', src:'prop_abuelita.png'}
			{id:'propbg', src:'prop_bg.png'}
			{id:'clue', src:'text_clue.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U2_A3_Instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U2_A3_Instructions2.mp3', id:'instructions2'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
 
		@letras = ['letraM', 'letraU', 'letraS', 'letraH', 'letraR', 'letraO', 'letraO', 'letraM', 'letraS']
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
		@insertInstructions 'instructions', 'Listen and drag the clocks to the correct pictures.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setMarket().setFrase().setDrags().setQuestion().setFinal().introEvaluation()
	setMarket: ->
		tienda = new createjs.Container()
		tienda.x = 0
		tienda.y = 0
		back = @createBitmap 'propbg','propbg', 426, 308, 'mc'
		blueberry = @createBitmap 'priceblueberryJam', 'priceblueberryJam', 521, 404, 'mc'
		butter = @createBitmap 'pricebutter', 'pricebutter', 350, 218, 'mc'
		carrots = @createBitmap 'pricecarrots', 'pricecarrots', 584, 314, 'mc'
		chilis = @createBitmap 'pricechilis', 'pricechilis', 580, 176, 'mc'
		cream = @createBitmap 'pricecream', 'pricecream', 416, 253, 'mc'
		eggs = @createBitmap 'priceeggs', 'priceeggs', 322, 315, 'mc'
		mushrooms = @createBitmap 'pricemushrooms', 'pricemushrooms', 397, 320, 'mc'
		peach = @createBitmap 'pricepeachJam', 'pricepeachJam', 347, 406, 'mc'
		peppers = @createBitmap 'pricepeppers', 'pricepeppers', 477, 313, 'mc'
		abuelita = @createBitmap 'propabuelita', 'propabuelita', 554, 254, 'mc'
		tienda.addChild back, blueberry, butter, chilis, cream, eggs, mushrooms, peach, abuelita, carrots, peppers
		@addToMain tienda
		@
	setFrase: ->
		precio = new createjs.Text 'texto del precio', '20px Arial', '#333333'
		precio.x = stageSize.w / 2
		precio.y = 500
		precio.textAlign = 'center'
		@addToMain precio
		@	
	setDrags: ->
		letrablueberry = new Draggable 'letraM', (@preload.getResult 'letraM'), 0, 501, 407
		letrapeach = new Draggable 'letraU', (@preload.getResult 'letraU'), 1, 324, 408
		letracarrots = new Draggable 'letraS', (@preload.getResult 'letraS'), 2, 563, 323
		letraeggs = new Draggable 'letraH', (@preload.getResult 'letraH'), 3, 303, 317
		letrabutter = new Draggable 'letraR', (@preload.getResult 'letraR'), 4, 314, 213
		letramushrooms = new Draggable 'letraO', (@preload.getResult 'letraO'), 5, 374, 316
		letrapeppers = new Draggable 'letraO', (@preload.getResult 'letraO'), 6, 454, 316
		letrachilis = new Draggable 'letraM', (@preload.getResult 'letraM'), 7, 576, 163
		letracream  = new Draggable 'letraS', (@preload.getResult 'letraS'), 8, 389, 257
		letrablueberry.scaleX = letrapeach.scaleX = letracarrots.scaleX = letraeggs.scaleX = letrabutter.scaleX = letramushrooms.scaleX = letrapeppers.scaleX = letrachilis.scaleX = letracream.scaleX = 0.5
		letrablueberry.scaleY = letrapeach.scaleY = letracarrots.scaleY = letraeggs.scaleY = letrabutter.scaleY = letramushrooms.scaleY = letrapeppers.scaleY = letrachilis.scaleY = letracream.scaleY = 0.5
		@addToMain letrablueberry, letrapeach, letracarrots, letraeggs, letrabutter, letramushrooms, letrapeppers, letrachilis, letracream
		@
	setQuestion: ->
		q = new createjs.Text 'What vegetables are small and white?', '20px Arial', '#333333'
		q.x = stageSize.w / 2
		q.y = 480
		q.textAlign = 'center'
		@addToMain q

		palabra = new createjs.Container()
		palabra.x = 115
		palabra.y = 500

		cuadrito = new createjs.Graphics().beginFill( '' ).drawRect( 0, 0, 47, 40 ).beginStroke( '#f00' ).moveTo( 0, 40 ).lineTo( 47, 40 );
		for i in [1..9]
			c = new createjs.Shape cuadrito
			c.x = i * 55
			palabra.addChild c
		@addToMain palabra
		@insertBitmap 'clue', 'clue', stageSize.w / 2, 560, 'tc'
		@
	setFinal: ->
		final = new createjs.Container()
		final.x = 140
		final.y = 300
		for i in [0..8]
			if ( i % 2 == 0 )
				le = @createBitmap @letras[i], @letras[i], i*70, 0, 'mc'
			else le = @createBitmap @letras[i], @letras[i], i*70, 30, 'mc'
			final.addChild le
		@insertBitmap 'mush', 'mush', 0, 0
		@addToMain final
		@		
	introEvaluation: ->
		super
 
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
	initEvaluation: (e) =>
		super

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
		super
	window.U2A3 = U2A3