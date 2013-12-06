class U2A4 extends Oda
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
		@game = 
			imagenes: [
				{id: 'imageBacon', x:'118', y:'415', txt:'Bacon'}
				{id: 'imageButter', x:'95', y:'334', txt:'Butter'}
				{id: 'imageCheese', x:'176', y:'524', txt:'Cheese'}
				{id: 'imageCream',  x:'569', y:'165', txt:'Cream'}
				{id: 'imageHoney',  x:'717', y:'282', txt:'Honey'}
				{id: 'imageLeather',  x:'684', y:'520', txt:'Leather'}
				{id: 'imageMushrooms',  x:'323', y:'177', txt:'Mushrooms'}
				{id: 'imagePeanutbutter',  x:'540', y:'498', txt:'Peanutbutter'}
				{id: 'imagePumpkins',  x:'168', y:'165', txt:'Pumpkins'}
				{id: 'imageSugar',  x:'149', y:'266', txt:'Sugar'}
				{id: 'imageTomatoes', x:'460', y:'165', txt:'Tomatoes'}
				{id: 'imageTurbines', x:'679', y:'163', txt:'Turbines'}
				{id: 'imageWax',  x:'402', y:'520', txt:'Wax'}
				{id: 'imageYarn',  x:'701', y:'422', txt:'Yarn'}
				{id: 'imageYogurt',  x:'279', y:'481', txt:'Yogurt'}
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
		@insertInstructions 'instructions', 'Unscramble the seasons, months of the year and holidays.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 15, 0
		@setSeasons().introEvaluation()
	setSeasons: ->
		seasons = new createjs.Container()
		@imagenes = @game.imagenes
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
		@answers = @shuffle @imagenes
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
		TweenLite.to @library[@imagenes[@index].id], 1, {alpha: 0, y: @library[@imagenes[@index].id].y - 20, ease: Back.easeOut}
		TweenLite.to @library.letras, 1, {alpha: 0, y: @library['letras'].y - 20, ease: Back.easeOut}
		TweenLite.to @library.palabra, 1, {alpha: 0, y: @library['palabra'].y - 20, ease: Back.easeOut}
		@index++
		if @index < @answers.length
			@setQuestion @index
		else
			@finish()
	finish: ->
		super
	window.U2A4 = U2A4