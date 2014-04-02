class U8A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
 			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}

			{id:'tara', src:'tara_1.png'}
			{id:'dragblepainting', src:'dragble_painting.png'}
			{id:'dragblewaterpark', src:'dragble_waterpark.png'}
			{id:'dragbleicecream', src:'dragble_icecream.png'}
			{id:'dragblepool', src:'dragble_pool.png'}
			{id:'dragbleseashells', src:'dragble_seashells.png'}

			{id:'tyler', src:'tyler_1.png'}
			{id:'dragbledolphins', src:'dragble_dolphins.png'}
			{id:'dragbleboooks', src:'dragble_boooks.png'}
			{id:'dragblesandcastles', src:'dragble_sandcastles.png'}
			{id:'dragblebike', src:'dragble_bike.png'}
			{id:'dragblefishing', src:'dragble_fishing.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U8_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = [
			{
				personaje:'tyler'
				words:[
					{palabra:'after that', img:'dragbledolphins'}
					{palabra:'then', img:'dragblesandcastles'}
					{palabra:'first', img:'dragblefishing'}
					{palabra:'finally', mg:'dragbleboooks'}
					{palabra:'next', img:'dragblebike'}
				]
			}
			{
				personaje:'tara'
				words:[
					{palabra:'finally', img:'dragbleicecream'}
					{palabra:'next', img:'dragblepainting'}
					{palabra:'then', img:'dragblepool'}
					{palabra:'first', img:'dragbleseashells'}
					{palabra:'after that', img:'dragblewaterpark'}
				]
			}
		]


		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the words to complete the text.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 20, 0
		#@setMenu()
		@setKid(2)
	setKid: (kid) ->
		@kid = @game[kid - 1]

		kid = new createjs.Container()
		kid.y = 130
		kid.x = 50
		m = @createBitmap  @kid.personaje,  @kid.personaje, 0, 30
		kid.addChild m
		equis = 150
		for i in [1..5]
			w = new DraggableText "w#{i}", @kid.words[i - 1].palabra, 1, equis, 5
			w.text.font = '20px Quicksand'
			equis = equis + w.text.getMeasuredWidth() + 42
			kid.addChild w
		for i in [0..4]
			p = @createBitmap "p#{i + 1}", @kid.words[i].img, (i * 120)+ 50, 210
			if i in [1,3]
				p.y = 270
			kid.addChild p
 
		@addToMain kid

	window.U8A4 = U8A4