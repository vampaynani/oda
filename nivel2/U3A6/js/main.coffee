class U3A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'ch01', src:'chango0001.png'}
			{id:'ch02', src:'chango0002.png'}
			{id:'ch03', src:'chango0003.png'}
			{id:'ch04', src:'chango0004.png'}
			{id:'ch05', src:'chango0005.png'}
			{id:'ch06', src:'chango0006.png'}
			{id:'ch07', src:'chango0007.png'}
			{id:'ch08', src:'chango0008.png'}
			{id:'ch09', src:'chango0009.png'}
			{id:'ch10', src:'chango0010.png'}
			{id:'ch11', src:'chango0011.png'}
			{id:'ch12', src:'chango0012.png'}
			{id:'ch13', src:'chango0013.png'}
			{id:'ch14', src:'chango0014.png'}
			{id:'ch15', src:'chango0015.png'}
			{id:'ch16', src:'chango0016.png'}
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
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U3_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [
			'broccoli'
			'cherries'
			'bread'
			'pancakes'
			'chocolate cake'
			'cheese'
			'chicken'
			'cut the fruit'
			'breakfast'
			'mashed potatoes'
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@setChango().createAlphabet().introEvaluation()
	setChango: ->
		@insertSprite 'chango', ['ch01', 'ch02', 'ch03', 'ch04', 'ch05', 'ch06', 'ch07', 'ch08', 'ch09', 'ch10', 'ch11', 'ch12', 'ch13', 'ch14', 'ch15', 'ch16'], null, 549, 150, 'tl'
		@
	createAlphabet: ->
		alphabet = new createjs.Container()
		alphabet.x = 125
		alphabet.y = 440
		alphabet.name = 'alphabet'
		for i in [0..@abc.length - 1] by 1
			letter = @abc[i]
			if i <= 9
				letterObj = new ClickableLetter "l#{i}", letter, letter, 41.5 * i, 0
			else if i <= 18
				letterObj = new ClickableLetter "l#{i}", letter, letter, 41.5 * i - 395, 34
			else
				letterObj = new ClickableLetter "l#{i}", letter, letter, 41.5 * i - 750, 68
			letterObj.text.font = '20px Quicksand'
			@addToLibrary letterObj
			alphabet.addChild letterObj
		@addToMain alphabet
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['chango'], 1, {alpha: 0, x: @library['chango'].x + 50, ease: Quart.easeOut, delay: 1.5}
		TweenMax.from @library['alphabet'], 1, {alpha: 0, y: stageSize.h, delay: 2, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		word = @answers[@index]
		@col = word.split('')
		wordContainers = new createjs.Container()
		wordContainers.name = 'wordContainers'
		wordContainers.y = 400
		wordContainers.x = (@library['alphabet'].x + 177) - @col.length * 30 / 2
		
		for i in [0..@abc.length - 1]
			@library["l#{i}"].addEventListener 'click', @evaluateAnswer
		
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				wc = new WordContainer "w#{i}", '', '#fff', '#0098d7', 30 * i, 0, 26, 26
				wc.index = @col[i - 1]
				@addToLibrary wc
				wordContainers.addChild wc
		@addToMain wordContainers
	evaluateAnswer: (e) =>
		@answer = e.target
		@answer.visible = false
		check = off
		complete = on
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				if @answer.index is @library["w#{i}"].index
					@library["w#{i}"].changeText @answer.index
					check = on
		if not check
			current = @library.chango.currentFrame
			current++
			@library.chango.gotoAndStop current
		if @library.chango.currentFrame is @library.chango.spriteSheet._numFrames
			@finish()
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				wc = @library["w#{i}"]
				if wc.text.text isnt wc.index
					complete = off
		if complete then setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		@library['score'].plusOne()
		createjs.Sound.play 'good'
		for i in [1..@col.length]
			if @col[i] isnt ' '
				TweenLite.to @library['wordContainers'], 0.5, {alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			word = @answers[@index]
			@col = word.split('')
			@library.chango.currentFrame = 0
			@library.wordContainers.removeAllChildren()
			@library.wordContainers.x = (@library['alphabet'].x + 177) - @col.length * 30 / 2
			for i in [0..@abc.length - 1]
				@library["l#{i}"].visible = on
		
			for i in [1..@col.length]
				if @col[i - 1] isnt ' '
					wc = new WordContainer "w#{i}", '', '#fff', '#0098d7', 30 * i, 0, 26, 26
					wc.index = @col[i - 1]
					@addToLibrary wc
					@library.wordContainers.addChild wc
			TweenLite.to @library.wordContainers, 0.5, {alpha: 1, ease: Quart.easeOut}
		else
			@finish()
	finish: ->
		TweenLite.to @library.wordContainers, 0.5, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.alphabet, 1, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.chango, 1, {alpha: 0, ease: Quart.easeOut}
		super
	window.U3A6 = U3A6