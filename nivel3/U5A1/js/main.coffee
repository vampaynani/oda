class U5A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id:'city1610', src:'1610.png'}
			{id:'city1940', src:'1940.png'}
			{id:'btn1610', src:'btn_1610.png'}
			{id:'btn1940', src:'btn_1940.png'}
			{id:'btnstart', src:'btn_start.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U5_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'city1610', 'city1610', stageSize.w / 2, stageSize.h / 2, 'mc'
		@insertBitmap 'city1940', 'city1940', stageSize.w / 2, stageSize.h / 2, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 15, 0
		@setCity().introEvaluation()
	setCity: ->

		btns = new createjs.Container()
		btns.x = 132
		btns.y = 280
		btns.name = 'btns'
		t = new createjs.Text 'There were big ships on the river.', '24px Quicksand', '#000'
		t.textAlign = 'center'
		t.x = 267
		b1 = @createBitmap 'btn1610','btn1610', 0, 80
		b2 = @createBitmap 'btn1940','btn1940', 300,80
		b3 = @createBitmap 'btnstart','btnstart', 267,205, 'tc'
		btns.addChild t, b1, b2, b3
		@addToMain btns
		@
	setDoc: ->
		doc = new createjs.Container()
		d = @createSprite "doc", ['docquestion', 'docwrong', 'docright'],null, 341,144
		doc.addChild d
		for i in [1..3]
			balloon = new createjs.Container()
			balloon.x = @game.balloons[i-1].x
			balloon.y = @game.balloons[i-1].y
			b = @createBitmap "balloon#{i}", "balloon#{i}", 0,0, 'bc'
			t = new createjs.Text @game.steps[0].texts[i-1].t, '16px Quicksand', '#fff'
			if i is 1
				t.x = -20
			else if i is 2
				t.x = 20
			t.y = -50
			t.textAlign = 'center'
			balloon.addChild b, t
			doc.addChild balloon
		@addToMain doc
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library['header'].height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenLite.from @library.city1610, 1, {alpha :0, x: 0, delay: 1}
		TweenLite.to @library.city1610, 1, {alpha :0, x: 1000, delay: 10}
		TweenLite.from @library.city1940, 1, {alpha :0, x: 0, delay: 11}
		TweenLite.to @library.city1940, 1, {alpha :0, x: 1000, delay: 21}
		TweenLite.from @library.btns, 1, {alpha :0, delay: 22}
	window.U5A2 = U5A2