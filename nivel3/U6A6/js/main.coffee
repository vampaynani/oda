class U3A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'fondo', src: 'fondo.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}

			{id:'ch01', src:'animal_sable0001.png'}
			{id:'ch02', src:'animal_sable0002.png'}
			{id:'ch03', src:'animal_sable0003.png'}
			{id:'ch04', src:'animal_sable0004.png'}
			{id:'ch05', src:'animal_sable0005.png'}
			{id:'ch06', src:'animal_sable0006.png'}
		
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

			{id:'peoplecookedwithfire', src:'people-cooked-with-fire.png'}
			{id:'peoplehadpetwolves', src:'people-had-pet-wolves.png'}
			{id:'theyatemeat', src:'they-ate-meat.png'}
			{id:'theyhuntedmammoths', src:'they-hunted-mammoths.png'}
			{id:'theylivedintents', src:'they-lived-in-tents.png'}
			{id:'theymadetoolsfrombones', src:'they-made-tools-from-bones.png'}
			{id:'theypaintedpicturesincaves', src:'they-painted-pictures-in-caves.png'}
			{id:'theyworeanimalskins', src:'they-wore-animal-skins.png'}

		]
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U6_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			answers:[
				{t:'people cooked with fire', i:'peoplecookedwithfire'}
				{t:'people had pet wolves', i:'peoplehadpetwolves'}
				{t:'they ate meat', i:'theyatemeat'}
				{t:'they hunted mammoths', i:'theyhuntedmammoths'}
				{t:'they lived in tents', i:'theylivedintents'}
				{t:'they made tools from bones', i:'theymadetoolsfrombones'}
				{t:'they painted pictures in caves', i:'theypaintedpicturesincaves'}
				{t:'they wore animal skins', i:'theyworeanimalskins'}

			]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @shuffleNoRepeat @game.answers, 10
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on the letters and guess the word before George is complete.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@setChango().createAlphabet().introEvaluation()
	setChango: ->
		imagen = @createBitmap 'fondo', 'fondo', 456, 250, 'mc'
		#imagen.scaleX = imagen.scaleY = 0.9
		@addToMain imagen
		@insertSprite 'chango', ['ch01', 'ch02', 'ch03', 'ch04', 'ch05', 'ch06'], null, 511, 203, 'tl'
		@
	createAlphabet: ->
		alphabet = new createjs.Container()
		alphabet.x = 225
		alphabet.y = 500
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
		word = @answers[@index].t
		@col = word.split('')
		
		comidas = new createjs.Container()
		comidas.name = 'comidas'
		comidas.y = 250
		comidas.x = 300

		imagen = @createBitmap @answers[@index].i, @answers[@index].i, -10, 60, 'mc'
		imagen.scaleX = imagen.scaleY = 0.9
		comidas.addChild imagen

		wordContainers = new createjs.Container()
		wordContainers.name = 'wordContainers'
		wordContainers.y = 440
		wordContainers.x = (@library['alphabet'].x + 157) - @col.length * 30 / 2
		
		for i in [0..@abc.length - 1]
			@library["l#{i}"].addEventListener 'click', @evaluateAnswer
		
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				wc = new WordContainer "w#{i}", '', '#fff', '#0098d7', 30 * i, 0, 26, 26
				wc.index = @col[i - 1]
				@addToLibrary wc
				wordContainers.addChild wc
		@addToMain comidas
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
					console.log 'letra'

		if not check
			current = @library.chango.currentFrame
			current++
			@library.chango.gotoAndStop current
		if @library.chango.currentFrame is @library.chango.spriteSheet._numFrames		

			current--
			@library.chango.gotoAndStop current
			setTimeout @finishEvaluation, 3 * 1000			
			console.log 'perdiste'
			return
			#@finish()
		for i in [1..@col.length]
			if @col[i - 1] isnt ' '
				wc = @library["w#{i}"]
				if wc.text.text isnt wc.index
					complete = off
		if complete 
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
			@library.chango.currentFrame = 0
			imagen = @createBitmap @answers[@index].i, @answers[@index].i, 0, 0, 'mc'
			#imagen.scaleX = imagen.scaleY = 0.4
			@library.comidas.addChild imagen
	
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
			TweenLite.to @library.comidas, 0.5, {alpha: 1, ease: Quart.easeOut}
		else
			@finish()
	finish: ->
		TweenLite.to @library.wordContainers, 0.5, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.alphabet, 1, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.chango, 1, {alpha: 0, ease: Quart.easeOut}
		TweenLite.to @library.comidas, 0.5, {alpha: 0, ease: Quart.easeOut}

		super
	window.U3A6 = U3A6