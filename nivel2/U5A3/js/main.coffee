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
			{id: 'imageApril', x:'592', y:'175'}
			{id: 'imageAugust', x:'495', y:'522'}
			{id: 'imageChristmas', x:'715', y:'520'}
			{id: 'imageDecember', x:'99', y:'298'}
			{id: 'imageEaster', x:'603', y:'431'}
			{id: 'imageFall', x:'91', y:'202'}
			{id: 'imageFebruary', x:'328', y:'184'}
			{id: 'imageJanuary', x:'190', y:'172'}
			{id: 'imageJuly', x:'617', y:'529'}
			{id: 'imageJune', x:'724', y:'402'}
			{id: 'imageMarch', x:'459', y:'171'}
			{id: 'imageMay', x:'719', y:'290'}
			{id: 'imageNovember', x:'107', y:'405'}
			{id: 'imageOctober', x:'236', y:'515'}
			{id: 'imageSeptember', x:'359', y:'529'}
			{id: 'imageSpring', x:'637', y:'284'}
			{id: 'imageSummer', x:'137', y:'493'}
			{id: 'imageThanksgiving', x:'276', y:'437'}
			{id: 'imageValentine', x:'205', y:'251'}
			{id: 'imageWinter', x:'304', y:'184'}
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
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
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
		TweenLite.from @library['seasons'], 0.5, {alpha: 0, y: @library['seasons'].y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
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
				letra = new DraggableText "t#{i}", @scrambled[i - 1], @scrambled[i - 1], i * 30, 0
				letra.text.font = '20px Arial'
				letra.addEventListener 'drop', @evaluateAnswer
				letra.onInitEvaluation()
				@addToLibrary letra
				letras.addChild letra
			if col[i - 1] isnt ' '
				wc = new WordContainer "l#{i}", '', '#FFF','#f39234', i * 40, 50, 32, 22
				wc.index = col[i - 1]
				@addToLibrary wc
				palabra.addChild wc
		palabra.name = 'palabra'
		palabra.y = 300
		palabra.x = stageSize.w / 2 - @scrambled.length * 40 / 2 - 50
		@addToMain palabra
		letras.name = 'letras'
		letras.y = 300
		letras.x = stageSize.w / 2 - @scrambled.length * 30 / 2 - 30
		@addToMain letras
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = off
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				pt = @library["l#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
				if @library["l#{i}"].hitTest pt.x, pt.y
					if @answer.index is @library["l#{i}"].index
						@answer.visible = off
						@library["l#{i}"].changeText @library["l#{i}"].index
						dropped = on
					else
						@warning()
		if not dropped then @answer.returnToPlace() else @finishEvaluation()
	finishEvaluation: =>
		for i in [1..@scrambled.length]
			if @library["l#{i}"]
				if @library["l#{i}"].text.text is ''
					return
		createjs.Sound.play 'good'
		TweenLite.to @library[@answers[@index].img], 1, {alpha: 0, y: @library[@answers[@index].img].y - 20, ease: Back.easeOut}
		TweenLite.to @library['letras'], 1, {alpha: 0, y: @library['letras'].y - 20, ease: Back.easeOut}
		TweenLite.to @library['palabra'], 1, {alpha: 0, y: @library['palabra'].y - 20, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['score'].updateCount @index
			@setQuestion @index
		else
			@finish()
	finish: ->
		super
	window.U5A3 = U5A3