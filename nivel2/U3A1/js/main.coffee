class U3A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
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
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U3_A1_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U3_A1_menu1_breakfast.mp3', id:'m1b'}
		    {src:'sounds/TU2_U3_A1_menu1_dinner.mp3', id:'m1d'}
		    {src:'sounds/TU2_U3_A1_menu1_lunch.mp3', id:'m1l'}
		    {src:'sounds/TU2_U3_A1_menu2_breakfast.mp3', id:'m2b'}
		    {src:'sounds/TU2_U3_A1_menu2_dinner.mp3', id:'m2d'}
		    {src:'sounds/TU2_U3_A1_menu2_lunch.mp3', id:'m2l'}
		    {src:'sounds/TU2_U3_A1_menu3_breakfast.mp3', id:'m3b'}
		    {src:'sounds/TU2_U3_A1_menu3_dinner.mp3', id:'m3d'}
		    {src:'sounds/TU2_U3_A1_menu3_lunch.mp3', id:'m3l'}
		    {src:'sounds/TU2_U3_A1_menu4_breakfast.mp3', id:'m4b'}
		    {src:'sounds/TU2_U3_A1_menu4_dinner.mp3', id:'m4d'}
		    {src:'sounds/TU2_U3_A1_menu4_lunch.mp3', id:'m4l'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = {
			common: [
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
			m1: 
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
			m2:
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
			m3 :
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
			m4 :
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
		}
		@answers = {
			m1: [
				{
					sound: 'm1b'
					values: [
						{index:'m1c1',r:off}
						{index:'m1c2',r:off}
						{index:'m1c4',r:off}	
					]
					target: 'menubreakfast'
					r: off
				}
				{
					sound: 'm1l'
					values: [
						{index:'m1c6',r:off}
						{index:'m1c7',r:off}
						{index:'m1c14',r:off}
					]
					target: 'menulunch'
					r: off
				}
				{
					sound: 'm1d'
					values: [
						{index:'m1c9',r:off}
						{index:'m1c10',r:off}
						{index:'m1c13',r:off}
					]
					target: 'menudinner'
					r: off
				}
			]
			m2: [
				{
					sound: 'm2b'
					values: [
						{index:'m2c3',r:off}
						{index:'m2c9',r:off}
						{index:'m2c12',r:off}	
					]
					target: 'menubreakfast'
					r: off
				}
				{
					sound: 'm2l'
					values: [
						{index:'m2c5',r:off}
						{index:'m2c10',r:off}
						{index:'m2c13',r:off}
					]
					target: 'menulunch'
					r: off
				}
				{
					sound: 'm2d'
					values: [
						{index:'m2c1',r:off}
						{index:'m2c4',r:off}
						{index:'m2c7',r:off}
					]
					target: 'menudinner'
					r: off
				}
			]
			m3: [
				{
					sound: 'm3b'
					values: [
						{index:'m3c2',r:off}
						{index:'m3c4',r:off}
						{index:'m3c5',r:off}	
					]
					target: 'menubreakfast'
					r: off
				}
				{
					sound: 'm3l'
					values: [
						{index:'m3c8',r:off}
						{index:'m3c10',r:off}
						{index:'m3c14',r:off}
					]
					target: 'menulunch'
					r: off
				}
				{
					sound: 'm3d'
					values: [
						{index:'m3c9',r:off}
						{index:'m3c11',r:off}
						{index:'m3c12',r:off}
					]
					target: 'menudinner'
					r: off
				}
			]
			m4: [
				{
					sound: 'm4b'
					values: [
						{index:'m4c1',r:off}
						{index:'m4c2',r:off}
						{index:'m4c4',r:off}	
					]
					target: 'menubreakfast'
					r: off
				}
				{
					sound: 'm4l'
					values: [
						{index:'m4c3',r:off}
						{index:'m4c5',r:off}
						{index:'m4c10',r:off}
					]
					target: 'menulunch'
					r: off
				}
				{
					sound: 'm4d'
					values: [
						{index:'m4c8',r:off}
						{index:'m4c9',r:off}
						{index:'m4c12',r:off}
					]
					target: 'menudinner'
					r: off
				}
			]
			total: 4
		}
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setDropper().setMenu(1).introEvaluation()
	setDropper: ->
		common = new createjs.Container()
		common.name = 'common'
		repeat = new Button 'repeat', (@preload.getResult 'repeatbtn'), 0, 404, 413
		for i in [1..@game.common.length]
			v = @createBitmap @game.common[i - 1].id, @game.common[i - 1].id, @game.common[i - 1].x, @game.common[i - 1].y
			common.addChild v
			@addToLibrary v
			@addToMain common, repeat
		@
	setMenu: (num) ->
		menu = new createjs.Container()
		menu.name = 'menu'
		
		for value in @game["m#{num}"].abajo
			v = new Draggable value.id, (@preload.getResult value.id), value.id, value.x, value.y
			@observer.subscribe "init_#{num}_evaluation", v.onInitEvaluation
			v.addEventListener 'drop', @evaluateDrop
			menu.addChild v
		
		@addToMain menu
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['common'], 1, {alpha :0, x: 0, delay: 1}
		TweenLite.from @library['repeat'], 1, {alpha :0, y: @library['repeat'].y + 20, delay: 1.2}
		TweenLite.from @library['menu'], 1, {alpha :0, y: @library['menu'].y + 20, delay: 1.4, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@a_index = 0
		@observer.notify "init_#{@index + 1}_evaluation"
		@library['repeat'].addEventListener 'click', @playSound
		createjs.Sound.play @answers["m#{@index+1}"][@a_index].sound
	evaluateDrop: (e) =>
		@answer = e.target
		pt = @library[@answers["m#{@index+1}"][@a_index].target].globalToLocal @stage.mouseX, @stage.mouseY
		if @library[@answers["m#{@index+1}"][@a_index].target].hitTest pt.x, pt.y
			match = off
			for value in @answers["m#{@index+1}"][@a_index].values
				if @answer.index is value.index
					value.r = on
					match = on
			if match
				@answer.onStopEvaluation()
				@evaluateValues()
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	evaluateValues: ->
		complete = on
		for value in @answers["m#{@index+1}"][@a_index].values
			if value.r is off
				complete = off
		if complete
			@library['score'].plusOne()
			@evaluateAnswer()
	evaluateAnswer: () =>
		if @a_index < @answers["m#{@index+1}"].length - 1
			@a_index++
			@playSound()
		else
			setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		TweenLite.to @library['menu'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.total
			@a_index = 0
			@setMenu @index + 1
			@observer.notify "init_#{@index + 1}_evaluation"
			TweenLite.to @library['menu'], 0.5, {alpha: 1, y: 0, ease: Back.easeOut, onComplete: @playSound}
		else
			@finish()
	playSound: =>
		createjs.Sound.stop()
		createjs.Sound.play @answers["m#{@index+1}"][@a_index].sound
	finish: ->
		super
	window.U3A1 = U3A1