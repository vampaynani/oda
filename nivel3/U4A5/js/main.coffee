class U5A2 extends Oda
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

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'propback', 'propback', 0, 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read the speech bubbles and click on the corresponding character.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 15, 0
		@setFaces().introEvaluation()
	setFaces: ->
		faces = new createjs.Container()
		faces.x = 446
		faces.y = 443
		b = @createBitmap 'bubbletext','bubbletext', 0,0
		t = new ClickableText 't', 'Ben is deaf, so they’re speaking in sign language. ', 1, 10, 5
		t.textAlign = 'center'
		faces.addChild b, t
		for i in [1..4]
			c = @createBitmap "btn#{i}", "btn#{i}", (i-1) * 80, 50
			faces.addChild c
		@addToMain faces
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library['header'].height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}

	window.U5A2 = U5A2