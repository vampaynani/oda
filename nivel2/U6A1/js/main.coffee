class U2A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			

		    {id: 'p1', src: 'p1-btn.png'}
		    {id: 'p2', src: 'p2-btn.png'}
		    {id: 'm1', src: 'marco-1.png'}
		    {id: 'm2', src: 'marco-2.png'}
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
		@insertBitmap 'p1', 'p1', 731, 483
		@insertBitmap 'p2', 'p2', 731, 530
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@introEvaluation()
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
		TweenMax.from [@library['p1'], @library['p2'], @library['p3']], 1, {alpha:0, y:stageSize.h, delay:1}
	initEvaluation: (e) =>
		super
		for i in [1..2] by 1
			@blink @library['p'+i]
			@library['p'+i].addEventListener 'click', @selectPuzzle
	selectPuzzle: (e) =>
		for i in [1..2] by 1
			@blink @library["p#{i}"], off
			@library['p'+i].removeEventListener 'click', @selectPuzzle

		switch e.target.name
			when 'p1'
				@pieces =
					p1p1:  {x: 150, y: 79,  text:'A firefighter put out fires.', label:'true', back: on}
					p1p2:  {x: 245, y: 79} 
					p1p3:  {x: 318, y: 79,  text:'A nurse helps sick people.', label:'true', back: on}
					p1p4:  {x: 414, y: 79} 
					p1p5:  {x: 150, y: 165, text:'A mail carrier works at he post office.', label:'true', back: on}
					p1p6:  {x: 245, y: 165, text:'A bus driver works in an office.', label:'false', back: on}
					p1p7:  {x: 316, y: 165, text:'A waitress works at a grocery store.', label:'false', back: on}
					p1p8:  {x: 408, y: 165, text:'A salesclerk works at a bank.', label:'false', back: on}
					p1p9:  {x: 150, y: 256}
					p1p10: {x: 228, y: 256, text:'A librarian sells books.', label:'false', back: on}
					p1p11: {x: 336, y: 256}
					p1p12: {x: 408, y: 256, text:'A chef serves food.', label:'false', back: on}
				@answers = 8
				@setPuzzle 1
			when 'p2'
				@pieces =
					p2p1:  {x: 150, y: 79,  text:'A doctor works at a bank.', label:'false', back: on}
					p2p2:  {x: 245, y: 79} 
					p2p3:  {x: 318, y: 79,  text:'A teacher works at a library.', label:'false', back: on}
					p2p4:  {x: 414, y: 79} 
					p2p5:  {x: 150, y: 165, text:'A mechanic fixes cars.', label:'true', back: on}
					p2p6:  {x: 245, y: 165, text:'A police officer puts out fires.', label:'false', back: on}
					p2p7:  {x: 316, y: 165, text:'A farmer fixes cars.', label:'false', back: on}
					p2p8:  {x: 408, y: 165, text:'A waitress works at a restaurant.', label:'true', back: on}
					p2p9:  {x: 150, y: 256}
					p2p10: {x: 228, y: 256, text:'A vet helps sick animals.', label:'true', back: on}
					p2p11: {x: 336, y: 256}
					p2p12: {x: 408, y: 256, text:'A salesclerk works at a museum.', label:'false', back: on}
				@answers = 8
				@setPuzzle 2
			
	setPuzzle: (num) ->
		@num = num
		puzzle = new createjs.Container()
		puzzle.x = switch num
			when 1 then 75
			when 2 then 240
		puzzle.y = 148
		puzzle.name = 'puzzle'

		m = @createBitmap "m#{num}", "m#{num}", 145, 74
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
		dragpieces.y = 135
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
	stopListeners: ->
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