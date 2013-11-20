class U8A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'Asiangirl', src: 'Asian-girl.png'}
			{id: 'boyhair', src: 'boy-hair.png'}
			{id: 'brushtowelsoap', src: 'brush-towel-soap.png'}
			{id: 'brushinghisteeth', src: 'brushing-his-teeth.png'}
			{id: 'busfullpeople', src: 'bus-full-people.png'}
			{id: 'chef', src: 'chef.png'}
			{id: 'chopsticks', src: 'chopsticks.png'}
			{id: 'cloudyday', src: 'cloudy-day.png'}
			{id: 'familyChristmas', src: 'family-Christmas.png'}
			{id: 'fullmoon', src: 'full-moon.png'}
			{id: 'girlcanoeing', src: 'girl-canoeing.png'}
			{id: 'girlhair', src: 'girl-hair.png'}
			{id: 'hotday', src: 'hot-day.png'}
			{id: 'leaves', src: 'leaves.png'}
			{id: 'librarian', src: 'librarian.png'}
			{id: 'mapaSB', src: 'mapa-SB.png'}
			{id: 'motherchild', src: 'mother-child.png'}
			{id: 'necklace', src: 'necklace.png'}
			{id: 'USmoney', src: 'US-money.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U8_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			preguntas: [
				{tipo:'texto', imagen: 'Asiangirl', pregunta:"Where's she from?", opcionUno:'China.', opcionDos:'Japan.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'boyhair', pregunta:'Does he have curly hair?', opcionUno:'Yes, he does.', opcionDos:"No, he doesn't.", respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'brushtowelsoap', pregunta:'What are you packing?', opcionUno:'Soap, a toothbrush, a comb and a towel.', opcionDos:'Soap, a brush, toothpaste and a towel.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'brushinghisteeth', pregunta:"What's she doing?", opcionUno:"She's brushing her teeth.", opcionDos:"She's floshing her teeth.", respuesta:'opcionUno'}
				{tipo:'texto', imagen: 'busfullpeople', pregunta:'', opcionUno:"It's full.", opcionDos:"It's empty.", respuesta:'opcionUno'}
				{tipo:'texto', imagen: 'chef', pregunta:'She makes food.', opcionUno:'A waitress.', opcionDos:'A chef.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'chopsticks', pregunta:'What are these?', opcionUno:"They're chopsticks.", opcionDos:"They're fans.", respuesta:'opcionUno'}
				{tipo:'texto', imagen: 'cloudyday', pregunta:"What's the weather like?", opcionUno:"It's cloudy.", opcionDos:"It's snowy.", respuesta:'opcionUno'}
				{tipo:'texto', imagen: 'familyChristmas', pregunta:'They visit their friends and family.', opcionUno:'What do they visit on Christmas?', opcionDos:'Who do they visit on Christmas?', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'fullmoon', pregunta:'Where do they celebrate the Moon Festival?', opcionUno:'In India.', opcionDos:'In China.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'girlcanoeing', pregunta:'What are they doing?', opcionUno:"They're fishing.", opcionDos:"They're canoeing.", respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'girlhair', pregunta:'She has long blonde hair.', opcionUno:'True.', opcionDos:'False.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'hotday', pregunta:"What's the weather like?", opcionUno:"It's stormy.", opcionDos:"It's sunny.", respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'leaves', pregunta:'When do we play in the leaves?', opcionUno:'in the fall.', opcionDos:'In the winter.', respuesta:'opcionUno'}
				{tipo:'texto', imagen: 'librarian', pregunta:'Where does a librarian works?', opcionUno:'At a bookstore.', opcionDos:'At a library.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'mapaSB', pregunta:"Where's the internet café?", opcionUno:"Go straight. Turn right on Pine Street. It's next to the grocery store.", opcionDos:"Go straight. Turn left on Pine Street. It's across from the police station.", respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'mapaSB', pregunta:"Go straight. Turn right on Pine Street. It's across from the fire station.", opcionUno:"Where's the art museum?", opcionDos:"Where's the movie theater?", respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'motherchild', pregunta:"When do we celebrate Mother's Day?", opcionUno:'In June.', opcionDos:'In May.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'necklace', pregunta:'', opcionUno:"It's nineteen dollars and fifteen cents.", opcionDos:"It's nineteen dollars and fifty cents.", respuesta:"opcionDos"}
				{tipo:'texto', imagen: 'USmoney', pregunta:'Three dollars and twenty-five cents.', opcionUno:'$25.30', opcionDos:'$3.25', respuesta:'opcionDos'}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@preguntas = @shuffleNoRepeat @game.preguntas, 11
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 11, 0
		@setQuestion(0).introEvaluation()
	setQuestion: (i) ->
		question = new createjs.Container()
		question.x = 0
		question.y = 0
		question.name = 'question'
		if @preguntas[i].tipo is 'texto'
			v = @createBitmap @preguntas[i].imagen, @preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2+30, 'mc'
			v.scaleX = v.scaleY = 0.5
			question.addChild v
			@addToLibrary v

			text = new createjs.Text @preguntas[i].pregunta,'24px Quicksand','#333'
			text.name = 'titulo'
			text.x = stageSize.w / 2
			text.y = 140
			text.textAlign = 'center'
			text.lineWidth = 400
			question.addChild text
			@addToLibrary text

			opciones = new createjs.Container()
			uno = new ClickableText @preguntas[i].opcionUno, @preguntas[i].opcionUno, i, 0, 0
			uno.text.textAlign = 'center'
			uno.setLineWidth 300
			uno.x = stageSize.w / 2 - uno.width / 2 - 10
			opciones.addChild uno
			@addToLibrary uno 

			diagonal = new createjs.Text '/','16px Quicksand','#333'
			diagonal.name = 'diagonal'
			diagonal.textAlign = 'center'
			diagonal.x = stageSize.w / 2
			diagonal.y = 0
			opciones.addChild diagonal
			@addToLibrary diagonal

			dos = new ClickableText @preguntas[i].opcionDos, @preguntas[i].opcionDos, i, 0, 0
			dos.text.textAlign = 'center'
			dos.setLineWidth 300
			dos.x = stageSize.w / 2 + dos.width / 2 + 10
			opciones.addChild dos
			@addToLibrary dos

			total = uno.width + dos.width + 20

			#opciones.x = stageSize.w / 2 - total / 2;
			opciones.y = 490;
			question.addChild opciones
		
		@addToMain question
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['question'], 1, {alpha:0, y: @library['question'].y - 20, delay: 1, onComplete:@playInstructions, onCompleteParams:[@]}
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
		@answer = e.target
		if @answer.index is @preguntas[@index].respuesta
			createjs.Sound.play 'good'
			@library['score'].plusOne()
			@finishEvaluation()
		else
			@warning()
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
	window.U8A6 = U8A6