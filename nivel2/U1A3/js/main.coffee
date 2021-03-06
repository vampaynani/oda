class U1A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'cal', src: 'calendar.png'}
			{id: 'gym', src: 'icon_excercisesGymMM.png'}
			{id: 'lunch', src: 'icon_lunchCafeTnF.png'}
			{id: 'art', src: 'icon_paintArtRoomMnF.png'}
			{id: 'read', src: 'icon_readLibTT.png'}
			{id: 'watch', src: 'icon_watchAudTT.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U1_A3_instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [
			{id:'iconRead', a1: 1, a2: 3, a3: 4}
			{id:'iconLunch', a1: 4, a2: 2, a3: 3}
			{id:'iconGym', a1: 2, a2: 1, a3: 5}
		    {id:'iconArt', a1: 3, a2: 5, a3: 1}
		    {id:'iconWatch', a1: 5, a2: 4, a3: 2}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look at the schedule and click on the phrases to make sentences.', 80, 200
		@insertBitmap 'calendar', 'cal', 0, 260
		@insertBitmap 'iconGym', 'gym', 736, 428
		@insertBitmap 'iconArt', 'art', 388, 410
		@insertBitmap 'iconWatch', 'watch', 503, 505
		@insertBitmap 'iconRead', 'read', 615, 501
		@insertBitmap 'iconLunch', 'lunch', 882, 673
		@intento = 0
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 5, 0
		@setGrupo1().setGrupo2().setGrupo3().setDropper().introEvaluation()
	setGrupo1: ->
		group1 = new createjs.Container()
		group1.x = 1130
		group1.y = 180
		group1.name = 'group1'
		word1 = new ClickableText 'w11', 'We read books', 1, 0, 0
		word2 = new ClickableText 'w12', 'We do exercise', 2, 0, 50
		word3 = new ClickableText 'w13', 'We paint', 3, 0, 100
		word4 = new ClickableText 'w14', 'We eat lunch', 4, 0, 150
		word5 = new ClickableText 'w15', 'We watch movies', 5, 0, 200

		group1.addChild word1, word2, word3, word4, word5
		@addToLibrary word1, word2, word3, word4, word5
		@addToMain group1
		@
	setGrupo2: ->
		group2 = new createjs.Container()
		group2.x = 1130
		group2.y = 460
		group2.name = 'group2'
		word1 = new ClickableText 'w21', 'in the gym', 1, 0, 0
		word2 = new ClickableText 'w22', 'in the cafeteria', 2, 0, 50
		word3 = new ClickableText 'w23', 'in the library', 3, 0, 100
		word4 = new ClickableText 'w24', 'in the auditorium', 4, 0, 150
		word5 = new ClickableText 'w25', 'in the art room', 5, 0, 200

		group2.addChild word1, word2, word3, word4, word5
		@addToLibrary word1, word2, word3, word4, word5
		@addToMain group2
		@
	setGrupo3: ->
		group3 = new createjs.Container()
		group3.x = 1130
		group3.y = 740
		group3.name = 'group3'
		word1 = new ClickableText 'w31', 'on Monday and Friday.', 1, 0, 0
		word2 = new ClickableText 'w32', 'on Tuesday and Thursday.', 2, 0, 50
		word3 = new ClickableText 'w33', 'on Thursday and Friday.', 3, 0, 100
		word4 = new ClickableText 'w34', 'on Tuesday and Friday.', 4, 0, 150
		word5 = new ClickableText 'w35', 'on Monday and Wednesday.', 5, 0, 200

		group3.addChild word1, word2, word3, word4, word5
		@addToLibrary word1, word2, word3, word4, word5
		@addToMain group3
		@
	setDropper: ->
		words = new createjs.Container()
		words.x = 340
		words.y = stageSize.h - 200
		words.name = 'words'
		wc1 = new WordContainer 'wc1', '', '#FFF', '#ff983a', 0, 0, 550, 60
		wc2 = new WordContainer 'wc2', '', '#FFF', '#ff983a', 580, 0, 550, 60
		wc3 = new WordContainer 'wc3', '', '#FFF', '#ff983a', 200, 74, 710, 60
		words.addChild wc1, wc2, wc3
		@addToLibrary wc1, wc2, wc3
		@addToMain words
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenMax.allFrom [@library['calendar'], @library['iconGym'], @library['iconArt'], @library['iconWatch'], @library['iconRead'], @library['iconLunch']], 1, {alpha: 0, delay: 0.5}
		TweenLite.from @library['group1'], 1, {alpha: 0, y: @library['group1'].y + 100, delay: 1}
		TweenLite.from @library['group2'], 1, {alpha: 0, y: @library['group2'].y + 100, delay: 1.1}
		TweenLite.from @library['group3'], 1, {alpha: 0, y: @library['group3'].y + 100, delay: 1.2}
		TweenLite.from @library['words'], 1, {alpha: 0, y: @library['words'].y + 40, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@blink @library[@answers[@index].id]
		@blink @library['group1']
		for i in [1..5] by 1
			@library['w1'+i].addEventListener 'click', @evaluateAnswer1
	evaluateAnswer1: (e) =>
		@answer = e.currentTarget
		console.log @answer
		if @answer.index is @answers[@index].a1
			createjs.Sound.play 'good'
			@blink @library['group1'], off
			@library['wc1'].changeText @answer.text.text
			@blink @library['group2']
			for i in [1..5] by 1
				@library['w1'+i].removeEventListener 'click', @evaluateAnswer1
				@library['w2'+i].addEventListener 'click', @evaluateAnswer2
		else
			@intento = 1

			@warning()
	evaluateAnswer2: (e) =>
		@answer = e.currentTarget
		if @answer.index is @answers[@index].a2
			createjs.Sound.play 'good'
			@blink @library['group2'], off
			@library['wc2'].changeText @answer.text.text
			@blink @library['group3']
			for i in [1..5] by 1
				@library['w2'+i].removeEventListener 'click', @evaluateAnswer2
				@library['w3'+i].addEventListener 'click', @evaluateAnswer3
		else
			@warning()
			@intento = 1

	evaluateAnswer3: (e) =>
		@answer = e.currentTarget
		if @answer.index is @answers[@index].a3
			createjs.Sound.play 'good'
			@blink @library['group3'], off
			@blink @library[@answers[@index].id], off
			@library['wc3'].changeText @answer.text.text
			for i in [1..5] by 1
				@library['w3'+i].removeEventListener 'click', @evaluateAnswer3
			setTimeout @finishEvaluation, 1 * 1000
		else
			@warning()
			@intento = 1
	finishEvaluation: =>
		if @intento is 0
			@library['score'].plusOne()
		@intento = 0
		TweenLite.to @library['words'], 0.5, {alpha: 0, ease: Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['wc1'].changeText ''
			@library['wc2'].changeText ''
			@library['wc3'].changeText ''
			@blink @library[@answers[@index].id]
			@blink @library['group1']
			for i in [1..5] by 1
				@library['w1'+i].addEventListener 'click', @evaluateAnswer1
			TweenLite.to @library['words'], 0.5, {alpha: 1, ease: Quart.easeOut}
		else
			@library['wc1'].changeText ''
			@library['wc2'].changeText ''
			@library['wc3'].changeText ''
			TweenLite.to @library['words'], 0.5, {alpha: 1, ease: Quart.easeOut}
			@finish()
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		TweenMax.to [@library['calendar'], @library['iconGym'], @library['iconArt'], @library['iconWatch'], @library['iconRead'], @library['iconLunch']], 1, {alpha: 0, delay: 0.5}
		TweenLite.to @library['group1'], 1, {alpha: 0, y: @library['group1'].y + 100, delay: 0.1}
		TweenLite.to @library['group2'], 1, {alpha: 0, y: @library['group2'].y + 100, delay: 0.1}
		TweenLite.to @library['group3'], 1, {alpha: 0, y: @library['group3'].y + 100, delay: 0.1}
		TweenLite.to @library['words'], 1, {alpha: 0, y: @library['words'].y + 40, delay: 0.1}
		super
	window.U1A3 = U1A3