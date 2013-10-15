class U1A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'flecha1', src:'flecha_1.png'}
			{id: 'flecha2', src:'flecha_2.png'}
			{id: 'flecha3', src:'flecha_3.png'}
			{id: 'flecha4', src:'flecha_4.png'}
			{id: 'flecha5', src:'flecha_5.png'}
			{id: 'image1dragble', src:'image_1_dragble.png'}
			{id: 'image2dragble', src:'image_2_dragble.png'}
			{id: 'image3dragble', src:'image_3_dragble.png'}
			{id: 'image4dragble', src:'image_4_dragble.png'}
			{id: 'image5dragble', src:'image_5_dragble.png'}
			{id: 'image1dropArea', src:'image_1_dropArea.png'}
			{id: 'image2dropArea', src:'image_2_dropArea.png'}
			{id: 'image3dropArea', src:'image_3_dropArea.png'}
			{id: 'image4dropArea', src:'image_4_dropArea.png'}
			{id: 'image5dropArea', src:'image_5_dropArea.png'}
			{id: 'verso1dropArea', src:'verso_1_dropArea.png'}
			{id: 'verso2dropArea', src:'verso_2_dropArea.png'}
			{id: 'verso3dropArea', src:'verso_3_dropArea.png'}
			{id: 'verso4dropArea', src:'verso_4_dropArea.png'}
			{id: 'verso5dropArea', src:'verso_5_dropArea.png'}
			{id: 'caterpillarlabel', src:'caterpillar_label.png'}
			{id: 'btnfinished', src:'btn_finished.png'}
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
		@textos = [
		 	{uno: 'Caterpillar, catterpillar, up in the tree.', dos:'Where do you come from? Please tell me.', x:'154', y:'150'}
			{uno: "Wake up now. I can't believe my eyes!", dos: "Leaving the cocoon. What a big surprise!", x:'98', y:'417'}
			{uno: "Then you are a caterpillar, long and green,", dos: "With one goal in life--to eat, eat, eat!", x:'230', y:'460'}
			{uno: "Now yoy are a butterfly with wings so new.", dos: "Fly far away, up into the blue!", x:'134', y:'504'}
			{uno: "Build a little house called cocoon.", dos: "Sleep a little while. I'll see you very soon!", x:'99', y:'547'}
			{uno: "Tiny little eggs under a leaf,", dos: "Oh so difficult for me to see!", x:'329', y:'547'}
		]
		@positions = 
			drags:[
				{x:'550',y:'506'}
				{x:'630',y:'506'}
				{x:'590',y:'438'}
				{x:'501',y:'438'}
				{x:'677',y:'438'}
			]
			drops:[
				{x:'482',y:'184'}
				{x:'565',y:'130'}
				{x:'656',y:'175'}
				{x:'622',y:'268'}
				{x:'517',y:'278'}
			]
			flechas:[
				{x:'478',y:'273'}
				{x:'511',y:'140'}
				{x:'652',y:'134'}
				{x:'727',y:'261'}
				{x:'595',y:'360'}
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setTxtDropper().setDrags().introEvaluation()
	setTxtDropper:  ->
		@insertBitmap 'caterpillarlabel', 'caterpillarlabel', 228, 136, 'mc'
		text = new createjs.Text @textos[0].uno,'12px Arial','#333'
		text.x = @textos[0].x
		text.y = @textos[0].y
		@addToMain text
		text = new createjs.Text @textos[0].dos,'12px Arial','#333'
		text.x = @textos[0].x
		text.y = @textos[0].y - (-12)
		@addToMain text
		@insertBitmap 'verso1dropArea', 'verso1dropArea', 266, 207, 'mc'
		@insertBitmap 'verso2dropArea', 'verso2dropArea', 284, 250, 'mc'
		@insertBitmap 'verso3dropArea', 'verso3dropArea', 266, 293, 'mc'
		@insertBitmap 'verso4dropArea', 'verso4dropArea', 284, 335, 'mc'
		@insertBitmap 'verso5dropArea', 'verso5dropArea', 266, 377, 'mc'
		@
	setDrags:  ->
		for i in [1..5]
			text = new DraggableText 'drag'+i, @textos[i].uno, i, @textos[i].x, @textos[i].y
			@addToMain text
			text = new DraggableText 'drag'+i, @textos[i].dos, i, @textos[i].x, @textos[i].y - (-12)
			@addToMain text
			d = @createBitmap 'image'+i+'dragble', 'image'+i+'dragble', @positions.drags[i-1].x,  @positions.drags[i-1].y
			d.scaleX = d.scaleY = 0.7
			@addToMain d
			@addToLibrary d
			@insertBitmap 'image'+i+'dropArea', 'image'+i+'dropArea', @positions.drops[i-1].x,  @positions.drops[i-1].y
			@insertBitmap 'flecha'+i, 'flecha'+i, @positions.flechas[i-1].x,  @positions.flechas[i-1].y
		@insertBitmap 'btnfinished', 'btnfinished', 577, 383

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
	window.U1A4 = U1A4