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
						{frase:'In Brazil.', pattern:['#wc','do they','#wc','Reveillon?'], targets: ['Where','celebrate']}
						{frase:'On January 1st.', pattern:['#wc','do they','#wc','Reveillon?'], targets: ['When','celebrate']}
						{frase:'White clothes.', pattern:['#wc','do they','#wc','?'], targets: ['What','wear']}
						{frase:'They float boats with flowers and candles in the sea.', pattern:['#wc','do they','#wc','?'], targets: ['What','do']}
					]	
					opt1:[
						{i:1, t:'When', x:25, y:35}
						{i:2, t:'What', x:90, y:22}
						{i:3, t:'Where', x:70, y:70}
					]
					opt2:[
						{i:1, t:'celebrate', x:26, y:20}
						{i:2, t:'do', x:50, y:72}
						{i:3, t:'wear', x:85, y:58}
					]
				}
				{
					steps: [
						{frase:'Moon cakes and pomelos.', pattern:['#wc','do they','#wc','Reveillon?'], targets: ['What','eat']}
						{frase:'In September.', texts:['do they', 'Reveillon?'], targets: ['When','celebrate']}
						{frase:'Family and friends.', texts:['do they',], targets: ['Who','visit']}
						{frase:'Lanterns.', targets: ['What','carry']}	
					]
					opt1:[
						{i:1, t:'When', x:25, y:35}
						{i:2, t:'What', x:90, y:22}
						{i:3, t:'Who', x:70, y:70}
						{i:3, t:'Where', x:70, y:70}
					]
					opt2:[
						{i:1, t:'visit', x:26, y:20}
						{i:2, t:'eat', x:50, y:72}
						{i:3, t:'celebrate', x:85, y:58}
						{i:3, t:'carry', x:85, y:58}
					]
				}
				{
					steps: [
						{frase:'Beautiful jewelry.', pattern:['#wc','do they','#wc','Reveillon?'], targets: ['What','wear']}
						{frase:'In India.', targets: ['Where','celebrate']}
						{frase:'In October or November.', targets: ['When','celebrate']}
						{frase:'They watch fireworks and light candles for good luck.', targets: ['What','do']}	
					]
					opt1:[
						{i:1, t:'When', x:25, y:35}
						{i:2, t:'What', x:90, y:22}
						{i:3, t:'Who', x:70, y:70}
						{i:3, t:'Where', x:70, y:70}
					]
					opt2:[
						{i:1, t:'wear', x:26, y:20}
						{i:2, t:'do', x:50, y:72}
						{i:3, t:'celebrate', x:85, y:58}
					]
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 4, 0
		@setScene( 1 ).setDropper( 1 ).setNube1().setNube2().introEvaluation()
	setScene: (scene) ->
		@scene = @game.scenes[scene - 1]
		@insertBitmap "scene", "scene#{scene}", stageSize.w / 2, 150, 'tc'
		@
	setDropper: (step) ->
		@step = step
		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.y = 390
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		q = @createText 'q', 'Q:','24px Quicksand','#333', 120, 0
		dropper.addChild q

		i = 0
		npos = q.x + q.getMeasuredWidth() + 10
		for t in @scene.steps[step - 1].pattern
			if t is '#wc'
				h = new WordContainer "h#{i}", '', '#FFF', '#F00', npos, 5, 120, 22
				h.index = i
				dropper.addChild h
				@addToLibrary h
				npos += 130
				i++
			else
				h = @createText '', t,'24px Quicksand','#333', npos, 0
				dropper.addChild h
				npos += h.getMeasuredWidth() + 20

		a = @createText 'a', "A: #{@scene.steps[@step - 1].frase}",'24px Quicksand','#333', 120, 40
		dropper.addChild a
		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 210
		container.y = 480
		container.name = 'nube1'
		
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
		container.x = 440
		container.y = 480
		container.name = 'nube2'
		
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
		TweenLite.from @library.scene, 1, {alpha: 0, y: @library.scene.y + 20, delay: 1}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 1}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20, delay: 1.5}
		TweenLite.from @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
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
			@finishEvaluation()
		else
			@warning()
			@answer.returnToPlace()
	finishEvaluation: =>
		createjs.Sound.play 'good'
		if @library.h0.text.text is '' or @library.h1.text.text is ''
			return
		@library['score'].plusOne()
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for opt in @scene.opt1
			@library["n1d#{opt.i}"].visible = true
			@library["n1d#{opt.i}"].returnToPlace()
		for opt in @scene.opt2
			@library["n2d#{opt.i}"].visible = true
			@library["n2d#{opt.i}"].returnToPlace()
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @scene.steps.length
			@setDropper @index + 1
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 390}
			for opt in @scene.opt1
				@library["n1d#{opt.i}"].updateDrops @library.h0
			for opt in @scene.opt2
				@library["n2d#{opt.i}"].updateDrops @library.h1
		else
			@finish()
	finish: ->
		TweenLite.to @library.scene, 1, {alpha: 0, y: @library.scene.y + 20}
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20}
		TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20}
		super
	window.U8A2 = U8A2