class U7A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'bg', src:'bg.png'}
			{id: 'scene', src:'scene.png'}
			{id: 'btnfinished', src: 'btn_finished.png'}

			{id: '1', src:'1.png'}
			{id: '2', src:'2.png'}
			{id: '3', src:'3.png'}
			{id: '4', src:'4.png'}	
			{id: '5', src:'5.png'}	
			{id: '6', src:'6.png'}	
			{id: '7', src:'7.png'}	
			{id: '8', src:'8.png'}	
			{id: '9', src:'9.png'}	
			{id: '10', src:'10.png'}	
		
			{id: '1b', src:'1b.png'}
			{id: '2b', src:'2b.png'}
			{id: '3b', src:'3b.png'}
			{id: '4b', src:'4b.png'}	
			{id: '5b', src:'5b.png'}	
			{id: '6b', src:'6b.png'}	
			{id: '7b', src:'7b.png'}	
			{id: '8b', src:'8b.png'}	
			{id: '9b', src:'9b.png'}	
			{id: '10b', src:'10b.png'}	



		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U7_A4_instructions.mp3', id:'instructions'}
		]
		@game = [
			{
				texts:[
					{idx:10, t:'landed' , x:271, y:495}
					{idx:1, t:'believed' , x:187, y:495}
					{idx:2, t:'found' , x:498, y:533}
					{idx:7, t:'exploded' , x:404, y:533}
					{idx:3, t:'invented' , x:314, y:533}
					{idx:4, t:'made', x:491, y:495}
					{idx:5, t:'used', x:256, y:533}
					{idx:9, t:'killed', x:347, y:495}
					{idx:6, t:'carried', x:179, y:533}
					{idx:8,t:'caused', x:413, y:495}

				]
				positions:[
					{x:40, y:0 + 140}
					{x:40, y:30 + 140}
					{x:40, y:61 + 140}
					{x:40, y:98 + 140}
					{x:40, y:130 + 140}
					{x:40, y:166 + 140}
					{x:40, y:198 + 140}
					{x:40, y:229 + 140}
					{x:40, y:262 + 140}
					{x:40, y:279 + 140}
				]
				positionsverbs:[
					{x:265, y:198}
					{x:544, y:198}
					{x:256, y:307}
					{x:550, y:307}
					{x:403, y:422}
				]
				text:[
					{
						verbs:[
							{pre:'land', past:'landed'}
							{pre:'believe', past:'believed'}
							{pre:'find', past:'found'}
							{pre:'explode', past:'exploded'}
							{pre:'invent', past:'invented'}
						]
					}
					{
						verbs:[
							{pre:'make', past:'made'}
							{pre:'use', past:'used'}
							{pre:'kill', past:'killed'}
							{pre:'carry', past:'carried'}
							{pre:'cause', past:'caused'}
						]
					}					
				]
			}
		]
		@answers = []
		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Complete the text with the verbs.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		#@setCuento(1).introEvaluation()
		@setWords(1)
	setWords: (scene) ->
		words = new createjs.Container()
		words.y = 50
		fondo = @createBitmap 'scene', 'scene',  stageSize.w / 2, stageSize.h / 2, 'mc'
		btn = @createBitmap 'btnfinished', 'btnfinished',  stageSize.w / 2 + 10, 500, 'mc'
		words.addChild fondo, btn
		for i in [0..4]
			text = new createjs.Text @game[0].text[scene - 1].verbs[i].pre, '24px Arial', '#000'
			text.x = @game[scene - 1].positionsverbs[i].x
			text.y = @game[scene - 1].positionsverbs[i].y - 35
			text.textAlign = "center"
			words.addChild text

		@addToMain words
	setCuento: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene
		fondo = @createBitmap 'bg', 'bg', 770, 70, 'tr'
		cuento.addChild fondo

		for i in [1..@game[scene - 1].positions.length] by 1
			m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}",  "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y 

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
			t = new DraggableText "t#{i}", @game[scene - 1].texts[i-1].t, @game[scene - 1].texts[i-1].idx, @game[scene - 1].texts[i-1].x, @game[scene - 1].texts[i-1].y
			#t.text.textAlign = 'center'
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
		@answer = e.target
		dropped = off
		for i in [1..@game[@scene - 1].positions.length] by 1
			pt = @library["hsc#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
			if @library["hsc#{i}"].hitTest pt.x, pt.y
				if @answer.index is @library["hsc#{i}"].index
					if @answer.p
						if @library["sc#{i}"].currentFrame in [1,2]
							@library["sc#{i}"].currentFrame = 3
						else if @answer.p is 'p1'
							@library["sc#{i}"].currentFrame = 1
						else
							@library["sc#{i}"].currentFrame = 2
					else
						@library["sc#{i}"].currentFrame = 1
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
		@finish()
	finish: =>
		createjs.Sound.stop()
		createjs.Sound.play 'good'

		TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 10}
		TweenLite.to @library['bg'], 1, {alpha:0}
		super
	window.U7A4 = U7A4