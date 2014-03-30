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
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U1_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U1_A2_instructions2.mp3', id:'instructions2'}
		    {src:'sounds/TU3_U1_A2_art.mp3', id:'sticketArt'}
		    {src:'sounds/TU3_U1_A2_bug.mp3', id:'sticketBug'}
		    {src:'sounds/TU3_U1_A2_dinosaur.mp3', id:'sticketDinosaur'}
		    {src:'sounds/TU3_U1_A2_dolphin.mp3', id:'sticketDolphin'}
		    {src:'sounds/TU3_U1_A2_elephant.mp3', id:'sticketElephant'}
		    {src:'sounds/TU3_U1_A2_piano.mp3', id:'sticketPiano'}
		    {src:'sounds/TU3_U1_A2_puppet.mp3', id:'sticketPuppet'}
		    {src:'sounds/TU3_U1_A2_space.mp3', id:'sticketSpace'}
		]
		@game =
			tickets:[
				{
					id:'ticketArt'
					x:315
					y:178
					questions:[
						{q:'Where\'s the event?', a1:'It\'s at the Art Museum.', a2:'It\'s at the Art Gallery.', s:'a2'}
						{q:'What time does it start?', a1:'It starts at nine o\'clock.', a2:'It starts at one o\'clock.', s:'a1'}
					]
				}
				{
					id:'ticketBug'
					x:549
					y:178
					questions:[
						{q:'How much does it cost?', a1:'It cost nine dollars.', a2:'It cost nineteen dollars.', s:'a1'}
						{q:'What time does it open?', a1:'It opens at three thirty.', a2:'It opens at eleven thirty.', s:'a2'}
					]
				}
				{
					id:'ticketDinosaur'
					x:209
					y:284
					questions:[
						{q:'How much does it cost?', a1:'It costs twenty dollars.', a2:'It costs twelve dollars.', s:'a2'}
						{q:'What time does it close?', a1:'It closes at six o\'clock.', a2:'It closes at ten o\'clock.', s:'a1'}
					]
				}
				{
					id:'ticketDolphin'
					x:425
					y:319
					questions:[
						{q:'How much does it cost?', a1:'It costs nine dollars.', a2:'It costs nineteen dollars.', s:'a1'}
						{q:'What time does it start?', a1:'It starts at three thirty.', a2:'It starts at three o\'clock.', s:'a1'}
					]
				}
				{
					id:'ticketElephant'
					x:638
					y:284
					questions:[
						{q:'What time does it start?', a1:'The show starts at two o\'clock.', a2:'It starts at twelve o\'clock.', s:'a1'}
						{q:'How much does it cost?', a1:'It costs sixteen dollars.', a2:'It costs eight dollars.', s:'a2'}
					]
				}
				{
					id:'ticketPiano'
					x:205
					y:414
					questions:[
						{q:'What time does it start?', a1:'It starts at eleven o\'clock at night.', a2:'It starts at eleven o\'clock in the morning.', s:'a2'}
						{q:'How much does it cost?', a1:'It costs fifty dollars.', a2:'It costs fifteen dollars.', s:'a2'}
					]
				}
				{
					id:'ticketPuppet'
					x:423
					y:452
					questions:[
						{q:'Where\'s the event?', a1:'It\'s at the theater.', a2:'It\'s at the children\'s museum.', s:'a1'}
						{q:'What time does it start?', a1:'It starts at two o\'clock.', a2:'It starts at three o\'clock.', s:'a2'}
					]
				}
				{
					id:'ticketSpace'
					x:641
					y:414
					questions:[
						{q:'Where\'s the event?', a1:'It\'s at the theater.', a2:'It\'s at the science museum.', s:'a2'}
						{q:'What time does it cost?', a1:'It costs fourteen dollars.', a2:'It costs forty dollars.', s:'a1'}
					]
				}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@current = @shuffle @game.tickets
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and click on the correct ticket.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 16, 0
		@library.score.txtCount.color = "#bfd951"
		@library.score.txtTotal.color = "#ff9933"
		@setTickets().introEvaluation()
	setTickets:  ->
		if @library.tickets
			tickets = @library.tickets
		else
			tickets = new createjs.Container()
		tickets.removeAllChildren()
		tickets.name = 'tickets'
		tickets.alpha = 1
		
		for i in [0..@current.length - 1] by 1
			v = @createBitmap @current[i].id, @current[i].id, @current[i].x, @current[i].y, 'mc'
			v.scaleX = v.scaleY = 0.25
			tickets.addChild v
			@addToLibrary v

		r = @createBitmap 'repeat', 'repeatbtn', stageSize.w / 2, 530, 'tc'
		r.addEventListener 'click', @repeatSound
		tickets.addChild r
		@addToMain tickets
		@
	setTicketQuestion:  ->
		if @library.question
			question = @library.question
			question.alpha = 1
		else
			question = new createjs.Container()
			question.name = 'question'

		question.removeAllChildren()

		v = @createBitmap 'qticket', @current[@index].id, stageSize.w / 2, stageSize.h / 2-30, 'mc'
		v.scaleX = v.scaleY = 0.5
		question.addChild v

		currentQuestion = @current[@index].questions[@questionIndex]
		
		text = new createjs.Text currentQuestion.q,'24px Quicksand','#333'
		text.x = stageSize.w / 2
		text.y = 400
		text.textAlign = 'center'
		question.addChild text

		opciones = new createjs.Container()
		opciones.y = 430

		uno = new ClickableText 'a1', currentQuestion.a1, 'a1', 0, 0
		opciones.addChild uno
		
		diagonal = new createjs.Text '/','16px Quicksand','#333'
		diagonal.x = uno.x + uno.width
		opciones.addChild diagonal
		
		dos = new ClickableText 'a2', currentQuestion.a2, 'a2', diagonal.x + 10, 0
		opciones.addChild dos
		
		total = uno.width + dos.width + 20
		opciones.x = stageSize.w / 2 - total / 2
		question.addChild opciones

		@addToLibrary uno, dos
		@addToMain question
		TweenLite.from @library.question, 0.5, {alpha:0, y: -@library.question.y + 20}
		TweenLite.to @library.tickets, 0.5, {alpha:0, y: -@library.tickets.y + 20}
		@
	initOptionListeners: ->
		@library.a1.addEventListener 'click', @evaluateAnswer
		@library.a2.addEventListener 'click', @evaluateAnswer
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y: -@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.from @library.tickets, 1, {alpha: 0, y: @library.tickets.y + 20, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for i in [0..@current.length - 1] by 1
			@library[@current[i].id].addEventListener 'click', @evaluateClick
		createjs.Sound.play "s#{@current[@index].id}"
	evaluateClick: (e) =>
		if e.target.name is @current[@index].id
			createjs.Sound.stop()
			@library.instructions.children[1].text = "Read and click on the correct answers."
			if @index < 1 then createjs.Sound.play 'instructions2' else createjs.Sound.play 'good'
			@questionIndex = 0
			@setTicketQuestion().initOptionListeners()
		else
			@warning()
	evaluateAnswer: (e) =>
		@answer = e.currentTarget
		if @answer.index is @current[@index].questions[@questionIndex].s
			createjs.Sound.play 'good'
			@library.score.plusOne()
		else
			@warning()
		setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		@questionIndex++
		if @questionIndex < @current[@index].questions.length
			@setTicketQuestion().initOptionListeners()
		else
			@nextEvaluation()
	nextEvaluation: =>
		@index++
		if @index < @current.length
			@library.instructions.children[1].text = "Listen and click on the correct ticket."
			@setTickets()
			for i in [0..@current.length - 1] by 1
				@library[@current[i].id].addEventListener 'click', @evaluateClick
			TweenLite.to @library.question, 0.5, {alpha:0, y: -@library.question.y + 20}
			TweenLite.to @library.tickets, 0.5, {alpha:1, y: 0}
			createjs.Sound.play "s#{@current[@index].id}"
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "s#{@current[@index].id}"
	finish: ->
		TweenLite.to @library.question, 0.5, {alpha:0, y: -@library.question.y + 20}
		super
	window.U1A2 = U1A2