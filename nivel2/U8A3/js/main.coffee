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
				{pattern:["I have", "#wc", "eyes. I have straight", "#wc", "hair. I'm", "#wc", "tall.", "#br", "My name's", "#wc", "I'm from Germany."], targets:['blue','brown', '1m 10cm', 'Eric Schmidt']}
				{pattern:["I'm", "#wc", ". I'm from", "#wc", ". I have", "#wc", "eyes.", "#br", "I have curly", "#wc", "hair. I'm 1m 7cm tall."], targets:['Melanie Murphy','Ireland', 'green', 'red']}
				{pattern:["I have", "#wc", "eyes. I have curly blonde hair.", "#br", "I'm", "#wc", ". I'm from", "#wc", ". I'm", "#wc", "tall."], targets:['light brown','Saul Peterson', 'Canada', '1m 14cm']}
				{pattern:["I'm from", "#wc", ". I have dark brown eyes. I have long", "#wc", "hair.", "#br", "I'm", "#wc", "tall. My name's", "#wc"], targets:['China','black', '1m 15cm', 'Cassandra Wang']}
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
		@intento = 0
		@steps = @shuffle @game.steps
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 16, 0
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
			dropper.x = 120
			dropper.y = 500
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()
		
		i = 0
		j = 0
		npos = 0
		@targets = new Array()
		for t in @steps[step - 1].pattern
			ny = j * 30 + 7
			if t is '#br'
				npos = 0
				j++
			else if t is '#wc'
				txt = @steps[step - 1].targets[i]
				h = new WordContainer "h#{i}", "#{txt}", '#FFF', '#F00', npos, ny
				h.text.font = '20px Quicksand'
				h.index = i
				dropper.addChild h
				@addToLibrary h
				@targets.push h
				npos += h.width + 7
				i++
			else
				h = @createText '', t,'20px Quicksand','#333', npos, ny
				dropper.addChild h
				npos += h.getMeasuredWidth() + 12
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
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			@setDropper @index + 1
			for i in [1..@game.passports.length] by 1
				for j in [0..@game.passports[i - 1].values.length - 1] by 1 
					@library["p#{i}v#{j}"].updateDrops @targets
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 500}
		else
			@finish()
	finish: ->
		TweenLite.to [@library.pass1, @library.pass2, @library.pass3, @library.pass4], 1, {alpha: 0}
		super
	window.U8A3 = U8A3