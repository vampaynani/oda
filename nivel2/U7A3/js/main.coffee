class U7A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'greenbg', src:'green/propbg.png'}
			{id: 'greenscreen', src:'green/screen_begreen.png'}

			{id: 'dropAreagreenB', src:'green/dropArea_B.png'}
			{id: 'dropAreagreenE', src:'green/dropArea_E.png'}
			{id: 'dropAreagreenG', src:'green/dropArea_G.png'}
			{id: 'dropAreagreenR', src:'green/dropArea_R.png'}
			{id: 'dropAreagreenE2', src:'green/dropArea_E2.png'}
			{id: 'dropAreagreenE3', src:'green/dropArea_E3.png'}
			{id: 'dropAreagreenN', src:'green/dropArea_N.png'}
			{id: 'greenB', src:'green/outsite_B.png'}
			{id: 'greenE', src:'green/outside_E.png'}
			{id: 'greenG', src:'green/outside_G.png'}
			{id: 'greenR', src:'green/outside_R.png'}
			{id: 'greenE2', src:'green/outside_E2.png'}
			{id: 'greenE3', src:'green/outside_E3.png'}
			{id: 'greenN', src:'green/outside_N.png'}

			{id: 'summerscreen', src:'summer/screen_summer.png'}
			{id: 'summerbg', src:'summer/prop_bg.png'}

			{id: 'dropAreasummerS', src:'summer/dropArea_S.png'}
			{id: 'dropAreasummerU', src:'summer/dropArea_U.png'}
			{id: 'dropAreasummerM', src:'summer/dropArea_M.png'}
			{id: 'dropAreasummerM2', src:'summer/dropArea_M2.png'}
			{id: 'dropAreasummerE', src:'summer/dropArea_E.png'}
			{id: 'dropAreasummerR', src:'summer/dropArea_R.png'}
			{id: 'summerS', src:'summer/sLetra.png'}
			{id: 'summerU', src:'summer/u.png'}
			{id: 'summerM', src:'summer/m.png'}
			{id: 'summerM2', src:'summer/m2.png'}
			{id: 'summerE', src:'summer/e.png'}
			{id: 'summerR', src:'summer/r.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U7_A3_instructions.mp3', id:'instructions'}
		]
		@positions = 
			summertexts:[
				{t:'1. They are horse backriding.', l:'summerS'}
				{t:'2. She is fishing at the lake.', l:'summerU'}
				{t:'3. He is canoeing in the lake.', l:'summerM'}
				{t:'4. She is playing soccer.', l:'summerM2'}
				{t:'5. He is resting in the cabin.', l:'summerE'}
				{t:'6. They are hiking mountains.', l:'summerR'}
			]
			summerletras:[
				{letra:'summerS', x:732, y:370}
				{letra:'summerU', x:402, y:344} #24 y 10
				{letra:'summerM', x:160, y:350}
				{letra:'summerM2', x:846, y:562}
				{letra:'summerE', x:324, y:582}
				{letra:'summerR', x:422, y:196}
			]
			greentexts:[
				{t:'1. She is planting trees.', l:'greenB'}
				{t:'2. He is protecting endangered animals.', l:'greenE'}
				{t:'3. She is riding her bike.', l:'greenG'}
				{t:'4. He is conserving water.', l:'greenR'}
				{t:'5. She is picking up trash.', l:'greenE2'}
				{t:'6. She is turning off lights.', l:'greenE3'}
				{t:'7. He is recycling bottles and cans.', l:'greenN'}
			]
			greenletras:[
				{letra:'greenB', x:374, y:238} # 36 y 20
				{letra:'greenE', x:98, y:528}
				{letra:'greenG', x:534, y:418}
				{letra:'greenR', x:856, y:356}
				{letra:'greenE2', x:628, y:440}
				{letra:'greenE3', x:940, y:238}
				{letra:'greenN', x:826, y:490}
			]

		

		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Read, drag the letters and complete the mystery word.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 13, 0
		@setScene(1).introEvaluation()
	setScene: (scene) ->
		@escena = new createjs.Container()
		@escena.x = 232
		@escena.y = 320
		@escena.name = 'escena'

		if scene is 1
			es = 'summer'
			@esc = 1
		else
			es = 'green'
			@esc = 2

		fondo = @createBitmap "#{es}bg", "#{es}bg", 48, 22
		
		@texts = @positions["#{es}texts"]

		@insertText 'label', @texts[@index].t,'48px Quicksand','#333', stageSize.w / 2, 280, 'center'
		@escena.addChild fondo

		@letras = @positions["#{es}letras"]
		hits = new Array()

		for i in [0..@letras.length - 1]
			word = @letras[i]
			if scene is 1
				drop =  @createBitmap "darea#{word.letra}", "dropArea#{word.letra}", i * 150 + 170, 860, 'bc'
			if scene is 2
				drop =  @createBitmap "darea#{word.letra}", "dropArea#{word.letra}", i * 150 + 110, 860, 'bc'
				if i >= 2
					drop.x += 60
				if i is 6
					drop.x += 30
			hit = new createjs.Shape()
			hit.graphics.beginFill('rgba(255,255,255,1)').drawRect(0, 0, drop.width, drop.height)
			hit.x = drop.x - drop.width / 2
			hit.y = drop.y - drop.height
			hit.name = "dropArea#{word.letra}"
			hits.push hit
			@escena.addChild hit, drop

			letra = new Droppable word.letra, (@preload.getResult word.letra), i, word.x - 20, word.y - 20, @stage, hits
			letra.scaleX = letra.scaleY = 0.43
			letrafinal = @createBitmap "f#{@letras[i].letra}", @letras[i].letra, drop.x, drop.y - 14, 'bc'
			if i is 6
				letrafinal.set {x: 1075, y: 850}
			letrafinal.visible = off
			@addToLibrary letra, letrafinal
			@escena.addChild letra, letrafinal
		@addToMain @escena
		@
	setFinal: =>
		if @esc is 1
			es = 'summer'
		else
			es = 'green'
		
		@index = 0
		TweenLite.to @library.label, 0.5, {alpha: 0}

		final = new createjs.Container()
		final.set {name: 'final', alpha: 1}
		fin = @createBitmap es+'screen', es+'screen', stageSize.w / 2, stageSize.h /2 + 100, 'mc'
		final.addChild fin
		@addToLibrary final
		@addToMain final
		TweenLite.from final, 1, {alpha: 0, onComplete: @finalAndThen}
	finalAndThen: =>
		if @esc is 1
			@setScene(2).initEvaluation()
			TweenLite.to @library.final, 0.5, {alpha: 0, delay: 2}
			TweenLite.from @library.label, 0.5, {alpha: 0, delay: 2}
			TweenLite.from @library.escena, 1, {alpha: 0, delay: 2, y: @library.escena.y + 40}
		else
			TweenLite.to @library.final, 0.5, {alpha: 0, delay: 2, onComplete: @finish}
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.label, 1, {alpha :0, y: @library.label.y + 20, delay: 1}
		TweenLite.from @library.escena, 1, {alpha: 0, y: @library.escena.y + 40, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [0..@letras.length - 1]
			@library["#{@letras[i].letra}"].initDragListener()
			@library["#{@letras[i].letra}"].addEventListener 'dropped', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop

		if "dropArea#{@answer.name}" is @drop.name
			if @answer.name is @texts[@index].l
				@library["f#{@answer.name}"].visible = on
				@answer.visible = off
				if @intento is 0
					@library['score'].plusOne()
				@finishEvaluation()
				@intento = 0

				createjs.Sound.play 'good'
			else
				@answer.returnToPlace 1, 0.43, 0.43
				@intento = 1
				@warning()
		else
			@answer.returnToPlace 1, 0.43, 0.43
			@intento = 1
			@warning()
	finishEvaluation: =>
		TweenLite.to @library.label, 0.5, {alpha: 0, y: @library.label.y + 20, ease: Quart.easeOut, onComplete:@nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @texts.length
			@library.label.text = @texts[@index].t
			TweenLite.to @library.label, 0.5, {alpha: 1, y: @library.label.y - 20, ease: Quart.easeOut}
		else		
			@escena.removeAllChildren()
			@mainContainer.removeChild @escena
			@setFinal()

	finish: =>
		super
	window.U7A3 = U7A3