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
			{id:'image', src:'image.png'}
			{id:'imagebugbite', src:'image_bugbite.png'}
			{id:'imagechickenpox', src:'image_chickenpox.png'}
			{id:'imagecold', src:'image_cold.png'}
			{id:'imagecough', src:'image_cough.png'}
			{id:'imagecutmyfinger', src:'image_cutmyfinger.png'}
			{id:'imagecutmyknee', src:'image_cutmyknee.png'}
			{id:'imageearache', src:'image_earache.png'}
			{id:'imagefever', src:'image_fever.png'}
			{id:'imageheadache', src:'image_headache.png'}
			{id:'imagehiccups', src:'image_hiccups.png'}
			{id:'imagerunnynose', src:'image_runnynose.png'}
			{id:'imagesorethroat', src:'image_sorethroat.png'}
			{id:'imagestomachache', src:'image_stomachache.png'}
			{id:'imagesunburn', src:'image_sunburn.png'}
			{id:'imagetoothache', src:'image_toothache.png'}

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U5_A3_instructions.mp3', id:'instructions'}
		]
		@imagenes = [
			{id:'imagebugbite', x:'100', y:'100'}
			{id:'imagechickenpox', x:'100', y:'100'}
			{id:'imagecold', x:'100', y:'100'}
			{id:'imagecough', x:'100', y:'100'}
			{id:'imagecutmyfinger', x:'100', y:'100'}
			{id:'imagecutmyknee', x:'100', y:'100'}
			{id:'imageearache', x:'100', y:'100'}
			{id:'imagefever', x:'100', y:'100'}
			{id:'imageheadache', x:'100', y:'100'}
			{id:'imagehiccups', x:'100', y:'100'}
			{id:'imagerunnynose', x:'100', y:'100'}
			{id:'imagesorethroat', x:'100', y:'100'}
			{id:'imagestomachache', x:'100', y:'100'}
			{id:'imagesunburn', x:'100', y:'100'}
			{id:'imagetoothache', x:'100', y:'100'}
		]
		@answers = [
			{img:'imagetoothache', frase:'i have a' , txt:'toothache'}
			{img:'imagecutmyfinger', frase:'i' , txt:'cut my finger'}
			{img:'imagerunnynose', frase:'I have a' , txt:'runny nose'}
			{img:'imagecutmyknee', frase:'i' , txt:'cut my knee'}
			{img:'imagefever', frase:'i have a' , txt:'fever'}
			{img:'imagesorethroat', frase:'i have a' , txt:'sore throat'}
			{img:'imagebugbite', frase:'i have a' , txt:'bug bite'}
			{img:'imagestomachache', frase:'i have a' , txt:'stomach ache'}
			{img:'imageearache', frase:'i have a ' , txt:'earache'}
			{img:'imagecold', frase:'i have a' , txt:'cold'}
			{img:'imagehiccups', frase:'i have the' , txt:'hiccups'}
			{img:'imagechickenpox', frase:'i have' , txt:'chicken pox'}
			{img:'imagesunburn', frase:'i have a' , txt:'sunburn'}
			{img:'imageheadache', frase:'i have a' , txt:'headache'}
			{img:'imagecough', frase:'i have a' , txt:'cough'}

		]
		super null, manifest, sounds
	setStage: ->
		super
		@success = 1
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		x = @createBitmap 'image', 'image', stageSize.w / 2, 20, 'tc'
		x.scaleX = x.scaleY = 1.1
		@addToMain x
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 15, 500, 20, 0
		@setSeasons().introEvaluation()
	setSeasons: ->
		seasons = new createjs.Container()
		seasons.name = 'seasons'
		for i in [0..14]
			img = @createBitmap @imagenes[i].id, @imagenes[i].id, @imagenes[i].x, @imagenes[i].y, 'mc'
			#img.scaleX = img.scaleY = 0.5
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
				letra.text.font = '20px Quicksand'
				letra.createHitArea(28,30)
				letra.addEventListener 'drop', @evaluateAnswer
				letra.onInitEvaluation()
				@addToLibrary letra
				letras.addChild letra
			if col[i - 1] isnt ' '
				wc = new WordContainer "l#{i}", '', 'rgba(238,238,238,0.3)','#f39234', i * 35, 50, 30, 30
				wc.index = col[i - 1]
				@addToLibrary wc
				palabra.addChild wc
		q = @createText 'q', @answers[@index].frase,'24px Quicksand','#333', 42, 55
		q.x = 42 - q.getMeasuredWidth() - 20
		palabra.addChild  q
		p = @createText 'q', '.','24px Quicksand','#333', 42, 55
		p.x = @scrambled.length*35 + 38
		palabra.addChild  p

		palabra.name = 'palabra'
		palabra.y = 270
		palabra.x = stageSize.w / 2 - @scrambled.length * 35 / 2 - 50 + (q.getMeasuredWidth() + 20)/2
		@addToMain palabra
		letras.name = 'letras'
		letras.y = 370
		letras.x = stageSize.w / 2 - @scrambled.length * 30 / 2 - 30
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
		TweenLite.to @library[@answers[@index].img], 1, {alpha: 0, y: @library[@answers[@index].img].y - 20, ease: Back.easeOut}
		TweenLite.to @library.letras, 1, {alpha: 0, y: @library['letras'].y - 20, ease: Back.easeOut}
		TweenLite.to @library.palabra, 1, {alpha: 0, y: @library['palabra'].y - 20, ease: Back.easeOut}
		@index++
		if @index < @answers.length
			@setQuestion @index
		else
			@finish()
	finish: ->
		super
	window.U5A3 = U5A3