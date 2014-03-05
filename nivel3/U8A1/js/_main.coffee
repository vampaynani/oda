class U8A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id: 'inst' , src: 'inst.png'}
		    {id: 'c1' , src: 'circle1.png'}
		    {id: 'c2' , src: 'circle2.png'}

			{id: 'imgballon', src: 'img_ballon.png'}
			{id: 'imgbus', src: 'img_bus.png'}
			{id: 'imgicecream', src: 'img_icecream.png'}
			{id: 'imgmovies', src: 'img_movies.png'}
			{id: 'imgocean', src: 'img_ocean.png'}
			{id: 'imgpizza', src: 'img_pizza.png'}
			{id: 'imgsandcastle', src: 'img_sandcastle.png'}
			{id: 'imgscuba', src: 'img_scuba.png'}
			{id: 'imgshopping', src: 'img_shopping.png'}
			{id: 'imgvolleyball', src: 'img_volleyball.png'}
			{id: 'bg', src: 'prop_bg.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U8_A1_Instructions.mp3', id:'instructions'}
		]
		@game =
			steps : [ 
				{img:'imgballon', frase: 'What are they going to buy?', targets: ['they','are','going','to','buy','a','balloon'],x:473 ,y:317}
				{img:'imgbus', frase: 'What is she going to do?', targets: ['She','is','going','to','catch','the','bus'],x:390,y:462}
				{img:'imgicecream', frase: 'What is she going to do?', targets: ['She','is','going','to','buy','an','ice cream'], x:188, y:259}
				{img:'imgmovies', frase: 'Where is going to go?', targets: ['He','is','going','to','go','to','the','movies'],x:697,y:421}
				{img:'imgocean', frase: 'What are they going to do?', targets: ['They','are','going','to','swim','in','the','ocean'], x:314, y :264}
				{img:'imgpizza', frase: 'What are they going to do?', targets: ['They','are','going','to','eat','pizza'],x:229,y:412}
				{img:'imgsandcastle', frase: 'What is he going to do?', targets: ['He','is','going','to','build','a','sandcastle'], x:552 , y:305}
				{img:'imgscuba', frase: 'what are they going to do?', targets: ['They','are','going','to','go','scuba diving'], x:693, y:235}
				{img:'imgshopping', frase: 'What is he going to do?', targets: ['He','is','going','to','go','shopping'],x:557,y:422}
				{img:'imgvolleyball', frase: 'What is going to do?', targets: ['She','is','going','to','hit','the','ball'], x:445, y:351}
			]

			opt1:[
				{i:1,  t:'swim', x:0 ,y:0}
				{i:2,  t:'ball', x:0 ,y:0}
				{i:3,  t:'he', x:0 ,y:0}
				{i:4,  t:'is', x:0 ,y:0}
				{i:5,  t:'movies', x:0 ,y:0}
				{i:6,  t:'an', x:0 ,y:0}
				{i:7,  t:'balloon', x:0 ,y:0}
				{i:8,  t:'ice cream', x:0 ,y:0}
				{i:9,  t:'how', x:0 ,y:0}
				{i:10, t:'scuba diving', x:0 ,y:0}
				{i:11, t:'she', x:0 ,y:0}
				{i:12, t:'jump', x:0 ,y:0}
				{i:13, t:'a', x:0 ,y:0}
				{i:14, t:'eat', x:0 ,y:0}
				{i:15, t:'going', x:0 ,y:0}
				{i:16, t:'what', x:0 ,y:0}
				{i:17, t:'to', x:0 ,y:0}
				{i:18, t:'shooping', x:0 ,y:0}
				{i:19, t:'are', x:0 ,y:0}
				{i:20, t:'do', x:0 ,y:0}
				{i:21, t:'they', x:0 ,y:0}
				{i:22, t:'in ', x:0 ,y:0}
				{i:23, t:'build', x:0 ,y:0}
				{i:24, t:'ocean', x:0 ,y:0}
				{i:25, t:'buy', x:0 ,y:0}
				{i:26, t:'sandcastle', x:0 ,y:0}
				{i:27, t:'bus', x:0 ,y:0}
				{i:28, t:'go', x:0 ,y:0}
				{i:29, t:'the', x:0 ,y:0}
				{i:30, t:'hit', x:0 ,y:0}
				{i:31, t:'pizza', x:0 ,y:0}
				{i:32, t:'catch', x:0 ,y:0}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@steps =  @game.steps
		@intento = 0
		stepsimg = (step.img for step in @steps)
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read and drag the words to make questions.', 40, 100
		imgs = @createSprite 'images', stepsimg, null, stageSize.w / 2, 235, 'mc'
		imgs.scaleX = imgs.scaleY = 0.3
		@addToMain imgs
		@insertBitmap 'bg', 'bg', 132, 187

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@setCharacters()
		@setDropper(1).setNube1().introEvaluation()
	setCharacters: ->
		for i in [1..@steps.length]
			p = @createBitmap  "img#{i}", @steps[i - 1].img,  @steps[i - 1].x,  @steps[i - 1].y, 'mr'
			@addToLibrary p
			p.scaleY = p.scaleX = 0.5
			@addToMain p
	setDropper: (step) ->
		@step = step
		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.y = 400
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		frase = @createText 'frase', @steps[step - 1].frase,'24px Quicksand','#333', 0, 120, 'center'
		frase.x =  stageSize.w / 2 - frase.getMeasuredWidth() / 2 + 50
		@addToLibrary frase
		dropper.addChild frase

		for i in [0..@steps[step - 1].targets.length - 1] by 1
			h = new WordContainer "h#{i}", '', '#FFF', '#F00', 90*i + 10, 155, 80, 22
			h.index = i
			dropper.addChild h
			@addToLibrary h 

		dropper.x = stageSize.w / 2 - @steps[step - 1].targets.length*95 / 2 + 50
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 110
		container.y = 126
		container.name = 'nube1'
		ye = 20
		equis = 0		
		
		for opt in @game.opt1

			if opt.i <= 10

				ye = 0

			else if opt.i >= 23
				ye = 40
			else 
				ye = 20	

			d = new DroppableText "n1d#{opt.i}", opt.t, opt.t, equis, ye, @stage



			equis = equis + d.text.getMeasuredWidth() + 30 
			#console.log d.text.getMeasuredWidth()
			container.addChild d
			@addToLibrary d

			if opt.i is 10
				equis = 15
			if opt.i is 22
				equis = 40
		@addToMain container
		@
 
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 0.7}
		TweenLite.from @library.images, 1, {alpha: 0, y: @library.images.y + 20, delay: 0.7}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20, delay: 0.9}
 	initEvaluation: (e) =>
		super
		for opt in @game.opt1
			@library["n1d#{opt.i}"].updateDrops @library.h0
			@library["n1d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n1d#{opt.i}"].initDragListener()
 
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			createjs.Sound.play 'good'
			@finishEvaluation() 
		else
			@warning()
			@intento++
			console.log @intento
			@answer.returnToPlace()
			if @intento is 2
				@intento = 0			
				@clearEvaluation() 
	finishEvaluation: =>
		if @steps[@step - 1].targets.length is 3
			if @library.h0.text.text is '' or @library.h1.text.text is '' or @library.h2.text.text is ''
				return
		else
			if @library.h0.text.text is '' or @library.h1.text.text is ''
				return
		@library['score'].plusOne()	
		@intento = 0			
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for opt in @game.opt1
			@library["n1d#{opt.i}"].visible = true
			@library["n1d#{opt.i}"].returnToPlace()
		 
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20}
		TweenLite.to @library.images, 0.5, {scaleX: 1, scaleY: 1, alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			@library.images.currentFrame = @index
			@setDropper @index + 1
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: @library.images.y + 10}
			TweenLite.to @library.images, 0.5, {scaleX: 0.3, scaleY: 0.3, alpha: 1, ease: Back.easeOut}
			for opt in @game.opt1
				@library["n1d#{opt.i}"].updateDrops @library.h0
			 
		else
			@finish()
	finish: ->
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20}
		TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20}
		super
	window.U8A1 = U8A1