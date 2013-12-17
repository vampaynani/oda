class U6A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			
 			{id:'image1', src:'image_1.png'}
			{id:'image2', src:'image_2.png'}
			{id:'image3', src:'image_3.png'}
			{id:'image4', src:'image_4.png'}
			{id:'image5', src:'image_5.png'}
			{id:'image7', src:'image_7.png'}
			{id:'image9', src:'image_9.png'}
		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU3_U6_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			preguntas: [
				{tipo:'texto', imagen:'image9', pregunta:"Did the glyptodont fly?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'image9', pregunta:"Did the glyptodont live in swamps?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionUno"}
				{tipo:'texto', imagen:'image4', pregunta:"Did T-rex have sharp teeth?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionUno"}
				{tipo:'texto', imagen:'image7', pregunta:"Did the sand turtle crawl on four legs?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionUno"}
				{tipo:'texto', imagen:'image7', pregunta:"Did the sand turtle climb trees?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'image3', pregunta:"Did the T-rex eat meat?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionUno"}
				{tipo:'texto', imagen:'image2', pregunta:"Did the T-rex live in the ocean?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'image1', pregunta:"Did the T-rex swim like a fish?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'image5', pregunta:"Did the saber-toothed fish have a shell?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionDos"}
				{tipo:'texto', imagen:'image5', pregunta:"Did the saber-toothed fish have fangs?", opcionUno:'Yes, it did.', opcionDos:"No, it didn't", respuesta:"opcionUno"}
	
			]
		super null, manifest, sounds
	setStage: ->
		super
		@preguntas = @shuffleNoRepeat @game.preguntas, 16
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Choose the correct answers to the questions.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
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
			question.addChild text
			@addToLibrary text

			opciones = new createjs.Container()

			uno = new ClickableText @preguntas[i].opcionUno, @preguntas[i].opcionUno, i, 0, 0
			opciones.addChild uno
			@addToLibrary uno 

			diagonal = new createjs.Text '/','16px Quicksand','#333'
			diagonal.name = 'diagonal'
			diagonal.x = uno.x + uno.width
			diagonal.y = 0
			opciones.addChild diagonal
			@addToLibrary diagonal

			dos = new ClickableText @preguntas[i].opcionDos, @preguntas[i].opcionDos, i,  diagonal.x + 10, 0
			opciones.addChild dos
			@addToLibrary dos

			total = uno.width + dos.width + 20

			opciones.x = stageSize.w / 2 - total / 2;
			opciones.y = 490;
			question.addChild opciones
		else if @preguntas[i].tipo is 'imagen'
			text = new createjs.Text @preguntas[i].pregunta,'24px Quicksand','#333'
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
	window.U6A4 = U6A4