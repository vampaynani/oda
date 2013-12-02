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
			{id:'balloon1', src:'balloon_1.png'}
			{id:'balloon2', src:'balloon_2.png'}
			{id:'balloon3', src:'balloon_3.png'}
			{id:'btnrepeat', src:'btn_repeat.png'}
			{id:'docquestion', src:'doc_question.png'}
			{id:'docright', src:'doc_right.png'}
			{id:'docwrong', src:'doc_wrong.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U5_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			balloons : [
				{x:224, y:289}
				{x:613, y:356}
				{x:396, y:523}
			]
			steps: 
				[
					{
						texts:[
							{t:'You should blow it.'}
							{t:'You should go to bed.'}
							{t:'You should eat an apple.'}
						]
					}
					{
						texts:[
							{t:'You should drink a glass of water.'}
							{t:'You should wash with soap and water.'}
							{t:'You should go to the doctor.'}
						]
					}
				]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'btnrepeat', 'btnrepeat', 489, 197
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 15, 0
		@setDoc().introEvaluation()
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

	window.U5A2 = U5A2