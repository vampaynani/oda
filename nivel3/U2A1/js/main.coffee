class U1A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
		    {id: 'inst' , src: 'texto_look.png'}
		    {id: 'c1' , src: 'circle1.png'}
		    {id: 'c2' , src: 'circle2.png'}
			{id: 'propblueberries', src:'prop_blueberries.png'}
			{id: 'propcheese', src:'prop_cheese.png'}
			{id: 'propcorn', src:'prop_corn.png'}
			{id: 'propeggs', src:'prop_eggs.png'}
			{id: 'propgreenPeppers', src:'prop_greenPeppers.png'}
			{id: 'prophoney', src:'prop_honey.png'}
			{id: 'propmarket', src:'prop_market.png'}
			{id: 'propmeat', src:'prop_meat.png'}
			{id: 'propmilk', src:'prop_milk.png'}
			{id: 'propmushrooms', src:'prop_mushrooms.png'}
			{id: 'proppeaches', src:'prop_peaches.png'}
			{id: 'propPeanutButter', src:'prop_PeanutButter.png'}
			{id: 'proppumpkins', src:'prop_pumpkins.png'}
			{id: 'propraspberries', src:'prop_raspberries.png'}
			{id: 'propstrawberryJelly', src:'prop_strawberryJelly.png'}
			{id: 'propsugar', src:'prop_sugar.png'}
			{id: 'propyogurt', src:'prop_yogurt.png'}
			{id: 'n3', src:'tag_food.png'}
			{id: 'n2', src:'tag_pronoun.png'}
			{id: 'n1', src:'tag_verb.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U1_A1_Instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [
			{w1:1, w2:2, w3:2, sound:'song' }
		    {w1:1, w2:1, w3:4, sound:'outside' }
		    {w1:0, w2:0, w3:0, sound:'picture'}
		    {w1:1, w2:3, w3:1, sound:'english' }
		    {w1:0, w2:1, w3:3, sound:'flute'}
		]
		@positions =
			market2:[
				{id:'propstrawberryJelly', x:'310', y:'106'}
				{id:'propPeanutButter', x:'467', y:'120'}
				{id:'propcorn', x:'223', y:'167'}
				{id:'propgreenPeppers', x:'294', y:'186'}
				{id:'propmushrooms', x:'370', y:'185'}
				{id:'propblueberries', x:'440', y:'172'}
				{id:'proppeaches', x:'530', y:'172'}
				{id:'propsugar', x:'322', y:'273'}
			]
			market1:[
				{id:'propmilk', x:'303', y:'105'}
				{id:'prophoney', x:'466', y:'116'}
				{id:'propcheese', x:'223', y:'159'}
				{id:'propmeat', x:'310', y:'160'}
				{id:'propyogurt', x:'370', y:'181'}
				{id:'propeggs', x:'434', y:'183'}
				{id:'propraspberries', x:'505', y:'201'}
				{id:'proppumpkins', x:'405', y:'270'}
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setDropper().setNube1().setNube2().setNube3().introEvaluation()
	setDropper: ->
		scene = new createjs.Container()
		scene.x = 88
		scene.y = 66
		a = @createBitmap 'propmarket', 'propmarket', 312, 169, 'mc'
		scene.addChild a

		for i in [0..7]
			a = @createBitmap @positions.market2[i].id,  @positions.market2[i].id,  @positions.market2[i].x,  @positions.market2[i].y, 'mc'
			scene.addChild a

		dropper = new createjs.Container()
		dropper.x = stageSize.w / 2 - 205
		dropper.y = 540
		dropper.name = 'dropper'

		t = new createjs.Text 'There','24px Arial','#333'
		t.x = 20
		t.y = 0
		dropper.addChild t

		h1 = new WordContainer 'h1', '', '', '#f39234', 90, 0, 60, 22
		h2 = new WordContainer 'h2', '', '', '#f39234', 160, 0, 80, 22
		h3 = new WordContainer 'h3', '', '', '#f39234', 250, 0, 140, 22
		
		t = new createjs.Text '.','24px Arial','#333'
		t.x = 393
		t.y = 0
		dropper.addChild t

		dropper.addChild h1, h2, h3
		@addToLibrary h1, h2, h3
		@addToMain dropper, scene
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 124
		container.y = 412
		container.name = 'nube1'
		back = @createBitmap 'backNube1', 'n1', 0, 0

		p1n1 = new ClickableText 'p1n1', 'are', 0, 25, 20
		p2n1 = new ClickableText 'p2n1', "aren't", 1, 69, 20
		p3n1 = new ClickableText 'p3n1', 'is', 2, 44, 47
		p4n1 = new ClickableText 'p4n1', "isn't", 3, 79, 62
		
		container.addChild back, p1n1, p2n1, p3n1, p4n1
		@addToLibrary back, p1n1, p2n1
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 291
		container.y = 432
		container.name = 'nube2'
		back = @createBitmap 'backNube2', 'n2', 0, 0
		p1n2 = new ClickableText 'p1n2', 'any', 0, 33, 10
		p2n2 = new ClickableText 'p2n2', "some", 1, 26, 35
		container.addChild back, p1n2, p2n2
		@addToLibrary back, p1n2, p2n2
		@addToMain container
		@
	setNube3: ->
		container = new createjs.Container()
		container.x = 421
		container.y = 383
		container.name = 'nube3'
		back = @createBitmap 'backNube3', 'n3', -6, 0

		p1n3 = new ClickableText 'p1n3', 'sugar', 0, 13, 34
		p2n3 = new ClickableText 'p2n3', "mushrooms", 1, 25, 75
		p3n3 = new ClickableText 'p3n3', 'peaches', 2, 92, 17
		p4n3 = new ClickableText 'p4n3', "peanut butter", 3, 67, 45
		p5n3 = new ClickableText 'p5n3', "corn", 4, 136, 74
		p6n3 = new ClickableText 'p6n3', "blueberries", 5, 99, 100
		p7n3 = new ClickableText 'p7n3', "fish", 6, 178, 12
		p8n3 = new ClickableText 'p8n3', "green peppers",7, 199, 36
		p9n3 = new ClickableText 'p9n3', "strawberry jelly", 8, 196, 69
		p10n3 = new ClickableText 'p10n3', "apples", 9, 212, 106

		container.addChild back, p1n3, p2n3, p3n3, p4n3, p5n3, p6n3, p7n3, p8n3, p9n3, p10n3
		@addToLibrary back, p1n3, p2n3, p3n3, p4n3, p5n3, p6n3, p7n3, p8n3, p9n3, p10n3
		@addToMain container
		@
	introEvaluation: ->
		super
		for i in [1..2] by 1
			@observer.subscribe 'init_evaluation', @library['p'+i+'n1'].onInitEvaluation
		for i in [1..4] by 1
			@observer.subscribe 'init_evaluation', @library['p'+i+'n2'].onInitEvaluation
		for i in [1..5] by 1
			@observer.subscribe 'init_evaluation', @library['p'+i+'n3'].onInitEvaluation
		
		
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['dropper'], 1, {alpha: 0, y: @library['dropper'].y + 20, delay: 1.2}
		TweenLite.from @library['nube1'], 1, {alpha: 0, y: @library['nube1'].y + 20, delay: 1.4}
		TweenLite.from @library['nube2'], 1, {alpha: 0, y: @library['nube2'].y + 20, delay: 1.5}
		TweenLite.from @library['nube3'], 1, {alpha: 0, y: @library['nube3'].y + 20, delay: 1.6, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library['h1'].blink()
		@blink @library['backNube1']
		for i in [1..2] by 1
			@library['p'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		false
	evaluateAnswer1: (e) =>
		@answer = e.target
		pt = @library['h1'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h1'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w1
				@answer.visible = false
				@library['h1'].changeText @answer.text.text
				@library['h1'].blink off
				@blink @library['backNube1'], off
				@library['h2'].blink()
				@blink @library['backNube2']
				for i in [1..4] by 1
					@library['p'+i+'n2'].addEventListener 'drop', @evaluateAnswer2
				false
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateAnswer2: (e) =>
		@answer = e.target
		pt = @library['h2'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h2'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w2
				@answer.visible = false
				@library['h2'].changeText @answer.text.text
				@library['h2'].blink off
				@blink @library['backNube2'], off
				@library['h3'].blink()
				@blink @library['backNube3']
				for i in [1..5] by 1
					@library['p'+i+'n3'].addEventListener 'drop', @evaluateAnswer3
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateAnswer3:(e) =>
		@answer = e.target;
		pt = @library['h3'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['h3'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].w3
				@answer.visible = false
				@library['h3'].changeText @answer.text.text
				@library['h3'].blink off
				@blink @library['backNube3'], off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		song = createjs.Sound.play @answers[@index].sound
		song.addEventListener 'complete', @clearEvaluation
	clearEvaluation: (e) =>
		for i in [1..2] by 1
			@library['p'+i+'n1'].visible = true
			@library['p'+i+'n1'].returnToPlace()
		for i in [1..4] by 1
			@library['p'+i+'n2'].visible = true
			@library['p'+i+'n2'].returnToPlace()
		for i in [1..5] by 1
			@library['p'+i+'n3'].visible = true
			@library['p'+i+'n3'].returnToPlace()
		for i in [1..3] by 1
			@library['h'+i].changeText ''
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['h1'].blink()
			@blink @library['backNube1']
			for i in [1..2] by 1
				@library['p'+i+'n1'].addEventListener 'drop', @evaluateAnswer1
		else
			@finish()
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		super
	window.U1A1 = U1A1