class U5A3 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}

			{id:'propclaw', src:'prop_claw.png'}
			{id:'propfeather', src:'prop_feather.png'}
			{id:'propfin', src:'prop_fin.png'}
			{id:'prophair', src:'prop_hair.png'}
			{id:'prophead', src:'prop_head.png'}
			{id:'prophorn', src:'prop_horn.png'}
			{id:'propleg', src:'prop_leg.png'}
			{id:'propneck', src:'prop_neck.png'}
			{id:'proptail', src:'prop_tail.png'}
			{id:'propteeth', src:'prop_teeth.png'}
			{id:'proptusk', src:'prop_tusk.png'}
			{id:'propwing', src:'prop_wing.png'}
			{id:'propwords', src:'prop_words.png'}

			{id:'scene2bison', src:'scene2_bison.png'}
			{id:'scene2mamut', src:'scene2_mamut.png'}
			{id:'scene2mauisaurus', src:'scene2_mauisaurus.png'}
			{id:'scene2velociraptor', src:'scene2_velociraptor.png'}

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U6_A1_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU3_U6_A1_instructions2.mp3', id:'instructions2'}
		]

		@game = 
			animales:[
					{
						image: 'scene2velociraptor'
						words: [
							{txt:'claw', x:118, y:327}
							{txt:'feather', x:135, y:167}
							{txt:'wing', x:610, y:277}
							{txt:'teeth', x:590, y:148}
						]
					}
					{
						image: 'scene2bison'
						words: [
							{txt:'leg', x:57 , y:171}
							{txt:'horn', x:629 , y:38}
						]
					}
					{
						image: 'scene2mamut'
						words: [
							{txt:'hair', x:57 , y:90}
							{txt:'tail', x:83 , y:291}
							{txt:'tusk', x:563 , y:213}
						]
					}
					{
						image: 'scene2mauisaurus'
						words: [
							{txt:'fin', x:57 ,y:215}
							{txt:'head', x:588 ,y:100}
							{txt:'neck', x:591 ,y:314}
						]
					}
			]
			letras3:[
				{y:5}
				{y:0}
				{y:5}
			]
			letras4:[
				{y:8}
				{y:0}
				{y:0}
				{y:8}
			]
			letras5:[
				{y:22}
				{y:5}
				{y:0}
				{y:5}
				{y:22}
			]
			letras7:[
				{y:54}
				{y:22}
				{y:5}
				{y:0}
				{y:5}
				{y:22}
				{y:54}
			]
			toScramble:[
				{
					img:[
						{txt: 'tusk',  id: 'proptusk'}
						{txt: 'fin',  id: 'propfin'}
						{txt: 'claw',  id: 'propclaw'}
					]
				}
				{
					img:[
						{txt: 'horn',  id: 'prophorn'}
						{txt: 'leg',  id: 'propleg'}
						{txt: 'feather',  id: 'propfeather'}
					]
				}
				{
					img:[
						{txt: 'wing',  id: 'propwing'}
						{txt: 'neck',  id: 'propneck'}
						{txt: 'hair',  id: 'prophair'}
					]
				}
				{
					img:[
						{txt: 'head',  id: 'prophead'}
						{txt: 'teeth',  id: 'propteeth'}
						{txt: 'tail',  id: 'proptail'}
					]
				}
			]
			positions:[
				{x:204, y:258}
				{x:598, y:258}
				{x:405, y:437}
			]
			palabras:[
				{w:'tusk',x: 92, y: 65 }
				{w:'fin', x: 381, y: 25 }
				{w:'claw',x: 308, y: 58 }
				{w:'horn', x: 58, y: 35 }
				{w:'leg', x: 506, y: 64 }
				{w:'feather', x: 171, y: 29 }
				{w:'wing', x: 408, y: 51 }
				{w:'neck', x: 197, y: 59 }
				{w:'hair', x: 600, y: 70 }
				{w:'head',  x: 472, y: 28 }
				{w:'teeth', x: 573, y: 33 }
				{w:'tail',  x: 291, y: 25 }
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look and drag the letters to form a word.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 20, 0
		@setScrambled(1)
		#@setDrags(1)
	setScrambled: (step)  ->
		@imagenes = @game.toScramble[step-1].img

		container = new createjs.Container()
		container.name = 'container'
		for j in [0..2]
			img = @createBitmap @imagenes[j].id, @imagenes[j].id, @game.positions[j].x, @game.positions[j].y, 'mc'
			#img.scaleX = img.scaleY = 0.5
			@addToLibrary img
			container.addChild img

			letras = new createjs.Container()
			palabra = new createjs.Container()
			col = @imagenes[j].txt.split ''
			@scrambled = @shuffle col

			for i in [1..@scrambled.length]
				if @scrambled[i - 1] isnt ' '

					if @scrambled.length is 3
						letra = new DraggableText "t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 30, @game.letras3[i - 1].y
					if @scrambled.length is 4
						letra = new DraggableText "t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 30, @game.letras4[i - 1].y
					if @scrambled.length is 5
						letra = new DraggableText "t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 30, @game.letras5[i - 1].y
					if @scrambled.length is 7
						letra = new DraggableText "t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 30, @game.letras7[i - 1].y


					letra.text.font = '20px Quicksand'

					letra.createHitArea(28,30)
					letra.addEventListener 'drop', @evaluateAnswer
					letra.onInitEvaluation()
					@addToLibrary letra
					letras.addChild letra
				if col[i - 1] isnt ' '
					wc = new WordContainer "l#{i}", '', 'rgba(238,238,238,0.3)','	#f39234', i * 28, 50, 25, 30
					wc.index = col[i - 1]
					@addToLibrary wc
					palabra.addChild wc

			palabra.name = "palabra"
			palabra.y = @game.positions[j].y + 35
			palabra.x = @game.positions[j].x - @scrambled.length * 28 / 2 - 28
			letras.name = "letras"
			letras.y = @game.positions[j].y - 120 
			letras.x = @game.positions[j].x - @scrambled.length * 28 / 2 - 28

			@addToMain letras
			@addToMain palabra
		@addToMain container
		@	
	setDrags: (scene) ->
		@imagenes = @game.animales[scene - 1]

		animal = new createjs.Container()
		animal.name = 'animal'
		animal.x = 80
		animal.y = 100

		img = @createBitmap @imagenes.image, @imagenes.image, 0, 0
		@addToLibrary img
		animal.addChild img

		console.log @imagenes.words[1].x
		for i in [1..@imagenes.words.length]
 			console.log 'hola'
 			wc = new WordContainer "wc#{i}", '', 'rgba(238,238,238,1)','#f39234',  @imagenes.words[i - 1].x - 50, @imagenes.words[i - 1].y - 20
 			@addToLibrary wc
			animal.addChild wc

		console.log @library['wc1']
		console.log @library['wc2']

		palabras = new createjs.Container()
		palabras.name = 'palabras'
		palabras.x = 100
		palabras.y = 480
		fondo = @createBitmap 'propwords', 'propwords', 15, 10		
		palabras.addChild fondo
		for i in [1..12]
			word = new DraggableText "w#{i}", @game.palabras[i - 1].w, i, @game.palabras[i - 1].x, @game.palabras[i - 1].y
			word.text.font = '20px Quicksand'
			@addToLibrary word
			palabras.addChild word


		@addToMain palabras
		@addToMain animal
		@

	window.U5A3 = U5A3