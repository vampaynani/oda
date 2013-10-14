class U3A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 
			{id: 'guia1', src:'guia1.png'}
			{id: 'guia2', src:'guia2.png'}
			{id: 'guia3', src:'guia3.png'}
 
			{id: 'btnNoHeDoesnt', src:'btn_NoHeDoesnt.png'}
			{id: 'btnNoSheDoesnt', src:'btn_NoSheDoesnt.png'}
			{id: 'btnNoTheyDont', src:'btn_NoTheyDont.png'}
			{id: 'btnYesHeDoes', src:'btn_YesHeDoes.png'}
			{id: 'btnYesSheDoes', src:'btn_YesSheDoes.png'}
			{id: 'btnYesTheyDo', src:'btn_YesTheyDo.png'}
 
			{id: 'mattno', src:'matt_no.png'}
			{id: 'mattyes', src:'matt_yes.png'}
			{id: 'patno', src:'pat_no.png'}
			{id: 'patyes', src:'pat_yes.png'}
 
			{id: 'labelmatt', src:'label_matt.png'}
			{id: 'labelpat', src:'label_pat.png'}
 
			{id: 'lineastable1', src:'lineas-table1.png'}
			{id: 'lineastable2', src:'lineas-table2.png'}
			{id: 'lineastable3', src:'lineas-table3.png'}
 
			{id: 'table1foodmattno', src:'table1/food_matt_no.png'}
			{id: 'table1foodmattyes', src:'table1/food_matt_yes.png'}
			{id: 'table1foodpatno', src:'table1/food_pat_no.png'}
			{id: 'table1foodpatyes', src:'table1/food_pat_yes.png'}
			{id: 'table2foodmattno', src:'table2/food_matt_no.png'}
			{id: 'table2foodmattyes', src:'table2/food_matt_yes.png'}
			{id: 'table2foodpatno', src:'table2/food_pat_no.png'}
			{id: 'table2foodpatyes', src:'table2/food_pat_yes.png'}
			{id: 'table3foodmattno', src:'table3/food_matt_no.png'}
			{id: 'table3foodmattyes', src:'table3/food_matt_yes.png'}
			{id: 'table3foodpatno', src:'table3/food_pat_no.png'}
			{id: 'table3foodpatyes', src:'table3/food_pat_yes.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U3_A1_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@menu1 = [
			{id:'lineastable1', x:'150' , y:'245' }
			{id:'table1foodmattno',  x:'594' , y:'285' }
			{id:'table1foodmattyes',  x:'424' , y:'294' }
			{id:'table1foodpatno', x:'265' , y:'319' }
			{id:'table1foodpatyes',  x:'84' , y:'306' }		

		]
		@menu2 = [
			{id:'lineastable2', x:'182' , y:'216' }
			{id:'table2foodmattyes', x:'431' , y:'310' }
			{id:'table2foodmattno', x:'612' , y:'307' }
			{id:'table2foodpatno', x:'284' , y:'313' }
			{id:'table2foodpatyes',  x:'81' , y:'320' } 
		]
		@menu3 = [
			{id:'lineastable3', x:'163' , y:'227' }
			{id:'table3foodpatyes', x:'96' , y:'311' }
			{id:'table3foodmattno', x:'629' , y:'333' }
			{id:'table3foodmattyes',  x:'447' , y:'311' }
			{id:'table3foodpatno',  x:'255' , y:'327' }
		]
		@common = [
			{id:'mattno', x:'606' , y:'116' }
			{id:'mattyes',  x:'464' , y:'121' }
			{id:'patno',  x:'274' , y:'124' }
			{id:'patyes', x:'127' , y:'123' }
			{id:'labelmatt',  x:'569' , y:'233' }
			{id:'labelpat', x:'235' , y:'233' }


			{id:'btnYesTheyDo', x:'166' , y:'485' }
			{id:'btnYesHeDoes', x:'361' , y:'485' }
			{id:'btnYesSheDoes',  x:'555' , y:'485' }
			{id:'btnNoTheyDont',  x:'166' , y:'539' }
			{id:'btnNoHeDoesnt',  x:'361' , y:'539' }
			{id:'btnNoSheDoesnt', x:'555' , y:'539' }		
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setDropper().setMenu1().introEvaluation()
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
	setMenu1: ->
		common = new createjs.Container()
		common.x = 0
		common.y = 0		
		menu1 = new createjs.Container()
		menu1.x = 0
		menu1.y = 0
		menu2 = new createjs.Container()
		menu2.x = 0
		menu2.y = 0
		menu3 = new createjs.Container()
		menu3.x = 0
		menu3.y = 0

		for i in [1..5]
			v = @createBitmap @menu1[i-1].id, @menu1[i-1].id, @menu1[i-1].x, @menu1[i-1].y
			menu1.addChild v
			@addToLibrary v
		for i in [1..5]
			v = @createBitmap @menu2[i-1].id, @menu2[i-1].id, @menu2[i-1].x, @menu2[i-1].y
			menu2.addChild v
			@addToLibrary v
		for i in [1..5]
			v = @createBitmap @menu3[i-1].id, @menu3[i-1].id, @menu3[i-1].x, @menu3[i-1].y
			menu3.addChild v
			@addToLibrary v
		for i in [1..12]
			v = @createBitmap @common[i-1].id, @common[i-1].id, @common[i-1].x, @common[i-1].y
			common.addChild v
			@addToLibrary v

		@addToMain common
		@addToMain menu1
		###@addToMain menu2
		@addToMain menu3###
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
	window.U3A2 = U3A2