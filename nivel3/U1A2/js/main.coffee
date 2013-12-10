class U1A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'ticketArt', src:'ticket_art.png'}
			{id: 'ticketBug', src:'ticket_bug.png'}
			{id: 'ticketDinosaur', src:'ticket_dinosaur.png'}
			{id: 'ticketDolphin', src:'ticket_dolphin.png'}
			{id: 'ticketElephant', src:'ticket_elephant.png'}
			{id: 'ticketPiano', src:'ticket_piano.png'}
			{id: 'ticketPuppet', src:'ticket_puppet.png'}
			{id: 'ticketSpace', src:'ticket_space.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U1_A2_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@tickets = [
			{id:'ticketArt', x:'315', y:'178', preguntaUno:'', pUnoOpcionUno:'', pUnoOpcionDos:'', preguntaDos:'', pDosOpcionUno:'', pDosOpcionDos:''}
			{id:'ticketBug', x:'549', y:'178', preguntaUno:'How much does it cost?', pUnoOpcionUno:'It cost nine dollars.', pUnoOpcionDos:'It cost thirty-six dollars', preguntaDos:'What time does it open', pDosOpcionUno:'It opens at three thirty.', pDosOpcionDos:'It opens at eleven thirty.'}
			{id:'ticketDinosaur', x:'209', y:'284', preguntaUno:'', pUnoOpcionUno:'', pUnoOpcionDos:'', preguntaDos:'', pDosOpcionUno:'', pDosOpcionDos:''}
			{id:'ticketDolphin', x:'425', y:'319', preguntaUno:'', pUnoOpcionUno:'', pUnoOpcionDos:'', preguntaDos:'', pDosOpcionUno:'', pDosOpcionDos:''}
			{id:'ticketElephant', x:'638', y:'284', preguntaUno:'', pUnoOpcionUno:'', pUnoOpcionDos:'', preguntaDos:'', pDosOpcionUno:'', pDosOpcionDos:''}
			{id:'ticketPiano', x:'205', y:'414', preguntaUno:'', pUnoOpcionUno:'', pUnoOpcionDos:'', preguntaDos:'', pDosOpcionUno:'', pDosOpcionDos:''}
			{id:'ticketPuppet', x:'423', y:'452', preguntaUno:'', pUnoOpcionUno:'', pUnoOpcionDos:'', preguntaDos:'', pDosOpcionUno:'', pDosOpcionDos:''}
			{id:'ticketSpace', x:'641', y:'414', preguntaUno:'', pUnoOpcionUno:'', pUnoOpcionDos:'',  preguntaDos:'', pDosOpcionUno:'', pDosOpcionDos:''}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and click on the correct ticket.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setTickets().setTicketQuestion().introEvaluation()
	setTickets:  ->
		tickets = new createjs.Container()
		tickets.x = 0
		tickets.y = 0	

		for i in [0..7]
			v = @createBitmap @tickets[i].id, @tickets[i].id, @tickets[i].x, @tickets[i].y, 'mc'
			v.scaleX = v.scaleY = 0.25
			tickets.addChild v
			@addToLibrary v

		@addToMain tickets
		@
	setTicketQuestion:  ->
		tickets = new createjs.Container()
		tickets.x = 0
		tickets.y = 0	

		for i in [0..7]
			v = @createBitmap @tickets[i].id, @tickets[i].id, stageSize.w / 2, stageSize.h / 2, 'mc'
			v.scaleX = v.scaleY = 0.45
			tickets.addChild v
			@addToLibrary v

			text = new createjs.Text @tickets[i].preguntaUno,'24px Arial','#333'
			text.x = stageSize.w / 2
			text.y = 410
			text.textAlign = 'center'
			tickets.addChild text

			opciones = new createjs.Container()

			uno = new ClickableText @tickets[i].pUnoOpcionUno, @tickets[i].pUnoOpcionUno, i, 0, 0
			opciones.addChild uno

			diagonal = new createjs.Text ' / ','24px Arial','#333'
			diagonal.x = uno.x + uno.width
			diagonal.y = 0
			opciones.addChild diagonal

			dos = new ClickableText @tickets[i].pUnoOpcionDos, @tickets[i].pUnoOpcionDos, i,  diagonal.x + 24, 0
			opciones.addChild dos

			total = uno.width + dos.width + 20

			opciones.x = stageSize.w / 2 - total / 2;
			opciones.y = 450;
			tickets.addChild opciones
		@addToMain tickets
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
	window.U1A2 = U1A2