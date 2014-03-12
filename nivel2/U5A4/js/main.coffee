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
			{id: 'summerJeniffersunglassesclothdrag', src:'summer/jeniffer_sunglasses_cloth_drag_summer.png'}
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
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U5_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/TU2_U5_A4_summer_jennifer.mp3', id:'ssummerchildjennifer'}
		    {src:'sounds/TU2_U5_A4_summer_mike.mp3', id:'ssummerchildmike'}
		    {src:'sounds/TU2_U5_A4_summer_rachel.mp3', id:'ssummerchildrachel'}
		    {src:'sounds/TU2_U5_A4_summer_tyler.mp3', id:'ssummerchildtyler'}
		    {src:'sounds/TU2_U5_A4_winter_jennifer.mp3', id:'swinterchildjennifer'}
		    {src:'sounds/TU2_U5_A4_winter_mike.mp3', id:'swinterchildmike'}
		    {src:'sounds/TU2_U5_A4_winter_rachel.mp3', id:'swinterchildrachel'}
		    {src:'sounds/TU2_U5_A4_winter_tyler.mp3', id:'swinterchildtyler'}
		]
		@game = 
			summer:
				kids: [
					['summerchildjennifer', 'summerchildjenniferdress', 'summerchildjenniferglasses', 'summerchildjenniferhat', 'summerchildjennifershoes']
					['summerchildtyler', 'summerchildtylershort', 'summerchildtylerhat', 'summerchildtylershoes']
					['summerchildrachel', 'summerchildrachelhat', 'summerchildrachelshoes', 'summerchildrachelsuit']
					['summerchildmike', 'summerchildmikeglasses', 'summerchildmikehat', 'summerchildmikeshort', 'summerchildmikeshirt', 'summerchildmikeshoes']
				]
				drops: [
					{
						summerJenifferdressclothdrag: 'summerchildjenniferdress'
						summerJenifferhatclothdrag:'summerchildjenniferhat'
						summerJeniffersandalsclothdrag:'summerchildjennifershoes'
						summerJeniffersunglassesclothdrag:'summerchildjenniferglasses'
					}
					{
						summerTylercapclothdrag: 'summerchildtylerhat'
						summerTylersandalsclothdrag: 'summerchildtylershoes'
						summerTylerswimsuitclothdrag: 'summerchildtylershort'
					}
					{
						summerRachelhatclothdrag: 'summerchildrachelhat'
						summerRachelsandalsclothdrag: 'summerchildrachelshoes'
						summerRachelswimsuitclothdrag: 'summerchildrachelsuit'
					}
					{
						summerMIkecapclothdrag: 'summerchildmikehat'
						summerMIkeshirtclothdrag:'summerchildmikeshirt'
						summerMIkesunglassesclothdrag:'summerchildmikeglasses'
						summerMIkeswimsuitclothdrag:'summerchildmikeshort'
						summerMIketennisclothdrag:'summerchildmikeshoes'
					}
				]
				positions: [
					{id: 'summerJenifferdressclothdrag', x:1466, y:920}
					{id: 'summerJenifferhatclothdrag', x:292, y:864}
					{id: 'summerJeniffersandalsclothdrag', x:1434, y:810}
					{id: 'summerJeniffersunglassesclothdrag', x:494, y:864}
					{id: 'summerMIkecapclothdrag', x:1264, y:878}
					{id: 'summerMIkeshirtclothdrag', x:1008, y:900}
					{id: 'summerMIkesunglassesclothdrag', x:1390, y:1110}
					{id: 'summerMIkeswimsuitclothdrag', x:1230, y:1000}
					{id: 'summerMIketennisclothdrag', x:844, y:1036}
					{id: 'summerRachelhatclothdrag', x:696, y:854}
					{id: 'summerRachelsandalsclothdrag', x:1006, y:1088}
					{id: 'summerRachelswimsuitclothdrag',x:922, y:882}
					{id: 'summerTylercapclothdrag', x:606, y:960}
					{id: 'summerTylersandalsclothdrag', x:582, y:1070}
					{id: 'summerTylerswimsuitclothdrag', x:374, y:1032}
				]
			winter:
				kids: [
					['winterchildjennifer', 'winterchildjenniferboots', 'winterchildjennifercoat', 'winterchildjenniferhat']
					['winterchildtyler', 'winterchildtylerhat', 'winterchildtylerpants', 'winterchildtylersweater', 'winterchildtylertennis']
					['winterchildrachel', 'winterchildrachelcoat', 'winterchildrachelshoes', 'winterchildrachelskirt', 'winterchildrachelbufanda']
					['winterchildmike', 'winterchildmikejeans', 'winterchildmikeboats', 'winterchildmikecoat', 'winterchildmikegloves', 'winterchildmikehat']
				]
				drops: []
				positions: [
					{id: 'winterJenniferbootsclothdrag', x:1260, y:818}
					{id: 'winterJenniferhatclothdrag', x:1082, y:856}
					{id: 'winterJenniferraincoatclothdrag', x:1426, y:1030}
					{id: 'winterMikebootsclothdrag', x:608, y:1072}
					{id: 'winterMikecoatclothdrag', x:820, y:994}
					{id: 'winterMikeglovesclothdrag', x:960, y:980}
					{id: 'winterMikehatclothdragwinter', x:442, y:858}
					{id: 'winterMikejeansclothdrag', x:264, y:888}
					{id: 'winterRacheljacketclothdrag', x:294, y:1046}
					{id: 'winterRachelscarfclothdrag', x:1464, y:814}
					{id: 'winterRachelshoesclothdrag', x:854, y:830}
					{id: 'winterRachelskirtclothdrag', x:422, y:990}
					{id: 'winterTylerhatclothdrag', x:1356, y:906}
					{id: 'winterTylerpantsclothdrag', x:632, y:894}
					{id: 'winterTylersweaterclothdrag', x:1132, y:988}
					{id: 'winterTylertennisclothdrag', x:1264, y:1066}
				]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on the models, listen and dress them up.', 80, 200
		@insertBitmap 'bg', 'bg', 170, 600
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 15, 0
		@setKids('summer').setRopa().introEvaluation()
	setKids: (station) ->
		kids = new createjs.Container()
		kids.name = 'kids'
		kids.x = 320
		kids.y = 300
		@station = station
		current = @game[@station].kids
		for i in [0..3]	by 1
			boton = @createBitmap "repeat#{current[i][0]}", 'repeatbtn', i * 290, 400
			boton.visible = off
			@addToLibrary boton
			kids.addChild boton
		for i in [0..3] by 1
			for j in [0..current[i].length-1] by 1
				asset = @createBitmap current[i][j], current[i][j], i * 320 + 40, 170, 'mc'
				asset.scaleX = asset.scaleY = 0.45
				console.log asset
				if j > 0 
					asset.visible = off
				else 
					hit = new createjs.Shape()
					hit.graphics.beginFill('#000').drawRect(-5, -3, asset.width + 40, asset.height + 20)
					asset.index = i
					asset.hitArea = hit
				@addToLibrary asset
				kids.addChild asset
		@addToMain kids
		@
	setRopa: ->
		ropas = new createjs.Container()
		ropas.name = 'ropas'
		ropas.x = 0
		ropas.y = 0

		current = @game[@station].positions
		for i in [0..current.length - 1] by 1
			ropa = new Draggable "r#{i}", @preload.getResult(current[i].id), current[i].id, current[i].x, current[i].y, 'mc'
			@addToLibrary ropa
			ropas.addChild ropa
		@addToMain ropas
		@
	introEvaluation: ->
		super
		for i in [0..@game[@station].positions.length - 1] by 1
			@observer.subscribe 'init_kid_evaluation', @library["r#{i}"].onInitEvaluation
		for kid in @game[@station].kids
			@blink @library[kid[0]]
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library.bg, 1, {alpha: 0, y: @library.bg.y + 40, delay: 1}
		TweenLite.from @library.kids, 1, {alpha: 0, y: @library.kids.y + 40, delay: 1}
		TweenLite.from @library.ropas, 1, {alpha: 0, y: @library.ropas.y + 40, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for kid in @game[@station].kids
			@library[kid[0]].addEventListener 'click', @selectKid
	selectKid: (e) =>
		@selected = e.target
		@blink @selected, off
		
		for kid in @game[@station].kids
			@library[kid[0]].removeEventListener 'click', @selectKid
		
		for i in [0..@game[@station].positions.length - 1] by 1
			@library["r#{i}"].addEventListener 'drop', @evaluateAnswer
		@intento = 0

		createjs.Sound.play "s#{@selected.name}"
		@library["repeat#{@selected.name}"].visible = on
		@library["repeat#{@selected.name}"].addEventListener 'click', @repeatSound
		@observer.notify 'init_kid_evaluation'
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @selected.globalToLocal @stage.mouseX, @stage.mouseY
		if @selected.hitTest pt.x, pt.y
			drops = @game[@station].drops[@selected.index]
			if drops[@answer.index]
				if @intento is 0
					@library.score.plusOne()
				@library[drops[@answer.index]].visible = on
				@answer.visible = off
				@finishEvaluation()
				@intento = 0
				createjs.Sound.play 'good'

			else
				@intento = 1
				@answer.returnToPlace()
				@warning()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		for asset in @game[@station].kids[@selected.index]
			if @library[asset].visible is off
				return
		@library["repeat#{@selected.name}"].removeEventListener 'click', @repeatSound
		TweenLite.to @library["repeat#{@selected.name}"], 1, {y: @library["repeat#{@selected.name}"] + 100, alpha: 0, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @game[@station].kids.length
			for kid in @game[@station].kids
				@library[kid[0]].addEventListener 'click', @selectKid
		else
			@finish()
	blink: (obj, state=on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	repeatSound: =>
		createjs.Sound.stop()
		createjs.Sound.play "s#{@selected.name}"
	finish: ->
		TweenLite.to @library.bg, 1, {alpha: 0, y: @library.bg.y + 40}
		TweenLite.to @library.kids, 1, {alpha: 0, y: @library.kids.y + 40}
		super
	window.U5A4 = U5A4