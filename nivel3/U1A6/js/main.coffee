class U1A6 extends Oda
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

			
			{id:'game1aquarium1' , src:'game1/aquarium1.png'}
			{id:'game1aquarium2' , src:'game1/aquarium2.png'}
			{id:'game1book1' , src:'game1/book1.png'}
			{id:'game1book2' , src:'game1/book2.png'}
			{id:'game1fair1' , src:'game1/fair1.png'}
			{id:'game1fair2' , src:'game1/fair2.png'}
			{id:'game1gallery1' , src:'game1/gallery1.png'}
			{id:'game1gallery2' , src:'game1/gallery2.png'}
			{id:'game1gift1' , src:'game1/gift1.png'}
			{id:'game1gift2' , src:'game1/gift2.png'}
			{id:'game1planet1' , src:'game1/planet1.png'}
			{id:'game1planet2' , src:'game1/planet2.png'}
			{id:'game1theater1' , src:'game1/theater1.png'}
			{id:'game1theater2' , src:'game1/theater2.png'}
			{id:'game1zoo1' , src:'game1/zoo1.png'}
			{id:'game1zoo2' , src:'game1/zoo2.png'}
			{id:'game2ant1' , src:'game2/ant1.png'}
			{id:'game2ant2' , src:'game2/ant2.png'}
			{id:'game2beetle1' , src:'game2/beetle1.png'}
			{id:'game2beetle2' , src:'game2/beetle2.png'}
			{id:'game2butterfly1' , src:'game2/butterfly1.png'}
			{id:'game2butterfly2' , src:'game2/butterfly2.png'}
			{id:'game2caterpillar1' , src:'game2/caterpillar1.png'}
			{id:'game2caterpillar2' , src:'game2/caterpillar2.png'}
			{id:'game2cricket1' , src:'game2/cricket1.png'}
			{id:'game2cricket2' , src:'game2/cricket2.png'}
			{id:'game2dragonfly1' , src:'game2/dragonfly1.png'}
			{id:'game2dragonfly2' , src:'game2/dragonfly2.png'}
			{id:'game2firefly1' , src:'game2/firefly1.png'}
			{id:'game2firefly2' , src:'game2/firefly2.png'}
			{id:'game2mosquito1' , src:'game2/mosquito1.png'}
			{id:'game2mosquito2' , src:'game2/mosquito2.png'}
			{id:'game3animals1' , src:'game3/animals1.png'}
			{id:'game3animals2' , src:'game3/animals2.png'}
			{id:'game3camer2' , src:'game3/camer2.png'}
			{id:'game3camera1' , src:'game3/camera1.png'}
			{id:'game3cell1' , src:'game3/cell1.png'}
			{id:'game3cell2' , src:'game3/cell2.png'}
			{id:'game3eat1' , src:'game3/eat1.png'}
			{id:'game3eat2' , src:'game3/eat2.png'}
			{id:'game3line1' , src:'game3/line1.png'}
			{id:'game3line2' , src:'game3/line2.png'}
			{id:'game3run1' , src:'game3/run1.png'}
			{id:'game3run2' , src:'game3/run2.png'}
			{id:'game3touch1' , src:'game3/touch1.png'}
			{id:'game3touch2' , src:'game3/touch2.png'}
			{id:'game3trash1' , src:'game3/trash1.png'}
			{id:'game3trash2' , src:'game3/trash2.png'}

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U1_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = [
			[			
				{id: 'game1aquarium1', i:1}
				{id: 'game1aquarium2', i:1}
				{id: 'game1book1', i:2}
				{id: 'game1book2', i:2}
				{id: 'game1fair1', i:3}
				{id: 'game1fair2', i:3}
				{id: 'game1gallery1', i:4}
				{id: 'game1gallery2', i:4}
				{id: 'game1gift1', i:5}
				{id: 'game1gift2', i:5}
				{id: 'game1planet1', i:6}
				{id: 'game1planet2', i:6}
				{id: 'game1theater1', i:7}
				{id: 'game1theater2', i:7}
				{id: 'game1zoo1', i:8}
				{id: 'game1zoo2', i:8}
			]
			[
				{id: 'game2ant1', i:1}
				{id: 'game2ant2', i:1}
				{id: 'game2beetle1', i:2}
				{id: 'game2beetle2', i:2}
				{id: 'game2butterfly1', i:3}
				{id: 'game2butterfly2', i:3}
				{id: 'game2caterpillar1', i:4}
				{id: 'game2caterpillar2', i:4}
				{id: 'game2cricket1', i:5}
				{id: 'game2cricket2', i:5}
				{id: 'game2dragonfly1', i:6}
				{id: 'game2dragonfly2', i:6}
				{id: 'game2firefly1', i:7}
				{id: 'game2firefly2', i:7}
				{id: 'game2mosquito1', i:8}
				{id: 'game2mosquito2', i:8}
			]
			[
				{id: 'game3animals1', i:1}
				{id: 'game3animals2', i:1}
				{id: 'game3camer2', i:2}
				{id: 'game3camera1', i:2}
				{id: 'game3cell1', i:3}
				{id: 'game3cell2', i:3}
				{id: 'game3eat1', i:4}
				{id: 'game3eat2', i:4}
				{id: 'game3line1', i:5}
				{id: 'game3line2', i:5}
				{id: 'game3run1', i:6}
				{id: 'game3run2', i:6}
				{id: 'game3touch1', i:7}
				{id: 'game3touch2', i:7}
				{id: 'game3trash1', i:8}
				{id: 'game3trash2', i:8}
			]
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on two cards and see if they match.', 40, 100
		b1 = new Button 'game1btn', (@preload.getResult 'game1btn'), 1, 753, 460
		b2 = new Button 'game2btn', (@preload.getResult 'game2btn'), 2, 753, 505
		b3 = new Button 'game3btn', (@preload.getResult 'game3btn'), 3, 753, 550	
		@addToMain b1, b2, b3
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 100, 0
		@library.score.txtCount.color = "#bfd951"
		@library.score.txtTotal.color = "#ff9933"
		@introEvaluation()
	setCards: (e) =>
		@time = 100
		@timer = setInterval @updateCounter, 1000
		j = 0
		game = e.currentTarget.index
		juego = new createjs.Container()
		juego.x = 200
		juego.y = 180
		juego.name = 'juego'
		@clearButtons()
		@selected = new Array()
		@cards = @shuffle @game[game - 1]
		for h in [0..3]
			for i in [0..3]
				c = @createBitmap "carta#{game}", "carta#{game}", i*130, h*110, 'mc'
				b = @createBitmap "cartab#{game}", @cards[j].id, i*130, h*110, 'mc'
				b.scaleX = b.scaleY = 0.9
				c.scaleX = c.scaleY = 0.9
				c.index = @cards[j].i
				c.addEventListener 'click', @evaluateAnswer
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
	window.U1A6 = U1A6