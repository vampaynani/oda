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

			{id:'game1cloudy', src:'game1/cloudy.png'}
			{id:'game1cold', src:'game1/cold.png'}
			{id:'game1hot', src:'game1/hot.png'}
			{id:'game1itscloudy', src:'game1/its_cloudy.png'}
			{id:'game1itscold', src:'game1/its_cold.png'}
			{id:'game1itshot', src:'game1/its_hot.png'}
			{id:'game1itsraining', src:'game1/its_raining.png'}
			{id:'game1itssunny', src:'game1/its_sunny.png'}
			{id:'game1itssnowing', src:'game1/its_swing.png'}
			{id:'game1itswindy', src:'game1/its_windy.png'}
			{id:'game1lookitsarainbow', src:'game1/look_its_a_rainbow.png'}
			{id:'game1rainbow', src:'game1/rainbow.png'}
			{id:'game1raining', src:'game1/raining.png'}
			{id:'game1snowing', src:'game1/snowing.png'}
			{id:'game1sunny', src:'game1/sunny.png'}
			{id:'game1windy', src:'game1/windy.png'}

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
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U5_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = [
			[
				{id:'game1cloudy', i:1}
				{id:'game1cold', i:2}
				{id:'game1hot', i:3}
				{id:'game1raining', i:4}
				{id:'game1sunny', i:5}
				{id:'game1snowing', i:6}
				{id:'game1windy', i:7}
				{id:'game1rainbow', i:8}
				{id:'game1itscloudy', i:1}
				{id:'game1itscold', i:2}
				{id:'game1itshot', i:3}
				{id:'game1itsraining', i:4}
				{id:'game1itssunny', i:5}
				{id:'game1itssnowing', i:6}
				{id:'game1itswindy', i:7}
				{id:'game1lookitsarainbow', i:8}
			]
			[
				{id:'game2butterflies', i:1}
				{id:'game2easter', i:2}
				{id:'game2flowers', i:3}
				{id:'game2leaves', i:4}
				{id:'game2scooter', i:5}
				{id:'game2sledding', i:6}
				{id:'game2snowman', i:7}
				{id:'game2swimming', i:8}
				{id:'game2ichasebutterflies', i:1}
				{id:'game2icelebrateeaster', i:2}
				{id:'game2ipickflowers', i:3}
				{id:'game2Iraketheleaves', i:4}
				{id:'game2irideascooter', i:5}
				{id:'game2igosledding', i:6}
				{id:'game2ibuildasnowman', i:7}
				{id:'game2igoswimming', i:8}
			]
			[
				{id:'game3cold', i:1}
				{id:'game3hot', i:2}
				{id:'game3hungry', i:3}
				{id:'game3mourn', i:4}
				{id:'game3nap', i:5}
				{id:'game3sick', i:6}
				{id:'game3thirsty', i:7}
				{id:'game3tired', i:8}
				{id:'game3shescold', i:1}
				{id:'game3sheshot', i:2}
				{id:'game3shehungry', i:3}
				{id:'game3shessad', i:4}
				{id:'game3shestakinganap', i:5}
				{id:'game3shessick', i:6}
				{id:'game3shesthirsty', i:7}
				{id:'game3shestired', i:8}
			]
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on two cards and see if they match.', 80, 200
		b1 = new Button 'game1btn', (@preload.getResult 'game1btn'), 1, 1506, 920
		b2 = new Button 'game2btn', (@preload.getResult 'game2btn'), 2, 1506, 1010
		b3 = new Button 'game3btn', (@preload.getResult 'game3btn'), 3, 1506, 1100	
		@addToMain b1, b2, b3
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 100, 0
		@clicked = 0

		@introEvaluation()
	setCards: (e) =>
		@time = 100
		@timer = setInterval @updateCounter, 1000
		j = 0
		game = e.target.index
		juego = new createjs.Container()
		juego.x = 400
		juego.y = 360
		juego.name = 'juego'
		@clearButtons()
		@selected = new Array()
		@cards = @shuffle @game[game - 1]
		for h in [0..3]
			for i in [0..3]
				c = @createBitmap "carta#{game}", "carta#{game}", i * 260, h * 220, 'mc'
				b = @createBitmap "cartab#{game}", @cards[j].id, i * 260, h * 220, 'mc'
				b.scaleX = b.scaleY = 0.8
				c.index = @cards[j].i
				c.addEventListener 'click', @evaluateAnswer
				juego.addChild b, c
				@addToLibrary b, c
				j++
		@addToMain juego
		TweenLite.from juego, 0.5, {alpha:0, y:juego.y - 40}
		@
	updateCounter: =>
		if @clicked is 1
			@time--
			@library['score'].updateTotal @time
			@finish() if @time is 0
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from [@library.game1btn, @library.game2btn, @library.game3btn], 1, {alpha: 0, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library.game1btn.blink()
		@library.game2btn.blink()
		@library.game3btn.blink()
		@library.game1btn.addEventListener 'click', @setCards
		@library.game2btn.addEventListener 'click', @setCards
		@library.game3btn.addEventListener 'click', @setCards
	clearButtons: ->
		@library.game1btn.blink off
		@library.game2btn.blink off
		@library.game3btn.blink off
		@library.game1btn.removeEventListener 'click', @setCards
		@library.game2btn.removeEventListener 'click', @setCards
		@library.game3btn.removeEventListener 'click', @setCards
	evaluateAnswer: (e) =>
		@clicked = 1
		if @selected.length < 2
			@selected.push e.target
			TweenLite.to e.target, 0.5, {alpha:0}
		if @selected.length is 2
			setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		if @selected[0].index is @selected[1].index
			@nextEvaluation()
		else
			TweenLite.to @selected[0], 0.5, {alpha:1}
			TweenLite.to @selected[1], 0.5, {alpha:1}
			@selected = new Array()
			#@warning()
	nextEvaluation: =>
		@index++
		@library.score.plusOne()
		if @index < @cards.length / 2
			@selected = new Array()
			createjs.Sound.play 'good'
		else
			@finish()
	finish: ->
		clearInterval @timer

		TweenLite.to [@library.game1btn, @library.game2btn, @library.game3btn], 1, {alpha: 0}
		TweenLite.to @library.juego, 1, {alpha:0, y:@library.juego.y - 20}
		super
	window.U5A6 = U5A6