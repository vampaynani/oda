class U8A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
 			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'ballon', src:'ballon.png'}
 			
			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'menuAshton', src:'ashton.png'}
			{id: 'menuCarla', src:'carla.png'}
			{id: 'menuEva', src:'eva.png'}
			{id: 'menuJack', src:'jack.png'}
			{id: 'menuKevin', src:'kevin.png'}
			{id: 'menuMarissa', src:'marissa.png'}
			{id: 'menuRenee', src:'renee.png'}
			{id: 'menuSam', src:'sam.png'}
			{id: 'menuWilson', src:'wilson.png'}
			{id: 'ballonAshtonDragble', src:'ballon_ashton_dragble.png'}
			{id: 'ballonCarlaDragble', src:'ballon_carla_dragble.png'}
			{id: 'ballonEvaDragble', src:'ballon_eva_dragble.png'}
			{id: 'ballonJackDragble', src:'ballon_jack_dragble.png'}
			{id: 'ballonKevinDragble', src:'ballon_kevin_dragble.png'}
			{id: 'ballonMarissaDragble', src:'ballon_marissa_dragble.png'}
			{id: 'ballonReneeDragble', src:'ballon_renee_dragble.png'}
			{id: 'ballonSamDragble', src:'ballon_sam_dragble.png'}
			{id: 'ballonWilsonDragble', src:'ballon_wilson_dragble.png'}
			{id: 'imageAshtonDragble', src:'image_ashton_dragble.png'}
			{id: 'imageCarlaDragble', src:'image_carla_dragble.png'}
			{id: 'imageEvaDragble', src:'image_eva_dragble.png'}
			{id: 'imageJackDragble', src:'image_jack_dragble.png'}
			{id: 'imageKevinDragble', src:'image_kevin_dragble.png'}
			{id: 'imageMarissaDragble', src:'image_marissa_dragble.png'}
			{id: 'imageReneeDragble', src:'image_renee_dragble.png'}
			{id: 'imageSamDragble', src:'image_sam_dragble.png'}
			{id: 'imageWilsonDragble', src:'image_wilson_dragble.png'}
			{id: 'spAshtonBig1', src:'prop_ashton_big0001.png'}
			{id: 'spAshtonBig2', src:'prop_ashton_big0002.png'}
			{id: 'spCarlaBig1', src:'prop_carla_big0001.png'}
			{id: 'spCarlaBig2', src:'prop_carla_big0002.png'}
			{id: 'spEvaBig1', src:'prop_eva_big0001.png'}
			{id: 'spEvaBig2', src:'prop_eva_big0002.png'}
			{id: 'spJackBig1', src:'prop_jack_big0001.png'}
			{id: 'spJackBig2', src:'prop_jack_big0002.png'}
			{id: 'spKevinBig1', src:'prop_kevin_big0001.png'}
			{id: 'spKevinBig2', src:'prop_kevin_big0002.png'}
			{id: 'spMarissaBig1', src:'prop_marissa_big0001.png'}
			{id: 'spMarissaBig2', src:'prop_marissa_big0002.png'}
			{id: 'spReneeBig1', src:'prop_renee_big0001.png'}
			{id: 'spReneeBig2', src:'prop_renee_big0002.png'}
			{id: 'spSamBig1', src:'prop_sam_big0001.png'}
			{id: 'spSamBig2', src:'prop_sam_big0002.png'}
			{id: 'spWilsonBig1', src:'prop_wilson_big0001.png'}
			{id: 'spWilsonBig2', src:'prop_wilson_big0002.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U8_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			names:[
				{img: 'Wilson', x:443 , y:266 , frase:'' }
				{img: 'Jack', x:442 , y:274 , frase:'' }
				{img: 'Renee', x:427 , y:288 , frase:'' }
				{img: 'Ashton', x:463 , y:309 , frase:'' }
				{img: 'Eva', x:464 , y:329 , frase:'' }
				{img: 'Kevin', x:460 , y:295 , frase:'' }
				{img: 'Marissa', x:474 , y:291 , frase:'' }
				{img: 'Sam', x:474 , y:319 , frase:'' }
				{img: 'Carla', x:468 , y:332 , frase:'' }
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click, listen and match.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		#@setMenu()
		@setVacations(9)
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