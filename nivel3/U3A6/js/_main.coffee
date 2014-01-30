class U1A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}


			{id: 'cooking', src: 'image_cooking.png'}
			{id: 'dancing', src: 'image_dancing.png'}
			{id: 'making', src: 'image_making.png'}
			{id: 'painting', src: 'image_painting.png'}
			{id: 'playing', src: 'image_playing.png'}
			{id: 'singing', src: 'image_singing.png'}
			{id: 'numbercooking', src: 'number_cooking.png'}
			{id: 'numberdancing', src: 'number_dancing.png'}
			{id: 'numbermaking', src: 'number_making.png'}
			{id: 'numberpainting', src: 'number_painting.png'}
			{id: 'numberplaying', src: 'number_playing.png'}
			{id: 'numbersinging', src: 'number_singing.png'}
			{id: 'crosswords', src: 'prop_crossword.png'}

			{id: 'aLetra', src: 'a.png'}
			{id: 'bLetra', src: 'b.png'}
			{id: 'cLetra', src: 'c.png'}
			{id: 'dLetra', src: 'd.png'}
			{id: 'eLetra', src: 'e.png'}
			{id: 'fLetra', src: 'f.png'}
			{id: 'gLetra', src: 'g.png'}
			{id: 'hLetra', src: 'h.png'}
			{id: 'iLetra', src: 'i.png'}
			{id: 'jLetra', src: 'j.png'}
			{id: 'kLetra', src: 'k.png'}
			{id: 'lLetra', src: 'l.png'}
			{id: 'mLetra', src: 'm.png'}
			{id: 'nLetra', src: 'n.png'}
			{id: 'oLetra', src: 'o.png'}
			{id: 'pLetra', src: 'p.png'}
			{id: 'qLetra', src: 'q.png'}
			{id: 'rLetra', src: 'r.png'}
			{id: 'sLetra', src: 's.png'}
			{id: 'tLetra', src: 't.png'}
			{id: 'uLetra', src: 'u.png'}
			{id: 'vLetra', src: 'v.png'}
			{id: 'wLetra', src: 'w.png'}
			{id: 'xLetra', src: 'x.png'}
			{id: 'yLetra', src: 'y.png'}
			{id: 'zLetra', src: 'z.png'}
		]
		sounds = [
			{src:'sounds/TU2_U1_A6_instructions.mp3', id:'instructions'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/wrong.mp3', id:'wrong'}	
		]
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		@numbers = [
			{id:'1', x:8, y:-1}
			{id:'2', x:6, y:2}
			{id:'3', x:6, y:3}
			{id:'4', x:10, y:3}
			{id:'5', x:4, y:5}
			{id:'6', x:-1, y:9}

		]
		@containers = [
			{id:'p', x:8, y:0}
			{id:'l', x:8, y:1}
			{id:'a', x:8, y:2}
			{id:'y', x:8, y:3}
			{id:'i', x:8, y:4}
			{id:'n', x:8, y:5}
			{id:'g', x:8, y:6}
			{id:'t', x:8, y:8}
			{id:'h', x:8, y:9}
			{id:'e', x:8, y:10}
			{id:'f', x:8, y:12}
			{id:'l', x:8, y:13}
			{id:'u', x:8, y:14}
			{id:'t', x:8, y:15}
			{id:'e', x:8, y:16}

			{id:'d', x:7, y:2}
			{id:'n', x:9, y:2}
			{id:'c', x:10, y:2}
			{id:'i', x:11, y:2}
			{id:'n', x:12, y:2}
			{id:'g', x:13, y:2}

			{id:'m', x:6, y:4}
			{id:'a', x:6, y:5}
			{id:'k', x:6, y:6}
			{id:'i', x:6, y:7}
			{id:'n', x:6, y:8}
			{id:'g', x:6, y:9}
			{id:'c', x:6, y:11}
			{id:'r', x:6, y:12}
			{id:'a', x:6, y:13}
			{id:'f', x:6, y:14}
			{id:'t', x:6, y:15}
			{id:'s', x:6, y:16}

			{id:'s', x:10, y:4}
			{id:'i', x:10, y:5}
			{id:'n', x:10, y:6}
			{id:'g', x:10, y:7}
			{id:'i', x:10, y:8}
			{id:'n', x:10, y:9}
			{id:'g', x:10, y:10}

			{id:'p', x:5, y:5}
			{id:'i', x:7, y:5}
			{id:'n', x:8, y:5}
			{id:'t', x:9, y:5}
			{id:'n', x:11, y:5}
			{id:'g', x:12, y:5}

			{id:'c', x:0, y:9}
			{id:'o', x:1, y:9}
			{id:'o', x:2, y:9}
			{id:'k', x:3, y:9}
			{id:'i', x:4, y:9}
			{id:'n', x:5, y:9}

		]
		@game = 
			answers:
				cooking: r: off, c: [46,47,48,49,50,51,26]
				dancing: r: off, c: [15,2,16,17,18,19,20]
				making: r: off, c: [21,22,23,24,25,26,27,28,29,30,31,32]
				painting: r: off, c: [40,22,41,42,43,34,44,45]
				playing: r: off, c: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
				singing: r: off, c: [33,34,35,36,37,38,39]


		super null, manifest, sounds
	setStage: ->
		super
		@answers = @clone @game.answers
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look and drag the letters to complete the crossword puzzle.', 30, 100

		@insertBitmap 'cooking' , 'cooking', 564,422, 'mc'
		@insertBitmap 'dancing' , 'dancing', 109, 258, 'mc'
		@insertBitmap 'making'  , 'making' , 193, 403, 'mc'
		@insertBitmap 'painting', 'painting', 688, 297, 'mc'
		@insertBitmap 'playing' , 'playing', 263, 200, 'mc'
		@insertBitmap 'singing' , 'singing', 708, 159, 'mc'

		@insertBitmap 'numbercooking' , 'numbercooking', 547, 354
		@insertBitmap 'numberdancing' , 'numberdancing', 63, 185
		@insertBitmap 'numbermaking'  , 'numbermaking' , 136, 370
		@insertBitmap 'numberpainting', 'numberpainting', 587, 244
		@insertBitmap 'numberplaying' , 'numberplaying', 237, 137
		@insertBitmap 'numbersinging' , 'numbersinging', 692, 94

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@createDroppers()
		@createAlphabet()
		@introEvaluation()
	createAlphabet: ->
		alphabet = new createjs.Container()
		alphabet.x = 135
		alphabet.y = 510
		alphabet.name = 'alphabet'
		for i in [0..@abc.length - 1] by 1
			letter = @abc[i]
			if i <= 13
				letterObj = new Draggable letter, (@preload.getResult letter+'Letra'), letter, 41.5*i, 0
			else
				letterObj = new Draggable letter, (@preload.getResult letter+'Letra'), letter, 41.5*i-540, 34
			letterObj.onInitEvaluation()
			alphabet.addChild letterObj	
			@addToLibrary letterObj
		@addToMain alphabet
	createDroppers: ->
		crosswords = new createjs.Container()
		crosswords.x = 285
		crosswords.y = 56
		crosswords.name = 'crosswords'
		for i in [0..@containers.length - 1] by 1
			drop = new WordContainer "h#{i}", '', '#FFF', '#999', @containers[i].x*20, @containers[i].y*20, 20, 20
			drop.setRectShape '#FFF', '#999', 2, 20, 20
			drop.text.y -= 3
			drop.id = @containers[i].id
			@addToLibrary drop
			crosswords.addChild drop
		for i in [0..5]
			t = new createjs.Text @numbers[i].id,'14px Quicksand','#333'
			t.x = @numbers[i].x*20 + 6
			t.y = @numbers[i].y*20 + 4
			crosswords.addChild t
		#crosswords.cache -23, -23, 276, 230
		@addToMain crosswords
	introEvaluation: ->
		super
		@library['crosswords'].y = 146
		@library['crosswords'].alpha = 1
		@library['alphabet'].y = 510
		@library['alphabet'].alpha = 1

		@library['cooking'].alpha = 1
		@library['numbercooking'].alpha = 1
		@library['dancing'].alpha = 1
		@library['numberdancing'].alpha = 1
		@library['singing'].alpha = 1
		@library['numbersinging'].alpha = 1
		@library['making'].alpha = 1
		@library['numbermaking'].alpha = 1
		@library['painting'].alpha = 1
		@library['numberpainting'].alpha = 1
		@library['playing'].alpha = 1
		@library['numberplaying'].alpha = 1
	
		for i in [0..@containers.length - 1] by 1
			if(@containers[i].a)
				@library['h'+i].changeText @containers[i].id
			else
				@library['h'+i].changeText ''
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenMax.allFrom [@library['cooking'], @library['dancing'], @library['making'], @library['painting'], @library['playing'], @library['singing']], 1, {alpha:0, delay:1.5}, 0.2
		TweenMax.allFrom [@library['numbercooking'], @library['numberdancing'], @library['numbermaking'], @library['numberpainting'], @library['numberplaying'], @library['numbersinging']], 1, {alpha:0, delay:1.5}, 0.2
		TweenLite.from @library['alphabet'], 1, {alpha: 0, y: @library['alphabet'].y + 50, delay: 1.5}
		TweenLite.from @library['crosswords'], 1, {alpha: 0, y: @library['crosswords'].y + 50, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		#@library.crosswords.cache -23, -23, 276, 230
		for letter in @abc
			@library[letter].addEventListener 'drop', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = false
		hitdrop = null
		for i in [0..@containers.length - 1] by 1
			hit = @library["h#{i}"]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
				dropped = true
				if hit.id is @answer.index
					hitdrop = hit
			else
				@answer.returnToPlace()
		if dropped is true
			if hitdrop isnt null
				hitdrop.changeText hitdrop.id
				@answer.x = @answer.pos.x
				@answer.y = @answer.pos.y
				@evaluate 'cooking'
				@evaluate 'dancing'
				@evaluate 'making'
				@evaluate 'painting'
				@evaluate 'playing'
				@evaluate 'singing'

				#@library.crosswords.cache -23, -23, 276, 230
			else
				@warning()
	evaluate: (instrument) ->
		ready = true
		if not @answers[instrument].r
			for box in @answers[instrument].c
				if @library['h'+box].text.text is ''
					ready = false
			if ready
				@finishEvaluation()
				@answers[instrument].r = on
				@library['score'].plusOne()
	finishEvaluation: (e) =>
		TweenMax.allTo [@library[e.target.instrument],@library['number'+e.target.instrument]], 1, {alpha:0, ease:Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		complete = on
		for instrument of @answers
			if @answers[instrument].r is off
				complete = off
		TweenLite.to @library['alphabet'], 0.5, {alpha:0, y: @library['alphabet'].y - 100, ease:Quart.easeOut} if complete
		TweenLite.to @library['crosswords'], 0.5, {alpha:0, y: @library['crosswords'].y - 100, ease:Quart.easeOut, onComplete: @finish} if complete
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: =>
		super
	window.U1A6 = U1A6