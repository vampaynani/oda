class U7A1 extends Oda
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
			{id:'creative', src:'creative.png'}
			{id:'creative2', src:'creative2.png'}
			{id:'hardworking', src:'hardworking.png'}
			{id:'hardworking2', src:'hardworking2.png'}
			{id:'intelligent', src:'intelligent.png'}
			{id:'intelligent2', src:'intelligent2.png'}
			{id:'lazy', src:'lazy.png'}
			{id:'lazy2', src:'lazy2.png'}
			{id:'popular', src:'popular.png'}
			{id:'popular2', src:'popular2.png'}
			{id:'shy', src:'shy.png'}
			{id:'shy2', src:'shy2.png'}
			{id:'stubborn', src:'stubborn.png'}
			{id:'stubborn2', src:'stubborn2.png'}
			{id:'vain', src:'vain.png'}
			{id:'vain2', src:'vain2.png'}


		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U7_A1_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = [
			[
				{id:'creative', i:1}
				{id:'creative2', i:1}
				{id:'hardworking', i:2}
				{id:'hardworking2', i:2}
				{id:'intelligent', i:3}
				{id:'intelligent2', i:3}
				{id:'lazy', i:4}
				{id:'lazy2', i:4}
				{id:'popular', i:5}
				{id:'popular2', i:5}
				{id:'shy', i:6}
				{id:'shy2', i:6}
				{id:'stubborn', i:7}
				{id:'stubborn2', i:7}
				{id:'vain', i:8}
				{id:'vain2', i:8}
			]
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on the cards and match the pictures and match the pictures with the adjectives.', 40, 100
		#b1 = new Button 'game1btn', (@preload.getResult 'game1btn'), 1, 753, 460
		#b2 = new Button 'game2btn', (@preload.getResult 'game2btn'), 2, 753, 505
		#b3 = new Button 'game3btn', (@preload.getResult 'game3btn'), 3, 753, 550	
		#@addToMain b1, b2, b3
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 100, 0
		@library.score.txtCount.color = "#BFD951"
		@library.score.txtTotal.color = "#0096DB"
		@setCards()
		@introEvaluation()
	setCards: (e) =>
		@time = 100
		@timer = setInterval @updateCounter, 1000
		j = 0
		game = 1
		juego = new createjs.Container()
		juego.x = 200
		juego.y = 180
		juego.name = 'juego'
		@clearButtons()
		@selected = new Array()
		@cards = @shuffle @game[game - 1]
		for h in [0..3]
			for i in [0..3]
				c = @createBitmap "carta#{h}_#{i}", "carta#{game}", i*130, h*110, 'mc'
				b = @createBitmap "cartab#{h}_#{i}", @cards[j].id, i*130, h*110, 'mc'
				#b.scaleX = b.scaleY = 0.6
				#c.scaleX = c.scaleY = 0.6
				c.index = @cards[j].i
				juego.addChild b, c
				@addToLibrary b, c
				j++
		@addToMain juego
		TweenLite.from juego, 0.5, {alpha:0, y:juego.y - 20}
		@
	updateCounter: =>
		@time--
		@library['score'].updateTotal @time
		@finish() if @time is 0
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		#TweenLite.from [@library.game1btn, @library.game2btn, @library.game3btn], 1, {alpha: 0, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for h in [0..3]
			for i in [0..3]
				c = @library["carta#{h}_#{i}"]
				c.addEventListener 'click', @evaluateAnswer
		#@library.game1btn.blink()
		#@library.game2btn.blink()
		#@library.game3btn.blink()
		#@library.game1btn.addEventListener 'click', @setCards
		#@library.game2btn.addEventListener 'click', @setCards
		#@library.game3btn.addEventListener 'click', @setCards
	clearButtons: ->
		#@library.game1btn.blink off
		#@library.game2btn.blink off
		#@library.game3btn.blink off
		#@library.game1btn.removeEventListener 'click', @setCards
		#@library.game2btn.removeEventListener 'click', @setCards
		#@library.game3btn.removeEventListener 'click', @setCards
	evaluateAnswer: (e) =>
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
	window.U7A1 = U7A1
