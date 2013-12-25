class ContainerFactory
	makeContainer: (opts) ->
		switch opts.type
			when 'label' then new LabelContainer opts

class LabelContainer
	LabelContainer.prototype = new createjs.Container()
	LabelContainer::Container_initialize = LabelContainer::initialize
	LabelContainer::initialize = (opts) ->
		@Container_initialize()
		@name = opts.name
		@x = opts.x
		@y = opts.y
		@text = new createjs.Text opts.text,opts.font,opts.color
		@text.name = opts.name
		@text.textAlign = opts.align ? 'left'
		@addChild @text
		@text
	constructor: (opts) ->
		@initialize opts
	update: (txt) ->
		@text.text = txt
		if @text.alpha is 0 then TweenLite.to @text, 0.5, {alpha: 1, y: 0} else TweenLite.from @text, 0.5, {alpha: 0, y: @text.y + 20}
	delete: ->
		TweenLite.to @text, 0.5, {alpha: 0, y: @text.y + 20}

class U2A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id:'letraM', src:'letra_M.png'}
			{id:'letraU', src:'letra_U.png'}
			{id:'letraS', src:'letra_S.png'}
			{id:'letraH', src:'letra_H.png'}
			{id:'letraR', src:'letra_R.png'}
			{id:'letraO', src:'letra_O.png'}
			{id:'mush', src:'mush.png'}
			{id:'priceblueberryJam', src:'price_blueberryJam.png'}
			{id:'pricebutter', src:'price_butter.png'}
			{id:'pricecarrots', src:'price_carrots.png'}
			{id:'pricechilis', src:'price_chilis.png'}
			{id:'pricecream', src:'price_cream.png'}
			{id:'priceeggs', src:'price_eggs.png'}
			{id:'pricemushrooms', src:'price_mushrooms.png'}
			{id:'pricepeachJam', src:'price_peachJam.png'}
			{id:'pricepeppers', src:'price_peppers.png'}
			{id:'propabuelita', src:'prop_abuelita.png'}
			{id:'propbg', src:'prop_bg.png'}
			{id:'clue', src:'text_clue.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/TU3_U2_A3_Instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U2_A3_Instructions2.mp3', id:'instructions2'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			header:'head'
			scenes:[
				{
					instructions: 'Read the price and click on the correct item.'
					container: {name: 'market'}
					background: {name: 'propbg', x: 426, y: 308, align: 'mc'}
					components: {
						texts: [
						]
						images: [
							{imgId: 'letraM', x:501, y:407, align: 'mc'}
							{imgId: 'letraU', x:324, y:408, align: 'mc'}
							{imgId: 'letraS', x:563, y:323, align: 'mc'}
							{imgId: 'letraH', x:303, y:317, align: 'mc'}
							{imgId: 'letraR', x:314, y:213, align: 'mc'}
							{imgId: 'letraO', x:374, y:316, align: 'mc'}
							{name: 'letraO2', imgId: 'letraO', x:454, y:316, align: 'mc'}
							{name: 'letraM2', imgId: 'letraM', x:576, y:163, align: 'mc'}
							{name: 'letraS2', imgId: 'letraS', x:389, y:257, align: 'mc'}
							{name: 'abuelita', imgId: 'propabuelita', x:554, y:254, align: 'mc', index: 15}
						]
						containers: [
							{type: 'label', name: 'answerlbl', text: '', font: '15px Quicksand', color: '#333', x: 415, y: 530, align: 'center'}
						]
						buttons: [
							{imgId: 'priceblueberryJam', x:521, y:404, align: 'mc', index: 'blueberry', action: 'checkPrice'}
							{imgId: 'pricebutter', x:350, y:218, align: 'mc', index: 'butter', action: 'checkPrice'}
							{imgId: 'pricecarrots', x:584, y:314, align: 'mc', index: 'carrots', action: 'checkPrice'}
							{imgId: 'pricechilis', x:580, y:176, align: 'mc', index: 'chilis', action: 'checkPrice'}
							{imgId: 'pricecream', x:416, y:253, align: 'mc', index: 'cream', action: 'checkPrice'}
							{imgId: 'priceeggs', x:322, y:315, align: 'mc', index: 'eggs', action: 'checkPrice'}
							{imgId: 'pricemushrooms', x:397, y:320, align: 'mc', index: 'mushrooms', action: 'checkPrice'}
							{imgId: 'pricepeachJam', x:347, y:406, align: 'mc', index: 'peach', action: 'checkPrice'}
							{imgId: 'pricepeppers', x:477, y:313, align: 'mc', index: 'peppers', action: 'checkPrice'}
						]
						drags: [
						]
						targets: [
						]
					}
					steps: [
						{type: 'txt', text:'It\'s three dollars and ten cents.', success: 'peach', show: 'letraU'}
						{type: 'txt', text:'They\'re three dollars a kilo.', success: 'carrots', show: 'letraS'}
						{type: 'txt', text:'It\'s ninety-five cents.', success: 'cream', show: 'letraS2'}
						{type: 'txt', text:'It\'s one dollar and fifty cents.', success: 'butter', show: 'letraR'}
						{type: 'txt', text:'They\'re two dollars and seventy-five cents.', success: 'chilis', show: 'letraM2'}
						{type: 'txt', text:'They\'re two dollars and forty cents a kilo.', success: 'peppers', show: 'letraO2'}
						{type: 'txt', text:'They\'re two dollars and seventy-five cents a kilo.', success: 'eggs', show: 'letraH'}
						{type: 'txt', text:'It\'s four dollars and fifty cents.', success: 'blueberry', show: 'letraM'}
						{type: 'txt', text:'They\'re four dollars and five cents a kilo.', success: 'mushrooms', show: 'letraO'}
					]
				}
				{
					instructions: 'Read the price and click on the correct item.'
					container: {name: 'market'}
					background: {name: 'propbg', x: 426, y: 308, align: 'mc'}
					components: {
						texts: [
						]
						images: [
							{name: 'abuelita', imgId: 'propabuelita', x:554, y:254, align: 'mc', index: 15}
						]
						containers: [
						]
						buttons: [
						]
						drags: [
							{type: 'img', imgId: 'letraM', x:501, y:407, align: 'mc'}
							{type: 'img', imgId: 'letraU', x:324, y:408, align: 'mc'}
							{type: 'img', imgId: 'letraS', x:563, y:323, align: 'mc'}
							{type: 'img', imgId: 'letraH', x:303, y:317, align: 'mc'}
							{type: 'img', imgId: 'letraR', x:314, y:213, align: 'mc'}
							{type: 'img', imgId: 'letraO', x:374, y:316, align: 'mc'}
							{type: 'img', name: 'letraO2', imgId: 'letraO', x:454, y:316, align: 'mc'}
							{type: 'img', name: 'letraM2', imgId: 'letraM', x:576, y:163, align: 'mc'}
							{type: 'img', name: 'letraS2', imgId: 'letraS', x:389, y:257, align: 'mc'}
						]
						targets:[
						]
					}
					steps: [
						{type: 'word', text:'mushrooms'}
					]	
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@scene = 0
		totalScore = 0
		for i in [0..@game.scenes.length - 1]
			totalScore += @game.scenes[i].steps.length
		@insertBitmap 'header', @game.header, stageSize.w / 2, 0, 'tc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, totalScore, 0
		@setScene().hideLetters().introEvaluation()
	setScene: ->
		currentScene = @game.scenes[@scene]
		
		#Create scene container
		cname = currentScene.container.name ? 'currentContainer'
		if @library[cname]
			c = @library[cname]
		else
			c = new createjs.Container()
			@addToMain c
		
		c.name = cname
		c.x =  currentScene.container.x ? 0
		c.y =  currentScene.container.y ? 0
		c.removeAllChildren()

		#Create background for scene container
		bgname = currentScene.background.name ? 'background'
		bgx = currentScene.background.x ? 0
		bgy = currentScene.background.y ? 0
		bga = currentScene.background.align ? ''
		b = @createBitmap bgname, bgname, bgx, bgy, bga
		c.addChild b

		#Create images for scene container
		for image in currentScene.components.images
			align = image.align ? ''
			name = image.name ? image.imgId
			b = @createBitmap name, image.imgId, image.x, image.y, align
			c.addChild b
			@addToLibrary b
		
		#Create containers for scene container
		factory = new ContainerFactory()
		for container in currentScene.components.containers 
			co = factory.makeContainer container
			c.addChild co
			@addToLibrary co

		#Create buttons for scene container
		for button in currentScene.components.buttons
			align = button.align ? ''
			name = button.name ? button.imgId
			b = @createBitmap name, button.imgId, button.x, button.y, align
			b.index = button.index
			b.addEventListener 'click', @[button.action]
			c.addChild b
			@addToLibrary b

		#Create drags for scene container
		for drag in currentScene.components.drags
			name = drag.name ? drag.imgId
			
			d = new Droppable name, (@preload.getResult drag.imgId), drag.index, drag.x, drag.y, @stage
			@setReg d, d.width / 2, d.height / 2
			d.addEventListener 'click', @[drag.action]
			c.addChild d
			@addToLibrary d

		for image in currentScene.components.images
			if image.index
				@library[image.name].parent.setChildIndex @library[image.name], image.index 
		
		@insertInstructions 'instructions', @game.scenes[@scene].instructions, 40, 100
		@
	hideLetters: ->
		letras = ['letraM', 'letraU', 'letraS', 'letraH', 'letraR', 'letraO', 'letraO2', 'letraM2', 'letraS2']
		for letra in letras
			@library[letra].visible = off
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library[@game.scenes[@scene].container.name], 1, {alpha :0, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: ->
		super
		if @game.scenes[@scene].steps.length > 0
			currentStep = @game.scenes[@scene].steps[@index]
			@library.answerlbl.update currentStep.text
	checkPrice: (e) =>
		currentAnswer = @game.scenes[@scene].steps[@index]
		if e.target.index is currentAnswer.success
			@library.score.plusOne()
		else
			@warning()
		@library[currentAnswer.show].visible = on
		TweenLite.to e.target, 0.5, {alpha: 0}
		@nextStep()
	nextStep: ->
		@index++
		if @index < @game.scenes[@scene].steps.length
			currentStep = @game.scenes[@scene].steps[@index]
			@library.answerlbl.update currentStep.text
		else
			@nextScene()
	nextScene: ->
		@scene++
		if @scene < @game.scenes.length
			@setScene @scene
	###
	setStage: ->
		super
		console.log window['createjs']['Bitmap']
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the clocks to the correct pictures.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setMarket().setFrase().setDrags().setQuestion().setFinal().introEvaluation()
	setMarket: ->
		tienda = new createjs.Container()
		tienda.x = 0
		tienda.y = 0
		back = @createBitmap 'propbg','propbg', 426, 308, 'mc'
		blueberry = @createBitmap 'priceblueberryJam', 'priceblueberryJam', 521, 404, 'mc'
		butter = @createBitmap 'pricebutter', 'pricebutter', 350, 218, 'mc'
		carrots = @createBitmap 'pricecarrots', 'pricecarrots', 584, 314, 'mc'
		chilis = @createBitmap 'pricechilis', 'pricechilis', 580, 176, 'mc'
		cream = @createBitmap 'pricecream', 'pricecream', 416, 253, 'mc'
		eggs = @createBitmap 'priceeggs', 'priceeggs', 322, 315, 'mc'
		mushrooms = @createBitmap 'pricemushrooms', 'pricemushrooms', 397, 320, 'mc'
		peach = @createBitmap 'pricepeachJam', 'pricepeachJam', 347, 406, 'mc'
		peppers = @createBitmap 'pricepeppers', 'pricepeppers', 477, 313, 'mc'
		abuelita = @createBitmap 'propabuelita', 'propabuelita', 554, 254, 'mc'
		tienda.addChild back, blueberry, butter, chilis, cream, eggs, mushrooms, peach, abuelita, carrots, peppers
		@addToMain tienda
		@
	setFrase: ->
		precio = new createjs.Text 'texto del precio', '20px Arial', '#333333'
		precio.x = stageSize.w / 2
		precio.y = 500
		precio.textAlign = 'center'
		@addToMain precio
		@	
	setDrags: ->
		letrablueberry = new Draggable 'letraM', (@preload.getResult 'letraM'), 0, 501, 407
		letrapeach = new Draggable 'letraU', (@preload.getResult 'letraU'), 1, 324, 408
		letracarrots = new Draggable 'letraS', (@preload.getResult 'letraS'), 2, 563, 323
		letraeggs = new Draggable 'letraH', (@preload.getResult 'letraH'), 3, 303, 317
		letrabutter = new Draggable 'letraR', (@preload.getResult 'letraR'), 4, 314, 213
		letramushrooms = new Draggable 'letraO', (@preload.getResult 'letraO'), 5, 374, 316
		letrapeppers = new Draggable 'letraO', (@preload.getResult 'letraO'), 6, 454, 316
		letrachilis = new Draggable 'letraM', (@preload.getResult 'letraM'), 7, 576, 163
		letracream  = new Draggable 'letraS', (@preload.getResult 'letraS'), 8, 389, 257
		letrablueberry.scaleX = letrapeach.scaleX = letracarrots.scaleX = letraeggs.scaleX = letrabutter.scaleX = letramushrooms.scaleX = letrapeppers.scaleX = letrachilis.scaleX = letracream.scaleX = 0.5
		letrablueberry.scaleY = letrapeach.scaleY = letracarrots.scaleY = letraeggs.scaleY = letrabutter.scaleY = letramushrooms.scaleY = letrapeppers.scaleY = letrachilis.scaleY = letracream.scaleY = 0.5
		@addToMain letrablueberry, letrapeach, letracarrots, letraeggs, letrabutter, letramushrooms, letrapeppers, letrachilis, letracream
		@
	setQuestion: ->
		q = new createjs.Text 'What vegetables are small and white?', '20px Arial', '#333333'
		q.x = stageSize.w / 2
		q.y = 480
		q.textAlign = 'center'
		@addToMain q

		palabra = new createjs.Container()
		palabra.x = 115
		palabra.y = 500

		cuadrito = new createjs.Graphics().beginFill( '' ).drawRect( 0, 0, 47, 40 ).beginStroke( '#f00' ).moveTo( 0, 40 ).lineTo( 47, 40 );
		for i in [1..9]
			c = new createjs.Shape cuadrito
			c.x = i * 55
			palabra.addChild c
		@addToMain palabra
		@insertBitmap 'clue', 'clue', stageSize.w / 2, 560, 'tc'
		@
	setFinal: ->
		final = new createjs.Container()
		final.x = 140
		final.y = 300
		for i in [0..8]
			if ( i % 2 == 0 )
				le = @createBitmap @letras[i], @letras[i], i*70, 0, 'mc'
			else le = @createBitmap @letras[i], @letras[i], i*70, 30, 'mc'
			final.addChild le
		@insertBitmap 'mush', 'mush', 0, 0
		@addToMain final
		@		
	introEvaluation: ->
		super
 
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
	initEvaluation: (e) =>
		super

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
		TweenLite.to @library['characters'], 0.5, {scaleX: 1.5, scaleY: 1.5, alpha: 0, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['characters'].currentFrame = @index
			@library['h1'].blink()
			@blink @library['backNube1']
			TweenLite.to @library['characters'], 0.5, {scaleX: 1, scaleY: 1, alpha: 1, ease: Back.easeOut}
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
	###
	window.U2A3 = U2A3