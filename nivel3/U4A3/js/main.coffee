class U4A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}

		    {id: 'btnConfused', src:'btn_confused.png'}
			{id: 'btnDirty', src:'btn_dirty.png'}
			{id: 'btnEnergetic', src:'btn_energetic.png'}
			{id: 'btnHot', src:'btn_hot.png'}
			{id: 'btnSick', src:'btn_sick.png'}
			{id: 'btnTired', src:'btn_tired.png'}
			{id: 'faceConfused', src:'face_confused.png'}
			{id: 'faceDirty', src:'face_dirty.png'}
			{id: 'faceEnergetic', src:'face_energetic.png'}
			{id: 'faceHot', src:'face_hot.png'}
			{id: 'faceSick', src:'face_sick.png'}
			{id: 'faceTired', src:'face_tired.png'}
			{id: 'n2', src:'tag_answer.png'}
			{id: 'n3', src:'tag_pronoun.png'}
			{id: 'n1', src:'tag_verb.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U4_A3_instructions.mp3', id:'instructions'}
		]
		@game =
			steps : [ ##no se como tengan que organizarse cada imagen tiene una frase que debe mostrar. Falta completar aqui las frases
				{x:200 ,y:235 ,face:'faceSick', id:'btnSick', frase:"When I'm sick, I ", targets: ['go','to the doctor'], a1: 1, a2: 5}
				{x:415 ,y:235 ,face:'faceConfused', id:'btnConfused', frase:"When I'm confused, I ", targets: ['ask','my teacher', 'a question'], a1: 3, a2: 1, a3: 1}
				{x:630 ,y:235 ,face:'faceTired', id:'btnTired', frase:"When I'm tired, I ", targets: ['go','to bed'], a1: 1, a2: 3}
				{x:200 ,y:380 ,face:'faceHot', id:'btnHot', frase:"When I'm hot, I ", targets: ['sit','in front of', 'a fan'], a1: 4, a2:2, a3: 2}
				{x:415 ,y:380 ,face:'faceDirty', id:'btnDirty', frase:"When I'm dirty, I ", targets: ['take','a shower'], a1: 2, a2: 4}
				{x:630 ,y:380 ,face:'faceEnergetic', id:'btnEnergetic', frase:"When I'm energetic, I ", targets: ['go','roller skating'], a1: 1, a2: 6}
			]
			opt1:[
				{i:1, t:'go', x:31, y:36}
				{i:2, t:'take', x:69, y:21}
				{i:3, t:'ask', x:67, y:70}
				{i:4, t:'sit', x:117, y:47}
			]
			opt2:[
				{i:1, t:'my teacher', x:36, y:36}
				{i:2, t:'in front of', x:16, y:93}
				{i:3, t:'to bed', x:67, y:132}
				{i:4, t:'a shower', x:164, y:25}
				{i:5, t:'to the doctor', x:116, y:69}
				{i:6, t:'roller skating', x:134, y:113}
			]
			opt3:[
				{i:1, t:'a question', x:22, y:21}
				{i:2, t:'a fan', x:43, y:57}
			]
			
		super null, manifest, sounds
	setStage: ->
		super
		@current = @shuffle @game.steps
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and click on the correct ticket.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 12, 0
		@setNube1().setNube2().setNube3()
		@setDropper()

		@setTickets().introEvaluation()
	setTickets:  ->
		if @library.tickets
			tickets = @library.tickets
		else
			tickets = new createjs.Container()
			tickets.name = 'tickets'
		
			for i in [0..@current.length - 1] by 1
				v = @createBitmap @current[i].id, @current[i].id, @current[i].x, @current[i].y, 'tc'
				v.scaleX = v.scaleY = 0.8
				tickets.addChild v
				@addToLibrary v
		@addToMain tickets
		@
	setDropper: ->
		step = @index

		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.x = 70
			dropper.y = 140
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		face = @createBitmap 'face', @current[step].face, 0,0
		frase = @createText 'frase', @current[step].frase,'28px Quicksand','#333', 100,20
		@addToLibrary frase
		dropper.addChild frase, face

		for i in [0..@current[step].targets.length - 1] by 1
			h = new WordContainer "wc#{i + 1}", '', '#FFF', '#F00', (120*i  + 10)+130+frase.getMeasuredWidth(), 25, 110, 22
			h.index = i
			dropper.addChild h
			@addToLibrary h
		question = @createText 'q', '.','28px Quicksand','#333', @current[step].targets.length*120 + 140 + frase.getMeasuredWidth(), 20
		dropper.addChild question

		if @library.picture
			picture = @library.picture
		else
			picture = new createjs.Container()

			picture.name = 'picture'
			@addToMain picture
		picture.removeAllChildren()

		v = @createBitmap 'pic', @current[step].id, stageSize.w / 2, 220, 'tc'
		picture.addChild v		
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 110
		container.y = 452
		container.name = 'group1'
		
		back = @createBitmap 'backNube1', 'n1', 0, 0
		container.addChild back

		word1 = new ClickableText 'w11', @game.opt1[0].t, 1,  @game.opt1[0].x,  @game.opt1[0].y
		word2 = new ClickableText 'w12', @game.opt1[1].t, 2,  @game.opt1[1].x,  @game.opt1[1].y
		word3 = new ClickableText 'w13', @game.opt1[2].t, 3,  @game.opt1[2].x,  @game.opt1[2].y
		word4 = new ClickableText 'w14', @game.opt1[3].t, 4,  @game.opt1[3].x,  @game.opt1[3].y
 
		container.addChild word1, word2, word3, word4
		@addToLibrary word1, word2, word3, word4
		
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 312
		container.y = 395
		container.name = 'group2'
		
		back = @createBitmap 'backNube2', 'n2', 0, 0
		container.addChild back

		word1 = new ClickableText 'w21',  @game.opt2[0].t, 1,  @game.opt2[0].x,  @game.opt2[0].y
		word2 = new ClickableText 'w22',  @game.opt2[1].t, 2,  @game.opt2[1].x,  @game.opt2[1].y
		word3 = new ClickableText 'w23',  @game.opt2[2].t, 3,  @game.opt2[2].x,  @game.opt2[2].y
		word4 = new ClickableText 'w24',  @game.opt2[3].t, 4,  @game.opt2[3].x,  @game.opt2[3].y
		word5 = new ClickableText 'w25',  @game.opt2[4].t, 5,  @game.opt2[4].x,  @game.opt2[4].y
		word6 = new ClickableText 'w26',  @game.opt2[5].t, 6,  @game.opt2[5].x,  @game.opt2[5].y

		container.addChild word1, word2, word3, word4, word5, word6
		@addToLibrary word1, word2, word3, word4, word5, word6

 
		@addToMain container
		@
	setNube3: ->
		container = new createjs.Container()
		container.x = 626
		container.y = 459
		container.name = 'group3'
		
		back = @createBitmap 'backNube3', 'n3', 0, 0
		container.addChild back

		word1 = new ClickableText 'w31', @game.opt3[0].t, 1,  @game.opt3[0].x,  @game.opt3[0].y
		word2 = new ClickableText 'w32', @game.opt3[1].t, 2,  @game.opt3[1].x,  @game.opt3[1].y
		container.addChild word1, word2
		@addToLibrary word1, word2
		@addToMain container
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y: -@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.to @library.picture, 0, {alpha: 0}
		TweenLite.to @library.group1, 0, {alpha:0}
		TweenLite.to @library.group2, 0, {alpha:0}
		TweenLite.to @library.group3, 0, {alpha:0}
		TweenLite.from @library.tickets, 1, {alpha: 0, y: @library.tickets.y + 20, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [0..@current.length - 1] by 1
			@library[@current[i].id].addEventListener 'click', @evaluateClick
		for i in [1..4] by 1
			@library['w1'+i].addEventListener 'click', @evaluateAnswer1
	evaluateAnswer1: (e) =>
		@answer = e.target
		if @answer.index is @current[@index].a1
			createjs.Sound.play 'good'
			@blink @library['group1'], off
			@library['wc1'].changeText @answer.text.text
			@blink @library['group2']
			for i in [1..4] by 1
				@library['w1'+i].removeEventListener 'click', @evaluateAnswer1
			for i in [1..6] by 1
				@library['w2'+i].addEventListener 'click', @evaluateAnswer2
		else
			@warning()
	evaluateAnswer2: (e) =>
		@answer = e.target
		if @answer.index is @current[@index].a2
			createjs.Sound.play 'good'
			@blink @library['group2'], off
			@library['wc2'].changeText @answer.text.text
			for i in [1..6] by 1
				@library['w2'+i].removeEventListener 'click', @evaluateAnswer2
			if @current[@index].a3
				@blink @library['group3']
				for i in [1..2] by 1
					@library['w3'+i].addEventListener 'click', @evaluateAnswer3
			else
				setTimeout @finishEvaluation, 1 * 1000
		else
			@warning()
	evaluateAnswer3: (e) =>
		@answer = e.target
		if @answer.index is @current[@index].a3
			createjs.Sound.play 'good'
			@blink @library['group3'], off

			@library['wc3'].changeText @answer.text.text
			for i in [1..2] by 1
				@library['w3'+i].removeEventListener 'click', @evaluateAnswer3
			setTimeout @finishEvaluation, 1 * 1000
		else
			@warning()
	evaluateClick: (e) =>
		if e.target.name is @current[@index].id
			createjs.Sound.stop()
			createjs.Sound.play 'good'
			@library['score'].plusOne()

			TweenLite.to @library.tickets, 0.5, {alpha:0}
			TweenLite.to @library.group1, 0.5, {alpha:1, delay:1}
			TweenLite.to @library.group2, 0.5, {alpha:1, delay:1}
			TweenLite.to @library.group3, 0.5, {alpha:1, delay:1}
			TweenLite.to @library.picture, 0.5, {alpha:1, delay:1}
			@blink @library['group1']
		else
			@warning()
	finishEvaluation: =>
		@library['score'].plusOne()
		TweenLite.to @library.group1, 0.5, {alpha:0}
		TweenLite.to @library.group2, 0.5, {alpha:0}
		TweenLite.to @library.group3, 0.5, {alpha:0}
		TweenLite.to @library.picture, 0.5, {alpha:0}

		if @index < @current.length - 1
			@index++
			TweenLite.to @library.tickets, 0.5, {alpha:1, delay:1}
			@setDropper().initEvaluation()
		else
			@finish()
	finish: ->
		TweenLite.to @library.dropper, 0.5, {alpha:0}
		super
	window.U4A3 = U4A3