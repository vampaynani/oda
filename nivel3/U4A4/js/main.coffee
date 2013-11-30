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
			{id: 'btnH', src:'btn_H.png'}
			{id: 'btnU', src:'btn_U.png'}
			{id: 'btnrepeat', src:'btn_repeat.png'}

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
		@insertBitmap 'btnrepeat', 'btnrepeat', 489, 197
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 15, 0
		@setGame().introEvaluation()
	setGame: ->
		@insertBitmap 'btnU', 'btnU', 110, 353
		@insertBitmap 'btnH', 'btnH', 239, 146
		@insertBitmap 'btnrepeat', 'btnrepeat', 600,541

		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library['header'].height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}

	window.U5A2 = U5A2