class U4A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'title1', src:'title1.png'}
			{id: '1', src:'1.png'}
			{id: '2', src:'2.png'}
			{id: '3', src:'3.png'}
			{id: '4', src:'4.png'}	
			{id: '5', src:'5.png'}	
			{id: '6', src:'6.png'}	
			{id: '7', src:'7.png'}	
			{id: '8', src:'8.png'}
			{id: '1b', src:'1b.png'}
			{id: '2b', src:'2b.png'}
			{id: '3b', src:'3b.png'}
			{id: '4b', src:'4b.png'}	
			{id: '5b', src:'5b.png'}	
			{id: '6b', src:'6b.png'}	
			{id: '7b', src:'7b.png'}	
			{id: '8b', src:'8b.png'}	
			{id: 'btn', src:'btn.png'}	
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U4_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U4_A5_scene1.mp3', id:'scene1'}
		    {src:'sounds/TU2_U4_A5_scene2.mp3', id:'scene2'}
		]
		@game = [
			{
				texts:[
					{idx:3, t:"But finally Hare agrees to the race."}
					{idx:1, t:'Every day Hare teases Tortoise.'}
					{idx:4, t:'Many animals arrive to watch.'}
					{idx:2, t:"I run so fast!"}
				]
				positions:[
					{x:222, y:320}
					{x:660, y:330}
					{x:224, y:750}
					{x:652, y:726}
				]
			}
			{
				texts:[
					{idx:6, t:"He stops to rest under the tree."}
					{idx:8, t:"He's the winner."}
					{idx:5, t:'He runs ahead of Tortoise.'}
					{idx:7, t:"Hare is taking a nap!"}
				]
				positions:[
					{x:222, y:320}
					{x:650, y:330}
					{x:230, y:730}
					{x:660, y:714}	
				]
			}
		]
		@answers = []
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read and drag the sentences to complete the story.', 80, 200
		ti = @createBitmap 'title', 'title1', 700, 240, 'tc'
		ti.scaleX = ti.scaleY = 0.8
		@addToMain ti
		@insertBitmap 'btnnext', 'btn', 1520, 1040, 'tc'
		@library['btnnext'].visible = off
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 8, 0
		@setCuento(1).introEvaluation()
	setCuento: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene
		for i in [1..@game[scene - 1].positions.length] by 1
			m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}", "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
			m.index = (scene - 1) * 4 + i
			m.scaleX = m.scaleY = 1.1
			cuento.addChild m
			@addToLibrary m
		for i in [1..@game[scene - 1].texts.length] by 1
			t = new DraggableText "t#{i}", @game[scene - 1].texts[i-1].t, @game[scene - 1].texts[i-1].idx, 1400, i * 120 + 400
			t.text.lineHeight = 40
			t.text.lineWidth = 400
			t.text.textAlign = 'center'
			t.setHitArea()
			@addToLibrary t
			cuento.addChild t
		@addToMain cuento
		@
	setCuentoFinal: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene
		scn = @game[scene - 1]
		for i in [1..scn.positions.length] by 1
			m = @createBitmap "#{(scene - 1) * 4 + i}b", "#{(scene - 1) * 4 + i}b", scn.positions[i - 1].x, scn.positions[i - 1].y
			m.scaleX = m.scaleY = 1.1
			cuento.addChild m
			@addToLibrary m

		@addToMain cuento
	introEvaluation: ->
		super
		for i in [1..@game[@scene - 1].texts.length] by 1
			@observer.subscribe 'init_evaluation', @library["t#{i}"].onInitEvaluation
		TweenLite.from @library['header'], 1, {y: -@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.from @library['title'], 1, {alpha: 0, y: @library['title'].y + 40, delay: 1}
		TweenLite.from @library['cuento'], 1, {alpha: 0, y: @library['cuento'].y + 40, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [1..@game[@scene - 1].texts.length] by 1
			@library["t#{i}"].addEventListener 'click', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = off
		for i in [1..@game[@scene - 1].positions.length] by 1
			pt = @library["sc#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
			if @library["sc#{i}"].hitTest pt.x, pt.y
				if not @isArray @answer.index 
					if @answer.index is @library["sc#{i}"].index
						@library["sc#{i}"].currentFrame = 1
						@answer.visible = off
						createjs.Sound.play 'good'
						if not @library["sc#{i}"].failed
							@library['score'].plusOne()
						@finishEvaluation()
					else
						@library["sc#{i}"].failed = on
						@warning()
						@answer.returnToPlace()
				else
					hit = false
					for ans in @answer.index
						if ans is @library["sc#{i}"].index
							hit = true	
					if hit
						@library["sc#{i}"].currentFrame = 1
						@answer.visible = off
						createjs.Sound.play 'good'
						if not @library["sc#{i}"].failed
							@library['score'].plusOne()
						@finishEvaluation()
					else
						@library["sc#{i}"].failed = on
						@warning()
						@answer.returnToPlace()
			else
				@answer.returnToPlace()
	finishEvaluation: =>
		for i in [1..@game[@scene - 1].positions.length] by 1
			if @library["sc#{i}"].currentFrame is 0
				return
		if @scene < 2
			@library['btnnext'].visible = on
			@library['btnnext'].alpha = 1
			@library['btnnext'].y = 1120
			TweenLite.from @library['btnnext'], 1, {alpha:0, y:@library['btnnext'].y + 20}
			@library['btnnext'].addEventListener 'click', @nextEvaluation
		else
			@nextEvaluation()
	nextEvaluation: =>
		@index++
		createjs.Sound.stop()
		if @index < @game.length
			TweenLite.to @library['btnnext'], 1, {alpha:0, y:@library['btnnext'].y + 20}
			TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 20}
			@setCuento @index + 1
			TweenLite.from @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 20}
			for i in [1..@game[@scene - 1].texts.length] by 1
				@library["t#{i}"].onInitEvaluation()
				@library["t#{i}"].addEventListener 'click', @evaluateAnswer
		else
			@finalscene = 0
			TweenLite.to @library['title'], 1, {alpha:0, y:@library['title'].y + 40}
			setTimeout @storyTale, 2 * 1000
	storyTale: =>
		TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y - 100}
		if @finalscene < @game.length
			@setCuentoFinal @finalscene + 1
			s = createjs.Sound.play "scene#{@scene}"
			s.addEventListener 'complete', @storyTale
			TweenLite.to @library['cuento'], 1, {alpha:1, y:@library['cuento'].y + 20}
			@finalscene++
		else
			@finish()
	finish: =>
		super
	window.U4A5 = U4A5