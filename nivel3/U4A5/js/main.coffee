class U4A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'btn4', src:'btn_Chad.png'}
			{id: 'btn3', src:'btn_Ben.png'}
			{id: 'btn2', src:'btn_Lindsay.png'}
			{id: 'btn1', src:'btn_Matt.png'}
			{id: 'bubbletext', src:'bubble_text.png'}
			{id: 'propback', src:'prop_back.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U4_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			answers:[
				{q:'Oh! There\'s Lindsay and Ben!', a: 'matt'}
				{q:'They look strange!', a: 'chad'}
				{q:'Can we teach them to sign, too?', a: 'lindsay'}
				{q:'Do you think you can teach us?', a: 'chad'}
				{q:'I need to go to the sports store.', a: 'lindsay'}
				{q:'They are not strange.', a: 'matt'}
				{q:'Ben is deaf, so they\'re speaking in sign language.', a: 'matt'}
				{q:'I want to look for books!', a: 'ben'}
				{q:'What are you doing here?', a: 'matt'}
				{q:'It\'s great for talking in loud places.', a: 'lindsay'}
			]
			faces:[
				'matt'
				'lindsay'
				'ben'
				'chad'
			]

		super null, manifest, sounds
	setStage: ->
		super
		@answers = @shuffle @game.answers
		@intento = false
		@insertBitmap 'propback', 'propback', 0, 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read the speech bubbles and click on the corresponding character.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@library.score.txtCount.color = "#0A9BDD"
		@library.score.txtTotal.color = "#FE008F"
		@setFaces().introEvaluation()
	setFaces: ->
		faces = new createjs.Container()
		faces.x = 446
		faces.y = 443
		b = @createBitmap 'bubblebmp','bubbletext', 0,0
		t = @createText 'qtext', @answers[@index].q, '12px Roboto', '#000', 140, 9
		t.textAlign = 'center'
		faces.addChild b, t
		@addToLibrary b, t
		for i in [1..4] by 1
			c = @createBitmap "btn#{i}", "btn#{i}", (i-1) * 80, 50
			c.index = @game.faces[i-1]
			@addToLibrary c
			faces.addChild c
		@addToMain faces
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library['header'].height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		createjs.Sound.play "scene#{@scene}"
		for i in [1..4] by 1
			@library["btn#{i}"].addEventListener 'click', @evaluateAnswer
	evaluateAnswer: (e) =>
		if e.currentTarget.index is @answers[@index].a
			console.log @intento
			if @intento is false then @library['score'].plusOne()
			createjs.Sound.play 'good'
			@intento = false
			@finishEvaluation()
		else
			@intento = true
			@warning()
	finishEvaluation: ->
		TweenLite.to @library.qtext, 1, {alpha: 0, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library.qtext.text = @answers[@index].q
			TweenLite.to @library.qtext, 1, {alpha: 1}
		else
			@finish()
	finish: =>
		TweenLite.to [@library.propback, @library.bubblebmp, @library.btn1, @library.btn2, @library.btn3, @library.btn4], 1, {alpha:0, y:@ + 40}
		super
	window.U4A5 = U4A5