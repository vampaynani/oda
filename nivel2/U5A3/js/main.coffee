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
 			{id: 'imageApril', src:'image_april.png'}
			{id: 'imageAugust', src:'image_august.png'}
			{id: 'imageChristmas', src:'image_christmas.png'}
			{id: 'imageDecember', src:'image_december.png'}
			{id: 'imageEaster', src:'image_easter.png'}
			{id: 'imageFall', src:'image_fall.png'}
			{id: 'imageFebruary', src:'image_february.png'}
			{id: 'imageJanuary', src:'image_january.png'}
			{id: 'imageJuly', src:'image_july.png'}
			{id: 'imageJune', src:'image_june.png'}
			{id: 'imageMarch', src:'image_march.png'}
			{id: 'imageMay', src:'image_may.png'}
			{id: 'imageNovember', src:'image_november.png'}
			{id: 'imageOctober', src:'image_october.png'}
			{id: 'imageSeptember', src:'image_september.png'}
			{id: 'imageSpring', src:'image_spring.png'}
			{id: 'imageSummer', src:'image_summer.png'}
			{id: 'imageThanksgiving', src:'image_thanksgiving.png'}
			{id: 'imageValentine', src:'image_valentine.png'}
			{id: 'imageWinter', src:'image_winter.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U5_A3_instructions.mp3', id:'instructions'}
		]
		@imagenes = [
			{id: 'imageApril', x:1184, y:350}
			{id: 'imageAugust', x:990, y:1044}
			{id: 'imageChristmas', x:1430, y:1040}
			{id: 'imageDecember', x:198, y:596}
			{id: 'imageEaster', x:1206, y:862}
			{id: 'imageFall', x:182, y:404}
			{id: 'imageFebruary', x:656, y:368}
			{id: 'imageJanuary', x:380, y:344}
			{id: 'imageJuly', x:1234, y:1058}
			{id: 'imageJune', x:1448, y:804}
			{id: 'imageMarch', x:918, y:342}
			{id: 'imageMay', x:1438, y:580}
			{id: 'imageNovember', x:214, y:810}
			{id: 'imageOctober', x:472, y:1030}
			{id: 'imageSeptember', x:718, y:1058}
			{id: 'imageSpring', x:1274, y:568}
			{id: 'imageSummer', x:274, y:586}
			{id: 'imageThanksgiving', x:552, y:874}
			{id: 'imageValentine', x:410, y:502}
			{id: 'imageWinter', x:608, y:368}
		]
		@answers = [
			{txt:'January',img:'imageJanuary'}
			{txt:'February',img:'imageFebruary'}
			{txt:'March',img:'imageMarch'}
			{txt:'April',img:'imageApril'}
			{txt:'May',img:'imageMay'}
			{txt:'June',img:'imageJune'}
			{txt:'July',img:'imageJuly'}
			{txt:'August',img:'imageAugust'}
			{txt:'September',img:'imageSeptember'}
			{txt:'October',img:'imageOctober'}
			{txt:'November',img:'imageNovember'}
			{txt:'December',img:'imageDecember'}
			{txt:'Spring',img:'imageSpring'}
			{txt:'Summer',img:'imageSummer'}
			{txt:'Fall',img:'imageFall'}
			{txt:'Winter',img:'imageWinter'}
			{txt:'Easter',img:'imageEaster'}
			{txt:"Valentine's Day",img:'imageValentine'}
			{txt:'Christmas',img:'imageChristmas'}
			{txt:'Thanksgiving',img:'imageThanksgiving'}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@success = 1
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Unscramble the seasons, months of the year and holidays.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 20, 0
		@setSeasons().introEvaluation()
	setSeasons: ->
		seasons = new createjs.Container()
		seasons.name = 'seasons'
		for i in [0..19]
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
		TweenLite.from @library['seasons'], 0.5, {alpha: 0, y: @library['seasons'].y + 40, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@answers = @shuffle @answers
		@setQuestion @index
	setQuestion: (question) ->
		letras = new createjs.Container()
		palabra = new createjs.Container()
		col = @answers[@index].txt.split ''
		@scrambled = @shuffle col
		for i in [1..@scrambled.length]
			if @scrambled[i - 1] isnt ' '
				letra = new DraggableText "t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 60, 0
				letra.text.font = '40px Quicksand'
				letra.createHitArea(56,60)
				letra.addEventListener 'drop', @evaluateAnswer
				letra.onInitEvaluation()
				@addToLibrary letra
				letras.addChild letra
			if col[i - 1] isnt ' '
				wc = new WordContainer "l#{i}", '', 'rgba(238,238,238,0.3)','#f39234', i * 84, 100, 80, 60
				wc.index = col[i - 1]
				wc.hitter = null
				wc.addEventListener 'mousedown', (e) ->
					e.addEventListener 'mousemove', (ev) ->
						wc = e.target
						if wc.hitter
							wc.changeText ''
							wc.hitter.visible = on
							wc.hitter.returnToPlace()
				@addToLibrary wc
				palabra.addChild wc
		palabra.name = 'palabra'
		palabra.y = 600
		palabra.x = stageSize.w / 2 - @scrambled.length * 84 / 2 - 100
		@addToMain palabra
		letras.name = 'letras'
		letras.y = 600
		letras.x = stageSize.w / 2 - @scrambled.length * 60 / 2 - 60
		@addToMain letras
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = off
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				pt = @library["l#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
				if @library["l#{i}"].hitTest pt.x, pt.y
					#if @answer.index is @library["l#{i}"].index
					if @library["l#{i}"].text.text is ''
						@answer.visible = off
						@library["l#{i}"].hitter = @answer
						@library["l#{i}"].changeText @answer.index#@library["l#{i}"].index
						dropped = on
					
		if not dropped then @answer.returnToPlace() else @finishEvaluation()
	finishEvaluation: =>
		col = @answers[@index].txt.split ''
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				if @library["l#{i}"].text.text is ''
					return
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				if @library["l#{i}"].text.text isnt col[i-1]
					@success = 0
		if @success is 1
			createjs.Sound.play 'good'
			@library.score.plusOne()
		else
			createjs.Sound.play 'wrong'
			@success = 1
			for i in [1..@scrambled.length]
				@library["l#{i}"].text.text = col[i-1]
		setTimeout @nextEvaluation, 2 * 1000


	nextEvaluation: =>
		TweenLite.to @library[@answers[@index].img], 1, {alpha: 0, y: @library[@answers[@index].img].y - 40, ease: Back.easeOut}
		TweenLite.to @library.letras, 1, {alpha: 0, y: @library['letras'].y - 40, ease: Back.easeOut}
		TweenLite.to @library.palabra, 1, {alpha: 0, y: @library['palabra'].y - 40, ease: Back.easeOut}
		@index++
		if @index < @answers.length
			@setQuestion @index
		else
			@finish()
	finish: ->
		super
	window.U5A3 = U5A3