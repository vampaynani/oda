class U4A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'btnH', src:'btn_H.png'}
			{id: 'btnU', src:'btn_U.png'}
			{id: 'btnrepeat', src:'btn_repeat.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U4_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U4_A4_1.mp3', id:'sound1'}
		    {src:'sounds/TU3_U4_A4_2.mp3', id:'sound2'}
		    {src:'sounds/TU3_U4_A4_3.mp3', id:'sound3'}
		    {src:'sounds/TU3_U4_A4_4.mp3', id:'sound4'}
		    {src:'sounds/TU3_U4_A4_5.mp3', id:'sound5'}
		    {src:'sounds/TU3_U4_A4_6.mp3', id:'sound6'}
		    {src:'sounds/TU3_U4_A4_7.mp3', id:'sound7'}
		    {src:'sounds/TU3_U4_A4_8.mp3', id:'sound8'}
		    {src:'sounds/TU3_U4_A4_9.mp3', id:'sound9'}
		    {src:'sounds/TU3_U4_A4_10.mp3', id:'sound10'}
		    {src:'sounds/TU3_U4_A4_11.mp3', id:'sound11'}
		    {src:'sounds/TU3_U4_A4_12.mp3', id:'sound12'}
		    {src:'sounds/TU3_U4_A4_13.mp3', id:'sound13'}
		    {src:'sounds/TU3_U4_A4_14.mp3', id:'sound14'}
		    {src:'sounds/TU3_U4_A4_15.mp3', id:'sound15'}
		    {src:'sounds/TU3_U4_A4_16.mp3', id:'sound16'}
		    {src:'sounds/TU3_U4_A4_17.mp3', id:'sound17'}
		    {src:'sounds/TU3_U4_A4_18.mp3', id:'sound18'}
		    {src:'sounds/TU3_U4_A4_19.mp3', id:'sound19'}
		    {src:'sounds/TU3_U4_A4_20.mp3', id:'sound20'}
		]
		@game =
			tickets:[
				{snd:1, res:'btnH'}
				{snd:2, res:'btnH'}
				{snd:3, res:'btnU'}
				{snd:4, res:'btnH'}
				{snd:5, res:'btnH'}
				{snd:6, res:'btnH'}
				{snd:7, res:'btnU'}
				{snd:8, res:'btnU'}
				{snd:9, res:'btnH'}
				{snd:10, res:'btnU'}
				{snd:11, res:'btnU'}
				{snd:12, res:'btnH'}
				{snd:13, res:'btnU'}
				{snd:14, res:'btnU'}
				{snd:15, res:'btnU'}
				{snd:16, res:'btnU'}
				{snd:17, res:'btnH'}
				{snd:18, res:'btnH'}
				{snd:19, res:'btnH'}
				{snd:20, res:'btnU'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@current = @shuffle @game.tickets
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and click on the correct ticket.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 20, 0
		@setTickets().introEvaluation()
	setTickets:  ->
		if @library.tickets
			tickets = @library.tickets
		else
			tickets = new createjs.Container()
			tickets.name = 'tickets'
		
			u = @createBitmap 'btnU', 'btnU', 110, 353
			u.addEventListener 'click', @evaluateClick

			h = @createBitmap 'btnH', 'btnH', 239, 146
			h.addEventListener 'click', @evaluateClick

			tickets.addChild u, h
			@addToLibrary u, h

			r = @createBitmap 'repeat', 'btnrepeat', 600,541
			r.addEventListener 'click', @repeatSound
			tickets.addChild r
		@addToMain tickets
		@
	 
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y: -@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.from @library.tickets, 1, {alpha: 0, y: @library.tickets.y + 20, delay: 0.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		createjs.Sound.play "sound#{@current[@index].snd}"
	evaluateClick: (e) =>
		if e.target.name is @current[@index].res
			createjs.Sound.stop()
			createjs.Sound.play 'good'
			@library.score.plusOne()
			setTimeout @nextEvaluation(), 2 * 1000
		else
			@warning()
			setTimeout @nextEvaluation(), 2 * 1000

	nextEvaluation: =>
		@index++
		if @index < @current.length
			createjs.Sound.play "sound#{@current[@index].snd}"
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "sound#{@current[@index].snd}"
	finish: ->
		TweenLite.to @library.tickets, 0.5, {alpha:0}
		super
	window.U4A4 = U4A4