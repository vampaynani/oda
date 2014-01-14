class U5A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'volcan', src:'prop_img.png'}
			{id:'btnready', src:'btn_ready.png'}
			{id:'crossword', src:'prop_crossword.png'}

			{id:'q1', src:'q1.png'}
			{id:'q2', src:'q2.png'}
			{id:'q3', src:'q3.png'}
			{id:'q4', src:'q4.png'}
			{id:'q5', src:'q5.png'}
			{id:'q6', src:'q6.png'}
			{id:'q7', src:'q7.png'}
			{id:'q8', src:'q8.png'}
			{id:'q9', src:'q9.png'}
			{id:'q10', src:'q10.png'}

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
			{src:'sounds/TU3_U6_A3_instructions.mp3', id:'instructions'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/wrong.mp3', id:'wrong'}	
		]
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		@numbers = [
			{id:'1', x:9, y:1}
			{id:'2', x:11, y:0}
			{id:'3', x:8, y:2}
			{id:'4', x:7, y:3}
			{id:'5', x:5, y:5}
			{id:'6', x:4, y:6}
			{id:'7', x:0, y:8}
			{id:'8',  x:4, y:10}
			{id:'9',  x:1, y:12}
			{id:'10', x:0, y:14}
		]
		@containers = [
			{id:'f', x:10, y:1}
			{id:'o', x:11, y:1}
			{id:'r', x:12, y:1}
			{id:'e', x:13, y:1}
			{id:'s', x:14, y:1}
			{id:'t', x:15, y:1}

			{id:'c', x:11, y:2}
			{id:'e', x:11, y:3}
			{id:'a', x:11, y:4}
			{id:'n', x:11, y:5}

			{id:'l', x:8, y:3}
			{id:'a', x:9, y:3}
			{id:'k', x:10, y:3}

			{id:'c', x:7, y:4}
			{id:'o', x:7, y:5}
			{id:'n', x:7, y:6}
			{id:'t', x:7, y:7}
			{id:'i', x:7, y:8}
			{id:'n', x:7, y:9}
			{id:'e', x:7, y:10}
			{id:'n', x:7, y:11}
			{id:'t', x:7, y:12}

			{id:'v', x:6, y:5}
			{id:'l', x:8, y:5}
			{id:'c', x:9, y:5}
			{id:'a', x:10, y:5}
			{id:'o', x:12, y:5}
			{id:'s', x:5, y:6}
			{id:'w', x:5, y:7}
			{id:'a', x:5, y:8}
			{id:'m', x:5, y:9}
			{id:'p', x:5, y:10}
			{id:'t', x:1, y:8}
			{id:'s', x:2, y:8}
			{id:'u', x:3, y:8}
			{id:'n', x:4, y:8}
			{id:'m', x:6, y:8}
			{id:'i', x:4, y:11}
			{id:'s', x:4, y:12}
			{id:'l', x:4, y:13}
			{id:'a', x:4, y:14}
			{id:'n', x:4, y:15}
			{id:'d', x:4, y:16}
			{id:'d', x:2, y:12}
			{id:'e', x:3, y:12}
 			{id:'e', x:5, y:12}
			{id:'r', x:6, y:12}
			{id:'l', x:1, y:14}
			{id:'a', x:2, y:14}
			{id:'v', x:3, y:14}
		]
		@game = 
			answers:
				palabra1: r:off, c: [0,1,2,3,4,5]
				palabra2: r:off, c: [1,6,7,8,9]
				palabra3: r:off, c: [10,11,12,7]
				palabra4: r:off, c: [13,14,15,16,17,18,19,20,21]
				palabra5: r:off, c: [22,14,23,24,25,9,26]
				palabra6: r:off, c: [27,28,29,30,31]
				palabra7: r:off, c: [32,33,34,35,29,36,17]
				palabra8: r:off, c: [37,38,39,40,41,42]
				palabra9: r:off, c: [43,44,38,45,46,21]
				palabra9: r:off, c: [47,48,49,40]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @clone @game.answers
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on the crossword, read the clues and write the answers.', 30, 100
		@insertBitmap 'volcan', 'volcan', 495, 177
		@insertSprite 'questions', ['q1','q2','q3','q4','q5','q6','q7','q8','q9','q10'], null, 0, 0
		@library['questions'].currentFrame = 9
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
		crosswords.x = 235
		crosswords.y = 125
		crosswords.name = 'crosswords'
		for i in [0..@containers.length - 1] by 1
			drop = new WordContainer "h#{i}", '', '#FFF', '#999', @containers[i].x*21.9, @containers[i].y*21.9, 21.9, 21.9
			drop.setRectShape '#FFF', '#999', 2, 21.9, 21.9
			drop.text.y -= 3
			drop.id = @containers[i].id
			@addToLibrary drop
			crosswords.addChild drop
		for i in [0..9]
			t = new createjs.Text @numbers[i].id,'14px Quicksand','#333'
			t.x = @numbers[i].x*21.9 + 6
			t.y = @numbers[i].y*21.9 + 4
			crosswords.addChild t
		#crosswords.cache -23, -23, 276, 230
		@addToMain crosswords
	introEvaluation: ->
		super
		#@library['crosswords'].y = 216
		@library['crosswords'].alpha = 1
		@library['alphabet'].y = 540
		@library['alphabet'].alpha = 1
		
		for i in [0..@containers.length - 1] by 1
			if(@containers[i].a)
				@library['h'+i].changeText @containers[i].id
			else
				@library['h'+i].changeText ''
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
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
		@nextEvaluation
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