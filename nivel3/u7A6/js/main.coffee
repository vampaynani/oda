class U7A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}

			{id:'1p1', src:'1p0001.png'}
			{id:'1p2', src:'1p0002.png'}
			{id:'2p1', src:'2p0001.png'}
			{id:'2p2', src:'2p0002.png'}
			{id:'3p1', src:'3p0001.png'}
			{id:'3p2', src:'3p0002.png'}
			{id:'4p1', src:'4p0001.png'}
			{id:'4p2', src:'4p0002.png'}
			{id:'5p1', src:'5p0001.png'}
			{id:'5p2', src:'5p0002.png'}
			{id:'6p1', src:'6p0001.png'}
			{id:'6p2', src:'6p0002.png'}
			{id:'7p1', src:'7p0001.png'}
			{id:'7p2', src:'7p0002.png'}
			{id:'8p1', src:'8p0001.png'}
			{id:'8p2', src:'8p0002.png'}
			{id:'9p1', src:'9p0001.png'}
			{id:'9p2', src:'9p0002.png'}
			{id:'10p1', src:'10p0001.png'}
			{id:'10p2', src:'10p0002.png'}
			{id:'line', src:'line.png'}
			{id:'area', src:'prop_area.png'}
			{id:'bg', src:'prop_bg.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U7_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@letters = [
			['e', 's', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'o', 'r']
			['m', 'b', 'a', 'm', 'e', 'r', 'c', 't', 'o', 'r', 'w', 'a']
			['b', 'a', 'm', 'b', 'o', 'o', 'o', 'c', 'g', 'g', 'd', 'c']
			['a', 'b', 'l', 'a', 'r', 'c', 'm', 'o', 'm', 'u', 'e', 'a']
			['c', 'o', 'r', 'm', 'a', 'r', 't', 'm', 'e', 'n', 'r', 'l']
			['l', 'e', 'c', 'e', 'v', 'e', 'r', 'p', 'e', 'p', 'a', 'n']
			['e', 'd', 'u', 't', 'c', 'h', 'e', 'a', 'f', 'o', 'k', 'o']
			['v', 'e', 'r', 'i', 'a', 'g', 'l', 's', 'r', 'w', 'a', 'm']
			['e', 's', 't', 'a', 'm', 'o', 'u', 's', 'u', 'd', 'n', 'a']
			['r', 'h', 'i', 'b', 'e', 'r', 'n', 'a', 't', 'e', 'o', 'd']
			['c', 'o', 'p', 's', 'l', 'e', 'o', 'd', 'i', 'r', 'e', 'e']
			['e', 'c', 'h', 'o', 'p', 's', 't', 'i', 'c', 'k', 's', 't']	
		]
		@answers = [
			{q: 'What do you use to do sums in math class?', t:'A', id: 'calculator', line: ['l11','l12','l13','l14','l15','l16','l17','l18','l19'], x:110, y:475 }
			{q:'Who invented the telescope?', t:'The' , id: 'Dutch', line: ['l10','l20','l30','l40','l50','l60','l70','l80','l90'], x:202, y:475 }
			{q: 'What plant do pandas mainly eat?', t:'', id: 'bamboo', line: ['l91','l92','l93','l94','l95','l96','l97','l98','l99'], x:298, y:475 }
			{q: "What's another word for 'intelligent'?", t:'', id: 'clever', line: ['l0','l1','l2','l3','l4','l5','l6','l7','l8','l9'], x:393, y:475 }
			{q: 'What instrument shows north, south, east and west?', t:'A', id: 'compass', line: ['l42','l43','l44','l45','l46','l47','l48'], x:131, y:511 }
			{q: 'What do you call a person with no permanent home?', t:'A', id: 'nomad', line: ['l61','l62','l63','l64','l65','l66','l67'], x:227, y:511 }
			{q: 'What do Chinese people use to eat food?', t:'', id: 'chopsticks', line: ['l29','l39','l49','l59','l69','l79'], x:321, y:511 }
			{q: 'How did people travel on the Silk Road?', t:'By', id: 'camel', line: ['l29','l39','l49','l59','l69','l79'], x:152, y:543 }
			{q: 'What do most bears do during the winter?', t:'They', id: 'hibernate', line: ['l29','l39','l49','l59','l69','l79'], x:243, y:543 }
			{q: 'What are fireworks made from?', t:'', id: 'gunpowder', line: ['l29','l39','l49','l59','l69','l79'], x:355, y:543 }
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on the numbers, unscramble the answers and find them in the word search.', 40, 100
		@insertBitmap 'bg', 'bg', 840, 380, 'tr'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 9, 0
		@setQuestions().setSopa().introEvaluation()
	setQuestions:  ->
		preguntas = new createjs.Container()
		preguntas.x = 40
		preguntas.y = 173

		area = @createBitmap 'area', 'area', 0, 42
		preguntas.addChild area

		for i in [1..5]
			numero = @createSprite "numero#{i}", ["#{i}p1","#{i}p2"],null, (i - 1) * 63, 0 
			numerob = @createSprite "numerob#{i}", ["#{i + 5}p1","#{i + 5}p2"],null, (i - 1) * 63, 225 - i

			if i is 1 
				numero.x = numero.x + 17
				numerob.x = numerob.x + 17
			preguntas.addChild numero, numerob
		for i in [1..@answers.length]
			respuesta = new createjs.Container()
			respuesta.x = @answers[i - 1].x + 30
			respuesta.y = @answers[i - 1].y + 10

			text = new createjs.Text @answers[i - 1].id, '16px Quicksand', '#333333'
			text.textAlign = 'center'
			tache = @createBitmap 'line', 'line', 0, 5, 'tc'

			respuesta.addChild text, tache
			@addToMain respuesta
		@addToMain preguntas
		@
	setSopa: ->
		j = 0
		h = @letters.length
		sopa = new createjs.Container()
		sopa.x = 420
		sopa.y = 148
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
				letra = new ClickableText "l#{j}", @letters[h][i], "l#{j}", i * 26, h * 26
				letra.h = h
				letra.i = i
				letra.text.font = '20px Quicksand'
				letra.text.textAlign = 'center'
				sopa.addChild letra
				@addToLibrary letra
				j++
		@addToMain sopa
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	
 	initEvaluation: (e) =>
		super
		@library.sopa.visible = on
		#@library.sopa.cache -26,-26,286,286
		TweenLite.from @library['sopa'], 1, {alpha :0, y: @library['sopa'].y - 20}
		@mainContainer.addEventListener 'mousedown', @evaluateAnswer
	evaluateAnswer: (e) =>
		answer = Array()
		shape = new createjs.Shape()
		pt = @mainContainer.globalToLocal @stage.mouseX, @stage.mouseY
		oup = @mainContainer.getObjectUnderPoint pt.x, pt.y
		i = 0
		h = 0
		@library.shapesContainer.addChild shape
		if oup
			clktxt = oup.parent
			if clktxt instanceof ClickableText
				answer.push clktxt.index
				pos = x: clktxt.i * 26 - 13, y: clktxt.h * 26, i: clktxt.i, h: clktxt.h
				shape.graphics.s("rgba(255, 0, 0, 1)").f("rgba(255, 0, 0, 0.5)").rr(pos.x,pos.y,26,26,5)
				#@library.sopa.cache -26,-26,286,286
				e.addEventListener 'mousemove', (ev) =>
					pt = @mainContainer.globalToLocal @stage.mouseX, @stage.mouseY
					oup = @mainContainer.getObjectUnderPoint pt.x, pt.y
					if oup
						clktxt = oup.parent
						if clktxt instanceof ClickableText
							i = if Math.abs(clktxt.i - pos.i + 1) is 0 then 1 else Math.abs(clktxt.i - pos.i + 1)
							h = if Math.abs(clktxt.h - pos.h + 1) is 0 then 1 else Math.abs(clktxt.h - pos.h + 1)
							npos = w: i * 26, h: h * 26
							answer.push clktxt.index
							shape.graphics.c().s("rgba(255, 0, 0, 1)").f("rgba(255, 0, 0, 0.5)").rr(pos.x,pos.y,npos.w,npos.h,5)
							#@library.sopa.cache -26,-26,286,286
				e.addEventListener 'mouseup', (ev) =>
					find = off
					answer = Array()
					for i in [0..99] by 1
						if shape.hitTest @library["l#{i}"].x, @library["l#{i}"].y + 13 
							answer.push @library["l#{i}"].name
					for obj in @answers
						if obj.line.toString() is answer.toString()
							TweenLite.to @library[obj.id], 0.3, {y:@library[obj.id].y - 100, alpha:0, onComplete: @finishEvaluation}
							find = on
					@library.shapesContainer.removeChild shape if not find
					#@library.sopa.cache -26,-26,286,286
	finishEvaluation: =>
		createjs.Sound.play 'good'
		@nextEvaluation()
	nextEvaluation: =>
		@index++
		@library.score.plusOne()
		if @index >= @answers.length
			@finish()
	finish: ->
		@mainContainer.removeEventListener 'mousedown', @evaluateAnswer
		TweenLite.to @library['sopa'], 1, {y:@library['sopa'].y + 100, alpha:0}
		super
	window.U7A6 = U7A6