class U1A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}

  			{id: 'flecha1', src:'flecha_1.png'}
			{id: 'flecha2', src:'flecha_2.png'}
			{id: 'flecha3', src:'flecha_3.png'}
			{id: 'flecha4', src:'flecha_4.png'}
			{id: 'flecha5', src:'flecha_5.png'}

			{id:'error', src: 'wrong.png'}
			{id:'success', src: 'correct.png'}

			{id: 'mariposaStart1', src:'image_1_dragble.png'}
			{id: 'mariposaStart2', src:'image_2_dragble.png'}
			{id: 'mariposaStart3', src:'image_3_dragble.png'}
			{id: 'mariposaStart4', src:'image_4_dragble.png'}
			{id: 'mariposaStart5', src:'image_5_dragble.png'}


			{id:'mariposabtnready', src: 'btn_finished.png'}

			
			{id:'mariposalabel', src: 'caterpillar_label.png'}


			{id:'mariposastep1', src: 'image_1_dropArea.png'}
			{id:'mariposastep2', src: 'image_2_dropArea.png'}
			{id:'mariposastep3', src: 'image_3_dropArea.png'}
			{id:'mariposastep4', src: 'image_4_dropArea.png'}
			{id:'mariposastep5', src: 'image_5_dropArea.png'}

			{id:'mariposaline1', src: 'verso_1_dropArea.png'}
			{id:'mariposaline2', src: 'verso_2_dropArea.png'}
			{id:'mariposaline3', src: 'verso_3_dropArea.png'}
			{id:'mariposaline4', src: 'verso_4_dropArea.png'}
			{id:'mariposaline5', src: 'verso_5_dropArea.png'}

	
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U1_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U1_A4_song.mp3', id:'song'}
		]
		
		@mariposa = 
			drags:[
				{id:'mariposaStart1'}
				{id:'mariposaStart2'}
				{id:'mariposaStart3'}
				{id:'mariposaStart4'}
				{id:'mariposaStart5'}
			]
			texts:[
				{t: "Wake up now. I can't believe my eyes! Leaving your cocoon. What a big surprise!", x:98, y:417, w:230}
				{t: "Then you are a caterpillar, long and green, With one goal in life--to eat, eat, eat!", x:200, y:460, w:240}
				{t: "Now you are a butterfly with wings so new. Fly far away, up into the blue!", x:134, y:504, w:205}
				{t: "Build a little house called cocoon.\r\n Sleep a little while. I'll see you very soon!", x:109, y:547, w:225}
				{t: "Tiny little eggs under a leaf, Oh so difficult for me to see!", x:370, y:547, w:170}
			]
		
		@positions = 
			dragsImg:[
				{x:550,y:506}
				{x:630,y:506}
				{x:590,y:438}
				{x:501,y:438}
				{x:677,y:438}
			]		
			steps:[
				{x: 126, y:207}
				{x: 144, y:250}
				{x: 126, y:293}
				{x: 144, y:335}
				{x: 126, y:377}
			]
			drops:[
				{x:482,y:184}
				{x:565,y:130}
				{x:656,y:175}
				{x:622,y:268}
				{x:517,y:278}
			]
			flechas:[
				{x:478,y:273}
				{x:511,y:140}
				{x:652,y:134}
				{x:727,y:261}
				{x:595,y:360}
			]
			ready: {x:577,y:383}
			start: {x:284,y:539}
			score: {x:86,y:191}
			titulo: {x:150,y:131}

		@answers =
			mariposa: [
				{t:'d1', d:'mariposastep1'}
				{t:'d2', d:'mariposastep2'}
				{t:'d3', d:'mariposastep3'}
				{t:'d4', d:'mariposastep4'}
				{t:'d5', d:'mariposastep5'}
				{t:'dt5', d:'mariposaline1'}
				{t:'dt2', d:'mariposaline2'}
				{t:'dt4', d:'mariposaline3'}
				{t:'dt1', d:'mariposaline4'}
				{t:'dt3', d:'mariposaline5'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read and place the pictures and verses in order, then click on Finished.', 40, 100
		
		@insertBitmap 'label', 'mariposalabel', @positions.titulo.x, @positions.titulo.y
		@insertText 'h2', 'Caterpillar, catterpillar, up in the tree. Where do you come from? Please tell me.', '12px Quicksand', '#333', 154, 150
		@library.h2.lineWidth = 250
		
		@addToMain new Button 'btnready', (@preload.getResult 'mariposabtnready'), 'ready', @positions.ready.x, @positions.ready.y
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@library.score.txtCount.color = "#bfd951"
		@library.score.txtTotal.color = "#ff9933"
		
		@setMariposa()
	setMariposa: () =>
		mariposa = new createjs.Container()
		@current = mariposa.name = 'mariposa'
		
		for i in [1..5] by 1
			s = @createBitmap "mariposastep#{i}", "mariposastep#{i}", @positions.drops[i-1].x, @positions.drops[i-1].y
			f = @createBitmap "flecha#{i}", "flecha#{i}", @positions.flechas[i-1].x , @positions.flechas[i-1].y 
			l = @createBitmap "mariposaline#{i}", "mariposaline#{i}", @positions.steps[i-1].x , @positions.steps[i-1].y - 25
			@addToLibrary s, l
			mariposa.addChild s, f, l

		for i in [1..@mariposa.drags.length] by 1
			value = @mariposa.drags[i - 1]
			v = new Draggable "d#{i}", (@preload.getResult value.id), i, @positions.dragsImg[i-1].x, @positions.dragsImg[i-1].y
			v.scaleX = v.scaleY = 0.8
			@observer.subscribe 'init_mariposa', v.initDragListener
			v.addEventListener 'drop', @evaluateImageDrop
			mariposa.addChild v
			@addToLibrary v

		for i in [1..@mariposa.texts.length] by 1
			value = @mariposa.texts[i - 1]
			v = new DraggableText "dt#{i}", value.t, i, value.x, value.y
			v.text.font = '11px Quicksand'
			v.text.lineHeight = 14
			v.text.lineWidth = value.w
			v.createHitArea value.w, v.text.getMeasuredHeight()
			@observer.subscribe 'init_mariposa', v.initDragListener
			v.addEventListener 'drop', @evaluateTextDrop
			mariposa.addChild v
			@addToLibrary v

		@addToMain mariposa
		@introEvaluation()
		@
	introEvaluation: ->
		super
		TweenLite.from @library.btnready, 0.5, {alpha: 0, y: @library.btnready.y - 20, ease: Back.easeOut}
		TweenLite.from @library[@current], 0.5, {alpha: 0, y: 20, ease: Back.easeOut, onComplete: @playInstructions, onCompleteParams:[@]}
	initEvaluation: (e) =>
		super
		@startGame()
	startGame: (e) =>
		@observer.notify "init_#{@current}"
		@library.btnready.addEventListener 'click', @evaluateAnswer
	evaluateImageDrop: (e) =>
		@answer = e.target
		dropped = off
		i = 1
		until dropped is on or i > 5
			hit = @library["#{@current}step#{i}"]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
				@answer.putInPlace {x: hit.x, y: hit.y}, 1, 1, 1
				dropped = on
			else
				i++
		if not dropped
			@answer.returnToPlace 1, 0.8, 0.8
	evaluateTextDrop: (e) =>
		@answer = e.target
		dropped = off
		i = 1
		until dropped is on or i > 5
			hit = @library["#{@current}line#{i}"]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
                if @current is 'mariposa'
                    @answer.putInPlace {x: hit.x + 40, y: hit.y + 7}, 1, @answer.scaleX, @answer.scaled
                    dropped = on
			else
				i++
		if not dropped
			@answer.returnToPlace 1, @answer.scaleX, @answer.scaleY
	evaluateAnswer: (e) =>
		@library.btnready.removeEventListener 'click', @evaluateAnswer
		@complete = on
		for value in @answers[@current]
			if value.t.length > 2
				pt = @library[value.t].localToLocal 5, 5, @library[value.d]
			else
				pt = @library[value.t].localToLocal 20, 20, @library[value.d]
			npt = @library[value.d].localToLocal 0, 0, @mainContainer
			if @library[value.t].hitTest pt.x, pt.y
				@library.score.plusOne()
				r = @createBitmap 'success', 'success', npt.x, npt.y
			else
				@complete = off
				r = @createBitmap 'error', 'error', npt.x, npt.y
			@library[@current].addChild r
		setTimeout @endGame, 1 * 1000
	endGame: (e) =>
		@complete = off
		s = createjs.Sound.play 'song'
		s.addEventListener 'complete', @finishEvaluation
	finishEvaluation: =>
		TweenLite.to @library.label, 0.5, {alpha: 0, y: @library.label.y - 20, ease: Back.easeOut}
		TweenLite.to @library.h2, 0.5, {alpha: 0, y: @library.h2.y - 20, ease: Back.easeOut}
		TweenLite.to @library.btnready, 0.5, {alpha: 0, y: @library.btnready.y - 20, ease: Back.easeOut}
		TweenLite.to @library[@current], 0.5, {alpha: 0, y: 20, ease: Back.easeOut, onComplete: @finish}
	finish: =>
		super
	window.U1A4 = U1A4