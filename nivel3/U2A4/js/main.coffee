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
			{id: 'imageBacon', src:'image_bacon.png'}
			{id: 'imageButter', src:'image_butter.png'}
			{id: 'imageCheese', src:'image_cheese.png'}
			{id: 'imageCream', src:'image_cream.png'}
			{id: 'imageHoney', src:'image_honey.png'}
			{id: 'imageLeather', src:'image_leather.png'}
			{id: 'imageMushrooms', src:'image_mushrooms.png'}
			{id: 'imagePeanutbutter', src:'image_peanutbutter.png'}
			{id: 'imagePumpkins', src:'image_pumpkins.png'}
			{id: 'imageSugar', src:'image_sugar.png'}
			{id: 'imageTomatoes', src:'image_tomatoes.png'}
			{id: 'imageTurbines', src:'image_turbines.png'}
			{id: 'imageWax', src:'image_wax.png'}
			{id: 'imageYarn', src:'image_yarn.png'}
			{id: 'imageYogurt', src:'image_yogurt.png'}

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU2_U5_A3_instructions.mp3', id:'instructions'}
		]
		@imagenes = [
			{id: 'imageBacon', x:'118', y:'415'}
			{id: 'imageButter', x:'95', y:'334'}
			{id: 'imageCheese', x:'176', y:'524'}
			{id: 'imageCream',  x:'569', y:'165'}
			{id: 'imageHoney',  x:'717', y:'282'}
			{id: 'imageLeather',  x:'684', y:'520'}
			{id: 'imageMushrooms',  x:'323', y:'177'}
			{id: 'imagePeanutbutter',  x:'540', y:'498'}
			{id: 'imagePumpkins',  x:'168', y:'165'}
			{id: 'imageSugar',  x:'149', y:'266'}
			{id: 'imageTomatoes', x:'460', y:'165'}
			{id: 'imageTurbines', x:'679', y:'163'}
			{id: 'imageWax',  x:'402', y:'520'}
			{id: 'imageYarn',  x:'701', y:'422'}
			{id: 'imageYogurt',  x:'279', y:'481'}
		]
		@answers = [
			{txt:'Bacon',img:'imageBacon'}
			{txt:'Butter',img:'imageButter'}
			{txt:'Cheese',img:'imageCheese'}
			{txt:'Cream',img:'imageCream'}
			{txt:'Honey',img:'imageHoney'}
			{txt:'Leather',img:'imageLeather'}
			{txt:'Mushrooms',img:'imageMushrooms'}
			{txt:'Peanutbutter',img:'imagePeanutbutter'}
			{txt:'Pumpkins',img:'imagePumpkins'}
			{txt:'Sugar',img:'imageSugar'}
			{txt:'Tomatoes',img:'imageTomatoes'}
			{txt:'Turbines',img:'imageTurbines'}
			{txt:'Wax',img:'imageWax'}
			{txt:'Yarn',img:'imageYarn'}
			{txt:'Yogurt',img:'imageYogurt'}
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
		for i in [0..@imagenes.length-1]
			img = @createBitmap @imagenes[i].id, @imagenes[i].id, @imagenes[i].x, @imagenes[i].y, 'mc'
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