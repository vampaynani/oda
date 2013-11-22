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
					{id: 'summerJenifferdressclothdrag', x:'733', y:'460'}
					{id: 'summerJenifferhatclothdrag', x:'146', y:'432'}
					{id: 'summerJeniffersandalsclothdrag', x:'717', y:'405'}
					{id: 'summerJeniffersunglassesclothdrag', x:'247', y:'432'}
					{id: 'summerMIkecapclothdrag', x:'632', y:'439'}
					{id: 'summerMIkeshirtclothdrag', x:'504', y:'450'}
					{id: 'summerMIkesunglassesclothdrag', x:'695', y:'555'}
					{id: 'summerMIkeswimsuitclothdrag', x:'615', y:'500'}
					{id: 'summerMIketennisclothdrag', x:'422', y:'518'}
					{id: 'summerRachelhatclothdrag', x:'348', y:'427'}
					{id: 'summerRachelsandalsclothdrag', x:'503', y:'544'}
					{id: 'summerRachelswimsuitclothdrag',x:'461', y:'441'}
					{id: 'summerTylercapclothdrag', x:'303', y:'490'}
					{id: 'summerTylersandalsclothdrag', x:'291', y:'535'}
					{id: 'summerTylerswimsuitclothdrag', x:'187', y:'516'}
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
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'bg', 'bg', 85, 300
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 16, 0
		@setKids('summer').setRopa().introEvaluation()
	setKids: (station) ->
		kids = new createjs.Container()
		kids.name = 'kids'
		kids.x = 160
		kids.y = 150
		@station = station
		current = @game[@station].kids
		for i in [0..3]	by 1
			boton = @createBitmap "repeat#{current[i][0]}", 'repeatbtn', i * 145, 200
			boton.visible = off
			@addToLibrary boton
			kids.addChild boton
		for i in [0..3] by 1
			for j in [0..current[i].length-1] by 1
				asset = @createBitmap current[i][j], current[i][j], i * 160 + 20, 85, 'mc'
				asset.scaleX = asset.scaleY = 0.45
				if j > 0 
					asset.visible = off
				else 
					hit = new createjs.Shape()
					hit.graphics.beginFill('#000').drawRect(-5, -3, asset.width + 20, asset.height + 10)
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
		TweenLite.from @library.bg, 1, {alpha: 0, y: @library.bg.y + 20, delay: 1}
		TweenLite.from @library.kids, 1, {alpha: 0, y: @library.kids.y + 20, delay: 1}
		TweenLite.from @library.ropas, 1, {alpha: 0, y: @library.ropas.y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
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
		TweenLite.to @library["repeat#{@selected.name}"], 1, {y: @library["repeat#{@selected.name}"] + 50, alpha: 0, onComplete: @nextEvaluation}
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
		TweenLite.to @library.bg, 1, {alpha: 0, y: @library.bg.y + 20}
		TweenLite.to @library.kids, 1, {alpha: 0, y: @library.kids.y + 20}
		super
	window.U5A4 = U5A4