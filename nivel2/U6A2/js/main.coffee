class U6A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'calles', src:'calles.png'}
			{id: 'map1', src:'map_1.png'}
			{id: 'map2', src:'map_2.png'}
			{id: 'map3', src:'map_3.png'}
			{id: 'bus', src:'place_bus.png'}
			{id: 'cafe', src:'place_cafe.png'}
			{id: 'hospital', src:'place_hospital.png'}
			{id: 'library', src:'place_library.png'}
			{id: 'museum', src:'place_museum2.png'}
			{id: 'pet', src:'place_pet.png'}
			{id: 'restaurant', src:'place_restaurant.png'}
			{id: 'school', src:'place_school.png'}
			{id: 'theater', src:'place_theater.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U6_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U6_A2_map1_hospital.mp3', id:'shospital'}
		    {src:'sounds/TU2_U6_A2_map1_restaurant.mp3', id:'srestaurant'}
		    {src:'sounds/TU2_U6_A2_map1_theater.mp3', id:'stheater'}
		    {src:'sounds/TU2_U6_A2_map2_bus.mp3', id:'sbus'}
		    {src:'sounds/TU2_U6_A2_map2_museum.mp3', id:'smuseum'}
		    {src:'sounds/TU2_U6_A2_map2_school.mp3', id:'sschool'}
		    {src:'sounds/TU2_U6_A2_map3_cafe.mp3', id:'scafe'}
		    {src:'sounds/TU2_U6_A2_map3_library.mp3', id:'slibrary'}
		    {src:'sounds/TU2_U6_A2_map3_pet.mp3', id:'spet'}
		]
		@game =
			[
				[
					{i:'theater', x:154, y:-35, w:95, h:95}
					{i:'hospital', x:416, y:102, w:95, h:95}
					{i:'restaurant', x:58, y:243, w:95, h:95}
				]
				[
					{i:'bus', x:58, y:92, w:95, h:95}
					{i:'museum', x:309, y:93, w:95, h:95}
					{i:'school', x:150, y:-52, w:95, h:95}
				]
				[
					{i:'library', x:-42, y:102, w:95, h:95}
					{i:'cafe', x:65, y:-37, w:95, h:95}
					{i:'pet', x:400, y:-30, w:95, h:95}
				]
			]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the buildings to the correct place on the map.', 40, 100
		@insertBitmap 'btnRepeat', 'repeatbtn',  stageSize.w / 2, 570, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 9, 0
		@intento = 0
		@setMap( 1 ).introEvaluation()
	setMap: (map) ->
		mapa = new createjs.Container()
		mapa.name = 'mapa'
		mapa.x = 150
		mapa.y = 180

		fondo = @createBitmap "map#{map}", "map#{map}", -50, -40
		calles = @createBitmap 'calles', 'calles', -50, -30
		mapa.addChild calles, fondo

		@current = @game[map - 1]
		drops = new Array()
		for drop in @current
			s = new createjs.Shape()
			s.name = "#{drop.i}"
			s.graphics.beginFill('rgba(255,255,255,0.1)').drawRect(0, 0, drop.w, drop.h)
			s.x = drop.x
			s.y = drop.y
			drops.push s
			@addToLibrary s
			mapa.addChild s

		d1 = new Droppable 'd1', (@preload.getResult @current[0].i), @current[0].i, 650, 55, @stage, drops
		d2 = new Droppable 'd2', (@preload.getResult @current[1].i), @current[1].i, 650, 155, @stage, drops
		d3 = new Droppable 'd3', (@preload.getResult @current[2].i), @current[2].i, 650, 255, @stage, drops
		d1.scaleX = d1.scaleY = d2.scaleX = d2.scaleY = d3.scaleX = d3.scaleY = 0.7
 
		@addToLibrary d1, d2, d3
		mapa.addChild d1, d2, d3
		@addToMain mapa

		for i in [1..3] by 1
			@library["d#{i}"].addEventListener 'dropped', @evaluateAnswer
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y + 10, delay: 1}
		TweenLite.from @library.mapa, 1, {alpha: 0, y: @library.mapa.y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@mindex = 0
		createjs.Sound.play "s#{@current[@mindex].i}"
		@library.btnRepeat.addEventListener 'click', @repeatSound
		for i in [1..3] by 1
			@library["d#{i}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @drop.name
			@answer.endDragListener()
			@answer.putInPlace {x: @drop.x, y:@drop.y}
			@finishEvaluation()
			createjs.Sound.play 'good'

		else
			@warning()
			@intento = 1
			@answer.returnToPlace @answer.alpha, @answer.scaleX, @answer.scaleY
	finishEvaluation: =>
		@mindex++
		if @intento is 0
			@library.score.plusOne()
		@intento = 0
		createjs.Sound.stop()
		if @mindex < @current.length
			createjs.Sound.play "s#{@current[@mindex].i}"
		else
			@mindex = 0
			setTimeout @nextEvaluation, 2 * 1000
			@library.btnRepeat.removeEventListener 'click', @repeatSound
	nextEvaluation: =>
		@index++
		TweenLite.to @library.mapa, 1, {alpha: 0, y: @library.mapa.y + 20}
		if @index < @game.length
			@setMap @index + 1
			createjs.Sound.play "s#{@current[@mindex].i}"
			@library.btnRepeat.addEventListener 'click', @repeatSound
			for i in [1..3] by 1
				@library["d#{i}"].initDragListener()
		else
			@finish()
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "s#{@current[@mindex].i}"
	finish: ->
		createjs.Sound.stop()
		TweenLite.to @library.btnRepeat, 1, {alpha :0, y: @library.btnRepeat.y + 10}
		super
	window.U6A2 = U6A2