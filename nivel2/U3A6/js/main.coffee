class U3A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
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
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U2_A1_instructions.mp3', id:'instructions'}
		]
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		@answers = [
		
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setDropper().setChango().createAlphabet().introEvaluation()
	setDropper: ->
		#@addToMain new WordCompleter 'dropper', '', '', '#FFF', '#F59743', 170, 541, 188, 30
		@
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
				letterObj = new Draggable letter, (@preload.getResult letter+'Letra'), letter, 41.5*i, 0
			else if i <= 18
				letterObj = new Draggable letter, (@preload.getResult letter+'Letra'), letter, 41.5*i-395, 34
			else 
				letterObj = new Draggable letter, (@preload.getResult letter+'Letra'), letter, 41.5*i-750, 68
			letterObj.onInitEvaluation()
			alphabet.addChild letterObj	
			@addToLibrary letterObj
		@addToMain alphabet
	introEvaluation: ->
		super

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['dropper'], 1, {alpha: 0, x: @library['dropper'].x + 50, ease: Quart.easeOut, delay: 3, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.allFrom [@library['nube1'], @library['nube2'], @library['nube3'], @library['nube4']], 1, {alpha: 0, y: stageSize.h, delay: 2}
	initEvaluation: (e) =>
		super
		for i in [0..3] by 1
			@library['tn'+i].addEventListener 'drop', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropper'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropper'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.x = @answer.pos.x
				@answer.y = @answer.pos.y
				@library['dropper'].changeText @answer.text.text
				setTimeout @finishEvaluation, 1 * 1000
			else
				@answer.returnToPlace()	
				@warning()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		createjs.Sound.play 'good'
		TweenLite.to @library['dropper'], 0.5, {alpha: 0, y: stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['dropper'].y = 525
			@library['dropper'].x = 150 + 50
			@library['dropper'].changeText ''
			@library['dropper'].changeLabel @answers[@index].text
			TweenLite.to @library['dropper'], 0.5, {alpha: 1, x: 150, ease: Quart.easeOut}
		else
			@finish()
	finish: ->
		super
	window.U3A6 = U3A6