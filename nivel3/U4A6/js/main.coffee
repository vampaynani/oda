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
			
			{id:'alotofcats', src:'a-lot-of-cats.png'}
			{id:'anap', src:'a-nap.png'}
			{id:'itakeanap', src:'i-take-a-nap.png'}
			{id:'itstheirs', src:'its-theirs.png'}
			{id:'jointheoutdoorsclub', src:'join-the-outdoors-club.png'}
			{id:'many', src:'many.png'}
			{id:'notgoodat', src:'not-good-at.png'}
			{id:'take', src:'take.png'}
			{id:'thatahealthyhabit', src:'that-a-healthy-habit.png'}
			{id:'thatsbadadvice', src:'thats-bad-advice.png'}
			{id:'thereareafew', src:'there-are-a-few.png'}
			{id:'twodollarsA', src:'two-dollarsA.png'}
			{id:'twodollarsB', src:'two-dollarsB.png'}
			{id:'youshould', src:'you-should.png'}

		]

		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U8_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			preguntas: [
				{tipo:'texto', imagen: 'notgoodat', pregunta:"", opcionUno:"He's good at", opcionDos:'not good at taking pictures', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'alotofcats', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'anap', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'itakeanap', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'itstheirs', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'jointheoutdoorsclub', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'many', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'take', pregunta:"", opcionUno:"I want to taking", opcionDos:'take violin lessons.', respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'thatahealthyhabit', pregunta:"I love driking milk.", opcionUno:"That's a healthy habit.", opcionDos:"That's an unhealthy habit.", respuesta:'opcionUno'}
				{tipo:'texto', imagen: 'thatsbadadvice', pregunta:"", opcionUno:"That's a good advice.", opcionDos:"That's a bad advice.", respuesta:'opcionDos'}
				{tipo:'texto', imagen: 'thereareafew', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				{tipo:'imagen', pregunta:"How much are the pears?", preguntados:"They're two dollars and thirty cents a kilo.", opcionUno:'twodollarsA', opcionDos:'twodollarsB', respuesta:"opcionUno"}
				{tipo:'texto', imagen: 'youshould', pregunta:"", opcionUno:"", opcionDos:'', respuesta:'opcionDos'}
				]
		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@preguntas = @shuffleNoRepeat @game.preguntas, 11
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@setQuestion(0).introEvaluation()
	setQuestion: (i) ->
		question = new createjs.Container()
		question.x = 0
		question.y = 0
		question.name = 'question'
		if @preguntas[i].tipo is 'texto'
			v = @createBitmap @preguntas[i].imagen, @preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2+30, 'mc'
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
			if @intento is 0
				@library['score'].plusOne()
			@finishEvaluation()
			@intento = 0
		else
			@intento = 1
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
		if @index < @preguntas.length - 1
			@setQuestion(@index).setClick(@index)
		else
			@finish()
	finish: ->
		super
	window.U8A6 = U8A6