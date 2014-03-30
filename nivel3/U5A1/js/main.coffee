class U5A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id:'city1610', src:'1610.png'}
			{id:'city1940', src:'1940.png'}
			{id:'btn1610', src:'btn_1610.png'}
			{id:'btn1940', src:'btn_1940.png'}
			{id:'btnstart', src:'btn_start.png'}
 
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U5_A1_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U5_A1_instructions2.mp3', id:'instructions2'}
		 
		]
		@game =
			btns:[
				{t:"There wasn't any air pollution.", res:'btn1610'}
				{t:"There weren't any bridges.", res:'btn1610'}
				{t:"There were trees.", res:'btn1610'}
				{t:"There were bears and deer.", res:'btn1610'}
				{t:"There wasn't a railroad.", res:'btn1610'}
				{t:"There was clean water.", res:'btn1610'}
				{t:"There were wigwams.", res:'btn1610'}
				{t:"There were fish in the river.", res:'btn1610'}
				{t:"There was electricity.", res:'btn1940'}
				{t:"There wasn't any fresh air.", res:'btn1940'}
				{t:"There was garbage in the river.", res:'btn1940'}
				{t:"There were big ships on the river.", res:'btn1940'}
				{t:"There were bridges.", res:'btn1940'}
				{t:"There was traffic.", res:'btn1940'}
				{t:"There were factories.", res:'btn1940'}
			
			]
		super null, manifest, sounds
	setStage: ->
		super
		@current = @shuffle @game.btns
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look at the pictures for fifteen seconds.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 15, 0
		@library.score.txtCount.color = "#bfd951"
		@library.score.txtTotal.color = "#ff9933"
		@setBtns().setFrase().introEvaluation()
	setBtns:  ->
		if @library.btns
			btns = @library.btns
		else
			btns = new createjs.Container()
			btns.name = 'btns'
			btns.x = 132
			btns.y = 280

			u = @createBitmap 'btn1610', 'btn1610', 0, 80
			u.addEventListener 'click', @evaluateClick

			h = @createBitmap 'btn1940', 'btn1940', 300,80
			h.addEventListener 'click', @evaluateClick

			btns.addChild u, h
			@addToLibrary u, h

		btn = new createjs.Container()
		btn.name = 'btn'

		r = @createBitmap 'btnstart', 'btnstart', stageSize.w/2,450, 'tc'
		r.addEventListener 'click', @setAnim
		btn.addChild r

		@addToMain btns
		@addToMain btn
		@
	setFrase: ->
		question = new createjs.Container()
		question.x = stageSize.w / 2
		question.y = 280
		question.name = 'question'
	 
		text = new createjs.Text @current[@index].t,'24px Quicksand','#333'
		text.name = 'titulo'
		text.textAlign = 'center'
		question.addChild text
		@addToLibrary text

		@addToMain question
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y: -@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha: 0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenLite.to @library.question, 0, {alpha :0}
		TweenLite.to @library.btns, 0, {alpha :0}
	initEvaluation: (e) =>
		super
	evaluateClick: (e) =>
		if e.target.name is @current[@index].res
			createjs.Sound.stop()
			createjs.Sound.play 'good'
			@library.score.plusOne()
		else
			@warning()
		TweenLite.to @library['question'], 0.5, {alpha:0, onComplete: @nextEvaluation}	
	setAnim: =>
		TweenLite.to @library.btn, 1, {alpha :0}
		@insertBitmap 'city1610', 'city1610', stageSize.w / 2, stageSize.h / 2, 'mc'
		@insertBitmap 'city1940', 'city1940', stageSize.w / 2, stageSize.h / 2, 'mc'
		TweenLite.from @library.city1610, 1, {alpha :0, x: 0, delay: 1}
		TweenLite.to @library.city1610, 1, {alpha :0, x: 1000, delay: 15}
		TweenLite.from @library.city1940, 1, {alpha :0, x: 0, delay: 16}
		TweenLite.to @library.city1940, 1, {alpha :0, x: 1000, delay: 31}
		TweenLite.to @library.question, 1, {alpha :1, delay: 32}
		TweenLite.to @library.btns, 1, {alpha :1, delay: 32}

	nextEvaluation: =>
		@index++
		if @index < @current.length
			@setFrase()
		else
			@finish()
	finish: ->
		TweenLite.to @library.btns, 0.5, {alpha:0}
		super
	window.U5A1 = U5A1