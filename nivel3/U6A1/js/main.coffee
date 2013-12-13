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
		    {src:'sounds/TU2_U5_A3_instructions.mp3', id:'instructions'}
		]
		@imagenes = [
			{txt: 'claw',  id: 'propclaw'}
			{txt: 'feather',  id: 'propfeather'}
			{txt: 'fin',  id: 'propfin'}
			{txt: 'hair',  id: 'prophair'}
			{txt: 'head',  id: 'prophead'}
			{txt: 'horn',  id: 'prophorn'}
			{txt: 'leg',  id: 'propleg'}
			{txt: 'neck',  id: 'propneck'}
			{txt: 'tail',  id: 'proptail'}
			{txt: 'teeth',  id: 'propteeth'}
			{txt: 'tusk',  id: 'proptusk'}
			{txt: 'wing',  id: 'propwing'}
		]
	
		super null, manifest, sounds
	setStage: ->
		super
		@success = 1
		@preguntas = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Unscramble the seasons, months of the year and holidays.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 20, 0
		@setSeasons().introEvaluation()
	setSeasons: ->
		seasons = new createjs.Container()
		seasons.name = 'seasons'
		for i in [0..11]
			img = @createBitmap @imagenes[i].id, @imagenes[i].id, @imagenes[i].x, @imagenes[i].y, 'mc'
			img.scaleX = img.scaleY = 0.5
			@addToLibrary img
			seasons.addChild img
		@addToMain seasons
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['seasons'], 0.5, {alpha: 0, y: @library['seasons'].y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@imagenes = @shuffle @imagenes
		@setQuestion @index + @preguntas
	setQuestion: (question) ->

		for h in [1..3]
			letras = new createjs.Container()
			palabra = new createjs.Container()
			col = @imagenes[h - 1].txt.split ''
			@scrambled = @shuffle col
			for i in [1..@scrambled.length]
				if @scrambled[i - 1] isnt ' '
					letra = new DraggableText "#{h}t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 30, 0
					letra.text.font = '20px Quicksand'
					letra.createHitArea(28,30)
					letra.addEventListener 'drop', @evaluateAnswer
					letra.onInitEvaluation()
					@addToLibrary letra
					letras.addChild letra
				if col[i - 1] isnt ' '
					wc = new WordContainer "#{h}l#{i}", '', 'rgba(238,238,238,0.3)','	#f39234', i * 42, 50, 40, 30
					wc.index = col[i - 1]
					@addToLibrary wc
					palabra.addChild wc
			palabra.name = "palabra#{h}"
			palabra.y = 100 * h
			palabra.x = stageSize.w / 2 - @scrambled.length * 42 / 2 - 50
			@addToMain palabra
			letras.name = "letras#{h}"
			letras.y = 100 * h
			letras.x = stageSize.w / 2 - @scrambled.length * 30 / 2 - 30
			@addToMain letras
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = off
		for h in [1..3]
			for i in [1..@scrambled.length]
				if @library["#{h}l#{i}"]
					pt = @library["#{h}l#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
					if @library["#{h}l#{i}"].hitTest pt.x, pt.y
						#if @answer.index is @library["l#{i}"].index
						if @library["#{h}l#{i}"].text.text is ''
							@answer.visible = off
							@library["#{h}l#{i}"].changeText @answer.index#@library["l#{i}"].index
							dropped = on
					
		if not dropped then @answer.returnToPlace() else @finishEvaluation()
	finishEvaluation: =>
		col = @imagenes[@index].txt.split ''
		for h in [1..3]
			for i in [1..@scrambled.length]
				if @library["#{h}l#{i}"]
					if @library["#{h}l#{i}"].text.text is ''
						return
			for i in [1..@scrambled.length]
				if @library["#{h}l#{i}"]
					if @library["#{h}l#{i}"].text.text isnt col[i-1]
						@success = 0
			if @success is 1
				createjs.Sound.play 'good'
				@library.score.plusOne()
			else
				createjs.Sound.play 'wrong'
				@success = 1
				console.log "#{h}l#{i}"
				for i in [1..@scrambled.length]
					@library["#{h}l#{i}"].text.text = col[i-1]
			console.log 'yuju'
			#setTimeout @nextEvaluation, 2 * 1000


	nextEvaluation: =>
		TweenLite.to @library[@imagenes[@index].img], 1, {alpha: 0, y: @library[@imagenes[@index].img].y - 20, ease: Back.easeOut}
		TweenLite.to @library.letras, 1, {alpha: 0, y: @library["letras#{h}"].y - 20, ease: Back.easeOut}
		TweenLite.to @library.palabra, 1, {alpha: 0, y: @library["palabra#{h}"].y - 20, ease: Back.easeOut}
		@index++
		if @index < @imagenes.length
			@setQuestion @index
		else
			@finish()
	finish: ->
		super
	window.U5A3 = U5A3