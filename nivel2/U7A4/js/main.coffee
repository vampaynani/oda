class U7A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'nino1', src:'boy.png'}
			{id: 'nino2', src:'girl.png'}
			{id: 'btnFalse', src:'btn_False.png'}
			{id: 'btnTrue', src:'btn_True.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U7_A4_instructions.mp3', id:'instructions'}
		]
		@game =
			scenes : [
				{	
					answers: [
						{text:"I always watch TV.", respuestas:off}
						{text:"I sometimes take a shower.", respuestas:on}
						{text:"I sometimes read.", respuestas:on}
						{text:"I never ride my bike.", respuestas:off}
						{text:"I never take a bath.", respuestas:on}
						{text:"I always floss my teeth.", respuestas:on}
						{text:"I sometimes play baseball on Wednesday.", respuestas:off}
					]
				}
				{
					answers: [
						{text:"aI always watch TV.", respuestas:off}
						{text:"aI sometimes take a shower.", respuestas:on}
						{text:"aI sometimes read.", respuestas:on}
						{text:"aI never ride my bike.", respuestas:off}
						{text:"aI never take a bath.", respuestas:on}
						{text:"aI always floss my teeth.", respuestas:on}
						{text:"aI sometimes play baseball on Wednesday.", respuestas:off}
					]
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@escena = 1
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 14, 0
		@setScene(1).setClick().introEvaluation()
	setScene: (scene) ->
		@scene = @game.scenes[scene - 1]
		@answers = @shuffleNoRepeat @scene.answers, 7
		@insertBitmap 'boy', "nino#{scene}",  111,  158
		@library.boy.scaleX = @library.boy.scaleY = 0.9
		@
	setClick:  ->
		@insertBitmap 'btnfalse', 'btnFalse', 536, 535
		@insertBitmap 'btntrue', 'btnTrue', 409, 536
		@library.btnfalse.index = off
		@library.btntrue.index = on
		@library.btntrue.addEventListener 'click', @evaluateAnswer
		@library.btnfalse.addEventListener 'click', @evaluateAnswer
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0}
		TweenLite.from @library.boy, 1, {alpha: 0, y: @library.boy.y - 10, ease: Quart.easeOut}
		TweenLite.from @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 10, ease: Quart.easeOut, delay: 0.5}
		TweenLite.from @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 10, ease: Quart.easeOut, delay:0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@insertText 'frases', @answers[@index].text, '20px Quicksand', '#333', 520, 500, 'center'
		TweenLite.from @library.frases, 0.5, {alpha: 0, y: @library.frases - 10, ease: Quart.easeOut}
	evaluateAnswer: (e) =>
		@answer = e.target
		if @answer.index is @answers[@index].respuestas
			@library.score.plusOne()
			createjs.Sound.play 'good'
		else
			@warning()
		@finishEvaluation()	
	finishEvaluation: =>
		TweenLite.to @library.frases, 0.5, {alpha: 0, y: @library.frases.y - 20, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library.frases.text = @answers[@index].text
			TweenLite.to @library.frases, 0.5, {alpha: 1, y: @library.frases.y + 20, ease: Back.easeOut}
		else
			if @escena is 1
				@index = 0
				@escena = 2
				TweenLite.to @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 10, ease: Quart.easeOut}
				TweenLite.to @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 10, ease: Quart.easeOut}
				TweenLite.to @library.boy, 1, {alpha: 0, y: @library.boy.y - 10, ease: Quart.easeOut}
				TweenLite.to @library.frases, 0.5, {alpha: 0, y: @library.frases - 10, ease: Quart.easeOut}
				@setScene(2).setClick().initEvaluation()
			else
				@finish()
	finish: ->
		super
		TweenLite.to @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 10, ease: Quart.easeOut}
		TweenLite.to @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 10, ease: Quart.easeOut}
		TweenLite.to @library.boy, 1, {alpha: 0, y: @library.boy.y - 10, ease: Quart.easeOut}
		TweenLite.to @library.frases, 0.5, {alpha: 0, y: @library.frases - 10, ease: Quart.easeOut}
	window.U7A4 = U7A4