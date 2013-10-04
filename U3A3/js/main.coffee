class U3A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 
			{id:'guia1', src: 'guia1.png'}
			{id:'guia2', src: 'guia2.png'}
			{id:'guia3', src: 'guia3.png'}
			{id:'guia4', src: 'guia4.png'}

			{id:'btnsalad', src: 'btn_salad.png'}
			{id:'btnsandwich', src: 'btn_sandwich.png'}
			{id:'propsalad', src: 'prop_salad.png'}
			{id:'propsandwich', src: 'prop_sandwich.png'}

			{id:'wrong', src: 'wrong.png'}
			{id:'correct', src: 'correct.png'}

			{id:'checkchefscene0001', src: 'chef/check_chef_scene0001.png'}
			{id:'checkchefscene0002', src: 'chef/check_chef_scene0002.png'}
			{id:'checkchefscene0003', src: 'chef/check_chef_scene0003.png'}
			{id:'1cubierto1', src: 'chef/cubierto_10001.png'}
			{id:'1cubierto2', src: 'chef/cubierto_10002.png'}
			{id:'2cubierto1', src: 'chef/cubierto_20001.png'}
			{id:'2cubierto2', src: 'chef/cubierto_20002.png'}
			{id:'3cubierto1', src: 'chef/cubierto_30001.png'}
			{id:'3cubierto2', src: 'chef/cubierto_30002.png'}
			{id:'4cubierto1', src: 'chef/cubierto_40001.png'}
			{id:'4cubierto2', src: 'chef/cubierto_40002.png'}
			{id:'5cubierto1', src: 'chef/cubierto_50001.png'}
			{id:'5cubierto2', src: 'chef/cubierto_50002.png'}
			{id:'6cubierto1', src: 'chef/cubierto_60001.png'}
			{id:'6cubierto2', src: 'chef/cubierto_60002.png'}
			{id:'7cubierto1', src: 'chef/cubierto_70001.png'}
			{id:'7cubierto2', src: 'chef/cubierto_70002.png'}
			{id:'8cubierto1', src: 'chef/cubierto_80001.png'}
			{id:'8cubierto2', src: 'chef/cubierto_80002.png'}
			{id:'9cubierto1', src: 'chef/cubierto_90001.png'}
			{id:'9cubierto2', src: 'chef/cubierto_90002.png'}
			{id:'10cubierto1', src: 'chef/cubierto_100001.png'}
			{id:'10cubierto2', src: 'chef/cubierto_100002.png'}
			{id:'11cubierto1', src: 'chef/cubierto_110001.png'}
			{id:'11cubierto2', src: 'chef/cubierto_110002.png'}
			{id:'12cubierto1', src: 'chef/cubierto_120001.png'}
			{id:'12cubierto2', src: 'chef/cubierto_120002.png'}
			{id:'13cubierto1', src: 'chef/cubierto_130001.png'}
			{id:'13cubierto2', src: 'chef/cubierto_130002.png'}
			{id:'14cubierto1', src: 'chef/cubierto_140001.png'}
			{id:'14cubierto2', src: 'chef/cubierto_140002.png'}
			{id:'15cubierto1', src: 'chef/cubierto_150001.png'}
			{id:'15cubierto2', src: 'chef/cubierto_150002.png'}

			{id:'saladbtnready', src: 'salad/btn_ready.png'}
			{id:'saladbtnstart', src: 'salad/btn_start.png'}
			{id:'sandwichbtnready', src: 'sandwich/btn_ready.png'}
			{id:'sandwichbtnstart', src: 'sandwich/btn_start.png'}

			{id:'saladStart4Final3', src: 'salad/final_CutFruit.png'}
			{id:'saladStart1Final5', src: 'salad/final_Eat.png'}
			{id:'saladStart2Final4', src: 'salad/final_MixFruit.png'}
			{id:'saladStart5Final2', src: 'salad/final_WashFruit.png'}
			{id:'saladStart3Final1', src: 'salad/final_WashHands.png'}
			{id:'saladlabel', src: 'salad/label_fruit.png'}

			{id:'sandwichStart4Final4', src: 'sandwich/final_Bread.png'}
			{id:'sandwichStart3Final5', src: 'sandwich/final_Eat.png'}
			{id:'sandwichStart5Final2', src: 'sandwich/final_Spread.png'}
			{id:'sandwichStart1Final3', src: 'sandwich/final_Turkey.png'}
			{id:'sandwichStart2Final1', src: 'sandwich/final_Wash.png'}
			{id:'sandwichlabel', src: 'sandwich/label_sandwich.png'}

			{id:'saladstep', src: 'salad/step.png'}
			{id:'sandwichstep', src: 'sandwich/step.png'}

			{id:'saladnumber1', src: 'salad/number_1.png'}
			{id:'saladnumber2', src: 'salad/number_2.png'}
			{id:'saladnumber3', src: 'salad/number_3.png'}
			{id:'saladnumber4', src: 'salad/number_4.png'}
			{id:'saladnumber5', src: 'salad/number_5.png'}
			{id:'sandwichnumber1', src: 'sandwich/number_1.png'}
			{id:'sandwichnumber2', src: 'sandwich/number_2.png'}
			{id:'sandwichnumber3', src: 'sandwich/number_3.png'}
			{id:'sandwichnumber4', src: 'sandwich/number_4.png'}
			{id:'sandwichnumber5', src: 'sandwich/number_5.png'}

			{id:'saladscore', src: 'salad/score.png'}
			{id:'sandwichscore', src: 'sandwich/score.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U3_A1_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@salad = 
			drags:[
				{id:'saladStart1Final5'}
				{id:'saladStart2Final4'}
				{id:'saladStart3Final1'}
				{id:'saladStart4Final3'}
				{id:'saladStart5Final2'}
			]
			finals:[
				{id:'saladStart3Final1'}
				{id:'saladStart5Final2'}
				{id:'saladStart4Final3'}
				{id:'saladStart2Final4'}
				{id:'saladStart1Final5'}
			]

		@sandwich =
			drags:[
				{id:'sandwichStart1Final3'}
				{id:'sandwichStart2Final1'}
				{id:'sandwichStart3Final5'}
				{id:'sandwichStart4Final4'}
				{id:'sandwichStart5Final2'}
			]
			finals:[
				{id:'sandwichStart2Final1'}
				{id:'sandwichStart5Final2'}
				{id:'sandwichStart1Final3'}
				{id:'sandwichStart4Final4'}
				{id:'sandwichStart3Final5'}
			]
		@positions = 
			dragsImg:[
				{x:'160',y:'245'}
				{x:'284',y:'245'}
				{x:'407',y:'245'}
				{x:'531',y:'245'}
				{x:'654',y:'245'}
			]
			dragsTxt:[
				{x:'115',y:'487'}
				{x:'244',y:'456'}
				{x:'380',y:'487'}
				{x:'503',y:'456'}
				{x:'646',y:'487'}
			]			
			steps:[
				{x:'77', y:'376'}
				{x:'219',y:'376'}
				{x:'360',y:'376'}
				{x:'502',y:'376'}
				{x:'644',y:'376'}
			]
			botones:[				
				{x:'284',y:'539'}
				{x:'431',y:'539'}
			]
			score:[
				{x:'86',y:'191'}
			]
			titulo:[
				{x:'410',y:'131'}
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setDropper().setSandwich().setSalad().setStart().introEvaluation()
	setStart:  ->
		@insertBitmap 'btnsalad', 'btnsalad', 412, 450, 'tc'
		@insertBitmap 'propsalad', 'propsalad', 412, 361, 'tc'
		@insertBitmap 'btnsandwich', 'btnsandwich', 412, 244, 'tc'
		@insertBitmap 'propsandwich', 'propsandwich', 412, 149, 'tc'
	setDropper: ->
		myname = new createjs.Container()
		myname.x = 285
		myname.y = stageSize.h - 70
		myname.name = 'dropname'
		question = @createBitmap 'question', 'q', 0, 0
		h1 = new Droppable 'h1', '#FFFFFF', 250, 0, 120, 22
		myname.addChild question, h1
		@addToLibrary h1
		@addToMain myname
		@
	setSandwich: ->
		sandwich = new createjs.Container()
		sandwich.x = 0
		sandwich.y = 0		
		
		for i in [1..5]
			v = new Draggable @sandwich.drags[i-1].id,  (@preload.getResult @sandwich.drags[i-1].id), i,  @positions.dragsImg[i-1].x, @positions.dragsImg[i-1].y, 'bl'
			sandwich.addChild v
			@addToLibrary v

		for i in [1..5]
			v = @createBitmap 'sandwichstep', 'sandwichstep', @positions.steps[i-1].x, @positions.steps[i-1].y, 'bl'
			sandwich.addChild v
			@addToLibrary v
		for i in [1..5]
			v = @createBitmap @sandwich.finals[i-1].id,  @sandwich.finals[i-1].id, @positions.steps[i-1].x, @positions.steps[i-1].y, 'bl'
			sandwich.addChild v
			@addToLibrary v

		for i in [1..5]
			v = @createBitmap 'sandwichnumber'+[i], 'sandwichnumber'+[i], @positions.steps[i-1].x-(-56), @positions.steps[i-1].y-43, 'bl'
			sandwich.addChild v
			@addToLibrary v

		v = @createBitmap 'sandwichscore', 'sandwichscore', @positions.score[0].x, @positions.score[0].y
		sandwich.addChild v
		@addToLibrary v
		v = @createBitmap 'sandwichbtnready', 'sandwichbtnready', @positions.botones[1].x, @positions.botones[1].y
		sandwich.addChild v
		@addToLibrary v
		v = @createBitmap 'sandwichbtnstart', 'sandwichbtnstart', @positions.botones[0].x, @positions.botones[0].y
		sandwich.addChild v
		@addToLibrary v
		v = @createBitmap 'sandwichlabel', 'sandwichlabel', @positions.titulo[0].x, @positions.titulo[0].y, 'tc'
		sandwich.addChild v
		@addToLibrary v

		for i in [1..5]
			v = new Draggable 'sandwichscore',  (@preload.getResult 'sandwichscore'), i,  @positions.dragsTxt[i-1].x, @positions.dragsTxt[i-1].y
			sandwich.addChild v
			@addToLibrary v

		@addToMain sandwich
		@
	setSalad: ->
		salad = new createjs.Container()
		salad.x = 0
		salad.y = 0		
		
		for i in [1..5]
			v = new Draggable @salad.drags[i-1].id,  (@preload.getResult @salad.drags[i-1].id), i,  @positions.dragsImg[i-1].x, @positions.dragsImg[i-1].y, 'bl'
			salad.addChild v
			@addToLibrary v

		for i in [1..5]
			v = @createBitmap 'saladstep', 'saladstep', @positions.steps[i-1].x, @positions.steps[i-1].y, 'bl'
			salad.addChild v
			@addToLibrary v
		for i in [1..5]
			v = @createBitmap @salad.finals[i-1].id,  @salad.finals[i-1].id, @positions.steps[i-1].x, @positions.steps[i-1].y, 'bl'
			salad.addChild v
			@addToLibrary v

		for i in [1..5]
			v = @createBitmap 'saladnumber'+[i], 'saladnumber'+[i], @positions.steps[i-1].x-(-56), @positions.steps[i-1].y-43, 'bl'
			salad.addChild v
			@addToLibrary v

		v = @createBitmap 'saladscore', 'saladscore', @positions.score[0].x, @positions.score[0].y
		salad.addChild v
		@addToLibrary v
		v = @createBitmap 'saladbtnready', 'saladbtnready', @positions.botones[1].x, @positions.botones[1].y
		salad.addChild v
		@addToLibrary v
		v = @createBitmap 'saladbtnstart', 'saladbtnstart', @positions.botones[0].x, @positions.botones[0].y
		salad.addChild v
		@addToLibrary v
		v = @createBitmap 'saladlabel', 'saladlabel', @positions.titulo[0].x, @positions.titulo[0].y, 'tc'
		salad.addChild v
		@addToLibrary v
		for i in [1..5]
			v = new Draggable 'saladscore', (@preload.getResult 'saladscore'), i,  @positions.dragsTxt[i-1].x, @positions.dragsTxt[i-1].y
			salad.addChild v
			@addToLibrary v

		@addToMain salad
		@
	introEvaluation: ->
		super
		###
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
		###
	initEvaluation: (e) =>
		super
		@library['characters'].currentFrame = @answers[@index].id
		createjs.Sound.play @answers[@index].sound
		TweenLite.to @library['characters'], 0.5, {alpha: 1, y: stageSize.h - 180, ease: Quart.easeOut}
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropname'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropname'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.blink off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
		@answer.returnToPlace()
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
	window.U3A3 = U3A3