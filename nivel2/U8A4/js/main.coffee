class U8A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'btnfinished', src:'btn_finished.png'}
			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'dragble2', src:'dragble_bella.png'}
			{id: 'dragble3', src:'dragble_benny.png'}
			{id: 'dragble1', src:'dragble_hana.png'}
			{id: 'dragble8', src:'dragble_julia.png'}
			{id: 'dragble7', src:'dragble_oliver.png'}
			{id: 'dragble4', src:'dragble_phillip.png'}
			{id: 'dragble5', src:'dragble_renee.png'}
			{id: 'dragble6', src:'dragble_stuart.png'}
			{id: 'image6', src:'image_bella.png'}
			{id: 'image4', src:'image_benny.png'}
			{id: 'image5', src:'image_hana.png'}
			{id: 'image2', src:'image_julia.png'}
			{id: 'image1', src:'image_oliver.png'}
			{id: 'image3', src:'image_phillip.png'}
			{id: 'image8', src:'image_renee.png'}
			{id: 'image7', src:'image_start.png'}
			{id: 'correct', src:'correct.png'}
			{id: 'incorrect', src:'wrong.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U8_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U8_A4_bella.mp3', id:'sbella'}
		    {src:'sounds/TU2_U8_A4_benny.mp3', id:'sbenny'}
		    {src:'sounds/TU2_U8_A4_hana.mp3', id:'shana'}
		    {src:'sounds/TU2_U8_A4_julia.mp3', id:'sjulia'}
		    {src:'sounds/TU2_U8_A4_oliver.mp3', id:'soliver'}
		    {src:'sounds/TU2_U8_A4_phillip.mp3', id:'sphillip'}
		    {src:'sounds/TU2_U8_A4_renee.mp3', id:'srenee'}
		    {src:'sounds/TU2_U8_A4_stuart.mp3', id:'sstuart'}
		]
		@game = 
			steps: [
				{sound: 'sbella', drp: 2, tgt: 6}
				{sound: 'sbenny', drp: 3, tgt: 4}
				{sound: 'shana', drp: 1, tgt: 5}
				{sound: 'sjulia', drp: 8, tgt: 2}
				{sound: 'soliver', drp: 7, tgt: 1}
				{sound: 'sphillip', drp: 4, tgt: 3}
				{sound: 'srenee', drp: 5, tgt: 8}
				{sound: 'sstuart', drp: 6, tgt: 7}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@steps = @shuffle @game.steps
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the name to the corresponding person.', 40, 100
		@insertBitmap 'finish', 'btnfinished', 387, 541
		@insertBitmap 'repeat', 'btnrepeat', 264, 541
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@setKids().introEvaluation()
	setKids: ->
		caras = new createjs.Container()
		caras.x = 90
		caras.y = 150
		caras.name = 'caras'
		
		@targets = new Array()
		for i in [1..8]
			if i < 5
				c = @createBitmap "image#{i}", "image#{i}", (145*i)-145, 0
			else
				c = @createBitmap "image#{i}", "image#{i}", (145*i)-145*5, 190
			@targets.push c
			@addToLibrary c
			caras.addChild c
		
		for i in [1..8] by 1
			d = new Droppable "dragble#{i}", (@preload.getResult "dragble#{i}"), i, 630, i*37, @stage
			@setReg d, d.width / 2, d.height / 2
			@addToLibrary d
			caras.addChild d
		@addToMain caras
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.finish, 1, {alpha :0, y: @library.finish.y + 10, delay: 0.7}
		TweenLite.from @library.repeat, 1, {alpha :0, y: @library.repeat.y + 10, delay: 0.7}
		TweenLite.from @library.caras, 1, {alpha: 0, y: @library.caras.y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		createjs.Sound.play @steps[@index].sound
		@library.repeat.addEventListener 'click', @playSound
		@library.finish.addEventListener 'click', @evaluateAnswer
		for i in [1..8] by 1
			@library["dragble#{i}"].updateDrops @targets
			@library["dragble#{i}"].addEventListener 'dropped', @evaluateDrop
			@library["dragble#{i}"].initDragListener()
	evaluateDrop: (e) =>
		@answer = e.target
		@drop = e.drop
		@answer.putInPlace x:@drop.x + 65, y:@drop.y + 150
		setTimeout @finishEvaluation, 1 * 1000
	evaluateAnswer: (e) =>
		@library.repeat.removeEventListener 'click', @playSound
		@library.finish.removeEventListener 'click', @evaluateAnswer
		for i in [1..8] by 1
			step = @steps[i - 1]
			res = @createSprite 'resultado', ['incorrect', 'correct'], null, @library["image#{step.tgt}"].x, @library["image#{step.tgt}"].y
			if @library["dragble#{step.drp}"].x is @library["image#{step.tgt}"].x + 65
				@library.score.plusOne()
				res.currentFrame = 1
			else
				res.currentFrame = 0
			@library.caras.addChild res
		setTimeout @finish, 2 * 1000
	finishEvaluation: =>
		@nextEvaluation()
	nextEvaluation: =>
		@index++
		if @index < @steps.length
			createjs.Sound.play @steps[@index].sound
	playSound: =>
		createjs.Sound.stop()
		createjs.Sound.play @steps[@index].sound
	finish: =>
		TweenLite.to @library.finish, 1, {alpha :0, y: @library.finish.y + 10}
		TweenLite.to @library.repeat, 1, {alpha :0, y: @library.repeat.y + 10}
		TweenLite.to @library.caras, 1, {alpha: 0, y: @library.caras.y + 20}
		super
	window.U8A4 = U8A4