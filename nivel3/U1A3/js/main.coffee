class U1A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id:'btnfalse' , src:'btn_false.png'}
			{id:'btntrue' , src:'btn_true.png'}
			{id:'aqLabelAllison' , src:'aquarium/label_Allison.png'}
			{id:'aqLabelCarl' , src:'aquarium/label_Carl.png'}
			{id:'aqLabelDana' , src:'aquarium/label_Dana.png'}
			{id:'aqLabelDave' , src:'aquarium/label_Dave.png'}
			{id:'aqLabelDoris' , src:'aquarium/label_Doris.png'}
			{id:'aqLabelEmma' , src:'aquarium/label_Emma.png'}
			{id:'aqLabelJake' , src:'aquarium/label_Jake.png'}
			{id:'aqLabelJohn' , src:'aquarium/label_John.png'}
			{id:'aqLabelMitch' , src:'aquarium/label_Mitch.png'}
			{id:'aqLabelStella' , src:'aquarium/label_Stella.png'}
			{id:'aqPropbg' , src:'aquarium/prop_bg.png'}
			{id:'smLabelAva' , src:'space_museum/label_Ava.png'}
			{id:'smLabelJoshAndDiana' , src:'space_museum/label_JoshAndDiana.png'}
			{id:'smLabelKatie' , src:'space_museum/label_Katie.png'}
			{id:'smLabelKyle' , src:'space_museum/label_Kyle.png'}
			{id:'smLabelLindsey' , src:'space_museum/label_Lindsey.png'}
			{id:'smLabelPhilAndArthur' , src:'space_museum/label_PhilAndArthur.png'}
			{id:'smLabelSpot' , src:'space_museum/label_Spot.png'}
			{id:'smLabelZoe' , src:'space_museum/label_Zoe.png'}
			{id:'smPropbg' , src:'space_museum/prop_bg.png'}

		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@personaje = 
			aquarium:[
				{id:'aqLabelAllison', x:'356', y:'162'}
				{id:'aqLabelCarl', x:'487', y:'202'}
				{id:'aqLabelDana', x:'59', y:'333'}
				{id:'aqLabelDave', x:'312', y:'97'}
				{id:'aqLabelDoris', x:'416', y:'359'}
				{id:'aqLabelEmma', x:'521', y:'254'}
				{id:'aqLabelJake', x:'170', y:'364'}
				{id:'aqLabelJohn', x:'179', y:'172'}
				{id:'aqLabelMitch', x:'337', y:'315'}
				{id:'aqLabelStella', x:'280', y:'364'}
			]
			museum:[
				{id:'smLabelAva' , x:'251', y:'89'}
				{id:'smLabelJoshAndDiana', x:'400', y:'270'}
				{id:'smLabelKatie', x:'183', y:'192'}
				{id:'smLabelKyle', x:'124', y:'315'}
				{id:'smLabelLindsey', x:'118', y:'91'}
				{id:'smLabelPhilAndArthur', x:'330', y:'397'}
				{id:'smLabelSpot', x:'294', y:'199'}
				{id:'smLabelZoe', x:'438', y:'140'}
			]
		@preguntas = 
			aquarium: [
				{statement:'frase pregunta aquario'}
			]
			museum: [
				{statement:'frase pregunta museo'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'btnfalse', 'btnfalse', 457, 541
		@insertBitmap 'btntrue', 'btntrue', 330, 541
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setAquarium().setMuseum().introEvaluation()
	setAquarium:  ->
		aquarium = new createjs.Container()
		aquarium.x = 120
		aquarium.y = 80

		fondo = @createBitmap 'aqPropbg', 'aqPropbg', 15, 75
		aquarium.addChild fondo
		@addToLibrary fondo

		for i in [0..8]
			label = @createBitmap @personaje.aquarium[i].id, @personaje.aquarium[i].id, @personaje.aquarium[i].x, @personaje.aquarium[i].y
			aquarium.addChild label
			@addToLibrary label
			
		for i in [0..0]
			text = new createjs.Text @preguntas.aquarium[i].statement,'24px Arial','#333'
			text.x = stageSize.w / 2 - 75
			text.y = 420
			text.textAlign = 'center'
			aquarium.addChild text

		@addToMain aquarium
		@
	setMuseum:  ->
		museum = new createjs.Container()
		museum.x = 120
		museum.y = 60

		fondo = @createBitmap 'smPropbg', 'smPropbg', 73, 22
		museum.addChild fondo
		@addToLibrary fondo

		for i in [0..7]
			label = @createBitmap @personaje.museum[i].id, @personaje.museum[i].id, @personaje.museum[i].x, @personaje.museum[i].y
			museum.addChild label
			@addToLibrary label
			
		for i in [0..0]
			text = new createjs.Text @preguntas.museum[i].statement,'24px Arial','#333'
			text.x = stageSize.w / 2 - 75
			text.y = 440
			text.textAlign = 'center'
			museum.addChild text

		@addToMain museum
		@
	introEvaluation: ->
		super
		###
		for i in [1..6] by 1
			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation

		@library['characters'].currentFrame = @answers[@index].id

		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
		###
	initEvaluation: (e) =>
		super
		@library['characters'].currentFrame = @answers[@index].id
		createjs.Sound.play @answers[@index].sound
		TweenLite.to @library['characters'], 0.5, {alpha: 1, y: stageSize.h - 180, ease: Quart.easeOut}
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropname'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropname'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.blink off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
		@answer.returnToPlace()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['score'].updateCount( @index )
			@library['characters'].alpha = 1
			@library['characters'].y = stageSize.h - 180
			@library['characters'].currentFrame = @answers[@index].id
			createjs.Sound.play @answers[@index].sound
			TweenLite.from @library['characters'], 0.5, {alpha: 0, y: @library['characters'].y + 20, ease: Quart.easeOut}
		else
			@finish()
	repeatSound: =>
		createjs.Sound.play @answers[@index].sound
	finish: ->
		super
		for i in [1..6] by 1
			@library['name'+i].blink off
	window.U1A3 = U1A3