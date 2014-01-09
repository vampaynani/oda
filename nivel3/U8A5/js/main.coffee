class U8A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
 			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			
			{id: 'propbg', src:'prop_bg.png'}
			{id: 'propwords', src:'prop_words.png'}
			{id: 'img1', src:'img_1.png'}
			{id: 'img2', src:'img_2.png'}
			{id: 'img3', src:'img_3.png'}
			{id: 'img4', src:'img_4.png'}
			{id: 'img5', src:'img_5.png'}
			{id: 'img6', src:'img_6.png'}
			{id: 'img7', src:'img_7.png'}
			{id: 'img8', src:'img_8.png'}
			{id: 'img9', src:'img_9.png'}
			{id: 'img10', src:'img_10.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U8_A5_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			images: [
				{id:'img1', x:660, y:208}
				{id:'img2', x:642, y:295}
				{id:'img3', x:594, y:399}
				{id:'img4', x:487, y:445}
				{id:'img5', x:275, y:366}
				{id:'img6', x:407, y:223}
				{id:'img7', x:-8, y:287}
				{id:'img8', x:430, y:409}
				{id:'img9', x:490, y:300}
				{id:'img10', x:658, y:414}
			]


		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look, read and click on the correct options.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 20, 0
		#@setMenu()
		@setScene()
	setScene: ->
 		container = new createjs.Container()

		fondo = @createBitmap 'propbg', 'propbg', 15, 54
		container.addChild fondo

		for i in [1..10]
			m = @createBitmap @game.images[i - 1].id, @game.images[i - 1].id, @game.images[i - 1].x,  @game.images[i - 1].y 
			container.addChild m
 	
		@addToMain container
		@
	window.U8A5 = U8A5