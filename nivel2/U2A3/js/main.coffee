class U2A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'above', src: 'above-btn.png'}
		    {id: 'behind', src: 'behind-btn.png'}
		    {id: 'in', src: 'in-btn.png'}
		    {id: 'next', src: 'next-btn.png'}
		    {id: 'on', src: 'on-btn.png'}
		    {id: 'under', src: 'under-btn.png'}
		    {id: 'p1', src: 'p1-btn.png'}
		    {id: 'p2', src: 'p2-btn.png'}
		    {id: 'p3', src: 'p3-btn.png'}
		    {id: 'm1', src: 'marco-1.png'}
		    {id: 'm2', src: 'marco-2.png'}
		    {id: 'm3', src: 'marco-3.png'}
		    {id: 'p1p1', src: 'puzzle1-1.png'}
		    {id: 'p1p1back', src: 'puzzle1-1-back.png'}
		    {id: 'p1p2', src: 'puzzle1-2.png'}
		    {id: 'p1p2back', src: 'puzzle1-2-back.png'}
		    {id: 'p1p3', src: 'puzzle1-3.png'}
		    {id: 'p1p3back', src: 'puzzle1-3-back.png'}
		    {id: 'p1p4', src: 'puzzle1-4.png'}
		    {id: 'p1p4back', src: 'puzzle1-4-back.png'}
		    {id: 'p1p5', src: 'puzzle1-5.png'}
		    {id: 'p1p5back', src: 'puzzle1-5-back.png'}
		    {id: 'p1p6', src: 'puzzle1-6.png'}
		    {id: 'p1p6back', src: 'puzzle1-6-back.png'}
		    {id: 'p1p7', src: 'puzzle1-7.png'}
		    {id: 'p1p7back', src: 'puzzle1-7-back.png'}
		    {id: 'p1p8', src: 'puzzle1-8.png'}
		    {id: 'p1p8back', src: 'puzzle1-8-back.png'}
		    {id: 'p1p9', src: 'puzzle1-9.png'}
		    {id: 'p1p9back', src: 'puzzle1-9-back.png'}
		    {id: 'p1p10', src: 'puzzle1-10.png'}
		    {id: 'p1p10back', src: 'puzzle1-10-back.png'}
		    {id: 'p1p11', src: 'puzzle1-11.png'}
		    {id: 'p1p11back', src: 'puzzle1-11-back.png'}
		    {id: 'p1p12', src: 'puzzle1-12.png'}
		    {id: 'p1p12back', src: 'puzzle1-12-back.png'}
		    {id: 'p2p1', src: 'puzzle2-1.png'}
		    {id: 'p2p1back', src: 'puzzle2-1-back.png'}
		    {id: 'p2p2', src: 'puzzle2-2.png'}
		    {id: 'p2p2back', src: 'puzzle2-2-back.png'}
		    {id: 'p2p3', src: 'puzzle2-3.png'}
		    {id: 'p2p3back', src: 'puzzle2-3-back.png'}
		    {id: 'p2p4', src: 'puzzle2-4.png'}
		    {id: 'p2p4back', src: 'puzzle2-4-back.png'}
		    {id: 'p2p5', src: 'puzzle2-5.png'}
		    {id: 'p2p5back', src: 'puzzle2-5-back.png'}
		    {id: 'p2p6', src: 'puzzle2-6.png'}
		    {id: 'p2p6back', src: 'puzzle2-6-back.png'}
		    {id: 'p2p7', src: 'puzzle2-7.png'}
		    {id: 'p2p7back', src: 'puzzle2-7-back.png'}
		    {id: 'p2p8', src: 'puzzle2-8.png'}
		    {id: 'p2p8back', src: 'puzzle2-8-back.png'}
		    {id: 'p2p9', src: 'puzzle2-9.png'}
		    {id: 'p2p9back', src: 'puzzle2-9-back.png'}
		    {id: 'p2p10', src: 'puzzle2-10.png'}
		    {id: 'p2p10back', src: 'puzzle2-10-back.png'}
		    {id: 'p2p11', src: 'puzzle2-11.png'}
		    {id: 'p2p11back', src: 'puzzle2-11-back.png'}
		    {id: 'p2p12', src: 'puzzle2-12.png'}
		    {id: 'p2p12back', src: 'puzzle2-12-back.png'}
		    {id: 'p3p1', src: 'puzzle3-1.png'}
		    {id: 'p3p1back', src: 'puzzle3-1-back.png'}
		    {id: 'p3p2', src: 'puzzle3-2.png'}
		    {id: 'p3p2back', src: 'puzzle3-2-back.png'}
		    {id: 'p3p3', src: 'puzzle3-3.png'}
		    {id: 'p3p3back', src: 'puzzle3-3-back.png'}
		    {id: 'p3p4', src: 'puzzle3-4.png'}
		    {id: 'p3p4back', src: 'puzzle3-4-back.png'}
		    {id: 'p3p5', src: 'puzzle3-5.png'}
		    {id: 'p3p5back', src: 'puzzle3-5-back.png'}
		    {id: 'p3p6', src: 'puzzle3-6.png'}
		    {id: 'p3p6back', src: 'puzzle3-6-back.png'}
		    {id: 'p3p7', src: 'puzzle3-7.png'}
		    {id: 'p3p7back', src: 'puzzle3-7-back.png'}
		    {id: 'p3p8', src: 'puzzle3-8.png'}
		    {id: 'p3p8back', src: 'puzzle3-8-back.png'}
		    {id: 'p3p9', src: 'puzzle3-9.png'}
		    {id: 'p3p9back', src: 'puzzle3-9-back.png'}
		    {id: 'p3p10', src: 'puzzle3-10.png'}
		    {id: 'p3p10back', src: 'puzzle3-10-back.png'}
		    {id: 'p3p11', src: 'puzzle3-11.png'}
		    {id: 'p3p11back', src: 'puzzle3-11-back.png'}
		    {id: 'p3p12', src: 'puzzle3-12.png'}
		    {id: 'p3p12back', src: 'puzzle3-12-back.png'}
		]
		sounds = [
			{src:'sounds/TU2_U2_A3_instructions.mp3', id:'instructions'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'p1', 'p1', 731, 436
		@insertBitmap 'p2', 'p2', 731, 483
		@insertBitmap 'p3', 'p3', 731, 530
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@introEvaluation()
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.from [@library['p1'], @library['p2'], @library['p3']], 1, {alpha:0, y:stageSize.h, delay:1}
	initEvaluation: (e) =>
		super
		for i in [1..3] by 1
			@blink @library['p'+i]
			@library['p'+i].addEventListener 'click', @selectPuzzle
	selectPuzzle: (e) =>
		for i in [1..3] by 1
			@blink @library["p#{i}"], off
			@library['p'+i].removeEventListener 'click', @selectPuzzle

		@insertBitmap 'behind','behind', 118, 290
		@insertBitmap 'in','in', 118, 347
		@insertBitmap 'under','under', 118, 404
		@insertBitmap 'next','next', 628, 293
		@insertBitmap 'on','on', 628, 350
		@insertBitmap 'above','above', 628, 407

		switch e.target.name
			when 'p1'
				@pieces =
					p1p1: {x: 10, y: 10, texta:'The picture is',textb:'the fridge.', label:'above', back: on}
					p1p2: {x: 83, y: 10}
					p1p3: {x: 180, y: 10, texta:'The cat is',textb:'the flowers.', label:'next to', back: on}
					p1p4: {x: 10, y: 68}
					p1p5: {x: 82, y: 80, texta:'The apples are',textb:'the sink.', label:'in', back: on}
					p1p6: {x: 175, y: 80}
					p1p7: {x: 10, y: 150, texta:'The broom is',textb:'the fridge.', label:'next to', back: on}
					p1p8: {x: 77, y: 133, texta:'The fruit is',textb:'the table.', label:'on', back: on}
					p1p9: {x: 175, y: 135, texta:'The cake is',textb:'the oven.', label:'in', back: on}
					p1p10: {x: 10, y: 202, texta:'The mouse is',textb:'the chair.', label:'behind', back: on}
					p1p11: {x: 83, y: 202, texta:'The puppy is',textb:'the table.', label:'under', back: on}
					p1p12: {x: 180, y: 208}
				@answers = 8
				@setPuzzle 1
			when 'p2'
				@pieces =
					p2p1: {x: 28, y: 10, texta:'The picture is',textb:'the wall.', label:'on', back: on}
					p2p2: {x: 106, y: 10, texta:'The clock is',textb:'the window.', label:'above', back: on}
					p2p3: {x: 206, y: 10, texta:'The plant is',textb:'the bookcase.', label:'on', back: on}
					p2p4: {x: 28, y: 66, texta:'The lamp is',textb:'the sofa.', label:'next to', back: on}
					p2p5: {x: 104, y: 80}
					p2p6: {x: 202, y: 80, texta:'The books are',textb:'the bookcase.', label:'in', back: on}
					p2p7: {x: 28, y: 147, texta:'The boy is',textb:'the armchair.', label:'behind', back: on}
					p2p8: {x: 98, y: 133, texta:'The doll is',textb:'the sofa.', label:'on', back: on}
					p2p9: {x: 202, y: 133}
					p2p10: {x: 28, y: 201}
					p2p11: {x: 105, y: 201, texta:'The dog is',textb:'the table.', label:'under', back: on}
					p2p12: {x: 209, y: 207}
				@answers = 8
				@setPuzzle 2
			when 'p3'
				@pieces =
					p3p1: {x: 15, y: 12}
					p3p2: {x: 104, y: 12}
					p3p3: {x: 174, y: 12, texta:'The boots are',textb:'the teddy bear.', label:'next to', back: on}
					p3p4: {x: 268, y: 12}
					p3p5: {x: 15, y: 89, texta:'The picture is',textb:'the bed.', label:'above', back: on}
					p3p6: {x: 105, y: 89, texta:'The brown cat is',textb:'the bed.', label:'on', back: on}
					p3p7: {x: 172, y: 89, texta:'The dress is',textb:'the closet.', label:'in', back: on}
					p3p8: {x: 263, y: 89, texta:'The pencil case is',textb:'the dresser.', label:'on', back: on}
					p3p9: {x: 15, y: 170, texta:'The mouse is',textb:'the bed.', label:'behind', back: on}
					p3p10: {x: 88, y: 170, texta:'The white cat is',textb:'the bed.', label:'under', back: on}
					p3p11: {x: 192, y: 170}
					p3p12: {x: 262, y: 170, texta:'The schoolbag is',textb:'the dresser.', label:'next to', back: on}
				@answers = 8
				@setPuzzle 3

		TweenLite.from @library['behind'], 1, {alpha:0, y:@library['behind'].y - 20}
		TweenLite.from @library['in'], 1, {alpha:0, y:@library['in'].y - 20, delay: 0.2}
		TweenLite.from @library['under'], 1, {alpha:0, y:@library['under'].y - 20, delay: 0.4}
		TweenLite.from @library['next'], 1, {alpha:0, y:@library['next'].y - 20}
		TweenLite.from @library['on'], 1, {alpha:0, y:@library['on'].y - 20, delay: 0.2}
		TweenLite.from @library['above'], 1, {alpha:0, y:@library['above'].y - 20, delay: 0.4}
	setPuzzle: (num) ->
		@num = num
		puzzle = new createjs.Container()
		puzzle.x = switch num
			when 1 then 260
			when 2 then 240
			when 3 then 220
		puzzle.y = 230
		puzzle.name = 'puzzle'

		m = @createBitmap "m#{num}", "m#{num}", 0, 0
		puzzle.addChild m
		
		for i in [1..12] by 1
			if @pieces["p#{num}p#{i}"].back
				pp = @createBitmap "p#{num}p#{i}b", "p#{num}p#{i}back", @pieces["p#{num}p#{i}"].x, @pieces["p#{num}p#{i}"].y
			else
				pp = @createBitmap "p#{num}p#{i}", "p#{num}p#{i}", @pieces["p#{num}p#{i}"].x, @pieces["p#{num}p#{i}"].y
			
			@addToLibrary pp
			puzzle.addChild pp

		dragpieces = new createjs.Container()
		dragpieces.x = stageSize.w / 2
		dragpieces.y = 150
		dragpieces.name = 'dragpieces'
		index = 0
		
		for i in [1..12] by 1
			if @pieces["p#{num}p#{i}"].back
				dpp = new Draggable "dp#{num}p#{i}", @preload.getResult("p#{num}p#{i}"), "p#{num}p#{i}", index*88, 0
				dpp.addEventListener 'drop', @evaluateAnswer
				@observer.subscribe 'init_drag', dpp.onInitEvaluation
				@observer.subscribe 'stop_drag', dpp.onStopEvaluation
				dpp.scaleX = dpp.scaleY = 0.6
				index++
				@addToLibrary dpp
				dragpieces.addChild dpp
		
		dragpieces.width = index*88
		@setReg(dragpieces, dragpieces.width / 2, 0)
		
		@addToMain puzzle
		@addToMain dragpieces

		TweenLite.from puzzle, 1, {alpha:0, y:puzzle.y - 20, delay: 0.6}
		TweenLite.from dragpieces, 1, {alpha:0, y:puzzle.y - 20, delay: 0.6, onComplete: @initDrag}
	initDrag: =>
		@observer.notify 'init_drag'
	initListeners: ->
		@library['behind'].addEventListener 'click', @evaluateLocation
		@library['in'].addEventListener 'click', @evaluateLocation
		@library['under'].addEventListener 'click', @evaluateLocation
		@library['next'].addEventListener 'click', @evaluateLocation
		@library['on'].addEventListener 'click', @evaluateLocation
		@library['above'].addEventListener 'click', @evaluateLocation
	stopListeners: ->
		@library['behind'].removeEventListener 'click', @evaluateLocation
		@library['in'].removeEventListener 'click', @evaluateLocation
		@library['under'].removeEventListener 'click', @evaluateLocation
		@library['next'].removeEventListener 'click', @evaluateLocation
		@library['on'].removeEventListener 'click', @evaluateLocation
		@library['above'].removeEventListener 'click', @evaluateLocation
	evaluateAnswer: (e) =>
		@answer = e.target
		hit = @library[@answer.index+'b']
		pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
		
		if hit.hitTest pt.x, pt.y
			hpt = hit.parent.localToGlobal hit.x, hit.y
			htt = @answer.parent.globalToLocal hpt.x, hpt.y
			@wordcompleter = new WordCompleter 'dropper', @pieces[@answer.index].texta, '', @pieces[@answer.index].textb, '#FFF', '#E90E2C', 150, 560, 90, 30
			
			@wordcompleter.x = stageSize.w / 2 - @wordcompleter.width / 2
			
			if @library['dropper']
				@mainContainer.removeChild @library['dropper']
			@addToMain @wordcompleter

			@observer.notify 'stop_drag'
			
			@answer.putInPlace( htt )
			@initListeners()
		else
			@answer.returnToPlace()
	evaluateLocation: (e) =>
		name = e.target.name
		name = 'next to' if name is 'next' 
		if name is @pieces[@answer.index].label
			@wordcompleter.changeText @pieces[@answer.index].label
			@stopListeners()
			createjs.Sound.play 'good'
			setTimeout @finishEvaluation, 1 * 1000
		else
			@warning()
	finishEvaluation: =>
		@library['score'].plusOne()
		TweenLite.to @library['dropper'], 0.5, {alpha: 0, y: stageSize.h, ease:Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers
			@initDrag()
		else
			@finish()
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		super
	window.U2A3 = U2A3