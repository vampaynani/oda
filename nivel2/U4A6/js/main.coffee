class U4A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id: 'applepieicecream', src:'applepie-icecream.png'}
			{id: 'camel', src:'camel.png'}
			{id: 'chart', src:'chart.png'}
			{id: 'cherries', src:'cherries.png'}
			{id: 'chickenRice', src:'chickenRice.png'}
			{id: 'childrensDrawing', src:'childrensDrawing.png'}
			{id: 'childrenSport', src:'childrenSport.png'}
			{id: 'closet', src:'closet.png'}
			{id: 'desk', src:'desk.png'}
			{id: 'dogEmptyBowl', src:'dogEmptyBowl.png'}
			{id: 'fireTruck', src:'fireTruck.png'}
			{id: 'fish', src:'fish.png'}
			{id: 'frogelephant', src:'frog-elephant.png'}
			{id: 'girlPlayingFlute', src:'girlPlayingFlute.png'}
			{id: 'girlPlayingGuitar', src:'girlPlayingGuitar.png'}
			{id: 'girlWashing', src:'girlWashing.png'}
			{id: 'hamRice', src:'hamRice.png'}
			{id: 'houseAttic', src:'houseAttic.png'}
			{id: 'likePancakes', src:'likePancakes.png'}
			{id: 'lion', src:'lion.png'}
			{id: 'lista', src:'lista.txt'}
			{id: 'lizard', src:'lizard.png'}
			{id: 'monkeys', src:'monkeys.png'}
			{id: 'parrot', src:'parrot.png'}
			{id: 'polarBear', src:'polarBear.png'}
			{id: 'polarBearSwim', src:'polarBearSwim.png'}
			{id: 'rhino', src:'rhino.png'}
			{id: 'sixthirty', src:'six-thirty.png'}
			{id: 'snake', src:'snake.png'}
			{id: 'studentsReading', src:'studentsReading.png'}
			{id: 'toastMilkJuice', src:'toastMilkJuice.png'}
			{id: 'turtle', src:'turtle.png'}
			{id: 'zebras', src:'zebras.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [	
		]
		@preguntas = [
			{tipo:'texto', imagen:'toastMilkJuice', pregunta:"What's for breakfast?", opcionUno:'Cereal. milk and juice', opcionDos:'Toast, milk and juice', respuesta:"opcionDos"}
			{tipo:'texto', imagen:'zebras', pregunta:'Do zebras live in the grasslands?', opcionUno:'Yes, they do.', opcionDos:"No, they don't.", respuesta:"opcionUno"}
			{tipo:'imagen', pregunta:'It has fins and scales. What is it?', opcionUno:'fish', opcionDos:'parrot', respuesta:"opcionUno"}
			{tipo:'imagen', pregunta:'This animal is endangered', opcionUno:'rhino', opcionDos:'snake', respuesta:"opcionUno"}
			{tipo:'texto', imagen:'closet', pregunta:'Where is the broom?', opcionUno:"It's in the drawer", opcionDos:"It's in the closet", respuesta:"opcionDos"}
			{tipo:'texto', imagen:'girlWashing', pregunta:"What's she doing?", opcionUno:"She's setting the table", opcionDos:"She's washing the dishes", respuesta:"opcionDos"}
			{tipo:'texto', imagen:'turtle', pregunta:"Do turtles have a tail?", opcionUno:"Yes, they do", opcionDos:"No, they don't", respuesta:"opcionUno"}
			{tipo:'texto', imagen:'girlPlayingFlute', pregunta:"What's she playing?", opcionUno:"A trumpet", opcionDos:"A flute", respuesta:"opcionDos"}
			{tipo:'texto', imagen:'lion', pregunta:"What does lion eat?", opcionUno:"Plants", opcionDos:"Meat", respuesta:"opcionDos"}
			{tipo:'texto', imagen:"polarBearSwim", pregunta:"Can polar bears swim?", opcionUno:"Yes, they can", opcionDos:"No, they can't", respuesta:"opcionUno"}
			{tipo:'texto', imagen:"chart", pregunta:"We work on computers on Wednesday", opcionUno:"True", opcionDos:"False", respuesta:"opcionDos"}
			{tipo:'imagen', pregunta:"I like ham, rice and brocoli", opcionUno:'hamRice', opcionDos:'chickenRice', respuesta:"opcionUno"}
			{tipo:'texto', imagen:"desk", pregunta:"Where is it?", opcionUno:"It's behind the desk.", opcionDos:"It's under the desk.", respuesta:"opcionDos"}
			{tipo:'texto', imagen:'childrensDrawing', pregunta:"What are they doing?", opcionUno:"They're drawing.", opcionDos:"They're painting.", respuesta:"opcionUno"}
			{tipo:'texto', imagen:"applepieicecream", pregunta:"What's for dessert?", opcionUno:"Cake and ice cream.", opcionDos:"Apple pie and ice cream.", respuesta:"opcionDos"}
			{tipo:'texto', imagen:"sixthirty", pregunta:"What time does she wake up?", opcionUno:"Six Thirty.", opcionDos:"Seven Thirty.", respuesta:"opcionUno"}
			{tipo:'texto', imagen:"dogEmptyBowl", pregunta:"", opcionUno:"Feed the dogs.", opcionDos:"Take out the dog.", respuesta:"opcionUno"}
			{tipo:'texto', imagen:"houseAttic", pregunta:"", opcionUno:"There's an attic.", opcionDos:"There isn't an attic.", respuesta:"opcionUno"}
			{tipo:'texto', imagen:"fireTruck", pregunta:"Where's the fire truck?", opcionUno:"It's under the garage", opcionDos:"It's in the garage", respuesta:"opcionDos"}
			{tipo:'texto', imagen:"girlPlayingGuitar", pregunta:"Is she playing the Violin?", opcionUno:"Yes, she is", opcionDos:"No, she isn't", respuesta:"opcionDos"}
			{tipo:'texto', imagen:"likePancakes", pregunta:"Do they like pancakes", opcionUno:"Yes, they do.", opcionDos:"No, they don't", respuesta:"opcionUno"}
			{tipo:"texto", imagen:"polarBear", pregunta:"Where do the polar bears live?", opcionUno:"In the forest", opcionDos:"On the ice", respuesta:"opcionDos"}
			{tipo:'texto', imagen:"monkeys", pregunta:"Do monkeys have fins?", opcionUno:"Yes, they do", opcionDos:"No, they don't", respuesta:"opcionDos"}
			{tipo:'imagen', pregunta:"It lives in the desert. It can carry water in it's humps", opcionUno:"camel", opcionDos:"lizard", respuesta:"opcionUno"}
			{tipo:'imagen', pregunta:"It has fins and scales. What is it?", opcionUno:"fish", opcionDos:"parrot", respuesta:"opcionUno"}
			{tipo:"texto", pregunta:"We excercise in the", opcionUno:"auditorium", opcionDos:"gym", respuesta:"opcionDos"}
			{tipo:"texto", pregunta:"cherries", pregunta:"", opcionUno:"These are strawberries", opcionDos:"These are cherries", respuesta:"opcionDos"}


			{tipo:'texto', imagen:"frogelephant", pregunta:"It can't jump", opcionUno:"Frog", opcionDos:"Elephant", respuesta:'opcionDos' }
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0

		@setQuestion(0).setClick(0).introEvaluation()

	setQuestion: (i) ->
		question = new createjs.Container()
		question.x = 0
		question.y = 0	
		
		if @preguntas[i].tipo == 'texto'
			v = @createBitmap @preguntas[i].imagen, @preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2+30, 'mc'
			v.scaleX = v.scaleY = 0.5
			question.addChild v
			@addToLibrary v

			text = new createjs.Text @preguntas[i].pregunta,'24px Arial','#333'
			text.name = 'titulo'
			text.x = stageSize.w / 2
			text.y = 140
			text.textAlign = 'center'
			question.addChild text
			@addToLibrary text

			opciones = new createjs.Container()

			uno = new ClickableText @preguntas[i].opcionUno, @preguntas[i].opcionUno, i, 0, 0
			opciones.addChild uno
			@addToLibrary uno 

			diagonal = new createjs.Text ' / ','24px Arial','#333'
			diagonal.name = 'diagonal'
			diagonal.x = uno.x + uno.width
			diagonal.y = 0
			opciones.addChild diagonal
			@addToLibrary diagonal

			dos = new ClickableText @preguntas[i].opcionDos, @preguntas[i].opcionDos, i,  diagonal.x + 24, 0
			opciones.addChild dos
			@addToLibrary dos

			total = uno.width + dos.width + 20

			opciones.x = stageSize.w / 2 - total / 2;
			opciones.y = 490;
			question.addChild opciones
		else if @preguntas[i].tipo = 'imagen'
			text = new createjs.Text @preguntas[i].pregunta,'24px Arial','#333'
			text.name = 'titulo'
			text.x = 200
			text.y = 140
			question.addChild text
			@addToLibrary text

			v = @createBitmap @preguntas[i].opcionUno, @preguntas[i].opcionUno, stageSize.w / 4, stageSize.h / 2+30, 'mc'
			v.scaleX = v.scaleY = 0.3
			question.addChild v
			@addToLibrary v
			v = @createBitmap @preguntas[i].opcionDos, @preguntas[i].opcionDos, (stageSize.w / 4)*3, stageSize.h / 2+30, 'mc'
			v.scaleX = v.scaleY = 0.3
			question.addChild v
			@addToLibrary v

		@addToMain question
		@
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
	setClick: (i) =>

		if @preguntas[i].tipo = 'texto'
			@library[@preguntas[i].opcionUno].index = 'opcionUno'
			@library[@preguntas[i].opcionDos].index = 'opcionDos'
			@library[@preguntas[i].opcionUno].addEventListener 'click', @evaluateAnswer
			@library[@preguntas[i].opcionDos].addEventListener 'click', @evaluateAnswer
		else if @preguntas[i].tipo = 'imagen'
			@library[@preguntas[i].opcionUno] is @preguntas.index
			@library[@preguntas[i].opcionDos] is @preguntas.index
			@library[@preguntas[i].opcionUno].addEventListener 'click', evaluateAnswer
			@library[preguntas[i].opcionDos].addEventListener 'click', evaluateAnswer
		@
	evaluateAnswer: (e) =>
		@answer = e.target
		if @answer.index is @preguntas[@index].respuesta
			createjs.Sound.play 'good'
			@library['score'].plusOne()

			if @preguntas[@index].tipo = 'texto'			
				TweenLite.to @library[@preguntas[@index].opcionUno], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}			
				TweenLite.to @library[@preguntas[@index].opcionDos], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}			
				TweenLite.to @library['titulo'], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}
				TweenLite.to @library['diagonal'], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}				
				TweenLite.to @library[@preguntas[@index].imagen], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}			
			else if @preguntas[@index].tipo = 'imagen'
				TweenLite.to @library[@preguntas[@index].opcionDos], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}
				TweenLite.to @library[@preguntas[@index].opcionUno], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}
		else
			@warning()

	finishEvaluation: =>
	nextEvaluation: =>
		@index++		
		@setQuestion(@index)
		@library['score'].updateCount( @index )
		if @preguntas[@index].tipo = 'texto'
			@library[@preguntas[@index].opcionUno].index = 'opcionUno'
			@library[@preguntas[@index].opcionDos].index = 'opcionDos'
			@library[@preguntas[@index].opcionUno].addEventListener 'click', @evaluateAnswer
			@library[@preguntas[@index].opcionDos].addEventListener 'click', @evaluateAnswer
		else if @preguntas[@index].tipo = 'imagen'
			@library[@preguntas[@index].opcionUno] is @preguntas.index
			@library[@preguntas[@index].opcionDos] is @preguntas.index
			@library[@preguntas[@index].opcionUno].addEventListener 'click', evaluateAnswer
			@library[preguntas[@index].opcionDos].addEventListener 'click', evaluateAnswer
	repeatSound: =>
		createjs.Sound.play @answers[@index].sound
	finish: ->
		super
		for i in [1..6] by 1
			@library['name'+i].blink on
	window.U4A6 = U4A6