class U3A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
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
		@menu1 = 
			arriba:[
				{id: 'bigm1c1', x:'185', y:'202'}
				{id: 'bigm1c2', x:'261', y:'202'}
				{id: 'bigm1c3', x:'181', y:'296'}
				{id: 'bigm1c4', x:'352', y:'168'}
				{id: 'bigm1c5', x:'372', y:'234'}
				{id: 'bigm1c6', x:'362', y:'320'}
				{id: 'bigm1c7', x:'534', y:'179'}
				{id: 'bigm1c8', x:'530', y:'254'}
				{id: 'bigm1c9', x:'590', y:'275'}
			]
			abajo:[
				{id: 'm1c1', x:'143', y:'473'}
				{id: 'm1c2', x:'206', y:'454'}
				{id: 'm1c3', x:'260', y:'455'}
				{id: 'm1c4', x:'322', y:'459'}
				{id: 'm1c5', x:'417', y:'455'}
				{id: 'm1c6', x:'489', y:'452'}
				{id: 'm1c7', x:'586', y:'461'}
				{id: 'm1c8', x:'690', y:'474'}
				{id: 'm1c9', x:'182', y:'526'}
				{id: 'm1c10', x:'284', y:'515'}
				{id: 'm1c11', x:'364', y:'527'}
				{id: 'm1c12', x:'448', y:'522'}
				{id: 'm1c13', x:'536', y:'519'}
				{id: 'm1c14', x:'609', y:'536'}
			]	
		@menu2 =
			arriba: [
				{id: 'bigm2c1', x:'181', y:'163'}
				{id: 'bigm2c2', x:'259', y:'232'}
				{id: 'bigm2c3', x:'184', y:'279'}
				{id: 'bigm2c4', x:'353', y:'177'}
				{id: 'bigm2c5', x:'408', y:'274'}
				{id: 'bigm2c6', x:'339', y:'279'}
				{id: 'bigm2c7', x:'548', y:'177'}
				{id: 'bigm2c8', x:'554', y:'245'}
				{id: 'bigm2c9', x:'536', y:'308'}
			]
			abajo: [
				{id: 'm2c1', x:'145', y:'466'}
				{id: 'm2c2', x:'235', y:'473'}
				{id: 'm2c3', x:'292', y:'460'}
				{id: 'm2c4', x:'373', y:'473'}
				{id: 'm2c5', x:'462', y:'458'}
				{id: 'm2c6', x:'523', y:'466'}
				{id: 'm2c7', x:'615', y:'469'}
				{id: 'm2c8', x:'664', y:'458'}
				{id: 'm2c9', x:'207', y:'525'}
				{id: 'm2c10', x:'298', y:'525'}
				{id: 'm2c11', x:'380', y:'517'}
				{id: 'm2c12', x:'491', y:'518'}
				{id: 'm2c13', x:'557', y:'532'}
				{id: 'm2c14', x:'635', y:'515'}
			]
		@menu3 =
			arriba: [
				{id: 'bigm3c1', x:'189', y:'177'}
				{id: 'bigm3c2', x:'262', y:'217'}
				{id: 'bigm3c3', x:'186', y:'303'}
				{id: 'bigm3c4', x:'364', y:'174'}
				{id: 'bigm3c5', x:'353', y:'251'}
				{id: 'bigm3c6', x:'403', y:'272'}
				{id: 'bigm3c7', x:'534', y:'174'}
				{id: 'bigm3c8', x:'587', y:'249'}
				{id: 'bigm3c9', x:'537', y:'315'}
			]
			abajo: [
				{id: 'm3c1', x:'152', y:'451'}
				{id: 'm3c2', x:'207', y:'447'}
				{id: 'm3c3', x:'254', y:'449'}
				{id: 'm3c4', x:'319', y:'460'}
				{id: 'm3c5', x:'403', y:'453'}
				{id: 'm3c6', x:'462', y:'456'}
				{id: 'm3c7', x:'530', y:'458'}
				{id: 'm3c8', x:'628', y:'449'}
				{id: 'm3c9', x:'175', y:'521'}
				{id: 'm3c10', x:'251', y:'504'}
				{id: 'm3c11', x:'339', y:'519'}
				{id: 'm3c12', x:'434', y:'526'}
				{id: 'm3c13', x:'516', y:'519'}
				{id: 'm3c14', x:'623', y:'526'}
			]
		@menu4 =
			arriba: [
				{id: 'bigm4c1', x:'184', y:'191'}
				{id: 'bigm4c2', x:'262', y:'227'}
				{id: 'bigm4c3', x:'192', y:'287'}
				{id: 'bigm4c4', x:'351', y:'181'}
				{id: 'bigm4c5', x:'445', y:'235'}
				{id: 'bigm4c6', x:'355', y:'309'}
				{id: 'bigm4c7', x:'535', y:'174'}
				{id: 'bigm4c8', x:'560', y:'241'}
				{id: 'bigm4c9', x:'535', y:'313'}
			]
			abajo: [
				{id: 'm4c1', x:'136', y:'453'}
				{id: 'm4c2', x:'192', y:'469'}
				{id: 'm4c3', x:'272', y:'454'}
				{id: 'm4c4', x:'325', y:'463'}
				{id: 'm4c5', x:'413', y:'462'}
				{id: 'm4c6', x:'519', y:'454'}
				{id: 'm4c7', x:'580', y:'474'}
				{id: 'm4c8', x:'654', y:'462'}
				{id: 'm4c9', x:'166', y:'523'}
				{id: 'm4c10', x:'264', y:'526'}
				{id: 'm4c11', x:'351', y:'522'}
				{id: 'm4c12', x:'452', y:'527'}
				{id: 'm4c13', x:'538', y:'519'}
				{id: 'm4c14', x:'623', y:'525'}
			]		
		@menu = [
			{id: 'menuback', x:'157', y:'121'}

			{id: 'hojabreakfast', x:'164', y:'132'}
			{id: 'hojadinner', x:'510', y:'127'}
			{id: 'hojalunch', x:'337', y:'132'}

			{id: 'menubreakfast', x:'174', y:'164'}
			{id: 'menudinner', x:'526', y:'161'}
			{id: 'menulunch', x:'349', y:'164'}

			{id: 'labelbreakfast', x:'214', y:'149'}
			{id: 'labeldinner', x:'582', y:'150'}
			{id: 'labellunch', x:'407', y:'151'}
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
		menu = new createjs.Container()
		menu.x = 0
		menu.y = 0		
		menu1 = new createjs.Container()
		menu1.x = 0
		menu1.y = 0
		menu2 = new createjs.Container()
		menu2.x = 0
		menu2.y = 0
		menu3 = new createjs.Container()
		menu3.x = 0
		menu3.y = 0
		menu4 = new createjs.Container()
		menu4.x = 0
		menu4.y = 0

		@insertBitmap 'repeatbtn', 'repeatbtn', 404, 413

		repeat = new Button 'btnrepeat', (@preload.getResult 'repeat'), 0, 300, 320

		for i in [1..10]
			v = @createBitmap @menu[i-1].id, @menu[i-1].id, @menu[i-1].x, @menu[i-1].y
			menu.addChild v
			@addToLibrary v

		for i in [1..14]
			v = new Draggable 'm1c'+i, (@preload.getResult 'm1c'+i), i, @menu1.abajo[i-1].x, @menu1.abajo[i-1].y
			menu1.addChild v
			@addToLibrary v
		for i in [1..9]
			v = @createBitmap 'bigm1c'+i,'bigm1c'+i,@menu1.arriba[i-1].x, @menu1.arriba[i-1].y
			menu1.addChild v
			@addToLibrary v
		for i in [1..14]
			v = new Draggable 'm2c'+i, (@preload.getResult 'm2c'+i), i, @menu2.abajo[i-1].x, @menu2.abajo[i-1].y
			menu2.addChild v
			@addToLibrary v
		for i in [1..9]
			v = @createBitmap 'bigm2c'+i, 'bigm2c'+i, @menu2.arriba[i-1].x, @menu2.arriba[i-1].y
			menu2.addChild v
			@addToLibrary v
		for i in [1..14]
			v = new Draggable 'm3c'+i, (@preload.getResult 'm3c'+i), i, @menu3.abajo[i-1].x, @menu3.abajo[i-1].y
			menu3.addChild v
			@addToLibrary v
		for i in [1..9]
			v = @createBitmap 'bigm3c'+i, 'bigm3c'+i, @menu3.arriba[i-1].x, @menu3.arriba[i-1].y
			menu3.addChild v
			@addToLibrary v
		for i in [1..14]
			v = new Draggable 'm4c'+i, (@preload.getResult 'm4c'+i), i, @menu4.abajo[i-1].x, @menu4.abajo[i-1].y
			menu4.addChild v
			@addToLibrary v
		for i in [1..9]
			v = @createBitmap 'bigm4c'+i, 'bigm4c'+i, @menu4.arriba[i-1].x, @menu4.arriba[i-1].y
			menu4.addChild v
			@addToLibrary v
		repeat.addEventListener 'click', @repeatSound
		
		menu1.addChild repeat
		@addToMain menu
		@addToMain menu1
		###@addToMain menu2
		@addToMain menu3
		@addToMain menu4###
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
	window.U3A1 = U3A1