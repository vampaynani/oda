class U1A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id:'btnFalse' , src:'btn_false.png'}
			{id:'btnTrue' , src:'btn_true.png'}
			{id:'lugar1' , src:'aquarium.png'}
			{id:'lugar2' , src:'museum.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U1_A3_instructions.mp3', id:'instructions'}
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			scenes : [
				{	
					answers: [
						{text:"Dana and Jake aren't watching a movie.", respuestas:off}
						{text:"Dave and John are swimming with the dolphins.", respuestas:on}
						{text:"Emma and Doris aren't feeding the elephants.", respuestas:on}
						{text:"Alison isn't taking a nap.", respuestas:off}
						{text:"Dave and John aren't feeding the dolphins.", respuestas:on}
						{text:"Alison is eating a hamburger.", respuestas:off}
						{text:"Carl is taking a photograph.", respuestas:off}
						{text:"Mitch is eating a hamburger.", respuestas:on}
						{text:"Mitch and Stella are eating a snack.", respuestas:on}
						{text:"Stella isn't eating a banana.", respuestas:on}
						{text:"Emma and Doris aren't feeding the turtles.", respuestas:off}
						{text:"Carl is talking on his cell phone.", respuestas:on}
					]
				}
				{
					answers: [
						{text:"Spot is taking a picture.", respuestas:off}
						{text:"Diana is explaining the exhibit.", respuestas:on}
						{text:"Kyle is buying a snack.", respuestas:off}
						{text:"Katie isn't sitting down.", respuestas:on}
						{text:"Spot is posing for a picture.", respuestas:on}
						{text:"Ava isn't posing for a picture.", respuestas:on}
						{text:"Ava isn't listening to the guide.", respuestas:on}
						{text:"Katie isn't taking a nap.", respuestas:off}
						{text:"Zoe isn't watching the performance.", respuestas:off}
						{text:"Phil and Arthur aren't eating popcorn.", respuestas:on}
						{text:"Diana is listening to the guide.", respuestas:off}
						{text:"Lindsey is looking for souvenirs.", respuestas:on}
					]
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@escena = 1
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read, look and click on True or False.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 14, 0
		@library.score.txtCount.color = "#bfd951"
		@library.score.txtTotal.color = "#ff9933"
		@setScene(1).setClick().introEvaluation()
	setScene: (scene) ->
		@scene = @game.scenes[scene - 1]
		@answers = @shuffleNoRepeat @scene.answers, 7
		@insertBitmap 'boy', "lugar#{scene}",  stageSize.w / 2, 450, 'bc'
		if scene is 2 then @library.boy.y = 500
		@
	setClick:  ->
		@insertBitmap 'btnfalse', 'btnFalse',407, 541
		@insertBitmap 'btntrue', 'btnTrue',  280, 541
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
		@insertText 'frases', @answers[@index].text, '20px Quicksand', '#333', stageSize.w / 2, 500, 'center'
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
	window.U1A3 = U1A3