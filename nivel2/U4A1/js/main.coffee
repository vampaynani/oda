class U4A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'scoreYou', src:'score_you.png'}
			{id: 'scoreComputer', src:'score_computer.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}

			{id: 'borde1', src:'border0001.png'}
			{id: 'borde2', src:'border0002.png'}
			{id: 'borde3', src:'border0003.png'}
			{id: 'beak', src:'beak.png'}
			{id: 'bear', src:'bear.png'}
			{id: 'camel', src:'camel.png'}
			{id: 'chimpanzee', src:'chimpanzee.png'}
			{id: 'claws', src:'claws.png'}
			{id: 'crocodile', src:'crocodile.png'}
			{id: 'dolphin', src:'dolphin.png'}
			{id: 'eagle', src:'eagle.png'}
			{id: 'elephant', src:'elephant.png'}
			{id: 'feathers', src:'feathers.png'}
			{id: 'fins', src:'fins.png'}
			{id: 'fish', src:'fish.png'}
			{id: 'fox', src:'fox.png'}
			{id: 'frog', src:'frog.png'}
			{id: 'fur', src:'fur.png'}
			{id: 'giraffe', src:'giraffe.png'}
			{id: 'gorilla', src:'gorilla.png'}
			{id: 'jaguar', src:'jaguar.png'}
			{id: 'lion', src:'lion.png'}
			{id: 'monkey', src:'monkey.png'}
			{id: 'octopus', src:'octopus.png'}
			{id: 'owl', src:'owl.png'}
			{id: 'panda', src:'panda.png'}
			{id: 'parrot', src:'parrot.png'}
			{id: 'paws', src:'paws.png'}
			{id: 'penguin', src:'penguin.png'}
			{id: 'polarbear', src:'polar-bear.png'}
			{id: 'python', src:'python.png'}
			{id: 'rhino', src:'rhino.png'}
			{id: 'scales', src:'scales.png'}
			{id: 'seaturtle', src:'sea-turtle.png'}
			{id: 'shark', src:'shark.png'}
			{id: 'snake', src:'snake.png'}
			{id: 'tail', src:'tail.png'}
			{id: 'tiger', src:'tiger.png'}
			{id: 'whale', src:'whale.png'}
			{id: 'whiskers', src:'whiskers.png'}
			{id: 'wings', src:'wings.png'}
			{id: 'zebra', src:'zebra.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/TU2_U4_A1_instructions.mp3', id:'instructions'}
			{id:'sbeak', src:'sounds/beak.mp3'}
			{id:'sbear', src:'sounds/bear.mp3'}
			{id:'scamel', src:'sounds/camel.mp3'}
			{id:'schimpanzee', src:'sounds/chimpanzee.mp3'}
			{id:'sclaws', src:'sounds/claws.mp3'}
			{id:'scrocodile', src:'sounds/crocodile.mp3'}
			{id:'sdolphin', src:'sounds/dolphin.mp3'}
			{id:'seagle', src:'sounds/eagle.mp3'}
			{id:'selephant', src:'sounds/elephant.mp3'}
			{id:'sfeathers', src:'sounds/feathers.mp3'}
			{id:'sfins', src:'sounds/fins.mp3'}
			{id:'sfish', src:'sounds/fish.mp3'}
			{id:'sfox', src:'sounds/fox.mp3'}
			{id:'sfrog', src:'sounds/frog.mp3'}
			{id:'sfur', src:'sounds/fur.mp3'}
			{id:'sgiraffe', src:'sounds/giraffe.mp3'}
			{id:'sgorilla', src:'sounds/gorilla.mp3'}
			{id:'sjaguar', src:'sounds/jaguar.mp3'}
			{id:'slion', src:'sounds/lion.mp3'}
			{id:'smonkey', src:'sounds/monkey.mp3'}
			{id:'soctopus', src:'sounds/octopus.mp3'}
			{id:'sowl', src:'sounds/owl.mp3'}
			{id:'spanda', src:'sounds/panda.mp3'}
			{id:'sparrot', src:'sounds/parrot.mp3'}
			{id:'spaws', src:'sounds/paws.mp3'}
			{id:'spenguin', src:'sounds/penguin.mp3'}
			{id:'spolarbear', src:'sounds/polar-bear.mp3'}
			{id:'spython', src:'sounds/python.mp3'}
			{id:'srhino', src:'sounds/rhino.mp3'}
			{id:'sscales', src:'sounds/scales.mp3'}
			{id:'sseaturtle', src:'sounds/sea-turtle.mp3'}
			{id:'sshark', src:'sounds/shark.mp3'}
			{id:'ssnake', src:'sounds/snake.mp3'}
			{id:'stail', src:'sounds/tail.mp3'}
			{id:'stiger', src:'sounds/tiger.mp3'}
			{id:'swhale', src:'sounds/whale.mp3'}
			{id:'swhiskers', src:'sounds/whiskers.mp3'}
			{id:'swings', src:'sounds/wings.mp3'}
			{id:'szebra', src:'sounds/zebra.mp3'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@animals = [
			{id: 'beak'}
			{id: 'bear'}
			{id: 'camel'}
			{id: 'chimpanzee'}
			{id: 'claws'}
			{id: 'crocodile'}
			{id: 'dolphin'}
			{id: 'eagle'}
			{id: 'elephant'}
			{id: 'feathers'}
			{id: 'fins'}
			{id: 'fish'}
			{id: 'fox'}
			{id: 'frog'}
			{id: 'fur'}
			{id: 'giraffe'}
			{id: 'gorilla'}
			{id: 'jaguar'}
			{id: 'lion'}
			{id: 'monkey'}
			{id: 'octopus'}
			{id: 'owl'}
			{id: 'panda'}
			{id: 'parrot'}
			{id: 'paws'}
			{id: 'penguin'}
			{id: 'polarbear'}
			{id: 'python'}
			{id: 'rhino'}
			{id: 'scales'}
			{id: 'seaturtle'}
			{id: 'shark'}
			{id: 'snake'}
			{id: 'tail'}
			{id: 'tiger'}
			{id: 'whale'}
			{id: 'whiskers'}
			{id: 'wings'}
			{id: 'zebra'}
		]
		@game = {
			animals: @shuffle @animals
			you: 0
			pc: 0
		}
		super null, manifest, sounds
	setStage: ->
		@round = 0
		console.log 'ronda '+(@round+1)
		super
		@youcards = @shuffleNoRepeat @animals, 9
		@pccards = @shuffleNoRepeat @animals, 9
		@game.animals = @shuffle @animals

		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'scoreComputer', 'scoreComputer', 19, 463
		@insertBitmap 'scoreYou', 'scoreYou', 19, 370
		@insertBitmap 'repeatbtn', 'repeatbtn', 395, 536
		@insertText 'pcCount',@game.pc,'24px Quicksand', '#ffffff',41,487,'center'
		@insertText 'youCount',@game.you,'24px Quicksand', '#ffffff',41,397,'center'
		@setCardsYou().setCardsPc().introEvaluation()
	jug: ->
		@game.you++
		createjs.Sound.play 'good'
		@library['youCount'].text = @game.you
		@
	compu: ->
		@game.pc++
		createjs.Sound.play  'wrong'
		@library['pcCount'].text = @game.pc
		@
	nuevaRonda: ->
		#console.log 'indice '+@index

		@index = 0
		@round++
		#console.log 'indice '+@index
		console.log 'ronda '+(@round+1)

		TweenLite.to @library.cartas, 1, {alpha: 0, y: @library.cartas.y - 50}
		TweenLite.to @library.cartaspc, 1, {alpha: 0, y: @library.cartaspc.y - 50}
		clearInterval @interval
		
		@youcards = @shuffleNoRepeat @animals, 9
		@pccards = @shuffleNoRepeat @animals, 9
		@game.animals = @shuffle @animals
		if @round <= 5
			@setCardsYou().setCardsPc().introEvaluation()
		else
			@finish()
	setCardsYou: ->
		j = 0
		cartas = new createjs.Container()
		cartas.x = 100
		cartas.y = 145
		cartas.name = 'cartas'

		texto = @createText '','You','22px Quicksand','#333',150,-25
		cartas.addChild texto
		
		for h in [0..2]
			for i in [0..2]
				b = @createSprite 'borde', ['borde1', 'borde2', 'borde3'], null, 0, 0
				a = @createBitmap 'animal', @youcards[j].id, 0, 0
				a.scaleX = a.scaleY = 0.36333
				carta = new createjs.Container()
				carta.name = "cartay#{j}"
				carta.index = @youcards[j].id
				carta.x = i * 112
				carta.y = h * 130
				carta.addChild b, a
				cartas.addChild carta
				@addToLibrary carta
				j++
		
		@addToMain cartas
		@
	setCardsPc: ->
		j = 0
		cartaspc = new createjs.Container()
		cartaspc.x = 449
		cartaspc.y = 145
		cartaspc.name = 'cartaspc'
		
		texto = @createText '', 'Computer','22px Quicksand','#333', 117, -25
		cartaspc.addChild texto
		
		for h in [0..2]
			for i in [0..2]
				b = @createSprite 'borde', ['borde1', 'borde2', 'borde3'], null, 0, 0
				a = @createBitmap 'animal', @pccards[j].id, 0, 0
				a.scaleX = a.scaleY = 0.36333
				carta = new createjs.Container()
				carta.name = "cartac#{j}"
				carta.index = @pccards[j].id
				carta.x = i * 112
				carta.y = h * 130
				carta.addChild b, a
				cartaspc.addChild carta
				@addToLibrary carta
				j++

		@addToMain cartaspc
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['cartas'], 1, {alpha: 0, y: @library['cartas'].y - 50, delay: 1}
		if @round is 0
			TweenLite.from @library['cartaspc'], 1, {alpha: 0, y: @library['cartaspc'].y - 50, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
		else	
			TweenLite.from @library['cartaspc'], 1, {alpha: 0, y: @library['cartaspc'].y - 50, delay: 1, onComplete: @initEvaluation, onCompleteParams: [@]}	

	initEvaluation: (e) =>
		super
		for i in [0..8]
			@library["cartay#{i}"].addEventListener 'click', @evaluateClick
		@library['repeatbtn'].addEventListener 'click', @repeatSound
		createjs.Sound.play "s#{@game.animals[@index].id}"
		@interval = setInterval @nextEvaluation, 5 * 1000
	evaluateClick: (e) =>
		@answer = e.target
		if @answer.index is @game.animals[@index].id
			@answer.getChildByName('borde').currentFrame = 1
			@evaluateRows()
	evaluateRows: (e) =>
		if @library["cartay0"].getChildByName('borde').currentFrame is 1 and @library["cartay1"].getChildByName('borde').currentFrame is 1 and @library["cartay2"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()
		if @library["cartay3"].getChildByName('borde').currentFrame is 1 and @library["cartay4"].getChildByName('borde').currentFrame is 1 and @library["cartay5"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()
		if @library["cartay6"].getChildByName('borde').currentFrame is 1 and @library["cartay7"].getChildByName('borde').currentFrame is 1 and @library["cartay8"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()
		if @library["cartay0"].getChildByName('borde').currentFrame is 1 and @library["cartay3"].getChildByName('borde').currentFrame is 1 and @library["cartay6"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()
		if @library["cartay1"].getChildByName('borde').currentFrame is 1 and @library["cartay4"].getChildByName('borde').currentFrame is 1 and @library["cartay7"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()
		if @library["cartay2"].getChildByName('borde').currentFrame is 1 and @library["cartay5"].getChildByName('borde').currentFrame is 1 and @library["cartay8"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()
		if @library["cartay0"].getChildByName('borde').currentFrame is 1 and @library["cartay4"].getChildByName('borde').currentFrame is 1 and @library["cartay8"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()
		if @library["cartay2"].getChildByName('borde').currentFrame is 1 and @library["cartay4"].getChildByName('borde').currentFrame is 1 and @library["cartay6"].getChildByName('borde').currentFrame is 1 then @jug().nuevaRonda()

		if @library["cartac0"].getChildByName('borde').currentFrame is 2 and @library["cartac1"].getChildByName('borde').currentFrame is 2 and @library["cartac2"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		if @library["cartac3"].getChildByName('borde').currentFrame is 2 and @library["cartac4"].getChildByName('borde').currentFrame is 2 and @library["cartac5"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		if @library["cartac6"].getChildByName('borde').currentFrame is 2 and @library["cartac7"].getChildByName('borde').currentFrame is 2 and @library["cartac8"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		if @library["cartac0"].getChildByName('borde').currentFrame is 2 and @library["cartac3"].getChildByName('borde').currentFrame is 2 and @library["cartac6"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		if @library["cartac1"].getChildByName('borde').currentFrame is 2 and @library["cartac4"].getChildByName('borde').currentFrame is 2 and @library["cartac7"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		if @library["cartac2"].getChildByName('borde').currentFrame is 2 and @library["cartac5"].getChildByName('borde').currentFrame is 2 and @library["cartac8"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		if @library["cartac0"].getChildByName('borde').currentFrame is 2 and @library["cartac4"].getChildByName('borde').currentFrame is 2 and @library["cartac8"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		if @library["cartac2"].getChildByName('borde').currentFrame is 2 and @library["cartac4"].getChildByName('borde').currentFrame is 2 and @library["cartac6"].getChildByName('borde').currentFrame is 2 then @compu().nuevaRonda()
		@
	finishEvaluation: =>
	nextEvaluation: =>
		for i in [0..8]
			if @library["cartac#{i}"].index is @game.animals[@index].id
				@library["cartac#{i}"].getChildByName('borde').currentFrame = 2
				@evaluateRows()
		@index++
		if @index < @game.animals.length
			createjs.Sound.play "s#{@game.animals[@index].id}"
		else
			@finish()
	repeatSound: =>
		createjs.Sound.play "s#{@game.animals[@index].id}"
	finish: ->
		clearInterval @interval
		TweenLite.to @library.repeatbtn, 1, {alpha: 0}
		TweenLite.to @library.cartas, 1, {alpha: 0, y: @library.cartas.y - 50}
		TweenLite.to @library.cartaspc, 1, {alpha: 0, y: @library.cartaspc.y - 50}
		super
	window.U4A1 = U4A1