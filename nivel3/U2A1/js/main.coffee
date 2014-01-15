class U2A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}

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
		    {src:'sounds/TU3_U2_A1_Instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = [
			[
				{id:'propstrawberryJelly', x:310, y:106, a1:3, a2:0, a3:8}
				{id:'propPeanutButter', x:467, y:120, a1:2, a2:1, a3:3}
				{id:'propcorn', x:223, y:167, a1:3, a2:0, a3:4}
				{id:'propgreenPeppers', x:294, y:186, a1:0, a2:1, a3:7}
				{id:'propmushrooms', x:370, y:185, a1:0, a2:1, a3:1}
				{id:'propblueberries', x:440, y:172, a1:1, a2:0, a3:5}
				{id:'proppeaches', x:530, y:172, a1:1, a2:0, a3:2}
				{id:'propsugar', x:322, y:273, a1:2, a2:1, a3:0}
			]
			[
				{id:'propmilk', x:303, y:105, a1:2, a2:1, a3:3}
				{id:'prophoney', x:466, y:116, a1:2, a2:1, a3:1}
				{id:'propcheese', x:223, y:159, a1:3, a2:0, a3:2}
				{id:'propmeat', x:310, y:160, a1:3, a2:0, a3:0}
				{id:'propyogurt', x:370, y:181, a1:2, a2:1, a3:8}
				{id:'propeggs', x:434, y:183, a1:0, a2:1, a3:4}
				{id:'propraspberries', x:505, y:201, a1:0, a2:1, a3:9}
				{id:'proppumpkins', x:405, y:270, a1:0, a2:1, a3:5}
			]
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look and click on the words to make a sentence.', 40, 100

		@insertBitmap 'propmarket', 'propmarket', 400, 235, 'mc'
		@market = 1
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 16, 0
		@setFood(@market).setNube1().setNube2().setNube3().setDropper().introEvaluation()
	setFood: (food) ->
		if @library.dropper
			scene = @library.scene
		else
			scene = new createjs.Container()
			scene.x = 88
			scene.y = 66			
			scene.name = 'scene'
			@addToMain scene
		scene.removeAllChildren()

 
		@foodcollection = @game[food - 1]
		for i in [1..@foodcollection.length]
			a = @createBitmap @foodcollection[i-1].id,  @foodcollection[i-1].id,  @foodcollection[i-1].x,  @foodcollection[i-1].y, 'mc'
			scene.addChild a
			@addToLibrary a
		@addToMain  scene

		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 124
		container.y = 412
		container.name = 'nube1'
		back = @createBitmap 'backNube1', 'n1', 0, 0

		w11 = new ClickableText 'w11', 'are', 0, 25, 20
		w12 = new ClickableText 'w12', "aren't", 1, 69, 20
		w13 = new ClickableText 'w13', 'is', 2, 44, 47
		w14 = new ClickableText 'w14', "isn't", 3, 79, 62
		
		container.addChild back, w11, w12, w13, w14
		@addToLibrary back, w11, w12, w13, w14
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 291
		container.y = 432
		container.name = 'nube2'
		back = @createBitmap 'backNube2', 'n2', 0, 0
		w21 = new ClickableText 'w21', 'any', 0, 33, 10
		w22 = new ClickableText 'w22', "some", 1, 26, 35
		container.addChild back, w21, w22
		@addToLibrary back, w21, w22
		@addToMain container
		@
	setNube3: ->
		if @library.nube3
			nube3 = @library.nube3
		else
			nube3 = new createjs.Container()
			nube3.x = 421
			nube3.y = 383		
			nube3.name = 'nube3'
			@addToMain nube3
		nube3.removeAllChildren()

 
		back = @createBitmap 'backNube3', 'n3', -6, 0
		if @market is 1
			w31 = new ClickableText 'w31', 'sugar', 0, 13, 34
			w32 = new ClickableText 'w32', "mushrooms", 1, 25, 75
			w33 = new ClickableText 'w33', 'peaches', 2, 92, 17
			w34 = new ClickableText 'w34', "peanut butter", 3, 67, 45
			w35 = new ClickableText 'w35', "corn", 4, 136, 74
			w36 = new ClickableText 'w36', "blueberries", 5, 99, 100
			w37 = new ClickableText 'w37', "fish", 6, 178, 12
			w38 = new ClickableText 'w38', "green peppers",7, 199, 36
			w39 = new ClickableText 'w39', "strawberry jelly", 8, 196, 69
			w310 = new ClickableText 'w310', "apples", 9, 212, 106
		else
			w31 = new ClickableText 'w31', 'meat', 0, 13, 34
			w32 = new ClickableText 'w32', "honey", 1, 25, 75
			w33 = new ClickableText 'w33', 'cheese', 2, 92, 17
			w34 = new ClickableText 'w34', "milk", 3, 67, 45
			w35 = new ClickableText 'w35', "eggs", 4, 136, 74
			w36 = new ClickableText 'w36', "pumpkins", 5, 99, 100
			w37 = new ClickableText 'w37', "bacon", 6, 178, 12
			w38 = new ClickableText 'w38', "apples",7, 199, 36
			w39 = new ClickableText 'w39', "yogurt", 8, 196, 69
			w310 = new ClickableText 'w310', "raspberries", 9, 212, 106


		nube3.addChild back, w31,w32,w33,w34,w35,w36,w37,w38,w39,w310	
		@addToLibrary back, w31,w32,w33,w34,w35,w36,w37,w38,w39,w310	
		@addToMain nube3
		@
	setDropper: ->
		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.x = stageSize.w / 2 - 205
			dropper.y = 540	
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		t = new createjs.Text 'There','24px Arial','#333'
		t.x = 20
		t.y = 0
		dropper.addChild t

		h1 = new WordContainer 'wc1', '', '', '#eb2d3d', 90, 0, 60, 22
		h2 = new WordContainer 'wc2', '', '', '#eb2d3d', 160, 0, 80, 22
		h3 = new WordContainer 'wc3', '', '', '#eb2d3d', 250, 0, 140, 22
		
		t = new createjs.Text '.','24px Arial','#333'
		t.x = 393
		t.y = 0
		dropper.addChild t

		dropper.addChild h1, h2, h3
		@addToLibrary h1, h2, h3
		@addToMain dropper
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		#TweenMax.allFrom [@library['calendar'], @library['iconGym'], @library['iconArt'], @library['iconWatch'], @library['iconRead'], @library['iconLunch']], 1, {alpha: 0, delay: 0.5}
		TweenLite.from @library['nube1'], 1, {alpha: 0, y: @library['nube1'].y + 50, delay: 1}
		TweenLite.from @library['nube2'], 1, {alpha: 0, y: @library['nube2'].y + 50, delay: 1.1}
		TweenLite.from @library['nube3'], 1, {alpha: 0, y: @library['nube3'].y + 50, delay: 1.2}
		TweenLite.from @library['dropper'], 1, {alpha: 0, y: @library['dropper'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@blink @library[@foodcollection[@index].id]
		@blink @library['nube1']
		for i in [1..4] by 1
			@library['w1'+i].addEventListener 'click', @evaluateAnswer1
	evaluateAnswer1: (e) =>
		@answer = e.target
		if @answer.index is @foodcollection[@index].a1
			createjs.Sound.play 'good'
			@blink @library['nube1'], off
			@library['wc1'].changeText @answer.text.text
			@blink @library['nube2']
			for i in [1..4] by 1
				@library['w1'+i].removeEventListener 'click', @evaluateAnswer1
			for i in [1..2] by 1
				@library['w2'+i].addEventListener 'click', @evaluateAnswer2
		else
			@warning()
	evaluateAnswer2: (e) =>
		@answer = e.target
		if @answer.index is @foodcollection[@index].a2
			createjs.Sound.play 'good'
			@blink @library['nube2'], off
			@library['wc2'].changeText @answer.text.text
			@blink @library['nube3']
			for i in [1..2] by 1
				@library['w2'+i].removeEventListener 'click', @evaluateAnswer2
			for i in [1..10] by 1
				@library['w3'+i].addEventListener 'click', @evaluateAnswer3
		else
			@warning()
	evaluateAnswer3: (e) =>
		@answer = e.target
		if @answer.index is @foodcollection[@index].a3
			createjs.Sound.play 'good'
			@blink @library['nube3'], off
			@blink @library[@foodcollection[@index].id], off
			@library['wc3'].changeText @answer.text.text
			for i in [1..10] by 1
				@library['w3'+i].removeEventListener 'click', @evaluateAnswer3
			setTimeout @finishEvaluation, 1 * 1000
		else
			@warning()
	finishEvaluation: =>
		@library['score'].plusOne()
		TweenLite.to @library['dropper'], 0.5, {alpha: 0, ease: Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @foodcollection.length
			@library['wc1'].changeText ''
			@library['wc2'].changeText ''
			@library['wc3'].changeText ''
			@blink @library[@foodcollection[@index].id]
			@blink @library['nube1']
			for i in [1..4] by 1
				@library['w1'+i].addEventListener 'click', @evaluateAnswer1
			TweenLite.to @library['dropper'], 0.5, {alpha: 1, ease: Quart.easeOut}
		else
			@library['wc1'].changeText ''
			@library['wc2'].changeText ''
			@library['wc3'].changeText ''
			TweenLite.to @library['dropper'], 0.5, {alpha: 1, ease: Quart.easeOut}
			if @market is 1
				@market = 2
				@index = 0
				@setFood(@market).setNube3().setDropper().initEvaluation()
			else
				@finish()
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		#TweenMax.to [@library['calendar'], @library['iconGym'], @library['iconArt'], @library['iconWatch'], @library['iconRead'], @library['iconLunch']], 1, {alpha: 0, delay: 0.5}
		TweenLite.to @library['nube1'], 1, {alpha: 0, y: @library['nube1'].y + 50, delay: 0.1}
		TweenLite.to @library['nube2'], 1, {alpha: 0, y: @library['nube2'].y + 50, delay: 0.1}
		TweenLite.to @library['nube3'], 1, {alpha: 0, y: @library['nube3'].y + 50, delay: 0.1}
		TweenLite.to @library['dropper'], 1, {alpha: 0, y: @library['dropper'].y + 20, delay: 0.1}
		TweenLite.to @library['propmarket'], 1, {alpha: 0, y: @library['propmarket'].y + 20, delay: 0.1}
		TweenLite.to @library['scene'], 1, {alpha: 0, y: @library['scene'].y + 20, delay: 0.1}
		super
	window.U2A1 = U2A1