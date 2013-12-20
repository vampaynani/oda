class U8A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
 			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}

 			{id:'btnnext', src:'btn_next.png'}
			{id:'country', src:'country.png'}
			{id:'nationality', src:'nationality.png'}
			{id:'languages', src:'languages.png'}
			{id:'mapa1', src:'mapa0001.png'}
			{id:'mapa2', src:'mapa0002.png'}
			{id:'mapa3', src:'mapa0003.png'}
			{id:'mapa4', src:'mapa0004.png'}
			{id:'mapa5', src:'mapa0005.png'}
			{id:'mapa6', src:'mapa0006.png'}
			{id:'mapa7', src:'mapa0007.png'}
			{id:'mapa8', src:'mapa0008.png'}
			{id:'mapa9', src:'mapa0009.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U8_A3_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			countries:[
				{frase:'The Inuit people live in the north of this country.', pais:'Canada', nacionalidad:'Canadian', idioma:'English and French'}
				{frase:'Samba comes from this country.', pais:'Brazil', nacionalidad:'Brazilian', idioma:'Portuguese'}
				{frase:'This country is famous for sushi.', pais:'Japan', nacionalidad:'Japanese', idioma:'Japanese'}
				{frase:'This is famous for soccer, tango and beef!', pais:'Argentina', nacionalidad:'Argentinian', idioma:'Spanish'}
				{frase:'This country is famous for its cheese and chocolate.', pais:'Switzerland', nacionalidad:'Swiss', idioma:'French German Italian Romansh'}
				{frase:'', pais:'Germany', nacionalidad:'', idioma:''}
				{frase:'This country is famous for its champagne and cuisine.', pais:'France', nacionalidad:'French', idioma:'French'}
				{frase:'This country is also known as the "Emerald Isle."', pais:'Ireland', nacionalidad:'Irish', idioma:'Irish and English'}
				{frase:'This country is made up of England, Scotland, Wales and North Ireland. ', pais:'United Kingdom', nacionalidad:'British', idioma:'English'}
				{frase:'This is the most populated country in the world!', pais:'China', nacionalidad:'Chinese', idioma:'Mandarin chinese'}
				{frase:'This country is famous for its pyramids.', pais:'Egypt', nacionalidad:'Egyptian', idioma:'Arabic'}
				{frase:'Kangaroos and koalas live in this country.', pais:'Australia', nacionalidad:'Australian', idioma:'English and 70 aboriginal languages'}
			
			]
			options:[
				{
					country:['Austria', 'Australia', 'New Zealand']
					nationality:['Australian', 'Asian', 'Austrian']
					languages:['English', 'Australian','English and 70 aboriginal languages']
				}
				{
					country:['Austria', 'Australia', 'New Zealand']
					nationality:['Australian', 'Asian', 'Austrian']
					languages:['English', 'Australian','English and 70 aboriginal languages']
				}
			]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look, read and click on the correct options.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		#@setMenu()
		@setMapa(1)
	setMapa: (pais) ->
		@country = @game.countries[pais - 1]
		mapa = new createjs.Container()
		mapa.name = 'mapa'

		m = @createSprite "map", ['mapa1','mapa2','mapa3','mapa4','mapa5','mapa6','mapa7','mapa8','mapa9'],null, 60, 150
		m.currentFrame = pais
		cpais = new createjs.Container()
		cpais.x = 656
		cpais.y = 145
		c = @createBitmap  'country',  'country', 0, 0
		cpais.addChild c
		for i in [1..3]
			word = new ClickableText "country#{i}", @game.options[pais - 1].country[i - 1], i, 45, (i * 34) + 2
			word.text.font = '11px Quicksand'
			word.text.textAlign = 'center'
			cpais.addChild word

		cnation = new createjs.Container()
		cnation.x = 656
		cnation.y = 285
		n = @createBitmap  'nationality',  'nationality', 0, 0
		cnation.addChild n
		for i in [1..3]
			word = new ClickableText "country#{i}", @game.options[pais - 1].nationality[i - 1], i, 45, (i * 34) + 2
			word.text.font = '11px Quicksand'
			word.text.textAlign = 'center'
			cnation.addChild word

		clang = new createjs.Container()
		clang.x = 656
		clang.y = 425
		l = @createBitmap  'languages',  'languages', 0, 0
		clang.addChild l
		for i in [1..3]
			word = new ClickableText "country#{i}", @game.options[pais - 1].languages[i - 1], i, 45, (i * 34) + 2
			word.text.font = '11px Quicksand'
			word.text.textAlign = 'center'
			clang.addChild word

		btn = @createBitmap  'btnnext',  'btnnext', 400, 552
		f = new createjs.Text @country.frase, '16px Quicksand', '#333333'
		f.x = 100
		f.y = 510
		mapa.addChild m, clang, cnation, cpais, btn, f


		@addToMain mapa

	setMenu: ->
		menu = new createjs.Container()
		menu.x = 100
		menu.y = 290
		menu.name = 'menu'
		for i in [0..@game.names.length - 1]
			v = @createBitmap 'drag'+i, 'menu'+@game.names[i].img, i * 150, 20, 'bc'
			if i >= 5
				v.y = 200
				v.x = v.x - 670
			menu.addChild v
			@addToLibrary v
		@addToMain menu
		@
	setVacations: (nombre) ->
		@nombre = @game.names[nombre - 1].img
		menu = new createjs.Container()	
		menu.x = 24
		menu.y = 140
		menu.name = 'menu'
		for i in [0..@game.names.length - 1]
			v = new Draggable 'drag'+i, (@preload.getResult 'image'+@game.names[i].img+'Dragble'),i , i * 85, 0
			if i in [0,8]
				v.y = 50
			else if i in [1,7]
				v.y = 25
			menu.addChild v
			@addToLibrary v

		for i in [0..@game.names.length - 1]
			b = new Draggable 'ballon'+i, (@preload.getResult 'ballon'+@game.names[i].img+'Dragble'), i, i * 140 + 80, 370
			if i >= 5
				b.y = 415
				b.x = b.x - 620 
			menu.addChild b
			@addToLibrary b

		char = @createSprite "character", ["sp#{@nombre}Big1","sp#{@nombre}Big2"],null, 180, 340, 'bl'
		btn = @createBitmap  'btnrepeat', 'btnrepeat', 220, 310, 'bl'
		ballon = @createBitmap  'ballon', 'ballon', @game.names[nombre - 1].x + 10, @game.names[nombre - 1].y - 112
		menu.addChild char, btn, ballon
		@addToMain menu
		@
	window.U8A2 = U8A2