class U3A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
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
		    {src:'sounds/TU2_U3_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [
			[
				{a:'Table1num2',a1:2,a2:6,a3:10}
				{a:'Table1num10',a1:0,a2:7,a3:10}
				{a:'Table1num4',a1:2,a2:6,a3:12}
				{a:'Table1num9',a1:0,a2:4,a3:9}
				{a:'Table1num1',a1:2,a2:8,a3:9}
				{a:'Table1num5',a1:1,a2:8,a3:9}
			]
			[
				{a:'Table2num4',a1:2,a2:5,a3:12}
				{a:'Table2num7',a1:1,a2:5,a3:11}
				{a:'Table2num2',a1:2,a2:8,a3:10}
				{a:'Table2num10',a1:0,a2:4,a3:10}
				{a:'Table2num5',a1:1,a2:8,a3:9}
				{a:'Table2num11',a1:0,a2:7,a3:11}
			]
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look at the chart and drag the words to build sentences.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 12, 0
		@setDropper().setTable(1).setClouds().introEvaluation()
		@intento = 0

	setDropper: ->
		@addToMain new WordContainer 'dropper1', '', '#FFF', '#0098d7', 340, 1082, 376, 60
		@addToMain new WordContainer 'dropper2', '', '#FFF', '#0098d7', 746, 1082, 316, 60
		@addToMain new WordContainer 'dropper3', '', '#FFF', '#0098d7', 1088, 1082, 272, 60
		@addToMain @createText 'period', '.', '48px Arial', '#000', 1370, 1090
		@
	setTable: (table) ->
		if not @library.smileys
			smileys = new createjs.Container()
			smileys.x = 492
			smileys.name = 'smileys'
		else
			smileys = @library.smileys

		smileys.alpha = 1
		smileys.y = 368
		smileys.removeAllChildren()
		
		@table = table

		l1 = @createBitmap 'lineaJack', 'lineaJack', -136, 166
		l2 = @createBitmap 'lineaMeg', 'lineaMeg', -218, 52
		l3 = @createBitmap 'lineaTomandSue', 'lineaTomandSue', -216, 278
		i1 = @createBitmap 'imageJack', 'imageJack', -164, 24
		i2 = @createBitmap 'imageMeg', 'imageMeg', -352, -100
		i3 = @createBitmap 'imageTomandSue', 'imageTomandSue', -490, 132
		n1 = @createBitmap 'labelJack', 'labelJack', -138, 180
		n2 = @createBitmap 'labelMeg', 'labelMeg', -302, 24
		n3 = @createBitmap 'labelTomandSue', 'labelTomandSue', -376, 298
		f1 = @createBitmap "table#{table}food1", "table#{table}food1", 104, -6, 'bc'
		f2 = @createBitmap "table#{table}food2", "table#{table}food2", 366, -6, 'bc'
		f3 = @createBitmap "table#{table}food3", "table#{table}food3", 624, -6, 'bc'
		f4 = @createBitmap "table#{table}food4", "table#{table}food4", 888, -6, 'bc'

		smileys.addChild l1,l2,l3
		smileys.addChild i1,i2,i3
		smileys.addChild n1,n2,n3
		smileys.addChild f1,f2,f3,f4
		TweenMax.allFrom [f1, f2, f3, f4], 1, {alpha: 0}

		for i in [0..3]
			smiley = @createBitmap "Table#{table}num#{i+1}", "Table#{table}num#{i+1}", i * 260, 0
			smileys.addChild smiley
			@addToLibrary smiley
		for i in [0..3]
			smiley = @createBitmap "Table#{table}num#{i+5}", "Table#{table}num#{i+5}", i * 260, 116
			smileys.addChild smiley
			@addToLibrary smiley
		for i in [0..3]
			smiley = @createBitmap "Table#{table}num#{i+9}", "Table#{table}num#{i+9}", i * 260, 232
			smileys.addChild smiley
			@addToLibrary smiley
		@addToMain smileys
		@
	setClouds: ->
		if not @library.nube1
			nube1 = new createjs.Container()
			nube1.x = 154
			nube1.y = 776
			nube1.name = 'nube1'
		else
			nube1 = @library.nube1
		if not @library.nube2
			nube2 = new createjs.Container()
			nube2.x = 544
			nube2.y = 738
			nube2.name = 'nube2'
		else
			nube2 = @library.nube2
		if not @library.nube3
			nube3 = new createjs.Container()
			nube3.x = 1162
			nube3.y = 744
			nube3.name = 'nube3'
		else
			nube3 = @library.nube3

		nube1.alpha = 1
		nube2.alpha = 1
		nube3.alpha = 1

		nube1.removeAllChildren()
		nube2.removeAllChildren()
		nube3.removeAllChildren()
		
		n1 = @createBitmap 'n1', 'n1', 0, 0
		n2 = @createBitmap 'n2', 'n2', 0, 0
		n3 = @createBitmap 'n3', 'n3', 0, 0

		t1n1 = new DraggableText 't1n1', "They", 0, 64, 84 
		t2n1 = new DraggableText 't2n1', "He", 1, 160, 148 
		t3n1 = new DraggableText 't3n1', "She", 2, 180, 42 

		t1n2 = new DraggableText 't1n2', "like", 3, 206, 182 
		t2n2 = new DraggableText 't2n2', "don't like", 4, 238, 48 
		t3n2 = new DraggableText 't3n2', "likes", 5, 110, 76 
		t4n2 = new DraggableText 't4n2', "doesn't like", 6, 268, 124
		t5n2 = new DraggableText 't5n2', "love", 7, 376, 196 
		t6n2 = new DraggableText 't6n2', "loves", 8, 46, 150 

		switch @table
			when 1
				t1n3 = new DraggableText 't1n3', "milk", 9, 64, 46 
				t2n3 = new DraggableText 't2n3', "pancakes", 10, 184, 96 
				t3n3 = new DraggableText 't3n3', "eggs", 11, 46, 134 
				t4n3 = new DraggableText 't4n3', "beans", 12, 170, 174 
			when 2
				t1n3 = new DraggableText 't1n3', "corn", 9, 64, 46 
				t2n3 = new DraggableText 't2n3', "ice cream", 10, 184, 96 
				t3n3 = new DraggableText 't3n3', "peaches", 11, 46, 134 
				t4n3 = new DraggableText 't4n3', "spinach", 12, 170, 174 
			when 3
				t1n3 = new DraggableText 't1n3', "tomatoes", 9, 64, 46 
				t2n3 = new DraggableText 't2n3', "broccoli", 10, 184, 96 
				t3n3 = new DraggableText 't3n3', "fish", 11, 46, 134 
				t4n3 = new DraggableText 't4n3', "lettuce", 12, 170, 174 

		nube1.addChild n1, t1n1, t2n1, t3n1
		nube2.addChild n2, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2
		nube3.addChild n3, t1n3, t2n3, t3n3, t4n3

		@addToLibrary t1n1,t2n1,t3n1, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2, t1n3, t2n3, t3n3, t4n3
		@addToMain nube1, nube2, nube3
		@
	introEvaluation: ->
		super
		for i in [1..3] by 1
			@library["t#{i}n1"].initDragListener()

		TweenLite.from @library.header, 1, {y:-@library['header'].height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.allFrom [@library.nube1, @library.nube2, @library.nube3], 1, {alpha: 0, delay: 1}
	initEvaluation: (e) =>
		super
		@aindex = 0
		for i in [1..3] by 1
			@library["t#{i}n1"].addEventListener 'drop', @evaluateAnswer1
		@blink @library[@answers[@table - 1][@aindex].a]
	evaluateAnswer1: (e) =>
		@answer = e.target
		success = off
		dropped = off
		for i in [1..3] by 1
			pt = @library.dropper1.globalToLocal @stage.mouseX, @stage.mouseY
			if @library.dropper1.hitTest pt.x, pt.y
				dropped = on
				if @answer.index is @answers[@table - 1][@aindex].a1
					success = on
					@answer.x = @answer.pos.x
					@answer.y = @answer.pos.y
					@library.dropper1.changeText @answer.text.text
					for i in [1..6] by 1
						@library["t#{i}n2"].initDragListener()

					for i in [1..6] by 1
						@library["t#{i}n2"].addEventListener 'drop', @evaluateAnswer2
		if not dropped 
			@answer.returnToPlace()
		else
			###
			if success
				if @intento is 0
					@library.score.plusOne()
				@intento = 0
				createjs.Sound.play 'good'
			###
			if not success
				@answer.returnToPlace()
				@warning() 
				@intento = 1
	evaluateAnswer2: (e) =>
		@answer = e.target
		success = off
		dropped = off
		for i in [1..6] by 1
			pt = @library.dropper2.globalToLocal @stage.mouseX, @stage.mouseY
			if @library.dropper2.hitTest pt.x, pt.y
				dropped = on
				if @answer.index is @answers[@table - 1][@aindex].a2
					@answer.x = @answer.pos.x
					@answer.y = @answer.pos.y
					@library.dropper2.changeText @answer.text.text
					success = on
					for i in [1..4] by 1
						@library["t#{i}n3"].initDragListener()
					for i in [1..4] by 1
						@library["t#{i}n3"].addEventListener 'drop', @evaluateAnswer3
		if not dropped 
			@answer.returnToPlace()
		else
			###
			if success
				if @intento is 0
					@library.score.plusOne()
				@intento = 0
				createjs.Sound.play 'good'
			###
			if not success
				@answer.returnToPlace()
				@warning() 
				@intento = 1
	evaluateAnswer3: (e) =>
		console.log e.target
		@answer = e.target
		dropped = off
		success = off
		for i in [1..6] by 1
			pt = @library.dropper3.globalToLocal @stage.mouseX, @stage.mouseY
			if @library.dropper3.hitTest pt.x, pt.y
				dropped = on
				if @answer.index is @answers[@table - 1][@aindex].a3
					@answer.x = @answer.pos.x
					@answer.y = @answer.pos.y
					@library.dropper3.changeText @answer.text.text
					success = on
		if not dropped 
			@answer.returnToPlace()
		else
			if success
				if @intento is 0 then @library.score.plusOne()
				@intento = 0
				createjs.Sound.play 'good'
				for i in [1..6] by 1
					@library["t#{i}n2"].endDragListener()
				for i in [1..4] by 1
					@library["t#{i}n3"].endDragListener()
				setTimeout @finishEvaluation, 1 * 1000
			else
				@answer.returnToPlace()
				@intento = 1
				@warning()
	finishEvaluation: =>
		@blink @library[@answers[@table - 1][@aindex].a], off
		#@library.score.plusOne()
		@aindex++
		if @aindex < @answers[@table - 1].length
			@blink @library[@answers[@table-1][@aindex].a]
			@library.dropper1.changeText ''
			@library.dropper2.changeText ''
			@library.dropper3.changeText ''
		else
			@aindex = 0
			@nextEvaluation()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library.dropper1.changeText ''
			@library.dropper2.changeText ''
			@library.dropper3.changeText ''
			@setTable(@index + 1).setClouds()
			@blink @library[@answers[@table - 1][@aindex].a]
			for i in [1..3] by 1
				@library["t#{i}n1"].onInitEvaluation()
			for i in [1..6] by 1
				@library["t#{i}n2"].onInitEvaluation()
			for i in [1..4] by 1
				@library["t#{i}n3"].onInitEvaluation()
			for i in [1..3] by 1
				@library["t#{i}n1"].addEventListener 'drop', @evaluateAnswer1
		else
			@finish()
	finish: ->
		TweenLite.to @library.smileys, 1, {alpha: 0, y: @library.smileys-20}
		TweenMax.allTo [@library.nube1, @library.nube2, @library.nube3], 1, {alpha: 0}
		TweenMax.allTo [@library.dropper1, @library.dropper2, @library.dropper3], 1, {alpha: 0}
		super
	window.U3A4 = U3A4