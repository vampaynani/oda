class U6A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id: 'inst' , src: 'inst.png'}
		    {id: 'c1' , src: 'circle1.png'}
		    {id: 'c2' , src: 'circle2.png'}
		    {id:'btnrepeat', src:'btn_repeat.png'}
			{id:'camelrap0001', src:'camelrap0001.png'}
			{id:'propnota', src:'prop_nota.png'}

			{id:'fondonaranja', src:'fondo-naranja.png'}
			{id:'fondoverde', src:'fondo-verde.png'}
			{id:'fondo', src:'fondo.png'}

			{id:'howget1', src:'how_get0001.png'}
			{id:'howget2', src:'how_get0002.png'}
			{id:'howgetdrag', src:'how_get_drag.png'}

			{id:'whatbring1', src:'what_bring0001.png'}
			{id:'whatbring2', src:'what_bring0002.png'}
			{id:'whatbringdrag', src:'what_bring_drag.png'}

			{id:'whattrade1', src:'what_trade0001.png'}
			{id:'whattrade2', src:'what_trade0002.png'}
			{id:'whattradedrag', src:'what_trade_drag.png'}

			{id:'wherego1', src:'where_go0001.png'}
			{id:'wherego2', src:'where_go0002.png'}
			{id:'wheregodrag', src:'where_go_drag.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U7_A3_Instructions.mp3', id:'instructions'}
		]


		@game =
			btns:[

			]
			steps:[
				{
					targets:['how','did','you','get','there']
					drags:[
						{i:1 ,t:'how', x:145, y:52}
						{i:2 ,t:'did', x:119, y:17}
						{i:3 ,t:'you', x:25, y:55}
						{i:4 ,t:'get', x:84, y:52}
						{i:5 ,t:'there', x:48, y:15}
					]
					drop:[img:'fondoverde', x:121, y:153]
				}
				{
					targets:['what','did','you','bring']
					drags:[	
						{i:6 ,t:'what', x:111, y:19}
						{i:7 ,t:'did', x:36, y:16}
						{i:8 ,t:'you', x:134, y:56}
						{i:9 ,t:'bring', x:36, y:57}
					]
					drop:[img:'fondonaranja', x:532, y:153]
				}
				{
					targets:['what','did','you','trade']
					drags:[
						{i:10 ,t:'what', x:120, y:20}
						{i:11 ,t:'did', x:49, y:56}
						{i:12 ,t:'you', x:116, y:60}
						{i:13 ,t:'trade', x:37, y:20}
					]
					drop:[img:'fondonaranja', x:121, y:346]
				}
				{
					targets:['where','did','you','go']
					drags:[
						{i:14 ,t:'where', x:119, y:48}
						{i:15 ,t:'did', x:39, y:50}
						{i:16 ,t:'you', x:31, y:21}
						{i:17 ,t:'go', x:127, y:20}
					]
					drop:[img:'fondoverde', x:532, y:346]
				}
			]		
		super null, manifest, sounds
	setStage: ->
		super
		@steps = @game.steps
		@intento = 0
		stepsimg = (step.img for step in @steps)
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Put the questions in the correct order.', 40, 100
		@insertBitmap 'fondo', 'fondo', stageSize.w / 2 + 15, 60, 'tc'

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@setDropper(1).setDropper(2).setDropper(3).setDropper(4)
		#@setCamel()
	setDropper: (step) ->
		@step = step
		dropper = new createjs.Container()
		dropper.y = @steps[step - 1].drop[0].y
		dropper.x = @steps[step - 1].drop[0].x
		dropper.name = 'dropper'
		@addToMain dropper
		#dropper.removeAllChildren()

		back = @createBitmap 'back', @steps[step - 1].drop[0].img, 0, 0
		dropper.addChild back

		for opt in @steps[step - 1].drags
			d = new DroppableText "n1d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			d.text.color =  '#ffffff'
			dropper.addChild d
			@addToLibrary d
		

		for i in [0..@steps[step - 1].targets.length - 1] by 1
			h = new WordContainer "h#{i}", '', '#FFF', '#2393D6',(62*i)-24 , 100, 58, 22
			h.index = i
			dropper.addChild h
			@addToLibrary h
		question = @createText 'q', '?','24px Quicksand','#333', @steps[step - 1].targets.length*62 - 24, 100
		dropper.addChild question
		@
	setCamel: ->
		camel = new createjs.Container()
		camel.x = 0
		camel.y = 0
		camel.name = 'camel'
		
		btn1 = @createBitmap 'wheregodrag', 'wheregodrag', 478, 444
		btn2 = @createBitmap 'whattradedrag', 'whattradedrag', 125 ,444
		btn3 = @createBitmap 'whatbringdrag', 'whatbringdrag', 132, 500
		btn4 = @createBitmap 'howgetdrag', 'howgetdrag', 475, 500
			
		sp1 = @createSprite 'sp1', ['wherego1', 'wherego2'], null, 34, 163
		sp2 = @createSprite 'sp2', ['whattrade1', 'whattrade2'], null, 515, 259
		sp3 = @createSprite 'sp3', ['whatbring1', 'whatbring2'], null, 515, 163
		sp4 = @createSprite 'sp4', ['howget1', 'howget2'], null, 34, 259

		nota = @createBitmap 'propnota', 'propnota', 381, 398
		camello = @createBitmap 'camelrap0001', 'camelrap0001', 293, 140
		btn = @createBitmap 'btnrepeat', 'btnrepeat', 350, 346

		camel.addChild nota, camello, btn
		camel.addChild btn1, btn2, btn3, btn4
		camel.addChild sp1, sp2, sp3, sp4

		@addToMain camel
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 150
		container.y = @library.dropper.y + 200
		container.name = 'nube1'
		
 

		for opt in @game.opt1
			d = new DroppableText "n1d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 250
		container.y = @library.dropper.y + 200
		container.name = 'nube2'
		
 

		for opt in @game.opt2
			d = new DroppableText "n2d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 0.7}
	initEvaluation: (e) =>
		super
		for opt in @game.opt1
			@library["n1d#{opt.i}"].updateDrops @library.h0
			@library["n1d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n1d#{opt.i}"].initDragListener()
		for opt in @game.opt2
			if @steps[@step - 1].targets.length is 3
				@library["n2d#{opt.i}"].updateDrops @library.h1, @library.h2
			else
				@library["n2d#{opt.i}"].updateDrops @library.h1
			@library["n2d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n2d#{opt.i}"].initDragListener()
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
		for opt in @game.opt2
			@library["n2d#{opt.i}"].visible = true
			@library["n2d#{opt.i}"].returnToPlace()
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20}
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			@setDropper @index + 1
			TweenLite.to @library.dropper, 0.5, {alpha: 1}
			for opt in @game.opt1
				@library["n1d#{opt.i}"].updateDrops @library.h0
			for opt in @game.opt2
				if @steps[@step - 1].targets.length is 3
					@library["n2d#{opt.i}"].updateDrops @library.h1, @library.h2
				else
					@library["n2d#{opt.i}"].updateDrops @library.h1
		else
			@finish()
	finish: ->
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20}
		TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20}
		super
	window.U6A3 = U6A3