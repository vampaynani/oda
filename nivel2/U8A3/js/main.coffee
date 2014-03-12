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
				{x: 260, y: 260, values: ['Eric Schmidt', 'Germany', 'blue', 'brown', '1m 10cm']}
				{x: 860, y: 270, values: ['Melanie Murphy', 'Ireland', 'green', 'red', '1m 7cm']}
				{x: 260, y: 608, values: ['Cassandra Wang', 'China', 'dark brown', 'black', '1m 15cm']}
				{x: 868, y: 608, values: ['Saul Peterson', 'Canada', 'light brown', 'blonde', '1m 14cm']}
			]
			steps:[
				{pattern:["I have", "#wc", "eyes. I have straight", "#wc", "hair. I'm", "#wc", "tall.", "#br", "My name's", "#wc", "I'm from Germany."], targets:['blue','brown', '1m 10cm', 'Eric Schmidt']}
				{pattern:["I'm", "#wc", ". I'm from", "#wc", ". I have", "#wc", "eyes.", "#br", "I have curly", "#wc", "hair. I'm 1m 7cm tall."], targets:['Melanie Murphy','Ireland', 'green', 'red']}
				{pattern:["I have", "#wc", "eyes. I have curly blonde hair.", "#br", "I'm", "#wc", ". I'm from", "#wc", ". I'm", "#wc", "tall."], targets:['light brown','Saul Peterson', 'Canada', '1m 14cm']}
				{pattern:["I'm from", "#wc", ". I have dark brown eyes. I have long", "#wc", "hair.", "#br", "I'm", "#wc", "tall. My name's", "#wc"], targets:['China','black', '1m 15cm', 'Cassandra Wang']}
			]
			positions:[
				{x:140, y:44}
				{x:164, y:100}
				{x:178, y:156}
				{x:190, y:212}
				{x:146, y:255}
			]


		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@steps = @shuffle @game.steps
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look at the passports, read and drag the words to complete the text.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 16, 0
		@setDropper( 1 ).setPassports().introEvaluation()
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
		if @library.dropper and @mainContainer.contains @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.x = 240
			dropper.y = 1000
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()
		
		i = 0
		j = 0
		npos = 0
		@targets = new Array()
		for t in @steps[step - 1].pattern
			ny = j * 60 + 14
			console.log ny
			if t is '#br'
				npos = 0
				j++
			else if t is '#wc'
				txt = @steps[step - 1].targets[i]
				h = new WordContainer "h#{i}", "#{txt}", '#FFF', '#eb188e', npos, ny + 20
				h.text.font = '40px Quicksand'
				h.index = i
				dropper.addChild h
				@addToLibrary h
				@targets.push h
				npos += h.width + 14
				i++
			else
				h = @createText '', t,'40px Quicksand','#333', npos, ny
				dropper.addChild h
				npos += h.getMeasuredWidth() + 24
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from [@library.pass1, @library.pass2, @library.pass3, @library.pass4], 1, {alpha: 0, delay: 1}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 40, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..@game.passports.length] by 1
			for j in [0..@game.passports[i - 1].values.length - 1] by 1 
				@library["p#{i}v#{j}"].updateDrops @targets
				@library["p#{i}v#{j}"].addEventListener 'dropped', @evaluateAnswer
				@library["p#{i}v#{j}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			@finishEvaluation()
			if @intento is 0 
				@library['score'].plusOne()
			@intento = 0

		else
			@warning()
			@intento = 1
			@answer.returnToPlace()
	finishEvaluation: =>
		createjs.Sound.play 'good'
		for target in @targets
			if target.text.text is ''
				return
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for i in [1..@game.passports.length] by 1
			for j in [0..@game.passports[i - 1].values.length - 1] by 1 
				@library["p#{i}v#{j}"].visible = true
				@library["p#{i}v#{j}"].returnToPlace()
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 40, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			@setDropper @index + 1
			for i in [1..@game.passports.length] by 1
				for j in [0..@game.passports[i - 1].values.length - 1] by 1 
					@library["p#{i}v#{j}"].updateDrops @targets
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 1000}
		else
			@finish()
	finish: ->
		TweenLite.to [@library.pass1, @library.pass2, @library.pass3, @library.pass4], 1, {alpha: 0}
		super
	window.U8A3 = U8A3