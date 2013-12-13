class U5A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}

			{id:'1', src:'1.png'}
			{id:'2', src:'2.png'}
			{id:'3', src:'3.png'}
			{id:'4', src:'4.png'}
			{id:'5', src:'5.png'}
			{id:'6', src:'6.png'}
			{id:'7', src:'7.png'}
			{id:'8', src:'8.png'}
			{id:'9', src:'9.png'}
			{id:'planetearth', src:'planet_earth.png'}

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
			{id:'1', x:0, y:3}
			{id:'2', x:1, y:3}
			{id:'3', x:2, y:2}
			{id:'4', x:3, y:0}
			{id:'5', x:5, y:1}
			{id:'6', x:7, y:0}
			{id:'7', x:9, y:0}
			{id:'8',  x:11, y:3}
			{id:'9',  x:12, y:-1}
			{id:'10', x:13, y:3}
		]
		@containers = [
			{id:'u', x:0, y:4, a:true}
			{id:'s', x:0, y:5}
			{id:'e', x:0, y:6}
			{id:'d', x:0, y:7}

			{id:'s', x:1, y:4}
			{id:'a', x:1, y:5}
			{id:'v', x:1, y:6, a:true}
			{id:'e', x:1, y:7}
			{id:'d', x:1, y:8}

			{id:'l', x:2, y:3}
			{id:'i', x:2, y:4, a:true}
			{id:'v', x:2, y:5}
			{id:'e', x:2, y:6}
			{id:'d', x:2, y:7}

			{id:'k', x:3, y:1}
			{id:'i', x:3, y:2}
			{id:'l', x:3, y:3}
			{id:'l', x:3, y:4}
			{id:'e', x:3, y:5}
			{id:'d', x:3, y:6}

			{id:'w', x:5, y:2}
			{id:'a', x:5, y:3, a:true}
			{id:'s', x:5, y:4}
			{id:'t', x:5, y:5}
			{id:'e', x:5, y:6}
			{id:'d', x:5, y:7}

			{id:'h', x:6, y:5, a:true}

			{id:'d', x:7, y:1}
			{id:'u', x:7, y:2}
			{id:'m', x:7, y:3, a:true}
			{id:'p', x:7, y:4}
			{id:'e', x:7, y:5}
			{id:'d', x:7, y:6}

			{id:'f', x:9, y:1}
			{id:'i', x:9, y:2}
			{id:'l', x:9, y:3}
			{id:'l', x:9, y:4}
			{id:'e', x:9, y:5}
			{id:'d', x:9, y:6, a:true}
			{id:'u', x:9, y:8}
			{id:'p', x:9, y:9}
			
			{id:'a', x:10, y:5}

			{id:'p', x:11, y:4}
			{id:'r', x:11, y:5}
			{id:'o', x:11, y:6}
			{id:'d', x:11, y:7}
			{id:'u', x:11, y:8}
			{id:'c', x:11, y:9,a:true}
			{id:'e', x:11, y:10}
			{id:'d', x:11, y:11}
			
			{id:'p', x:12, y:0}
			{id:'o', x:12, y:1}
			{id:'l', x:12, y:2,a:true}
			{id:'l', x:12, y:3}
			{id:'u', x:12, y:4}
			{id:'t', x:12, y:5}
			{id:'e', x:12, y:6}
			{id:'d', x:12, y:7}

			{id:'c', x:13, y:4}
			{id:'h', x:13, y:5}
			{id:'a', x:13, y:6}
			{id:'n', x:13, y:7}
			{id:'g', x:13, y:8}
			{id:'e', x:13, y:9, a:true}
			{id:'d', x:13, y:10}
		]
		@game = 
			answers:
				palabra1: r:off, c: [0,1,2,3]
				palabra2: r:off, c: [4,5,6,7,8]
				palabra3: r:off, c: [9,10,11,12,13]
				palabra4: r:off, c: [14,15,16,17,18,19]
				palabra5: r:off, c: [20,21,22,23,24,25]
				palabra6: r:off, c: [27,28,29,30,31,32]
				palabra7: r:off, c: [33,34,35,36,37,38,39,40]
				palabra8: r:off, c: [42,43,44,45,46,47,48,49]
				palabra9: r:off, c: [50,51,52,53,54,55,56,57]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @clone @game.answers
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read the dialogues and solve the puzzle with past tense verbes.', 30, 100
		@insertBitmap '1', '1', 214, 189, 'mc'
		@insertBitmap '2', '2', 134, 320, 'mc'
		@insertBitmap '3', '3', 133, 456, 'mc'
		@insertBitmap '4', '4', 300, 504, 'mc'
		@insertBitmap '5', '5', 666, 508, 'mc'
		@insertBitmap '6', '6', 683, 407, 'mc'
		@insertBitmap '7', '7', 670, 273, 'mc'
		@insertBitmap '8', '8', 628, 159, 'mc'
		@insertBitmap '9', '9', 405, 167, 'mc'

		###
		@insertBitmap '1', '1', 307, 189, 'mc'
		@insertBitmap '2', '2', 134, 249, 'mc'
		@insertBitmap '3', '3', 143, 388, 'mc'
		@insertBitmap '4', '4', 285, 497, 'mc'
		@insertBitmap '5', '5', 656, 544, 'mc'
		@insertBitmap '6', '6', 683, 448, 'mc'
		@insertBitmap '7', '7', 665, 320, 'mc'
		@insertBitmap '8', '8', 649, 209, 'mc'
		@insertBitmap '9', '9', 496, 167, 'mc'
		###

		for i in [1..9]
			@library[i].scaleY = @library[i].scaleX = 0.5
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@createDroppers()
		@createAlphabet()
		@introEvaluation()
	createAlphabet: ->
		alphabet = new createjs.Container()
		alphabet.x = 135
		alphabet.y = 540
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
		crosswords.x = 245
		crosswords.y = 216
		crosswords.name = 'crosswords'
		for i in [0..@containers.length - 1] by 1
			drop = new WordContainer "h#{i}", '', '#FFF', '#999', @containers[i].x*23, @containers[i].y*23, 23, 23
			drop.setRectShape '#FFF', '#999', 2, 23, 23
			drop.text.y -= 3
			drop.id = @containers[i].id
			@addToLibrary drop
			crosswords.addChild drop
		for i in [0..9]
			t = new createjs.Text @numbers[i].id,'14px Quicksand','#333'
			t.x = @numbers[i].x*23 + 6
			t.y = @numbers[i].y*23 + 4
			crosswords.addChild t
		#crosswords.cache -23, -23, 276, 230
		@addToMain crosswords
	introEvaluation: ->
		super
		@library['crosswords'].y = 216
		@library['crosswords'].alpha = 1
		@library['alphabet'].y = 540
		@library['alphabet'].alpha = 1
		@library['1'].alpha = 1
		@library['2'].alpha = 1
		@library['3'].alpha = 1
		@library['4'].alpha = 1
		@library['5'].alpha = 1
		@library['6'].alpha = 1
		@library['7'].alpha = 1
		@library['8'].alpha = 1
		@library['9'].alpha = 1
		for i in [0..@containers.length - 1] by 1
			if(@containers[i].a)
				@library['h'+i].changeText @containers[i].id
			else
				@library['h'+i].changeText ''
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenMax.allFrom [@library['1'], @library['2'], @library['3'], @library['4'], @library['5'], @library['6'], @library['7'], @library['8'], @library['9']], 1, {alpha:0, delay:1.5}, 0.2
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
				@evaluate 'palabra1'
				@evaluate 'palabra2'
				@evaluate 'palabra3'
				@evaluate 'palabra4'
				@evaluate 'palabra5'
				@evaluate 'palabra6'
				@evaluate 'palabra7'
				@evaluate 'palabra8'
				@evaluate 'palabra9'

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
		TweenMax.allTo @library[e.target.instrument], 1, {alpha:0, ease:Quart.easeOut, onComplete: @nextEvaluation}
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
	window.U5A6 = U5A6