class U5A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'windy', src:'windy_image.png'}
			{id: 'sunny', src:'sunny_image.png'}
			{id: 'snowy', src:'snowing_image.png'}
			{id: 'rainy', src:'raining_image.png'}
			{id: 'cloudy', src:'cloudy_image.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U5_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U5_A2_raining.mp3', id:'srainy'}
		    {src:'sounds/TU2_U5_A2_cloudy.mp3', id:'scloudy'}
		    {src:'sounds/TU2_U5_A2_snowing.mp3', id:'ssnowy'}
		    {src:'sounds/TU2_U5_A2_sunny.mp3', id:'ssunny'}
		    {src:'sounds/TU2_U5_A2_windy.mp3', id:'swindy'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			steps: [
				{
					id:'windy'
					texts:[
						{p:'I', s:1, c:'my jacket.'}
						{p:'I', s:1, c:'my sweater.'}
					]
				}
				{
					id:'sunny'
					texts:[
						{p:'I', s:1, c:'my swimsuit.'}
						{p:'I', s:2, c:'my jacket.'}
					]
				}
				{
					id:'rainy'
					texts:[
						{p:'I', s:1, c:'my raincoat.'}
						{p:'I', s:1, c:'my umbrella.'}
					]
				}
				{
					id:'snowy'
					texts:[
						{p:'I', s:1, c:'my boots.'}
						{p:'I', s:1, c:'my coat.'}
					]
				}
				{
					id:'cloudy'
					texts:[
						{p:'I', s:2, c:'my swimsuit.'}
						{p:'I', s:1, c:'my jeans.'}
					]
				}
			]

		super null, manifest, sounds
	filterByID: (x) => 
		x isnt @selected
	setStage: ->
		super
		@steps = @shuffle @game.steps
		@stepsid = (step.id for step in @steps)
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'repeatbtn', 'repeatbtn', 800, 900, 'mc'
		@insertInstructions 'instructions', 'Listen and click on the correct option.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 15, 0
		@setStep().introEvaluation()
	setStep: ->
		@selected = @stepsid[@index]
		intento = 0

		stepsView = @stepsid.filter @filterByID
		stepsView = @shuffle stepsView
		img1 = @preload.getResult @selected
		img2 = @preload.getResult stepsView[0]
		choose = new ChooseBitmap 'chooseImg', img1, img2, 1, stageSize.w / 2, 300
		choose.scaleX = choose.scaleY = 0.6
		choose.setDistance 1100, 0
		choose.addEventListener 'selection', (e)=>
			e.currentTarget.removeAllEventListeners 'selection'
			@tindex = 0
			if e.success is false 
				@warning() 
				intento = 1
			else 
				if intento is 0
					@library.score.plusOne()
					createjs.Sound.play "good"
				@showText()
				TweenLite.to @library.repeatbtn, 0.5, {alpha :0}
		@addToMain choose
		TweenLite.from choose, 1, {alpha: 0, y: @library.chooseImg.y + 100, delay: 1}
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library['header'].height}
		TweenLite.from @library.repeatbtn, 1, {alpha :0, y: @library.repeatbtn.y + 40, delay: 0.5}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library.chooseImg.initListeners()
		createjs.Sound.play "s#{@stepsid[@index]}"
		@library.repeatbtn.addEventListener 'click', @repeatSound
	showText: () ->
		text = @steps[@index].texts[@tindex]
		intento = 0
		choosetxt = new ChooseText 'chooseTxt', text.p, "want", "don't want", text.c, text.s, 0, 900
		choosetxt.x = stageSize.w / 2 -  choosetxt.width / 2
		choosetxt.addEventListener 'selection', (e)=>
			if e.success is false 
				@warning() 
				intento = 1
			else
				if intento is 0
					@library.score.plusOne()
					createjs.Sound.play "good"
				@evaluateAnswer() 
		@addToMain choosetxt
	evaluateAnswer: (e) =>
		@tindex++
		if @tindex < @steps[@index].texts.length
			TweenLite.to @library.chooseTxt, 0.5, {y:@library.chooseTxt.y - 100, alpha:0}
			@showText()
		else
			@finishEvaluation()
	finishEvaluation: =>
		TweenLite.to @library.chooseTxt, 0.5, {y:@library.chooseTxt.y - 100, alpha:0}
		TweenLite.to @library.chooseImg, 0.5, {alpha: 0, y: @library.chooseImg.y - 100, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		createjs.Sound.stop()
		#@library.score.plusOne()
		if @index < @steps.length
			@setStep()
			@library.chooseImg.initListeners()
			createjs.Sound.play "s#{@stepsid[@index]}"
			TweenLite.to @library.repeatbtn, 0.5, {alpha :1}
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "s#{@stepsid[@index]}"
	finish: ->
		super
	window.U5A2 = U5A2