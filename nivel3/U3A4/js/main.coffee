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
			{id:'caras', src:'caras.png'}
			{id:'img01', src:'imagenes0001.png'}
			{id:'img02', src:'imagenes0002.png'}
			{id:'img03', src:'imagenes0003.png'}
			{id:'img04', src:'imagenes0004.png'}
			{id:'img05', src:'imagenes0005.png'}
			{id:'img06', src:'imagenes0006.png'}
			{id:'img07', src:'imagenes0007.png'}
			{id:'img08', src:'imagenes0008.png'}
			{id:'img09', src:'imagenes0009.png'}
			{id:'img10', src:'imagenes0010.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U3_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		###
			0:They
			1:He
			2:She
			3:like
			4:don't like
			5:likes
			6:doesn't likes
			7:love
			8:loves
			9:milk
			10:pancakes
			11:eggs
			12:beans
			9:corn
			10:ice cream
			11:peaches
			12:spinach
			###
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
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setDropper().setGirl().setClouds()
	setDropper: ->
		text = new createjs.Text 'I','26px Quicksand','#333'
		text.x = 150
		text.y = 541
		@addToMain new WordContainer 'dropper1', '', '#FFF', '#F59743', 170, 541, 188, 30
		@addToMain new WordContainer 'dropper2', '', '#FFF', '#F59743', 373, 541, 158, 30
		@addToMain new WordContainer 'dropper3', '', '#FFF', '#F59743', 544, 541, 136, 30
		@addToMain text
		@
	setGirl: ->
		sp = @createSprite 'girl', [		'img01', 'img02', 'img03', 'img04', 'img05', 'img06', 'img07', 'img08', 'img09', 'img10'], null, stageSize.w / 2, 135, 'tc'
		sp.scaleX = sp.scaleY = 0.9
		@insertBitmap 'caras', 'caras', 670, 120
		@addToMain sp
		@
	setClouds: ->
		if not @library.nube1
			nube1 = new createjs.Container()
			nube1.x = 72
			nube1.y = 339
			nube1.name = 'nube1'
		else
			nube1 = @library.nube1
		if not @library.nube2
			nube2 = new createjs.Container()
			nube2.x = 241
			nube2.y = 336
			nube2.name = 'nube2'
		else
			nube2 = @library.nube2
		if not @library.nube3
			nube3 = new createjs.Container()
			nube3.x = 437
			nube3.y = 310
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

		t1n1 = new ClickableText 't1n1', "love", 0,37,21
		t2n1 = new ClickableText 't2n1', "don't like", 1,54,51
		t3n1 = new ClickableText 't3n1', "hate", 2, 36,79
		t4n1 = new ClickableText 't4n1', "like", 3, 84,99

		t1n2 = new ClickableText 't1n2', "going", 4,  34,21
		t2n2 = new ClickableText 't2n2', "chatting", 5, 79,49
		t3n2 = new ClickableText 't3n2', "doing", 6, 34,76
		t4n2 = new ClickableText 't4n2', "playing", 7, 99,102
		t5n2 = new ClickableText 't5n2', "taking", 8,  17,106
		t6n2 = new ClickableText 't6n2', "learning", 9, 83,144

		t1n3 = new ClickableText 't1n3', "roller skating", 10, 54,33 
		t2n3 = new ClickableText 't2n3', "the violin", 11,  19,61 
		t3n3 = new ClickableText 't3n3', "online with friends", 12, 43,93 
		t4n3 = new ClickableText 't4n3', "in the school band", 13,  21,127 
		t5n3 = new ClickableText 't4n3', "English", 14,  57,164 
		t6n3 = new ClickableText 't4n3', "ballet class", 15,  193,28 
		t7n3 = new ClickableText 't4n3', "computer games", 16,  164,66 
		t8n3 = new ClickableText 't4n3', "gymnastics", 17,  208,115 
		t9n3 = new ClickableText 't4n3', "karate lessons", 18,  174,160 
		t10n3 = new ClickableText 't4n3', "swimming lessons", 19,  117,191 

		nube1.addChild n1, t1n1, t2n1, t3n1, t4n1
		nube2.addChild n2, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2
		nube3.addChild n3, t1n3, t2n3, t3n3, t4n3, t5n3, t6n3, t7n3, t8n3, t9n3, t10n3

		@addToLibrary t1n1,t2n1,t3n1,t4n1, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2, t1n3, t2n3, t3n3, t4n3, t5n3, t6n3, t7n3, t8n3, t9n3, t10n3
		@addToMain nube1, nube2, nube3
		@
	introEvaluation: ->
		super
		for i in [1..3] by 1
			@observer.subscribe 'init_evaluation', @library["t#{i}n1"].onInitEvaluation
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library["t#{i}n2"].onInitEvaluation
		for i in [1..4] by 1
			@observer.subscribe 'init_evaluation', @library["t#{i}n3"].onInitEvaluation

		TweenLite.from @library.header, 1, {y:-@library['header'].height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.allFrom [@library.nube1, @library.nube2, @library.nube3], 1, {alpha: 0, delay: 1}
	initEvaluation: (e) =>
		super
		@aindex = 0
		for i in [1..3] by 1
			@library["t#{i}n1"].addEventListener 'drop', @evaluateAnswer1
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
						@library["t#{i}n2"].addEventListener 'drop', @evaluateAnswer2
		if not dropped 
			@answer.returnToPlace()
		else
			if not success
				@answer.returnToPlace()
				@warning() 
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
						@library["t#{i}n3"].addEventListener 'drop', @evaluateAnswer3
		if not dropped 
			@answer.returnToPlace()
		else
			if not success
				@answer.returnToPlace()
				@warning() 
	evaluateAnswer3: (e) =>
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
				setTimeout @finishEvaluation, 1 * 1000
			else
				@answer.returnToPlace()
				@warning()
	finishEvaluation: =>
		@blink @library[@answers[@table - 1][@aindex].a], off
		@library.score.plusOne()
		createjs.Sound.play 'good'
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