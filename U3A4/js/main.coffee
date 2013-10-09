class U3A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'n1', src: 'nube1.png'}
			{id: 'n2', src: 'nube2.png'}
			{id: 'n3', src: 'nube3.png'}
			{id:'table1food4', src:'food_beans.png'}
			{id:'table3food3', src:'food_brocoli.png'}
			{id:'table2food1', src:'food_corn.png'}
			{id:'table1food3', src:'food_eggs.png'}
			{id:'table3food2', src:'food_fish.png'}
			{id:'table2food2', src:'food_icecream.png'}
			{id:'table3food1', src:'food_lettuce.png'}
			{id:'table1food1', src:'food_milk.png'}
			{id:'table1food2', src:'food_pancakes.png'}
			{id:'table2food3', src:'food_peaches.png'}
			{id:'table2food4', src:'food_spinach.png'}
			{id:'table3food4', src:'food_tomato.png'}
			{id:'imageJack', src:'image_Jack.png'}
			{id:'imageMeg', src:'image_Meg.png'}
			{id:'imageTomandSue', src:'image_TomandSue.png'}
			{id:'labelJack', src:'label_Jack.png'}
			{id:'labelMeg', src:'label_Meg.png'}
			{id:'labelTomandSue', src:'label_TomandSue.png'}
			{id:'lineaJack', src:'linea_Jack.png'}
			{id:'lineaMeg', src:'linea_Meg.png'}
			{id:'lineaTomandSue', src:'linea_TomandSue.png'}
			{id:'Table1num1', src:'Table1_1.png'}
			{id:'Table1num2', src:'Table1_2.png'}
			{id:'Table1num3', src:'Table1_3.png'}
			{id:'Table1num4', src:'Table1_4.png'}
			{id:'Table1num5', src:'Table1_5.png'}
			{id:'Table1num6', src:'Table1_6.png'}
			{id:'Table1num7', src:'Table1_7.png'}
			{id:'Table1num8', src:'Table1_8.png'}
			{id:'Table1num9', src:'Table1_9.png'}
			{id:'Table1num10', src:'Table1_10.png'}
			{id:'Table1num11', src:'Table1_11.png'}
			{id:'Table1num12', src:'Table1_12.png'}
			{id:'Table2num1', src:'Table2_1.png'}
			{id:'Table2num2', src:'Table2_2.png'}
			{id:'Table2num3', src:'Table2_3.png'}
			{id:'Table2num4', src:'Table2_4.png'}
			{id:'Table2num5', src:'Table2_5.png'}
			{id:'Table2num6', src:'Table2_6.png'}
			{id:'Table2num7', src:'Table2_7.png'}
			{id:'Table2num8', src:'Table2_8.png'}
			{id:'Table2num9', src:'Table2_9.png'}
			{id:'Table2num10', src:'Table2_10.png'}
			{id:'Table2num11', src:'Table2_11.png'}
			{id:'Table2num12', src:'Table2_12.png'}
			{id:'Table3num1', src:'Table3_1.png'}
			{id:'Table3num2', src:'Table3_2.png'}
			{id:'Table3num3', src:'Table3_3.png'}
			{id:'Table3num4', src:'Table3_4.png'}
			{id:'Table3num5', src:'Table3_5.png'}
			{id:'Table3num6', src:'Table3_6.png'}
			{id:'Table3num7', src:'Table3_7.png'}
			{id:'Table3num8', src:'Table3_8.png'}
			{id:'Table3num9', src:'Table3_9.png'}
			{id:'Table3num10', src:'Table3_10.png'}
			{id:'Table3num11', src:'Table3_11.png'}
			{id:'Table3num12', src:'Table3_12.png'}		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U2_A1_instructions.mp3', id:'instructions'}
		]
		@answers = [
		
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setDropper().setClouds().setFaces().setTable().introEvaluation()
	setDropper: ->
		@addToMain new WordCompleter 'dropper', '', '', '#FFF', '#F59743', 170, 541, 188, 30
		@addToMain new WordCompleter 'dropper', '', '', '#FFF', '#F59743', 373, 541, 158, 30
		@addToMain new WordCompleter 'dropper', '', '', '#FFF', '#F59743', 544, 541, 136, 30
		@
	setClouds: ->
		nube1 = new createjs.Container()
		nube1.x = 77
		nube1.y = 388
		nube1.name = 'nube1'
		nube2 = new createjs.Container()
		nube2.x = 272
		nube2.y = 369
		nube2.name = 'nube2'
		nube3 = new createjs.Container()
		nube3.x = 581
		nube3.y = 372
		nube3.name = 'nube3'
		
		n1 = @createBitmap 'n1', 'n1', 0, 0
		n2 = @createBitmap 'n2', 'n2', 0, 0
		n3 = @createBitmap 'n3', 'n3', 0, 0

		t1n1 = new DraggableText 't1n1', "They", 0, 32, 42 
		t2n1 = new DraggableText 't2n1', "He", 1, 80, 74 
		t3n1 = new DraggableText 't3n1', "She", 2, 90, 21 

		t1n2 = new DraggableText 't1n2', "like", 3, 103, 91 
		t2n2 = new DraggableText 't2n2', "don't like", 4, 119, 24 
		t3n2 = new DraggableText 't3n2', "likes", 5, 55, 38 
		t4n2 = new DraggableText 't4n2', "doesn't likes", 6, 134, 62
		t5n2 = new DraggableText 't5n2', "love", 7, 188, 98 
		t6n2 = new DraggableText 't6n2', "loves", 8, 23, 75 

		t1n3 = new DraggableText 't1n3', "Tomatoes", 9, 32, 23 
		t2n3 = new DraggableText 't2n3', "Broccoli", 9, 92, 48 
		t3n3 = new DraggableText 't3n3', "fish", 9, 23, 67 
		t4n3 = new DraggableText 't4n3', "lettuce", 9, 85, 87 

		nube1.addChild n1, t1n1, t2n1, t3n1
		nube2.addChild n2, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2
		nube3.addChild n3, t1n3, t2n3, t3n3, t4n3

		@addToLibrary t1n1,t2n1,t3n1, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2, t1n3, t2n3, t3n3, t4n3
		@addToMain nube1, nube2, nube3
		@
	setFaces: ->
		@insertBitmap 'lineaJack', 'lineaJack', 178, 257
		@insertBitmap 'lineaMeg', 'lineaMeg', 137, 200
		@insertBitmap 'lineaTomandSue', 'lineaTomandSue', 138, 313
		@insertBitmap 'imageJack', 'imageJack', 164, 186
		@insertBitmap 'imageMeg', 'imageMeg', 70, 124
		@insertBitmap 'imageTomandSue', 'imageTomandSue', 1, 240
		@insertBitmap 'labelJack', 'labelJack', 177, 264
		@insertBitmap 'labelMeg', 'labelMeg', 95, 186
		@insertBitmap 'labelTomandSue', 'labelTomandSue', 58, 323
		@
	setTable: ->
		smileys = new createjs.Container()
		smileys.x = 246
		smileys.y = 174
		smileys.name = 'smileys'
		table = 3 

		@insertBitmap 'table'+table+'food1', 'table'+table+'food1', 298, 171, 'bc'
		@insertBitmap 'table'+table+'food2', 'table'+table+'food2', 429, 171, 'bc'
		@insertBitmap 'table'+table+'food3', 'table'+table+'food3', 558, 171, 'bc'
		@insertBitmap 'table'+table+'food4', 'table'+table+'food4', 690, 171, 'bc'

		for i in [0..3]
			smiley = @createBitmap 'Table'+table+'num'+(i+1), 'Table'+table+'num'+(i+1), i*130, 0
			smileys.addChild smiley
			@addToLibrary smiley
		for i in [0..3]
			smiley = @createBitmap 'Table'+table+'num'+(i+5), 'Table'+table+'num'+(i+5), i*130, 58
			smileys.addChild smiley
			@addToLibrary smiley
		for i in [0..3]
			smiley = @createBitmap 'Table'+table+'num'+(i+9), 'Table'+table+'num'+(i+9), i*130, 116
			smileys.addChild smiley
			@addToLibrary smiley
		@addToMain smileys
		@
	introEvaluation: ->
		super

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['dropper'], 1, {alpha: 0, x: @library['dropper'].x + 50, ease: Quart.easeOut, delay: 3, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.allFrom [@library['nube1'], @library['nube2'], @library['nube3'], @library['nube4']], 1, {alpha: 0, y: stageSize.h, delay: 2}
	initEvaluation: (e) =>
		super
		for i in [0..3] by 1
			@library['tn'+i].addEventListener 'drop', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropper'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropper'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.x = @answer.pos.x
				@answer.y = @answer.pos.y
				@library['dropper'].changeText @answer.text.text
				setTimeout @finishEvaluation, 1 * 1000
			else
				@answer.returnToPlace()	
				@warning()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		@library['score'].plusOne()
		createjs.Sound.play 'good'
		TweenLite.to @library['dropper'], 0.5, {alpha: 0, y: stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['dropper'].y = 525
			@library['dropper'].x = 150 + 50
			@library['dropper'].changeText ''
			@library['dropper'].changeLabel @answers[@index].text
			TweenLite.to @library['dropper'], 0.5, {alpha: 1, x: 150, ease: Quart.easeOut}
		else
			@finish()
	finish: ->
		super
	window.U3A4 = U3A4