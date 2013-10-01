class U3A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}

			{id: 'guia1', src: 'guia1.png'}
			{id: 'guia1b', src: 'guia1b.png'}
			{id: 'guia2', src: 'guia2.png'}
			{id: 'guia2b', src: 'guia2b.png'}
			{id: 'guia3', src: 'guia3.png'}
			{id: 'guia3b', src: 'guia3b.png'}

			{id: 'hojabreakfast', src: 'hoja_breakfast.png'}
			{id: 'hojadinner', src: 'hoja_dinner.png'}
			{id: 'hojalunch', src: 'hoja_lunch.png'}

			{id: 'labelbreakfast', src: 'label_breakfast.png'}
			{id: 'labeldinner', src: 'label_dinner.png'}
			{id: 'labellunch', src: 'label_lunch.png'}

			{id: 'menu1back', src: 'menu1-back.png'}
			{id: 'menu2back', src: 'menu2-back.png'}
			{id: 'menu3back', src: 'menu3back.png'}
			{id: 'menuback', src: 'menuback.png'}

			{id: 'menubreakfast', src: 'menu_breakfast.png'}
			{id: 'menudinner', src: 'menu_dinner.png'}
			{id: 'menulunch', src: 'menu_lunch.png'}

			{id: 'bigm1c1', src: 'bigm1c1.png'}
			{id: 'bigm1c2', src: 'bigm1c2.png'}
			{id: 'bigm1c3', src: 'bigm1c3.png'}
			{id: 'bigm1c4', src: 'bigm1c4.png'}
			{id: 'bigm1c5', src: 'bigm1c5.png'}
			{id: 'bigm1c6', src: 'bigm1c6.png'}
			{id: 'bigm1c7', src: 'bigm1c7.png'}
			{id: 'bigm1c8', src: 'bigm1c8.png'}
			{id: 'bigm1c9', src: 'bigm1c9.png'}
			{id: 'm1c1', src: 'm1c1.png'}
			{id: 'm1c2', src: 'm1c2.png'}
			{id: 'm1c3', src: 'm1c3.png'}
			{id: 'm1c4', src: 'm1c4.png'}
			{id: 'm1c5', src: 'm1c5.png'}
			{id: 'm1c6', src: 'm1c6.png'}
			{id: 'm1c7', src: 'm1c7.png'}
			{id: 'm1c8', src: 'm1c8.png'}
			{id: 'm1c9', src: 'm1c9.png'}
			{id: 'm1c10', src: 'm1c10.png'}
			{id: 'm1c11', src: 'm1c11.png'}
			{id: 'm1c12', src: 'm1c12.png'}
			{id: 'm1c13', src: 'm1c13.png'}
			{id: 'm1c14', src: 'm1c14.png'}

			{id: 'bigm2c1', src: 'bigm2c1.png'}
			{id: 'bigm2c2', src: 'bigm2c2.png'}
			{id: 'bigm2c3', src: 'bigm2c3.png'}
			{id: 'bigm2c4', src: 'bigm2c4.png'}
			{id: 'bigm2c5', src: 'bigm2c5.png'}
			{id: 'bigm2c6', src: 'bigm2c6.png'}
			{id: 'bigm2c7', src: 'bigm2c7.png'}
			{id: 'bigm2c8', src: 'bigm2c8.png'}
			{id: 'bigm2c9', src: 'bigm2c9.png'}
			{id: 'm2c1', src: 'm2c1.png'}
			{id: 'm2c2', src: 'm2c2.png'}
			{id: 'm2c3', src: 'm2c3.png'}
			{id: 'm2c4', src: 'm2c4.png'}
			{id: 'm2c5', src: 'm2c5.png'}
			{id: 'm2c6', src: 'm2c6.png'}
			{id: 'm2c7', src: 'm2c7.png'}
			{id: 'm2c8', src: 'm2c8.png'}
			{id: 'm2c9', src: 'm2c9.png'}
			{id: 'm2c10', src: 'm2c10.png'}
			{id: 'm2c11', src: 'm2c11.png'}
			{id: 'm2c12', src: 'm2c12.png'}
			{id: 'm2c13', src: 'm2c13.png'}
			{id: 'm2c14', src: 'm2c14.png'}

			{id: 'bigm3c1', src: 'bigm3c1.png'}
			{id: 'bigm3c2', src: 'bigm3c2.png'}
			{id: 'bigm3c3', src: 'bigm3c3.png'}
			{id: 'bigm3c4', src: 'bigm3c4.png'}
			{id: 'bigm3c5', src: 'bigm3c5.png'}
			{id: 'bigm3c6', src: 'bigm3c6.png'}
			{id: 'bigm3c7', src: 'bigm3c7.png'}
			{id: 'bigm3c8', src: 'bigm3c8.png'}
			{id: 'bigm3c9', src: 'bigm3c9.png'}
			{id: 'm3c1', src: 'm3c1.png'}
			{id: 'm3c2', src: 'm3c2.png'}
			{id: 'm3c3', src: 'm3c3.png'}
			{id: 'm3c4', src: 'm3c4.png'}
			{id: 'm3c5', src: 'm3c5.png'}
			{id: 'm3c6', src: 'm3c6.png'}
			{id: 'm3c7', src: 'm3c7.png'}
			{id: 'm3c8', src: 'm3c8.png'}
			{id: 'm3c9', src: 'm3c9.png'}
			{id: 'm3c10', src: 'm3c10.png'}
			{id: 'm3c11', src: 'm3c11.png'}
			{id: 'm3c12', src: 'm3c12.png'}
			{id: 'm3c13', src: 'm3c13.png'}
			{id: 'm3c14', src: 'm3c14.png'}
			
			{id: 'bigm4c1', src: 'bigm4c1.png'}
			{id: 'bigm4c2', src: 'bigm4c2.png'}
			{id: 'bigm4c3', src: 'bigm4c3.png'}
			{id: 'bigm4c4', src: 'bigm4c4.png'}
			{id: 'bigm4c5', src: 'bigm4c5.png'}
			{id: 'bigm4c6', src: 'bigm4c6.png'}
			{id: 'bigm4c7', src: 'bigm4c7.png'}
			{id: 'bigm4c8', src: 'bigm4c8.png'}
			{id: 'bigm4c9', src: 'bigm4c9.png'}
			{id: 'm4c1', src: 'm4c1.png'}
			{id: 'm4c2', src: 'm4c2.png'}
			{id: 'm4c3', src: 'm4c3.png'}
			{id: 'm4c4', src: 'm4c4.png'}
			{id: 'm4c5', src: 'm4c5.png'}
			{id: 'm4c6', src: 'm4c6.png'}
			{id: 'm4c7', src: 'm4c7.png'}
			{id: 'm4c8', src: 'm4c8.png'}
			{id: 'm4c9', src: 'm4c9.png'}
			{id: 'm4c10', src: 'm4c10.png'}
			{id: 'm4c11', src: 'm4c11.png'}
			{id: 'm4c12', src: 'm4c12.png'}
			{id: 'm4c13', src: 'm4c13.png'}
			{id: 'm4c14', src: 'm4c14.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U3_A1_instructions.mp3', id:'instructions'}
		]
		@answers = [
			
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
		menu1 = new createjs.Container()
		menu1.x = 0
		menu1.y = 0

		repeat = new Button 'btnrepeat', (@preload.getResult 'repeat'), 0, 300, 320

		for i in [1..14]
			v = new Draggable 'm1c'+i, 'm1c'+i,i, @positions['menu1'][i].x, @positions['menu1'][i].y
			@addToLibrary v
			'm1c'+i.addEventListener 'drop', @evaluateAnswer
		
		repeat.addEventListener 'click', @repeatSound
		
		menu1.addChild repeat
		@addToMain menu1
		@
	introEvaluation: ->
		super
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
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
	window.U3A1 = U3A1