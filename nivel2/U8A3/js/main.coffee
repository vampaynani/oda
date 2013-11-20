class U8A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'pas1', src:'pas1.png'}
			{id: 'pas2', src:'pas2.png'}
			{id: 'pas3', src:'pas3.png'}
			{id: 'pas4', src:'pas4.png'}


		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U8_A3_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			passports:[
				{x: 130, y: 130, values: ['Eric Schmidt', 'Germany', 'blue', 'brown', '1m 10cm']}
				{x: 430, y: 135, values: ['Melanie Murphy', 'Ireland', 'green', 'red', '1m 7cm']}
				{x: 130, y: 304, values: ['Cassandra Wang', 'China', 'dark brown', 'black', '1m 15cm']}
				{x: 434, y: 304, values: ['Saul Peterson', 'Canada', 'light brown', 'blonde', '1m 14cm']}
			]
			steps:[
				{pattern:["I have", "#wc", "eyes. I have straight", "#wc", "hair. I'm", "#wc", "tall.", "#br", "My name's", "#wc", "I'm from Germany."], targets:['blue','brown', '1m 10cm', 'Eric Schmidth']}
				[
					{pattern:["I have #wc eyes. I have straight #wc hair. I'm #wc tall."], targets:['blue','brown', '1m 10cm']}
					{pattern:["My name's #wc I'm from Germany"], targets:['Eric Schmidth']}
				]
				[
					{pattern:["I have #wc eyes. I have straight #wc hair. I'm #wc tall."], targets:['blue','brown', '1m 10cm']}
					{pattern:["My name's #wc I'm from Germany"], targets:['Eric Schmidth']}
				]
				[
					{pattern:["I have #wc eyes. I have straight #wc hair. I'm #wc tall."], targets:['blue','brown', '1m 10cm']}
					{pattern:["My name's #wc I'm from Germany"], targets:['Eric Schmidth']}
				]
			]
			positions:[
				{x:'65', y:'22'}
				{x:'77', y:'50'}
				{x:'84', y:'78'}
				{x:'90', y:'106'}
				{x:'68', y:'134'}
			]


		super null, manifest, sounds
	setStage: ->
		super
		@steps = @game.steps
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setPassports().setDropper( 1 ).introEvaluation()
	setPassports: ->
		i = 1
		for passport in @game.passports
			p = new createjs.Container()
			p.x = passport.x
			p.y = passport.y
			p.name = "pass#{i}"
			f = @createBitmap "p#{i}", "pas#{i}", 0, 0
			p.addChild f
			@addToMain p
			for j in [0..passport.values.length - 1] by 1
				n = new DroppableText "p#{i}v#{j}", passport.values[j], passport.values[j], @game.positions[j].x,  @game.positions[j].y, @stage
				@addToLibrary n
				p.addChild n
			i++
		@
	setDropper: (step) ->
		@step = step
		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.x = 120
			dropper.y = 500
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		i = 0
		j = 0
		npos = 0
		for t in @steps[step - 1].pattern
			ny = j * 30 + 5
			if t is '#br'
				npos = 0
				j++
			else if t is '#wc'
				h = new WordContainer "h#{i}", '', '#FFF', '#F00', npos, ny, 100, 22
				h.text.font = '20px Quicksand'
				h.index = i
				dropper.addChild h
				@addToLibrary h
				npos += 110
				i++
			else
				h = @createText '', t,'20px Quicksand','#333', npos, ny
				dropper.addChild h
				npos += h.getMeasuredWidth() + 20
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from [@library.pass1, @library.pass2, @library.pass3, @library.pass4], 1, {alpha: 0, delay: 1}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..@game.passports.length] by 1
			for j in [0..@game.passports[i - 1].values.length - 1] by 1
				@library["p#{i}v#{j}"].updateDrops @library.h0
				@library["p#{i}v#{j}"].addEventListener 'dropped', @evaluateAnswer
				@library["p#{i}v#{j}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			@finishEvaluation()
		else
			@warning()
			@answer.returnToPlace()
	finishEvaluation: =>
		#TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
		#@answer.returnToPlace()
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
	window.U8A3 = U8A3