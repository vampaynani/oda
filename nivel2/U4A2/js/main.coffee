class U4A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'bluewhale', src:'bluewhale_img.png'}
			{id: 'dolphin', src:'dolphin_img.png'}
			{id: 'eagle', src:'eagle_img.png'}
			{id: 'giantpanda', src:'giantpanda_img.png'}
			{id: 'polarbear', src:'polarbear_img.png'}
			{id: 'gorilla', src:'gorilla_img.png'}
			{id: 'jaguar', src:'jaguar_img.png'}
			{id: 'lion', src:'lion_img.png'}
			{id: 'seaturtle', src:'seaturttle_img.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U4_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@letters = [
			['g', 'i', 'a', 'n', 't', 'p', 'a', 'n', 'd', 'a']
			['p', 's', 'e', 'a', 't', 'u', 'r', 't', 'l', 'e']
			['o', 'u', 's', 'q', 'f', 'a', 't', 'y', 'i', 'j']
			['l', 'g', 'e', 'x', 'k', 'e', 'j', 'd', 'o', 'a']
			['a', 'e', 'd', 'o', 'l', 'p', 'h', 'i', 'n', 'g']
			['r', 'a', 'n', 'h', 'y', 'j', 'i', 'n', 'b', 'u']
			['b', 'g', 'o', 'r', 'i', 'l', 'l', 'a', 't', 'a']
			['e', 'l', 'k', 'd', 'o', 'z', 'p', 'l', 'n', 'r']
			['a', 'e', 'o', 'f', 'e', 'a', 'd', 'o', 'f', 'l']
			['r', 'b', 'l', 'u', 'e', 'w', 'h', 'a', 'l', 'e']
		]
		@answers = [
			{id: 'seaturtle', line: ['l11','l12','l13','l14','l15','l16','l17','l18','l19']}
			{id: 'polarbear', line: ['l10','l20','l30','l40','l50','l60','l70','l80','l90']}
			{id: 'bluewhale', line: ['l91','l92','l93','l94','l95','l96','l97','l98','l99']}
			{id: 'giantpanda', line: ['l0','l1','l2','l3','l4','l5','l6','l7','l8','l9']}
			{id: 'dolphin', line: ['l42','l43','l44','l45','l46','l47','l48']}
			{id: 'gorilla', line: ['l61','l62','l63','l64','l65','l66','l67']}
			{id: 'jaguar', line: ['l29','l39','l49','l59','l69','l79']}
			{id: 'eagle', line: ['l41','l51','l61','l71','l81']}
			{id: 'lion', line: ['l18','l28','l38','l48']}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Find the words and drag the cursor.', 80, 200
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 150, 0
		@setAnimals().setSopa().introEvaluation()
	setAnimals:  ->
		@insertBitmap 'bluewhale', 'bluewhale', 1018, 930
		@insertBitmap 'dolphin', 'dolphin', 454, 920
		@insertBitmap 'eagle', 'eagle', 66, 312
		@insertBitmap 'giantpanda', 'giantpanda', 1322, 498
		@insertBitmap 'gorilla', 'gorilla', 244, 722
		@insertBitmap 'jaguar', 'jaguar', 284, 264
		@insertBitmap 'lion', 'lion', 1172, 260
		@insertBitmap 'seaturtle', 'seaturtle', 1180, 744
		@insertBitmap 'polarbear', 'polarbear', 736, 848
		@
	setSopa: ->

		j = 0
		h = @letters.length
		sopa = new createjs.Container()
		sopa.x = 594
		sopa.y = 296
		sopa.name = 'sopa'
		sopa.visible = off
		shapesContainer = new createjs.Container()
		shapesContainer.name = 'shapesContainer'
		sopa.addChild shapesContainer
		@addToLibrary shapesContainer
		llength = @letters.length - 1
		for h in [0..llength] by 1
			lhlength = @letters[h].length - 1
			for i in [0..lhlength] by 1
				letra = new ClickableText "l#{j}", @letters[h][i], "l#{j}", i * 52, h * 52
				letra.h = h
				letra.i = i
				letra.text.font = '40px Quicksand'
				letra.text.textAlign = 'center'
				sopa.addChild letra
				@addToLibrary letra
				j++
		@addToMain sopa
		@
	updateCounter: =>
		@time--
		@library['score'].updateTotal @time
		@finish() if @time is 0
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.allFrom [@library['bluewhale'], 
						@library['dolphin'], 
						@library['eagle'], 
						@library['giantpanda'], 
						@library['gorilla'],
						@library['jaguar'],
						@library['lion'],
						@library['seaturtle'],
						@library['polarbear']
						], 1, {alpha: 0, delay: 1.5}, 0.1
	initEvaluation: (e) =>
		super
		@time = 151
		@timer = setInterval @updateCounter, 1000

		@library.sopa.visible = on
		@library.sopa.cache -52, -52, 572, 572
		TweenLite.from @library['sopa'], 1, {alpha :0, y: @library['sopa'].y - 40}
		@mainContainer.addEventListener 'mousedown', @evaluateAnswer
	evaluateAnswer: (e) =>
		answer = Array()
		shape = new createjs.Shape()
		target = e.target
		pt = @mainContainer.globalToLocal @stage.mouseX, @stage.mouseY
		oup = @mainContainer.getObjectUnderPoint pt.x, pt.y
		i = 0
		h = 0
		@library.shapesContainer.addChild shape
		if oup
			clktxt = oup.parent
			if clktxt instanceof ClickableText
				answer.push clktxt.index
				pos = x: clktxt.i * 52 - 26, y: clktxt.h * 52, i: clktxt.i, h: clktxt.h
				shape.graphics.s("rgba(255, 0, 0, 1)").f("rgba(255, 0, 0, 0.5)").rr(pos.x,pos.y,52,52,10)
				@library.sopa.cache -52,-52,572,572
				target.addEventListener 'pressmove', (ev) =>
					pt = @mainContainer.globalToLocal @stage.mouseX, @stage.mouseY
					oup = @mainContainer.getObjectUnderPoint pt.x, pt.y
					if oup
						clktxt = oup.parent
						if clktxt instanceof ClickableText
							i = if Math.abs(clktxt.i - pos.i + 1) is 0 then 1 else Math.abs(clktxt.i - pos.i + 1)
							h = if Math.abs(clktxt.h - pos.h + 1) is 0 then 1 else Math.abs(clktxt.h - pos.h + 1)
							npos = w: i * 52, h: h * 52
							answer.push clktxt.index
							shape.graphics.c().s("rgba(255, 0, 0, 1)").f("rgba(255, 0, 0, 0.5)").rr(pos.x,pos.y,npos.w,npos.h,10)
							@library.sopa.cache -52,-52,572,572
				target.addEventListener 'pressup', (ev) =>
					find = off
					answer = Array()
					for i in [0..99] by 1
						if shape.hitTest @library["l#{i}"].x, @library["l#{i}"].y + 13 
							answer.push @library["l#{i}"].name
					for obj in @answers
						if obj.line.toString() is answer.toString()
							TweenLite.to @library[obj.id], 0.3, {y:@library[obj.id].y - 200, alpha:0, onComplete: @finishEvaluation}
							find = on
					@library.shapesContainer.removeChild shape if not find
					@library.sopa.cache -52,-52,572,572
	finishEvaluation: =>
		createjs.Sound.play 'good'
		@nextEvaluation()
	nextEvaluation: =>
		@index++
		#@library.score.plusOne()
		if @index >= @answers.length
			@finish()
	finish: ->
		clearInterval @timer

		@mainContainer.removeEventListener 'mousedown', @evaluateAnswer
		TweenLite.to @library['sopa'], 1, {y:@library['sopa'].y + 200, alpha:0}
		super
	window.U4A2 = U4A2