class U8A5 extends Oda
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
		    {src:'sounds/TU2_U5_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U5_A5_scene1.mp3', id:'scene1'}
		    {src:'sounds/TU2_U5_A5_scene2.mp3', id:'scene2'}
		]
		@game = [
			{
				texts:[
					{idx:1, t:"She makes Yen-Shen do chores all day long."}
					{idx:2, t:'Every day, Yen-Shen feeds the fish.'}
					{idx:4, t:'They tell Yeh-Shen to stay at home.'}
					{idx:3, t:"Suddenly, an old man appears."}
				]
				positions:[
					{x:'118', y:'160'}
					{x:'335', y:'161'}
					{x:'118', y:'360'}
					{x:'330', y:'355'}
				]
			}
			{
				texts:[
					{idx:5, t:"She looks down at her feet."}
					{idx:8, t:'She shows them the other golden slipper'}
					{idx:6, t:'She runs home, but leaves one golden slipper behind.'}
					{idx:7, t:"The king wants to find the owner of the slipper."}
				]
				positions:[
					{x:'115', y:'140'}
					{x:'345', y:'161'}
					{x:'130', y:'360'}
					{x:'346', y:'360'}	
				]
			}
		]
		@answers = []
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'title', 'title1', 350, 125, 'tc'
		@insertBitmap 'btnnext', 'btn', 760, 520, 'tc'
		@library['btnnext'].visible = off
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@setCuento(1).introEvaluation()
	setCuento: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene
		for i in [1..@game[scene - 1].positions.length] by 1
			m = @createSprite "sc#{i}", ["#{(scene - 1) * 4 + i}", "#{(scene - 1) * 4 + i}b"],null, @game[scene - 1].positions[i - 1].x, @game[scene - 1].positions[i - 1].y
			m.index = (scene - 1) * 4 + i
			cuento.addChild m
			@addToLibrary m
		for i in [1..@game[scene - 1].texts.length] by 1
			t = new DraggableText "t#{i}", @game[scene - 1].texts[i-1].t, @game[scene - 1].texts[i-1].idx, 700, i * 60 + 200
			t.text.lineHeight = 20
			t.text.lineWidth = 200
			t.text.textAlign = 'center'
			t.setHitArea()
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
		for i in [1..@game[@scene - 1].texts.length] by 1
			@library["t#{i}"].addEventListener 'click', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = off
		for i in [1..@game[@scene - 1].positions.length] by 1
			pt = @library["sc#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
			if @library["sc#{i}"].hitTest pt.x, pt.y
				if @answer.index is @library["sc#{i}"].index
					@library["sc#{i}"].currentFrame = 1
					@answer.visible = off
					createjs.Sound.play 'good'
					@library['score'].plusOne()
					@finishEvaluation()
				else
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
			@library['btnnext'].y = 520
			TweenLite.from @library['btnnext'], 1, {alpha:0, y:@library['btnnext'].y + 10}
			@library['btnnext'].addEventListener 'click', @nextEvaluation
		else
			@nextEvaluation()
	nextEvaluation: =>
		@index++
		if @index < @game.length
			TweenLite.to @library['btnnext'], 1, {alpha:0, y:@library['btnnext'].y + 10}
			TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 10}
			@setCuento @index + 1
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
	window.U8A5 = U8A5