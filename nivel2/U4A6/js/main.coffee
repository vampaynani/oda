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
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			preguntas: [
				{tipo:'texto', imagen:'toastMilkJuice', pregunta:"What's for breakfast?", opcionUno:'Cereal. milk and juice.', opcionDos:'Toast, milk and juice.', respuesta:"opcionDos"}
				{tipo:'texto', imagen:'zebras', pregunta:'Do zebras live in the grasslands?', opcionUno:'Yes, they do.', opcionDos:"No, they don't.", respuesta:"opcionUno"}
				{tipo:'imagen', pregunta:'It has fins and scales. What is it?', opcionUno:'fish', opcionDos:'parrot', respuesta:"opcionUno"}
				{tipo:'imagen', pregunta:'This animal is endangered', opcionUno:'rhino', opcionDos:'snake', respuesta:"opcionUno"}
				{tipo:'texto', imagen:'closet', pregunta:'Where is the broom?', opcionUno:"It's in the drawer.", opcionDos:"It's in the closet.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'girlWashing', pregunta:"What's she doing?", opcionUno:"She's setting the table.", opcionDos:"She's washing the dishes.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'turtle', pregunta:"Do turtles have a tail?", opcionUno:"Yes, they do.", opcionDos:"No, they don't.", respuesta:"opcionUno"}
				{tipo:'texto', imagen:'girlPlayingFlute', pregunta:"What's she playing?", opcionUno:"A trumpet.", opcionDos:"A flute.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'lion', pregunta:"What does lion eat?", opcionUno:"Plants.", opcionDos:"Meat.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:"polarBearSwim", pregunta:"Can polar bears swim?", opcionUno:"Yes, they can.", opcionDos:"No, they can't.", respuesta:"opcionUno"}
				{tipo:'texto', imagen:"chart", pregunta:"We work on computers on Wednesday", opcionUno:"True.", opcionDos:"False.", respuesta:"opcionDos"}
				{tipo:'imagen', pregunta:"I like ham, rice and brocoli", opcionUno:'hamRice', opcionDos:'chickenRice', respuesta:"opcionUno"}
				{tipo:'texto', imagen:"desk", pregunta:"Where is it?", opcionUno:"It's behind the desk.", opcionDos:"It's under the desk.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'childrensDrawing', pregunta:"What are they doing?", opcionUno:"They're drawing.", opcionDos:"They're painting.", respuesta:"opcionUno"}
				{tipo:'texto', imagen:"applepieicecream", pregunta:"What's for dessert?", opcionUno:"Cake and ice cream.", opcionDos:"Apple pie and ice cream.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:"sixthirty", pregunta:"What time does she wake up?", opcionUno:"Six Thirty.", opcionDos:"Seven Thirty.", respuesta:"opcionUno"}
				{tipo:'texto', imagen:"dogEmptyBowl", pregunta:"", opcionUno:"Feed the dogs.", opcionDos:"Take out the dog.", respuesta:"opcionUno"}
				{tipo:'texto', imagen:"houseAttic", pregunta:"", opcionUno:"There's an attic.", opcionDos:"There isn't an attic.", respuesta:"opcionUno"}
				{tipo:'texto', imagen:"fireTruck", pregunta:"Where's the fire truck?", opcionUno:"It's under the garage.", opcionDos:"It's in the garage.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:"girlPlayingGuitar", pregunta:"Is she playing the Violin?", opcionUno:"Yes, she is.", opcionDos:"No, she isn't.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:"likePancakes", pregunta:"Do they like pancakes", opcionUno:"Yes, they do.", opcionDos:"No, they don't.", respuesta:"opcionUno"}
				{tipo:"texto", imagen:"polarBear", pregunta:"Where do the polar bears live?", opcionUno:"In the forest.", opcionDos:"On the ice.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:"monkeys", pregunta:"Do monkeys have fins?", opcionUno:"Yes, they do.", opcionDos:"No, they don't.", respuesta:"opcionDos"}
				{tipo:'imagen', pregunta:"It lives in the desert. It can carry water in it's humps", opcionUno:"camel", opcionDos:"lizard", respuesta:"opcionUno"}
				{tipo:"texto", imagen:"childrenSport", pregunta:"We excercise in the", opcionUno:"Auditorium.", opcionDos:"Gym.", respuesta:"opcionDos"}
				{tipo:"texto", imagen:"cherries", pregunta:"cherries", pregunta:"", opcionUno:"These are strawberries.", opcionDos:"These are cherries.", respuesta:"opcionDos"}
				{tipo:'texto', imagen:"frogelephant", pregunta:"It can't jump", opcionUno:"Frog.", opcionDos:"Elephant.", respuesta:'opcionDos' }
			]
		super null, manifest, sounds
	setStage: ->
		super
		@preguntas = @shuffleNoRepeat @game.preguntas, 16
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Take the review quiz! Click on the correct option.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 16, 0
		@setQuestion(0).introEvaluation()
	setQuestion: (i) ->
		question = new createjs.Container()
		question.x = 0
		question.y = 0
		question.name = 'question'
		if @preguntas[i].tipo is 'texto'
			v = @createBitmap @preguntas[i].imagen, @preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2 + 60, 'mc'
			#v.scaleX = v.scaleY = 0.5
			question.addChild v
			@addToLibrary v

			text = new createjs.Text @preguntas[i].pregunta,'48px Quicksand','#333'
			text.name = 'titulo'
			text.x = stageSize.w / 2
			text.y = 280
			text.textAlign = 'center'
			question.addChild text
			@addToLibrary text

			opciones = new createjs.Container()

			uno = new ClickableText @preguntas[i].opcionUno, @preguntas[i].opcionUno, i, 0, 0
			opciones.addChild uno
			@addToLibrary uno 

			diagonal = new createjs.Text '/','32px Quicksand','#333'
			diagonal.name = 'diagonal'
			diagonal.x = uno.x + uno.width
			diagonal.y = 0
			opciones.addChild diagonal
			@addToLibrary diagonal

			dos = new ClickableText @preguntas[i].opcionDos, @preguntas[i].opcionDos, i,  diagonal.x + 20, 0
			opciones.addChild dos
			@addToLibrary dos

			total = uno.width + dos.width + 40

			opciones.x = stageSize.w / 2 - total / 2;
			opciones.y = 980;
			question.addChild opciones
		else if @preguntas[i].tipo is 'imagen'
			text = @createText 'titulo', @preguntas[i].pregunta,'48px Quicksand','#333', 800, 280, 'center'
			question.addChild text
			@addToLibrary text

			v = @createBitmap @preguntas[i].opcionUno, @preguntas[i].opcionUno, stageSize.w / 4, stageSize.h / 2 + 60, 'mc'
			v.scaleX = v.scaleY = 0.6
			question.addChild v
			@addToLibrary v
			v = @createBitmap @preguntas[i].opcionDos, @preguntas[i].opcionDos, (stageSize.w / 4)*3, stageSize.h / 2 + 60, 'mc'
			v.scaleX = v.scaleY = 0.6
			question.addChild v
			@addToLibrary v

		@addToMain question
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['question'], 1, {alpha:0, y: @library['question'].y - 40, delay: 1, onComplete:@playInstructions, onCompleteParams:[@]}
	initEvaluation: (e) =>
		super
		@setClick 0
	setClick: (i) =>
		@library[@preguntas[i].opcionUno].index = 'opcionUno'
		@library[@preguntas[i].opcionDos].index = 'opcionDos'
		@library[@preguntas[i].opcionUno].addEventListener 'click', @evaluateAnswer
		@library[@preguntas[i].opcionDos].addEventListener 'click', @evaluateAnswer
		@
	evaluateAnswer: (e) =>
		@answer = e.currentTarget
		if @answer.index is @preguntas[@index].respuesta
			createjs.Sound.play 'good'
			@library['score'].plusOne()
			@finishEvaluation()
		else
			@warning()
			@finishEvaluation()
	finishEvaluation: =>
		if @preguntas[@index].tipo is 'texto'			
			TweenLite.to @library[@preguntas[@index].opcionUno], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}			
			TweenLite.to @library[@preguntas[@index].opcionDos], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}			
			TweenLite.to @library['titulo'], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}
			TweenLite.to @library['diagonal'], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}				
			TweenLite.to @library[@preguntas[@index].imagen], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}			
		else if @preguntas[@index].tipo is 'imagen'
			TweenLite.to @library['titulo'], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}
			TweenLite.to @library[@preguntas[@index].opcionDos], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}
			TweenLite.to @library[@preguntas[@index].opcionUno], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut}
	nextEvaluation: =>
		@index++
		if @index < @preguntas.length
			@setQuestion(@index).setClick(@index)
		else
			@finish()
	finish: ->
		super
	window.U4A6 = U4A6