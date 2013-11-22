class U2A5 extends Oda
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

			{id: '2p1', src:'2p1.png'}
			{id: '2p2', src:'2p2.png'}
			{id: '4p1', src:'4p1.png'}	
			{id: '4p2', src:'4p2.png'}	
			{id: '5p1', src:'5p1.png'}	
			{id: '5p2', src:'5p2.png'}	
			{id: '8p1', src:'8p1.png'}
			{id: '8p2', src:'8p2.png'}

			{id: 'btn', src:'btn.png'}	
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U2_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U2_A5_scene1.mp3', id:'scene1'}
		    {src:'sounds/TU2_U2_A5_scene2.mp3', id:'scene2'}
		]
		@game = [
			{
				texts:[
					{idx:3, t:"balloons"}
					{idx:4, t:'guests', p:'p1'}
					{idx:2, t:"dishes", p:'p2'}
					{idx:2, t:"cake", p:'p1'}
					{idx:4, t:"closet", p:'p2'}
					{idx:1, t:"the living room"}
				]
				positions:[
					{x:'107', y:'166'}
					{x:'328', y:'169'}
					{x:'108', y:'378'}
					{x:'320', y:'370'}
				]
			}
			{
				texts:[
					{idx:7, t:"candles"}
					{idx:5, t:'presents', p:'p1'}
					{idx:6, t:'dinner'}
					{idx:8, t:"Nick", p:'p1'}
					{idx:8, t:"lights", p:'p1'}
					{idx:5, t:"table", p:'p1'}
				]
				positions:[
					{x:'103', y:'170'}
					{x:'326', y:'173'}
					{x:'107', y:'368'}
					{x:'320', y:'368'}	
				]
			}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read and drag the words to complete the story.', 40, 100
		ti = @createBitmap 'title', 'title1', 350, 135, 'tc'
		ti.scaleX = ti.scaleY = 0.8
		@addToMain ti
		@insertBitmap 'btnnext', 'btn', 760, 520, 'tc'
		@library['btnnext'].visible = off
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@setCuento(1).introEvaluation()
	setCuento: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene
		for i in [1..@game[scene - 1].positions.length] by 1
			if scene is 1
				if i in [2, 4]
					m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}", "#{(scene - 1) * 4 + i}p1", "#{(scene - 1) * 4 + i}p2", "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
				else
					m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}", "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
			if scene is 2
				if i in [1, 4]
					m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}", "#{(scene - 1) * 4 + i}p1", "#{(scene - 1) * 4 + i}p2", "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
				else
					m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}", "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y

			m.scaleX = m.scaleY = 0.8
			m.index = (scene - 1) * 4 + i
			cuento.addChild m
			@addToLibrary m
		for i in [1..@game[scene - 1].texts.length] by 1
			t = new DraggableText "t#{i}", @game[scene - 1].texts[i-1].t, @game[scene - 1].texts[i-1].idx, 700, i * 60 + 160
			t.text.lineHeight = 20
			t.text.lineWidth = 200
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
		TweenLite.from @library['title'], 1, {alpha: 0, y: @library['title'].y + 20, delay: 1}
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
			pt = @library["sc#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
			if @library["sc#{i}"].hitTest pt.x, pt.y
				if @answer.index is @library["sc#{i}"].index
					if @answer.p
						if @library["sc#{i}"].currentFrame in [1,2]
							@library["sc#{i}"].currentFrame = 3
							@library['score'].plusOne()
						else if @answer.p is 'p1'
							@library["sc#{i}"].currentFrame = 1
						else
							@library["sc#{i}"].currentFrame = 2
					else
						@library["sc#{i}"].currentFrame = 1
						@library['score'].plusOne()
					@answer.visible = off
					createjs.Sound.play 'good'
					@finishEvaluation()
				else
					@warning()
					@answer.returnToPlace()
			else
				@answer.returnToPlace()
	finishEvaluation: =>
		for i in [1..@game[@scene - 1].positions.length] by 1
			if @library["sc#{i}"].currentFrame isnt @library["sc#{i}"].spriteSheet._frames.length - 1
				return
		if @scene < 2
			@library['btnnext'].visible = on
			@library['btnnext'].alpha = 1
			@library['btnnext'].y = 520
			TweenLite.from @library['btnnext'], 1, {alpha:0, y:@library['btnnext'].y + 10}
			@library['btnnext'].addEventListener 'click', @nextEvaluation
		else
			@nextEvaluation()
	nextEvaluation: =>
		@index++
		createjs.Sound.stop()
		if @index < @game.length
			TweenLite.to @library['btnnext'], 1, {alpha:0, y:@library['btnnext'].y + 10}
			TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 10}
			@setCuento @index + 1
			createjs.Sound.play "scene#{@scene}"
			TweenLite.from @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 10}
			for i in [1..@game[@scene - 1].texts.length] by 1
				@library["t#{i}"].onInitEvaluation()
				@library["t#{i}"].addEventListener 'click', @evaluateAnswer
		else
			setTimeout @finish, 2 * 1000
	finish: =>
		TweenLite.to @library['title'], 1, {alpha:0, y:@library['title'].y + 20}
		TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y - 50}
		super
	window.U2A5 = U2A5