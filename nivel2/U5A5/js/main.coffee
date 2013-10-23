class U5A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
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
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@preguntas = [
			{tipo:'texto', imagen:'toastMilkJuice', pregunta:"What's for breakfast?", opcionUno:'Cereal. milk and juice', opcionDos:'Toast, milk and juice'}
			{tipo:'texto', imagen:'zebras', pregunta:'Do zebras live in the grasslands?', opcionUno:'Yes, they do.', opcionDos:"No, they don't."}
			{tipo:'imagen', pregunta:'It has fins and scales. What is it?', opcionUno:'fish', opcionDos:'parrot'}
			{tipo:'imagen', pregunta:'This animal is endangered', opcionUno:'rhino', opcionDos:'snake'}
		]
		@positions = 
			p1:[
				{x:'231', y:'260'}
				{x:'465', y:'271'}
				{x:'236', y:'475'}
				{x:'450', y:'473'}
			
				{x:'231', y:'260'}
				{x:'455', y:'261'}
				{x:'226', y:'475'}
				{x:'450', y:'473'}
			]
		
		@texto = 
			t1:[
				{uno:"Outside it's snowing hard!"}
				{uno:'She is watching the weather report on TV'}
				{uno:'He is drinking hot chocolate and petting his dog, Bo.'}
				{uno:"Its windy and cold, but it isn't snowing"}
			]
			t2:[
				{uno:"Phil and Bo sit in the living room."}
				{uno:'He puts on his snow pants, sweater, coat and boats.'}
				{uno:'Phil jumps up and down and claps his hands.'}
				{uno:"Phil calls his friend Jack on the phone"}
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'title1', 'title1', 350, 120, 'tc'
		@insertBitmap 'btn', 'btn', 760, 520, 'tc'
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setCuento().introEvaluation()
	setCuento:  ->
		cuento = new createjs.Container()
		
		for i in [1..4]
			m = @createSprite i+'imagen', [i, i+'b'],null, @positions.p1[i-1].x, @positions.p1[i-1].y, 'mc'
			cuento.addChild m
			@addToLibrary m

		for i in [1..4]
			text = new DraggableText @texto.t1[i-1].uno, @texto.t1[i-1].uno,i,620, (i*60)+200
			cuento.addChild text

		for i in [5..8]
			m = @createSprite i+'imagen', [i, i+'b'],null, @positions.p1[i-1].x, @positions.p1[i-1].y, 'mc'
			cuento.addChild m
			@addToLibrary m

		for i in [1..4]
			text = new DraggableText @texto.t2[i-1].uno, @texto.t2[i-1].uno,i,620, (i*60)+200
			cuento.addChild text

		@addToMain cuento
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
	window.U5A5 = U5A5