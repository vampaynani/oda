class U5A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id:'carta1', src:'carta1.png'}
			{id:'carta2', src:'carta2.png'}
			{id:'carta3', src:'carta3.png'}
			{id:'game1btn', src:'game1_btn.png'}
			{id:'game2btn', src:'game2_btn.png'}
			{id:'game3btn', src:'game3_btn.png'}

			{id:'game1cloudy', src:'game1/cloudy.PNG'}
			{id:'game1cold', src:'game1/cold.PNG'}
			{id:'game1hot', src:'game1/hot.PNG'}
			{id:'game1itscloudy', src:'game1/its_cloudy.PNG'}
			{id:'game1itscold', src:'game1/its_cold.PNG'}
			{id:'game1itshot', src:'game1/its_hot.png'}
			{id:'game1itsraining', src:'game1/its_raining.PNG'}
			{id:'game1itssunny', src:'game1/its_sunny.PNG'}
			{id:'game1itsswing', src:'game1/its_swing.PNG'}
			{id:'game1itswindy', src:'game1/its_windy.PNG'}
			{id:'game1lookitsarainbow', src:'game1/look_its_a_rainbow.png'}
			{id:'game1rainbow', src:'game1/rainbow.PNG'}
			{id:'game1raining', src:'game1/raining.PNG'}
			{id:'game1snowing', src:'game1/snowing.PNG'}
			{id:'game1sunny', src:'game1/sunny.PNG'}
			{id:'game1windy', src:'game1/windy.PNG'}

			{id:'game2butterflies', src:'game2/butterflies.png'}
			{id:'game2easter', src:'game2/easter.png'}
			{id:'game2flowers', src:'game2/flowers.png'}
			{id:'game2ibuildasnowman', src:'game2/i_build_a_snowman.png'}
			{id:'game2icelebrateeaster', src:'game2/i_celebrate_easter.png'}
			{id:'game2ichasebutterflies', src:'game2/i_chase_butterflies.png'}
			{id:'game2igosledding', src:'game2/i_go_sledding.png'}
			{id:'game2igoswimming', src:'game2/i_go_swimming.png'}
			{id:'game2ipickflowers', src:'game2/i_pick_flowers.png'}
			{id:'game2Iraketheleaves', src:'game2/I_rake_the_leaves.png'}
			{id:'game2irideascooter', src:'game2/i_ride_a_scooter.png'}
			{id:'game2leaves', src:'game2/leaves.png'}
			{id:'game2scooter', src:'game2/scooter.png'}
			{id:'game2sledding', src:'game2/sledding.png'}
			{id:'game2snowman', src:'game2/snowman.png'}
			{id:'game2swimming', src:'game2/swimming.png'}

			{id:'game3cold', src:'game3/cold.png'}
			{id:'game3hot', src:'game3/hot.png'}
			{id:'game3hungry', src:'game3/hungry.png'}
			{id:'game3mourn', src:'game3/mourn.png'}
			{id:'game3nap', src:'game3/nap.png'}
			{id:'game3shehungry', src:'game3/she_hungry.png'}
			{id:'game3shescold', src:'game3/shes_cold.png'}
			{id:'game3sheshot', src:'game3/shes_hot.png'}
			{id:'game3shessad', src:'game3/shes_sad.png'}
			{id:'game3shessick', src:'game3/shes_sick.png'}
			{id:'game3shestakinganap', src:'game3/shes_taking_a_nap.png'}
			{id:'game3shesthirsty', src:'game3/shes_thirsty.png'}
			{id:'game3shestired', src:'game3/shes_tired.png'}
			{id:'game3sick', src:'game3/sick.png'}
			{id:'game3thirsty', src:'game3/thirsty.png'}
			{id:'game3tired', src:'game3/tired.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [	
		]


		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'game1btn', 'game1btn', 753, 460
		@insertBitmap 'game2btn', 'game2btn', 753, 505
		@insertBitmap 'game3btn', 'game3btn', 753, 550
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setCards().introEvaluation()
	setCards:  ->
		juego = new createjs.Container()
		juego.x = 200
		juego.y = 180	
		game = 1
		for h in [0..3]
			for i in [0..3]
				c = @createBitmap 'carta'+game, 'carta'+game, i*130, h*110, 'mc'
				juego.addChild c
				@addToLibrary c
		@addToMain juego
		@
	introEvaluation: ->
		super
		###
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
		###
	initEvaluation: (e) =>
		super
		@library['characters'].currentFrame = @answers[@index].id
		createjs.Sound.play @answers[@index].sound
		TweenLite.to @library['characters'], 0.5, {alpha: 1, y: stageSize.h - 180, ease: Quart.easeOut}
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropname'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropname'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.blink off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
		@answer.returnToPlace()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['score'].updateCount( @index )
			@library['characters'].alpha = 1
			@library['characters'].y = stageSize.h - 180
			@library['characters'].currentFrame = @answers[@index].id
			createjs.Sound.play @answers[@index].sound
			TweenLite.from @library['characters'], 0.5, {alpha: 0, y: @library['characters'].y + 20, ease: Quart.easeOut}
		else
			@finish()
	repeatSound: =>
		createjs.Sound.play @answers[@index].sound
	finish: ->
		super
		for i in [1..6] by 1
			@library['name'+i].blink off
	window.U5A6 = U5A6