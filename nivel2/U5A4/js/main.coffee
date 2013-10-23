class U5A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'bg', src:'prop_piso.png'}

			{id: 'summerJenifferdressclothdrag', src:'summer/jeniffer_dress_cloth_drag_summer.png'}
			{id: 'summerJenifferhatclothdrag', src:'summer/jeniffer_hat_cloth_drag_summer.png'}
			{id: 'summerJeniffersandalsclothdrag', src:'summer/jeniffer_sandals_cloth_drag_summer.png'}
			{id: 'summerJeniffersunglassesclothdrag_', src:'summer/jeniffer_sunglasses_cloth_drag_summer.png'}
			{id: 'summerMIkecapclothdrag', src:'summer/mIke_cap_cloth_drag_summer.png'}
			{id: 'summerMIkeshirtclothdrag', src:'summer/mIke_shirt_cloth_drag_summer.png'}
			{id: 'summerMIkesunglassesclothdrag', src:'summer/mIke_sunglasses_cloth_drag_summer.png'}
			{id: 'summerMIkeswimsuitclothdrag', src:'summer/mIke_swimsuit_cloth_drag_summer.png'}
			{id: 'summerMIketennisclothdrag', src:'summer/mIke_tennis_cloth_drag_summer.png'}
			{id: 'summerRachelhatclothdrag', src:'summer/rachel_hat_cloth_drag_summer.png'}
			{id: 'summerRachelsandalsclothdrag', src:'summer/rachel_sandals_cloth_drag_summer.png'}
			{id: 'summerRachelswimsuitclothdrag', src:'summer/rachel_swimsuit_cloth_drag_summer.png'}
			{id: 'summerTylercapclothdrag', src:'summer/tyler_cap_cloth_drag_summer.png'}
			{id: 'summerTylersandalsclothdrag', src:'summer/tyler_sandals_cloth_drag_summer.png'}
			{id: 'summerTylerswimsuitclothdrag', src:'summer/tyler_swimsuit_cloth_drag_summer.png'}

		
			{id: 'winterJenniferbootsclothdrag', src:'winter/jennifer_boots_cloth_drag_winter.png'}
			{id: 'winterJenniferhatclothdrag', src:'winter/jennifer_hat_cloth_drag_winter.png'}
			{id: 'winterJenniferraincoatclothdrag', src:'winter/jennifer_raincoat_cloth_drag_winter.png'}
			{id: 'winterMikebootsclothdrag', src:'winter/mike_boots_cloth_drag_winter.png'}
			{id: 'winterMikecoatclothdrag', src:'winter/mike_coat_cloth_drag_winter.png'}
			{id: 'winterMikeglovesclothdrag', src:'winter/mike_gloves_cloth_drag_winter.png'}
			{id: 'winterMikehatclothdragwinter', src:'winter/mike_hat_cloth_drag_winter.png'}
			{id: 'winterMikejeansclothdrag', src:'winter/mike_jeans_cloth_drag_winter.png'}
			{id: 'winterRacheljacketclothdrag', src:'winter/rachel_jacket_cloth_drag_winter.png'}
			{id: 'winterRachelscarfclothdrag', src:'winter/rachel_scarf_cloth_drag_winter.png'}
			{id: 'winterRachelshoesclothdrag', src:'winter/rachel_shoes_cloth_drag_winter.png'}
			{id: 'winterRachelskirtclothdrag', src:'winter/rachel_skirt_cloth_drag_winter.png'}
			{id: 'winterTylerhatclothdrag', src:'winter/tyler_hat_cloth_drag_winter.png'}
			{id: 'winterTylerpantsclothdrag', src:'winter/tyler_pants_cloth_drag_winter.png'}
			{id: 'winterTylersweaterclothdrag', src:'winter/tyler_sweater_cloth_drag_winter.png'}
			{id: 'winterTylertennisclothdrag', src:'winter/tyler_tennis_cloth_drag_winter.png'}

			{id:'summerchildjennifer', src:'summer_child_jennifer.png'}
			{id:'summerchildjenniferdress', src:'summer_child_jennifer_dress.png'}
			{id:'summerchildjenniferglasses', src:'summer_child_jennifer_glasses.png'}
			{id:'summerchildjenniferhat', src:'summer_child_jennifer_hat.png'}
			{id:'summerchildjennifershoes', src:'summer_child_jennifer_shoes.png'}
			{id:'summerchildmike', src:'summer_child_mike.png'}
			{id:'summerchildmikeglasses', src:'summer_child_mike_glasses.png'}
			{id:'summerchildmikehat', src:'summer_child_mike_hat.png'}
			{id:'summerchildmikeshirt', src:'summer_child_mike_shirt.png'}
			{id:'summerchildmikeshoes', src:'summer_child_mike_shoes.png'}
			{id:'summerchildmikeshort', src:'summer_child_mike_short.png'}
			{id:'summerchildrachel', src:'summer_child_rachel.png'}
			{id:'summerchildrachelhat', src:'summer_child_rachel_hat.png'}
			{id:'summerchildrachelshoes', src:'summer_child_rachel_shoes.png'}
			{id:'summerchildrachelsuit', src:'summer_child_rachel_suit.png'}
			{id:'summerchildtyler', src:'summer_child_tyler.png'}
			{id:'summerchildtylerhat', src:'summer_child_tyler_hat.png'}
			{id:'summerchildtylershoes', src:'summer_child_tyler_shoes.png'}
			{id:'summerchildtylershort', src:'summer_child_tyler_short.png'}

			{id:'winterchildrachelbufanda', src:'winter_child_bufanda.png'}
			{id:'winterchildjennifer', src:'winter_child_jennifer.png'}
			{id:'winterchildjenniferboots', src:'winter_child_jennifer_boots.png'}
			{id:'winterchildjennifercoat', src:'winter_child_jennifer_coat.png'}
			{id:'winterchildjenniferhat', src:'winter_child_jennifer_hat.png'}
			{id:'winterchildmike', src:'winter_child_mike.png'}
			{id:'winterchildmikeboats', src:'winter_child_mike_boats.png'}
			{id:'winterchildmikecoat', src:'winter_child_mike_coat.png'}
			{id:'winterchildmikegloves', src:'winter_child_mike_gloves.png'}
			{id:'winterchildmikehat', src:'winter_child_mike_hat.png'}
			{id:'winterchildmikejeans', src:'winter_child_mike_jeans.png'}
			{id:'winterchildrachel', src:'winter_child_rachel.png'}
			{id:'winterchildrachelcoat', src:'winter_child_rachel_coat.png'}
			{id:'winterchildrachelshoes', src:'winter_child_rachel_shoes.png'}
			{id:'winterchildrachelskirt', src:'winter_child_rachel_skirt.png'}
			{id:'winterchildtyler', src:'winter_child_tyler.png'}
			{id:'winterchildtylerhat', src:'winter_child_tyler_hat.png'}
			{id:'winterchildtylerpants', src:'winter_child_tyler_pants.png'}
			{id:'winterchildtylersweater', src:'winter_child_tyler_sweater.png'}
			{id:'winterchildtylertennis', src:'winter_child_tyler_tennis.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U5_A4_instructions.mp3', id:'instructions'}
		]
		@answers = [	
		]
		@positions = 
			summer:[
				{id: 'summerJenifferdressclothdrag', x:'713', y:'490'}
				{id: 'summerJenifferhatclothdrag', x:'146', y:'432'}
				{id: 'summerJeniffersandalsclothdrag', x:'717', y:'405'}
				{id: 'summerJeniffersunglassesclothdrag_', x:'247', y:'432'}
				{id: 'summerMIkecapclothdrag', x:'632', y:'439'}
				{id: 'summerMIkeshirtclothdrag', x:'504', y:'450'}
				{id: 'summerMIkesunglassesclothdrag', x:'695', y:'555'}
				{id: 'summerMIkeswimsuitclothdrag', x:'590', y:'500'}
				{id: 'summerMIketennisclothdrag', x:'422', y:'518'}
				{id: 'summerRachelhatclothdrag', x:'348', y:'427'}
				{id: 'summerRachelsandalsclothdrag', x:'503', y:'544'}
				{id: 'summerRachelswimsuitclothdrag',x:'421', y:'461'}
				{id: 'summerTylercapclothdrag', x:'303', y:'490'}
				{id: 'summerTylersandalsclothdrag', x:'291', y:'535'}
				{id: 'summerTylerswimsuitclothdrag', x:'177', y:'516'}
			]
			winter:[
				{id: 'winterJenniferbootsclothdrag', x:'630', y:'409'}
				{id: 'winterJenniferhatclothdrag', x:'541', y:'428'}
				{id: 'winterJenniferraincoatclothdrag', x:'713', y:'515'}
				{id: 'winterMikebootsclothdrag', x:'304', y:'536'}
				{id: 'winterMikecoatclothdrag', x:'410', y:'497'}
				{id: 'winterMikeglovesclothdrag', x:'480', y:'490'}
				{id: 'winterMikehatclothdragwinter', x:'221', y:'429'}
				{id: 'winterMikejeansclothdrag', x:'132', y:'444'}
				{id: 'winterRacheljacketclothdrag', x:'147', y:'523'}
				{id: 'winterRachelscarfclothdrag', x:'732', y:'407'}
				{id: 'winterRachelshoesclothdrag', x:'427', y:'415'}
				{id: 'winterRachelskirtclothdrag', x:'211', y:'495'}
				{id: 'winterTylerhatclothdrag', x:'678', y:'453'}
				{id: 'winterTylerpantsclothdrag', x:'316', y:'447'}
				{id: 'winterTylersweaterclothdrag', x:'566', y:'494'}
				{id: 'winterTylertennisclothdrag', x:'632', y:'533'}
			]
		@summer =
			child1:['summerchildjennifer', 'summerchildjenniferdress', 'summerchildjenniferglasses', 'summerchildjenniferhat', 'summerchildjennifershoes']
			child2:['summerchildtyler', 'summerchildtylerhat', 'summerchildtylershoes', 'summerchildtylershort']
			child3:['summerchildrachel', 'summerchildrachelhat', 'summerchildrachelshoes', 'summerchildrachelsuit']
			child4:['summerchildmike', 'summerchildmikeglasses', 'summerchildmikehat', 'summerchildmikeshirt', 'summerchildmikeshoes', 'summerchildmikeshort']

		@winter =
			child1:['winterchildjennifer', 'winterchildjenniferboots', 'winterchildjennifercoat', 'winterchildjenniferhat']
			child2:['winterchildtyler', 'winterchildtylerhat', 'winterchildtylerpants', 'winterchildtylersweater', 'winterchildtylertennis']
			child3:['winterchildrachel', 'winterchildrachelcoat', 'winterchildrachelshoes', 'winterchildrachelskirt', 'winterchildrachelbufanda']
			child4:['winterchildmike', 'winterchildmikeboats', 'winterchildmikecoat', 'winterchildmikegloves', 'winterchildmikehat', 'winterchildmikejeans']

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setKids().introEvaluation()
	setKids: ->
		todo = new createjs.Container()
		todo.x = 0
		todo.y = 150	

		ropas = new createjs.Container()
		ropas.x = 0
		ropas.y = 0

		fondo = @createBitmap 'bg', 'bg', 85, 150

		todo.addChild fondo
		@addToLibrary fondo

		estacion = 'summer'
		
		for i in [1..4]		
			boton = @createBitmap 'repeatbtn', 'repeatbtn', i*155, 200
			todo.addChild boton
			
		for i in [0..@[estacion].child1.length-1]
			chico = @createBitmap @[estacion].child1[i], @[estacion].child1[i], (1*160)+20, 85, 'mc'
			chico.scaleX = chico.scaleY = 0.45
			todo.addChild chico
		for i in [0..@[estacion].child2.length-1]
			chico = @createBitmap @[estacion].child2[i], @[estacion].child2[i], (2*160)+20, 85, 'mc'
			chico.scaleX = chico.scaleY = 0.45
			todo.addChild chico
		for i in [0..@[estacion].child3.length-1]
			chico = @createBitmap @[estacion].child3[i], @[estacion].child3[i], (3*160)+20, 85, 'mc'
			chico.scaleX = chico.scaleY = 0.45
			todo.addChild chico
		for i in [0..@[estacion].child4.length-1]
			chico = @createBitmap @[estacion].child4[i], @[estacion].child4[i], (4*160)+20, 85, 'mc'
			chico.scaleX = chico.scaleY = 0.45
			todo.addChild chico


		for i in [0..14]
			ropa = new Draggable @positions.summer[i].id, @preload.getResult(@positions.summer[i].id), i, @positions.summer[i].x, @positions.summer[i].y, 'mc'
			ropas.addChild ropa
			@addToLibrary ropa
			
		for i in [0..15]			
			ropa = new Draggable @positions.winter[i].id, @preload.getResult(@positions.winter[i].id), i, @positions.winter[i].x, @positions.winter[i].y, 'mc'
			ropas.addChild ropa
			@addToLibrary ropa

		@addToMain todo
		@addToMain ropas
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
	window.U5A4 = U5A4