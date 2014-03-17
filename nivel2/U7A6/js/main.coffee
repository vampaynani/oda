class U7A6 extends Oda
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
			{id:'bubble1', src:'bubble1.png'}
			{id:'bubble2', src:'bubble2.png'}
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
			{id: 'backpack', src:'backpack.png'}
			{id: 'baseball', src:'baseball.png'}
			{id: 'brushmyhair', src:'brush-my-hair.png'}
			{id: 'cabin', src:'cabin.png'}
			{id: 'canoeing', src:'canoeing.png'}
			{id: 'comb', src:'comb.png'}
			{id: 'field', src:'field.png'}
			{id: 'fishing', src:'fishing.png'}
			{id: 'flashlight', src:'flashlight.png'}
			{id: 'flossmyteeth', src:'floss-my-teeth.png'}
			{id: 'forest', src:'forest.png'}
			{id: 'hiking', src:'hiking.png'}
			{id: 'horsebackriding', src:'horseback-riding.png'}
			{id: 'lake', src:'lake.png'}
			{id: 'mountainbiking', src:'mountain-biking.png'}
			{id: 'mountains', src:'mountains.png'}
			{id: 'planttrees', src:'plant-trees.png'}
			{id: 'pool', src:'pool.png'}
			{id: 'recyclebottles', src:'recycle-bottles.png'}
			{id: 'soap', src:'soap.png'}
			{id: 'sunscreen', src:'sunscreen.png'}
			{id: 'swimming', src:'swimming.png'}
			{id: 'swimsuit', src:'swimsuit.png'}
			{id: 'toothbrush', src:'toothbrush.png'}
			{id: 'toothpaste', src:'toothpaste.png'}
			{id: 'towels', src:'towels.png'}
			{id: 'volleyball', src:'volleyball.png'}
			{id: 'washmyface', src:'wash-my-face.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U7_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		@game =
			answers:[
				{t: 'backpack', i:'backpack'}
				{t: 'baseball', i:'baseball'}
				{t: 'brush my hair', i:'brushmyhair'}
				{t: 'cabin', i:'cabin'}
				{t: 'canoeing', i:'canoeing'}
				{t: 'comb', i:'comb'}
				{t: 'field', i:'field'}
				{t: 'fishing', i:'fishing'}
				{t: 'flashlight', i:'flashlight'}
				{t: 'floss my teeth', i:'flossmyteeth'}
				{t: 'forest', i:'forest'}
				{t: 'hiking', i:'hiking'}
				{t: 'horseback riding', i:'horsebackriding'}
				{t: 'lake', i:'lake'}
				{t: 'mountain biking', i:'mountainbiking'}
				{t: 'mountains', i:'mountains'}
				{t: 'plant trees', i:'planttrees'}
				{t: 'pool', i:'pool'}
				{t: 'recycle bottles', i:'recyclebottles'}
				{t: 'soap', i:'soap'}
				{t: 'sunscreen', i:'sunscreen'}
				{t: 'swimming', i:'swimming'}
				{t: 'swimsuit', i:'swimsuit'}
				{t: 'toothbrush', i:'toothbrush'}
				{t: 'toothpaste', i:'toothpaste'}
				{t: 'towels', i:'towels'}
				{t: 'volleyball', i:'volleyball'}
				{t: 'wash my face', i:'washmyface'}
			]
	
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @shuffleNoRepeat @game.answers, 10
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on the letters and guess the word before George is complete!', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 10, 0
		@setChango().createAlphabet().introEvaluation()
	setChango: ->
		@insertSprite 'chango', ['ch01', 'ch02', 'ch03', 'ch04', 'ch05', 'ch06', 'ch07', 'ch08', 'ch09', 'ch10', 'ch11', 'ch12', 'ch13', 'ch14', 'ch15', 'ch16'], null, 1098, 300, 'tl'
		burbuja = new createjs.Container()
		burbuja.name = 'burbuja'
		burbuja.y = 298
		burbuja.x = 1100
		@addToMain burbuja
		@
	createAlphabet: ->
		alphabet = new createjs.Container()
		alphabet.x = 250
		alphabet.y = 880
		alphabet.name = 'alphabet'
		for i in [0..@abc.length - 1] by 1
			letter = @abc[i]
			if i <= 9
				letterObj = new ClickableLetter "l#{i}", letter, letter, 83 * i, 0
			else if i <= 18
				letterObj = new ClickableLetter "l#{i}", letter, letter, 83 * i - 790, 68
			else
				letterObj = new ClickableLetter "l#{i}", letter, letter, 83 * i - 1500, 136
			letterObj.text.font = '40px Quicksand'
			@addToLibrary letterObj
			alphabet.addChild letterObj
		@addToMain alphabet
		
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['chango'], 1, {alpha: 0, x: @library['chango'].x + 100, ease: Quart.easeOut, delay: 1.5}
		TweenMax.from @library['alphabet'], 1, {alpha: 0, y: stageSize.h, delay: 2, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		word = @answers[@index].t
		@col = word.split('')
		
		comidas = new createjs.Container()
		comidas.name = 'comidas'
		comidas.y = 500
		comidas.x = 600

		imagen = @createBitmap @answers[@index].i, @answers[@index].i, 0, 0, 'mc'
		imagen.scaleX = imagen.scaleY = 0.8
		comidas.addChild imagen

		wordContainers = new createjs.Container()
		wordContainers.name = 'wordContainers'
		wordContainers.y = 800
		wordContainers.x = (@library['alphabet'].x + 314) - @col.length * 60 / 2
		
		for i in [0..@abc.length - 1]
			@library["l#{i}"].addEventListener 'click', @evaluateAnswer
		
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				wc = new WordContainer "w#{i}", '', '#fff', '#0098d7', 60 * i, 0, 52, 52
				wc.index = @col[i - 1]
				@addToLibrary wc
				wordContainers.addChild wc
		@addToMain wordContainers 
		@addToMain comidas
	evaluateAnswer: (e) =>
		@answer = e.currentTarget
		@answer.visible = false
		check = off
		complete = on
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				if @answer.index is @library["w#{i}"].index
					@library["w#{i}"].changeText @answer.index
					check = on
					console.log 'letra'

		if not check
			current = @library.chango.currentFrame
			current++
			if @library.chango.currentFrame is @library.chango.spriteSheet.getNumFrames() - 1		
				current--
				b = @createBitmap 'bubble2', 'bubble2', 0,0
				@library.burbuja.addChild b
				@library.chango.gotoAndStop current
				createjs.Sound.play 'wrong'
				setTimeout @finishEvaluation, 3 * 1000			
				console.log 'perdiste'
				return
			else
				@library.chango.gotoAndStop current
				#@finish()
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				wc = @library["w#{i}"]
				if wc.text.text isnt wc.index
					complete = off
		if complete 
			b = @createBitmap 'bubble1', 'bubble1', 0, 0
			@library.burbuja.addChild b
			@library['score'].plusOne()
			createjs.Sound.play 'good'
			setTimeout @finishEvaluation, 3 * 1000
			console.log 'ganaste'

	finishEvaluation: =>
		TweenLite.to @library['comidas'], 0.5, {alpha: 0, ease: Back.easeOut}
		for i in [1..@col.length]
			if @col[i] isnt ' '
				TweenLite.to @library['wordContainers'], 0.5, {alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		for i in [1..@col.length]
			if @col[i] isnt ' '
				TweenLite.to @library['wordContainers'], 0.5, {alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
		TweenLite.to @library['comidas'], 0.5, {alpha: 0, ease: Back.easeOut}

		@index++
		if @index < @answers.length
			word = @answers[@index].t
			@col = word.split('')
			
			@library.comidas.removeAllChildren()
			@library.burbuja.removeAllChildren()
			@library.chango.gotoAndStop 0
			imagen = @createBitmap @answers[@index].i, @answers[@index].i, 0, 0, 'mc'
			imagen.scaleX = imagen.scaleY = 0.8
			@library.comidas.addChild imagen
	
			@library.wordContainers.removeAllChildren()
			@library.wordContainers.x = (@library['alphabet'].x + 354) - @col.length * 60 / 2
			for i in [0..@abc.length - 1]
				@library["l#{i}"].visible = on
		
			for i in [1..@col.length]
				if @col[i - 1] isnt ' '
					wc = new WordContainer "w#{i}", '', '#fff', '#0098d7', 60 * i, 0, 52, 52
					wc.index = @col[i - 1]
					@addToLibrary wc
					@library.wordContainers.addChild wc
			
			TweenLite.to @library.wordContainers, 0.5, {alpha: 1, ease: Quart.easeOut}
			TweenLite.to @library.comidas, 0.5, {alpha: 1, ease: Quart.easeOut}
		else
			@finish()
	finish: ->
		TweenLite.to @library.wordContainers, 0.5, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.alphabet, 1, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.chango, 1, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.comidas, 0.5, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.burbuja, 0.5, {alpha: 0, ease: Quart.easeOut}

		super
	window.U7A6 = U7A6