class U1A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'crossWords',  src: 'cross_words.png'}
			{id: 'bass', src: 'bass.png'}
			{id: 'drum', src: 'drum.png'}
			{id: 'guitar', src: 'guitar.png'}
			{id: 'flute', src: 'flute.png'}
			{id: 'piano', src: 'piano.png'}
			{id: 'sax', src: 'sax.png'}
			{id: 'tambourine', src: 'tambourine.png'}
			{id: 'trumpet', src: 'trumpet.png'}
			{id: 'drum_number', src: 'drum_number.png'}
			{id: 'guitar_number', src: 'guitar_number.png'}
			{id: 'flute_number', src: 'flute_number.png'}
			{id: 'piano_number', src: 'piano_number.png'}
			{id: 'sax_number', src: 'sax_number.png'}
			{id: 'tambourine_number', src: 'tambourine_number.png'}
			{id: 'trumpet_number', src: 'trumpet_number.png'}
			{id: 'bass_number', src: 'bass_number.png'}
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
		    {src:'sounds/TU2_U1_A6_bass.mp3', id:'sbass'}
		    {src:'sounds/TU2_U1_A6_drum.mp3', id:'sdrum'}
		    {src:'sounds/TU2_U1_A6_flute.mp3', id:'sflute'}
		    {src:'sounds/TU2_U1_A6_guitar.mp3', id:'sguitar'}
		    {src:'sounds/TU2_U1_A6_piano.mp3', id:'spiano'}
		    {src:'sounds/TU2_U1_A6_saxophone.mp3', id:'ssaxophone'}
		    {src:'sounds/TU2_U1_A6_tambourine.mp3', id:'stambourine'}
		    {src:'sounds/TU2_U1_A6_trumpet.mp3', id:'strumpet'}
		    {src:'sounds/TU2_U1_A6_violin.mp3', id:'sviolin'}
		    {src:'sounds/wrong.mp3', id:'wrong'}	
		]
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		@numbers = [
			{id:'1', x:5, y:-1}
			{id:'2', x:7, y:-1}
			{id:'3', x:-1, y:2}
			{id:'4', x:0, y:1}
			{id:'5', x:10, y:3}
			{id:'6', x:2, y:4}
			{id:'7', x:-1, y:6}
			{id:'8', x:1, y:8}
		]
		@containers = [
			{id:'d', x:5, y:0, a:true}
			{id:'r', x:5, y:1}
			{id:'u', x:5, y:2}
			{id:'m', x:5, y:3}
			{id:'g', x:7, y:0, a:true}
			{id:'u', x:7, y:1}
			{id:'i', x:7, y:2}
			{id:'t', x:7, y:3}
			{id:'a', x:7, y:4}
			{id:'r', x:7, y:5}
			{id:'t', x:0, y:2, a:true}
			{id:'a', x:1, y:2}
			{id:'m', x:2, y:2}
			{id:'b', x:3, y:2}
			{id:'o', x:4, y:2}
			{id:'r', x:6, y:2}
			{id:'n', x:8, y:2}
			{id:'e', x:9, y:2}
			{id:'r', x:0, y:3}
			{id:'u', x:0, y:4}
			{id:'m', x:0, y:5}
			{id:'p', x:0, y:6, a:true}
			{id:'e', x:0, y:7}
			{id:'t', x:0, y:8}
			{id:'f', x:10, y:4, a:true}
			{id:'l', x:10, y:5}
			{id:'u', x:10, y:6}
			{id:'t', x:10, y:7}
			{id:'e', x:10, y:8}
			{id:'b', x:2, y:5, a:true}
			{id:'a', x:2, y:6}
			{id:'s', x:2, y:7}
			{id:'s', x:2, y:8, a:true}
			{id:'i', x:1, y:6}
			{id:'n', x:3, y:6}
			{id:'o', x:4, y:6}
			{id:'a', x:3, y:8}
			{id:'x', x:4, y:8}
			{id:'o', x:5, y:8}
			{id:'p', x:6, y:8}
			{id:'h', x:7, y:8}
			{id:'o', x:8, y:8}
			{id:'n', x:9, y:8}
		]
		@game = 
			answers:
				drum: r: off, c: [0, 1, 2, 3]
				guitar: r: off, c:[4, 5, 6, 7, 8, 9]
				tambourine: r: off, c:[10, 11, 12, 13, 14, 2, 15, 6, 16, 17]
				trumpet: r: off, c:[10, 18, 19, 20, 21, 22, 23]
				flute: r: off, c:[24, 25, 26, 27, 28]
				bass: r: off, c:[29, 30, 31, 32]
				piano: r: off, c:[21,33,30,34,35]
				saxophone: r: off, c:[32,36,37,38,39,40,41,42,28]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @clone @game.answers
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 95
		@insertBitmap 'saxophone', 'sax', 341, 123
		@insertBitmap 'saxophoneNo', 'sax_number', 346, 135
		@insertBitmap 'drum', 'drum', 99, 125
		@insertBitmap 'drumNo', 'drum_number', 69, 125
		@insertBitmap 'guitar', 'guitar', 99, 228
		@insertBitmap 'guitarNo', 'guitar_number', 163, 252
		@insertBitmap 'tambourine', 'tambourine', 192, 412
		@insertBitmap 'tambourineNo', 'tambourine_number', 197, 390
		@insertBitmap 'trumpet', 'trumpet', 353, 446
		@insertBitmap 'trumpetNo', 'trumpet_number', 322, 444
		@insertBitmap 'flute', 'flute', 546, 448
		@insertBitmap 'fluteNo', 'flute_number', 521, 443
		@insertBitmap 'bass', 'bass', 639, 249
		@insertBitmap 'bassNo', 'bass_number', 621, 279
		@insertBitmap 'piano', 'piano', 567, 77
		@insertBitmap 'pianoNo', 'piano_number', 567, 138
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
		crosswords.x = 305
		crosswords.y = 216
		crosswords.name = 'crosswords'
		for i in [0..@containers.length - 1] by 1
			drop = new WordContainer 'h'+i, '', '#FFF', '#999', @containers[i].x*23, @containers[i].y*23, 23, 23
			drop.setRectShape '#FFF', '#999', 2, 23, 23
			drop.text.y -= 3
			drop.id = @containers[i].id
			@addToLibrary drop
			crosswords.addChild drop
		for i in [0..7]
			t = new createjs.Text @numbers[i].id,'14px Arial','#333'
			t.x = @numbers[i].x*23 + 6
			t.y = @numbers[i].y*23 + 4
			crosswords.addChild t
		crosswords.cache -23, -23, 276, 230
		@addToMain crosswords
	introEvaluation: ->
		super
		@library['crosswords'].y = 216
		@library['crosswords'].alpha = 1
		@library['alphabet'].y = 510
		@library['alphabet'].alpha = 1
		@library['saxophone'].alpha = 1
		@library['saxophoneNo'].alpha = 1
		@library['drum'].alpha = 1
		@library['drumNo'].alpha = 1
		@library['guitar'].alpha = 1
		@library['guitarNo'].alpha = 1
		@library['tambourine'].alpha = 1
		@library['tambourineNo'].alpha = 1
		@library['trumpet'].alpha = 1
		@library['trumpetNo'].alpha = 1
		@library['flute'].alpha = 1
		@library['fluteNo'].alpha = 1
		@library['bass'].alpha = 1
		@library['bassNo'].alpha = 1
		@library['piano'].alpha = 1
		@library['pianoNo'].alpha = 1
		for i in [0..@containers.length - 1] by 1
			if(@containers[i].a)
				@library['h'+i].changeText @containers[i].id
			else
				@library['h'+i].changeText ''
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenMax.allFrom [@library['saxophone'], @library['drum'], @library['guitar'], @library['tambourine'], @library['trumpet'], @library['flute'], @library['bass'], @library['piano']], 1, {alpha:0, delay:1.5}, 0.2
		TweenMax.allFrom [@library['saxophoneNo'], @library['drumNo'], @library['guitarNo'], @library['tambourineNo'], @library['trumpetNo'], @library['fluteNo'], @library['bassNo'], @library['pianoNo']], 1, {alpha:0, delay:1.5}, 0.2
		TweenLite.from @library['alphabet'], 1, {alpha: 0, y: @library['alphabet'].y + 50, delay: 1.5}
		TweenLite.from @library['crosswords'], 1, {alpha: 0, y: @library['crosswords'].y + 50, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library.crosswords.cache -23, -23, 276, 230
		for letter in @abc
			@library[letter].addEventListener 'drop', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = false
		hitdrop = null
		for i in [0..@containers.length - 1] by 1
			hit = @library['h'+i]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
				if hit.id is @answer.index
					dropped = true
					hitdrop = hit
			else
				@answer.returnToPlace()
		if dropped is true
			hitdrop.changeText hitdrop.id
			@answer.x = @answer.pos.x
			@answer.y = @answer.pos.y
			@evaluate 'drum'
			@evaluate 'guitar'
			@evaluate 'tambourine'
			@evaluate 'trumpet'
			@evaluate 'flute'
			@evaluate 'bass'
			@evaluate 'piano'
			@evaluate 'saxophone'
			@library.crosswords.cache -23, -23, 276, 230
		else
			@warning()
	evaluate: (instrument) ->
		ready = true
		if not @answers[instrument].r
			for box in @answers[instrument].c
				if @library['h'+box].text.text is ''
					ready = false
			if ready
				snd = createjs.Sound.play "s#{instrument}"
				snd.instrument = instrument
				snd.addEventListener 'complete', @finishEvaluation
				@answers[instrument].r = on
				@library['score'].plusOne()
	finishEvaluation: (e) =>
		TweenMax.allTo [@library[e.target.instrument],@library[e.target.instrument+'No']], 1, {alpha:0, ease:Quart.easeOut, onComplete: @nextEvaluation}
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