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
				{t:'1.They are hiking mountains', l:'summerS'}
				{t:'2.They are hiking mountains', l:'summerU'}
				{t:'3.They are hiking mountains', l:'summerM'}
				{t:'4.They are hiking mountains', l:'summerM2'}
				{t:'5.They are hiking mountains', l:'summerE'}
				{t:'6.They are hiking mountains', l:'summerR'}
			]
			summerletras:[
				{letra:'summerS', x:'366', y:'185'}
				{letra:'summerU', x:'201', y:'172'} #24 y 10
				{letra:'summerM', x:'85', y:'175'}
				{letra:'summerM2', x:'428', y:'281'}
				{letra:'summerE', x:'162', y:'291'}
				{letra:'summerR', x:'211', y:'98'}
			]
			greentexts:[
				'1.They are hiking mountains'
				'2.They are hiking mountains'
				'3.They are hiking mountains'
				'4.They are hiking mountains'
				'5.They are hiking mountains'
				'6.They are hiking mountains'
			]
			greenletras:[
				{letra:'greenB', x:'187', y:'119'} # 36 y 20
				{letra:'greenE', x:'49', y:'264'}
				{letra:'greenG', x:'267', y:'209'}
				{letra:'greenR', x:'428', y:'178'}
				{letra:'greenE2', x:'314', y:'220'}
				{letra:'greenE3', x:'470', y:'119'}
				{letra:'greenN', x:'418', y:'245'}
			]

		

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 6, 0
		@setScene(1).introEvaluation()
	setScene: (scene) ->
		escena = new createjs.Container()
		escena.x = 116
		escena.y = 160
		escena.name = 'escena'
		
		if scene is 1
			es = 'summer'
		else
			es = 'green'

		fondo = @createBitmap "#{es}bg", "#{es}bg", 24,11
		
		@texts = @positions["#{es}texts"]

		@insertText 'label', @texts[@index].t,'24px Quicksand','#333', stageSize.w / 2, 140, 'center'
		escena.addChild fondo

		@letras = @positions["#{es}letras"]
		for i in [0..@letras.length - 1]
			word = @letras[i]
			if scene is 1
				drop =  @createBitmap "darea#{word.letra}", "dropArea#{word.letra}", i*75 + 85, 430, 'bc'
			if scene is 2
				drop =  @createBitmap "darea#{word.letra}", "dropArea#{word.letra}", i*85 + 65, 430, 'bc'
				if i >= 2
					drop.x = drop.x + 30
			hit = new createjs.Shape()
			hit.graphics.beginFill('rgba(255,255,255,1)').drawRect(0, 0, drop.width, drop.height)
			hit.x = drop.x - drop.width / 2
			hit.y = drop.y - drop.height
			hit.name = "dropArea#{word.letra}"
			letra = new Droppable word.letra, (@preload.getResult word.letra), i, word.x, word.y, @stage, [hit]
			letra.scaleX = letra.scaleY = 0.43
			letrafinal = @createBitmap "f#{@letras[i].letra}", @letras[i].letra, drop.x, drop.y-7, 'bc'
			letrafinal.visible = off
			@addToLibrary letra, letrafinal
			escena.addChild hit, drop, letra, letrafinal
		@addToMain escena
		@
	setFinal: =>
		###
		es = 'green'
		@insertBitmap es+'screen', es+'screen', stageSize.w / 2, stageSize.h /2, 'mc'
		###
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.label, 1, {alpha :0, y: @library.label.y + 10, delay: 1}
		TweenLite.from @library.escena, 1, {alpha: 0, y: @library.escena.y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
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
				@finishEvaluation()
			else
				@answer.returnToPlace 1, 0.43, 0.43
				@warning()
	finishEvaluation: =>
		TweenLite.to @library.label, 0.5, {alpha: 0, y: @library.label.y + 10, ease: Quart.easeOut, onComplete:@nextEvaluation}
	nextEvaluation: =>
		@index++
		@library['score'].plusOne()
		if @index < @texts.length
			@library.label.text = @texts[@index].t
			TweenLite.to @library.label, 0.5, {alpha: 1, y: @library.label.y - 10, ease: Quart.easeOut}
		else
			@finish()
	finish: ->
		TweenLite.to @library.escena, 1, {alpha: 0, y: @library.escena.y + 20}
		super
	window.U7A3 = U7A3