class U1A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'bg', src:'bg.png'}

			{id: '1', src:'1.png'}
			{id: '2', src:'2.png'}
			{id: '3', src:'3.png'}
			{id: '4', src:'4.png'}	
		
			{id: '1b', src:'1.png'}
			{id: '2b', src:'2b.png'}
			{id: '3b', src:'3b.png'}
			{id: '4b', src:'4b.png'}	
	

			{id: '2p1', src:'2p1.png'}
			{id: '2p2', src:'2p2.png'}
			{id: '3p1', src:'3p1.png'}	
			{id: '3p2', src:'3p2.png'}	

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U1_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U1_A5_scene1.mp3', id:'scene1'}
		]
		@game = [
			{
				texts:[
					{idx:3, t:"Follow me,", p:'p1'}
					{idx:3, t:"It's the Magic Rain Book.", p:'p2'}
					{idx:2, t:"We're looking for a book about rain,", p:'p2'}
					{idx:2, t:"Are you looking for a particular book?", p:'p1' }
					{idx:4, t:"Thank you,"}
				]
				positions:[
					{x:140, y:186}
					{x:140, y:265}
					{x:140, y:325}
					{x:412, y:186}
				]
			}
		]
		@answers = []
		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen, read and drag the dialogues to the text.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@library.score.txtCount.color = "#bfd951"
		@library.score.txtTotal.color = "#ff9933"
		@setCuento(1).introEvaluation()
	setCuento: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene
		b = @createBitmap 'bg', 'bg', 0, 0
		cuento.addChild b
		for i in [1..@game[scene - 1].positions.length] by 1
			if i in [1]
				m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
			else if i in [4]
				m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}",  "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
			else
				m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}", "#{(scene - 1) * 4 + i}p1", "#{(scene - 1) * 4 + i}p2","#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
			hit = new createjs.Shape()
			hit.graphics.beginFill("rgba(255,255, 255, 0.1)").drawRect(0, 0, m.width, m.height) 
			hit.name = "hsc#{i}"
			hit.x = @game[scene - 1].positions[i - 1].x
			hit.y = @game[scene - 1].positions[i - 1].y
			cuento.addChild hit
			#m.scaleX = m.scaleY = 0.8
			hit.index = (scene - 1) * 4 + i
			cuento.addChild hit, m
			@addToLibrary hit, m
		for i in [1..@game[scene - 1].texts.length] by 1
			t = new DraggableText "t#{i}", @game[scene - 1].texts[i-1].t, @game[scene - 1].texts[i-1].idx, 680, i * 30 + 350
			t.text.textAlign = 'center'
			t.setHitArea()
			if @game[scene - 1].texts[i-1].p
				t.p = @game[scene - 1].texts[i-1].p
			@addToLibrary t
			cuento.addChild t
		@addToMain cuento
		@
	introEvaluation: ->
		super
		for i in [1..@game[@scene - 1].texts.length] by 1
			@observer.subscribe 'init_evaluation', @library["t#{i}"].onInitEvaluation
		TweenLite.from @library['header'], 1, {y: -@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.from @library['cuento'], 1, {alpha: 0, y: @library['cuento'].y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		createjs.Sound.play "scene#{@scene}"
		for i in [1..@game[@scene - 1].texts.length] by 1
			@library["t#{i}"].addEventListener 'click', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.currentTarget
		dropped = off
		for i in [1..@game[@scene - 1].positions.length] by 1
			pt = @library["hsc#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
			if @library["hsc#{i}"].hitTest pt.x, pt.y
				if @answer.index is @library["hsc#{i}"].index
					if @answer.p
						if @library["sc#{i}"].currentFrame in [1,2]
							@library["sc#{i}"].gotoAndStop 3
						else if @answer.p is 'p1'
							@library["sc#{i}"].gotoAndStop 1
						else
							@library["sc#{i}"].gotoAndStop 2
					else
						@library["sc#{i}"].gotoAndStop 1
					@answer.visible = off
					createjs.Sound.play 'good'
					if @intento is 0
						@library['score'].plusOne()
					@intento = 0
					@finishEvaluation()
				else
					@intento = 1
					@warning()
					@answer.returnToPlace()
			else
				@answer.returnToPlace()
	finishEvaluation: =>
		for i in [1..@game[@scene - 1].positions.length] by 1
			if @library["sc#{i}"].currentFrame isnt @library["sc#{i}"].spriteSheet._frames.length - 1
				return
		setTimeout @finish, 3 * 1000
	finish: =>
		createjs.Sound.stop()
		TweenLite.to @library.cuento, 1, {alpha:0, y:@library.cuento.y + 10}
		super
	window.U1A5 = U1A5