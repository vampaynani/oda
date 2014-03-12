class U8A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'n1', src:'question.png'}
			{id: 'scene1', src:'scenebrazil.png'}
			{id: 'scene2', src:'scenechina.png'}
			{id: 'scene3', src:'sceneindia.png'}
			{id: 'n2', src:'verb.png'}

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U8_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			scenes : [
				{	
					steps: [
						{frase:'In Brazil.', pattern:['#wc','do they ','#wc',' Reveillon?'], targets: ['Where','celebrate']}
						{frase:'On January 1st.', pattern:['#wc','do they','#wc','Reveillon?'], targets: ['When','celebrate']}
						{frase:'White clothes.', pattern:['#wc','do they','#wc','?'], targets: ['What','wear']}
						{frase:'They float boats with flowers and candles in the sea.', pattern:['#wc','do they','#wc','?'], targets: ['What','do']}
					]	
					opt1:[
						{i:1, t:'When', x:50, y:70}
						{i:2, t:'What', x:180, y:44}
						{i:3, t:'Where', x:140, y:140}
					]
					opt2:[
						{i:1, t:'celebrate', x:52, y:40}
						{i:2, t:'do', x:100, y:144}
						{i:3, t:'wear', x:170, y:116}
					]
				}
				{
					steps: [
						{frase:'Moon cakes and pomelos.', pattern:['#wc','do they','#wc','?'], targets: ['What','eat']}
						{frase:'In September.', pattern:['#wc','do they','#wc','?'], targets: ['When','celebrate']}
						{frase:'Family and friends.', pattern:['#wc','do they','#wc','?'], targets: ['Who','visit']}
						{frase:'Lanterns.', pattern:['#wc','do they','#wc','?'], targets: ['What','carry']}	
					]
					opt1:[
						{i:1, t:'When', x:50, y:70}
						{i:2, t:'What', x:130, y:34}
						{i:3, t:'Who', x:180, y:90}
						{i:4, t:'Where', x:140, y:140}
					]
					opt2:[
						{i:1, t:'visit', x:80, y:30}
						{i:2, t:'eat', x:100, y:144}
						{i:3, t:'celebrate', x:50, y:81}
						{i:4, t:'carry', x:170, y:116}
					]
				}
				{
					steps: [
						{frase:'Beautiful jewelry.', pattern:['#wc','do the women','#wc','?'], targets: ['What','wear']}
						{frase:'In India.',  pattern:['#wc','do they','#wc',' Diwali?'], targets: ['Where','celebrate']}
						{frase:'In October or November.', pattern:['#wc','do they','#wc',' Diwali?'], targets: ['When','celebrate']}
						{frase:'They watch fireworks and light candles for good luck.',  pattern:['#wc','do they','#wc','?'],targets: ['What','do']}	
					]
					opt1:[
						{i:1, t:'When', x:50, y:70}
						{i:2, t:'What', x:130, y:34}
						{i:3, t:'Who', x:180, y:90}
						{i:4, t:'Where', x:140, y:140}
					]
					opt2:[
						{i:1, t:'wear', x:170, y:116}
						{i:2, t:'do', x:100, y:144}
						{i:3, t:'celebrate', x:52, y:40}
					]
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@escena = 1
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Drag the words to form a question.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 24, 0
		@setScene( 1 ).setDropper( 1 ).setNube1().setNube2().introEvaluation()
	setScene: (scene) ->
		@scene = @game.scenes[scene - 1]
		@intento = 0
		@sc = @createBitmap "scene", "scene#{scene}", stageSize.w / 2, 300, 'tc'
		@addToMain @sc
		@
	setDropper: (step) ->
		@step = step
		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.y = 780
			dropper.name = 'dropper'
		dropper.alpha = 1
		if not dropper.parent then @addToMain dropper
		dropper.removeAllChildren()

		q = @createText 'q', 'Q:','48px Quicksand','#333', 240, 0
		dropper.addChild q

		i = 0
		npos = q.x + q.getMeasuredWidth() + 20
		for t in @scene.steps[step - 1].pattern
			if t is '#wc'
				txt = @scene.steps[step - 1].targets[i]
				h = new WordContainer "h#{i}", "#{txt}", '#FFF', '#eb188e', npos, 30
				h.index = i
				dropper.addChild h
				@addToLibrary h
				npos += h.width + 20
				i++
			else
				h = @createText '', t,'48px Quicksand','#333', npos, 0
				dropper.addChild h
				npos += h.getMeasuredWidth() + 20

		a = @createText 'a', "A: #{@scene.steps[@step - 1].frase}",'48px Quicksand','#333', 240, 80
		dropper.addChild a
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 420
		container.y = 960
		container.name = 'nube1'
		container.removeAllChildren()

		back = @createBitmap 'backNube1', 'n1', 0, 0
		container.addChild back

		for opt in @scene.opt1
			d = new DroppableText "n1d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 880
		container.y = 960
		container.name = 'nube2'
		container.removeAllChildren()
		back = @createBitmap 'backNube2', 'n2', 0, 0
		container.addChild back

		for opt in @scene.opt2
			d = new DroppableText "n2d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.from @library.scene, 1, {alpha: 0, y: @library.scene.y + 40, delay: 1}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 40, delay: 1}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 40, delay: 1.5}
		TweenLite.from @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 40, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for opt in @scene.opt1
			@library["n1d#{opt.i}"].updateDrops @library.h0
			@library["n1d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n1d#{opt.i}"].initDragListener()
		for opt in @scene.opt2
			@library["n2d#{opt.i}"].updateDrops @library.h1
			@library["n2d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n2d#{opt.i}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @scene.steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			if @intento is 0
				@library['score'].plusOne()
			@intento = 0
			createjs.Sound.play 'good'
			@finishEvaluation()
		else
			@warning()
			@intento = 1
			@answer.returnToPlace()
	finishEvaluation: =>
		if @library.h0.text.text is '' or @library.h1.text.text is ''
			return
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for opt in @scene.opt1
			@library["n1d#{opt.i}"].visible = true
			@library["n1d#{opt.i}"].returnToPlace()
		for opt in @scene.opt2
			@library["n2d#{opt.i}"].visible = true
			@library["n2d#{opt.i}"].returnToPlace()
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 40, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @scene.steps.length
			@setDropper @index + 1
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 780}
			for opt in @scene.opt1
				@library["n1d#{opt.i}"].updateDrops @library.h0
			for opt in @scene.opt2
				@library["n2d#{opt.i}"].updateDrops @library.h1
		else
			if @escena isnt 3
				@escena++
				@index = 0
				#TweenLite.to @library.sc, 0.5, {alpha: 0, y: @library.dropper.y + 20}
				@mainContainer.removeChild @sc
				TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 40}
				TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 40}
				@setScene( @escena ).setDropper(1).setNube1().setNube2().initEvaluation()
				TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 40}
				TweenLite.from @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 40}
				TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 780}
			else
				@finish()
	finish: ->
		TweenLite.to @library.scene, 1, {alpha: 0, y: @library.scene.y + 40}
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 40}
		TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 40}
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: 780}
		super
	window.U8A2 = U8A2