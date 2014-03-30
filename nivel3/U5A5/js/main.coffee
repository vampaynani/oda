class U3A5 extends Oda
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
			{id: '5', src:'5.png'}	
			{id: '6', src:'6.png'}	
			{id: '7', src:'7.png'}	
		
			{id: '1b', src:'1b.png'}
			{id: '2b', src:'2b.png'}
			{id: '3b', src:'3b.png'}
			{id: '4b', src:'4b.png'}	
			{id: '5b', src:'5b.png'}	
			{id: '6b', src:'6b.png'}	
			{id: '7b', src:'7b.png'}	
		
			{id: '2p1', src:'2p1.png'}
			{id: '2p2', src:'2p2.png'}

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U5_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U5_A5_scene1.mp3', id:'scene1'}
		]
		@game = [
			{
				texts:[
					{idx:1, t:'were', x:706, y:416}
					{idx:2, t:'planned', x:680, y:490,p:'p1'}
					{idx:2, t:'reached', x:606, y:360,p:'p2'}
					{idx:3, t:'wanted', x:609, y:474}
					{idx:4, t:'was', x:633, y:522}
					{idx:5, t:'put', x:665, y:440}
					{idx:6, t:'fell', x:624, y:401}
					{idx:7, t:'yelled', x:676, y:379}

				]
				positions:[
					{x:114, y:177}
					{x:114, y:238}
					{x:114, y:365}
					{x:114, y:470}
					{x:452, y:177}
					{x:452, y:245}
					{x:452, y:290}
				]
			}
		]
		@answers = []
		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'bg', 'bg', 0, 100
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen, read and drag the words to the text.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@library.score.txtCount.color = "#bfd951"
		@library.score.txtTotal.color = "#ff9933"
		@setCuento(1).introEvaluation()
	setCuento: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene

		for i in [1..@game[scene - 1].positions.length] by 1
			if i in [1, 3, 4, 5, 6, 7]
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
		@finish()
	finish: =>
		createjs.Sound.stop()
		createjs.Sound.play 'good'

		TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 10}
		TweenLite.to @library['bg'], 1, {alpha:0}
		super
	window.U3A5 = U3A5