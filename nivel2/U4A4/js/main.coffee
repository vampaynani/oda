class U4A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'btnfalse', src:'btn_false.png'}
			{id: 'btntrue', src:'btn_true.png'}
			{id: 'framedesert', src:'frame_desert.png'}
			{id: 'framegrasslands', src:'frame_grasslands.png'}
			{id: 'framejungle', src:'frame_jungle.png'}
			{id: 'frameocean', src:'frame_ocean.png'}
			{id: 'incamel', src:'in_camel.png'}
			{id: 'incrocodile', src:'in_crocodile.png'}
			{id: 'indolphin', src:'in_dolphin.png'}
			{id: 'inelephant', src:'in_elephant.png'}
			{id: 'ingiraffe', src:'in_giraffe.png'}
			{id: 'injaguar', src:'in_jaguar.png'}
			{id: 'inlion', src:'in_lion.png'}
			{id: 'inlizard', src:'in_lizard.png'}
			{id: 'inmonkey', src:'in_monkey.png'}
			{id: 'inoctopus', src:'in_octopus.png'}
			{id: 'inparrot', src:'in_parrot.png'}
			{id: 'inscorpion', src:'in_scorpion.png'}
			{id: 'inshark', src:'in_shark.png'}
			{id: 'insnake', src:'in_snake.png'}
			{id: 'inwhale', src:'in_whale.png'}
			{id: 'inzebra', src:'in_zebra.png'}
			{id: 'outcamel', src:'out_camel.png'}
			{id: 'outcrocodile', src:'out_crocodile.png'}
			{id: 'outdolphin', src:'out_dolphin.png'}
			{id: 'outelephant', src:'out_elephant.png'}
			{id: 'outgiraffe', src:'out_giraffe.png'}
			{id: 'outjaguar', src:'out_jaguar.png'}
			{id: 'outlion', src:'out_lion.png'}
			{id: 'outlizard', src:'out_lizard.png'}
			{id: 'outmonkey', src:'out_monkey.png'}
			{id: 'outoctopus', src:'out_octopus.png'}
			{id: 'outparrot', src:'out_parrot.png'}
			{id: 'outscorpion', src:'out_scorpion.png'}
			{id: 'outshark', src:'out_shark.png'}
			{id: 'outsnake', src:'out_snake.png'}
			{id: 'outwhale', src:'out_whale.png'}
			{id: 'outzebra', src:'out_zebra.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A3_instructions.mp3', id:'instructions'}
		]
		@answers = [
			{text: "A lion has paws", animal: 'lion', respuestas:'on'}
			{text: "A parrot has claws", animal: 'parrot', respuestas:'on'}
			{text: "Monkeys can't climb", animal: 'monkey', respuestas:'off'}
			{text: "Lizards eat insects", animal: 'lizard', respuestas:'on'}
			{text: "A scorpion can't crawl", animal: 'scorpion', respuestas:'off'}
			{text: "Zebras can run", animal:'zebras', respuestas:'on'}
			{text: "A lion can sleep in trees", animal:'lion', respuestas: 'on'}
			{text: "A baby dolphin drinks milk", animal:'dolphin', respuestas:'on'}
			{text: "Sharks have wings", animal:'shark', respuestas:'off'}
			{text:"Giraffes don't have a tail", animal:'giraffe', respuestas:'off'}
			{text:"Camels live in the grasslands", animal:'camel', respuestas:'off'}
			{text:"A lizard can crawl", animal:'lizard', respuestas:'on'}
			{text:"A dolphin can fly", animal:'dolphin', respuestas:'off'}
			{text:"An octopus can jump", animal:'octopus', respuestas:'off'}
			{text:"Monkeys don't have feathers", animal:'monkey', respuestas:'on'}
			{text:"A crocodile has a tail", animal:'crocodile', respuestas:'on'}
			{text:"A jaguar eats meat", animal:'jaguar', respuestas:'on'}
			{text:"A camel eats meat", animal: 'camel', respuestas:'off'}
			{text:"An octopus can change colors", animal:'octopus', respuestas:'on'}
			{text:"Giraffes live in the jungle", animal:'giraffe', respuestas:'off'}
			{text:"Elephants live in the desert", animal:'elephant', respuestas:'off'}
			{text:"Whales have a tail", animal:'whale', respuestas:'on'}
		]

		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setAnimals().setClick().introEvaluation()
	setAnimals: ->
		@insertBitmap 'framedesert', 'framedesert', 447, 309
		@insertBitmap 'framegrasslands', 'framegrasslands', 447, 131
		@insertBitmap 'framejungle', 'framejungle', 174, 309
		@insertBitmap 'frameocean', 'frameocean', 168, 131

		@insertBitmap 'incamel', 'incamel', 446, 365
		@insertBitmap 'incrocodile', 'incrocodile', 282, 419
		@insertBitmap 'indolphin', 'indolphin', 168, 217
		@insertBitmap 'inelephant', 'inelephant', 605, 180
		@insertBitmap 'ingiraffe', 'ingiraffe', 452, 138
		@insertBitmap 'injaguar', 'injaguar', 160, 376
		@insertBitmap 'inlion', 'inlion', 540, 148
		@insertBitmap 'inlizard', 'inlizard', 561, 343
		@insertBitmap 'inmonkey', 'inmonkey', 305, 314
		@insertBitmap 'inoctopus', 'inoctopus', 174, 140
		@insertBitmap 'inparrot', 'inparrot', 173, 326
		@insertBitmap 'inscorpion', 'inscorpion', 555, 410
		@insertBitmap 'inshark', 'inshark', 292, 140
		@insertBitmap 'insnake', 'insnake', 601, 366
		@insertBitmap 'inwhale', 'inwhale', 240, 219
		@insertBitmap 'inzebra', 'inzebra', 513, 198

		@insertSprite 'animalesfuera', ['outcamel', 'outcrocodile', 'outdolphin', 'outelephant',  'outgiraffe', 'outjaguar', 'outlion', 'outlizard', 'outmonkey', 'outoctopus', 'outparrot', 'outscorpion', 'outshark', 'outsnake', 'outwhale', 'outzebra'], {camel:0, crocodile:1, dolphin: 2, elephant: 3, giraffe: 4, jaguar: 5, lion: 6, lizard: 7, monkey: 8, octopus: 9, parrot: 10, scorpion: 11, shark: 12, snake: 13, whale: 14, zebra: 15}, 243, 535, 'mc'
		@
	
	setClick: -> 
		@insertBitmap 'btnfalse', 'btnfalse', 536, 535
		@insertBitmap 'btntrue', 'btntrue', 409, 536
		@library['btnfalse'].index = 'off'
		@library['btntrue'].index = 'on'
		@library['btntrue'].addEventListener 'click', @evaluateAnswer
		@library['btnfalse'].addEventListener 'click', @evaluateAnswer
		@
	introEvaluation: ->
		super
		@library['animalesfuera'].gotoAndStop @answers[@index].animal
		text = new createjs.Text @answers[@index].text, '20px Arial', '#333'
		text.name = 'frases'
		text.x = 410
		text.y = 500
		@addToMain text

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
	evaluateAnswer: (e) =>
		@answer = e.target
		if @answer.index is @answers[@index].respuestas
			@library['score'].plusOne()
			createjs.Sound.play 'good'
			TweenLite.to @library['animalesfuera'], 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}
		else 
			@warning()	
	finishEvaluation: =>
		@nextEvaluation()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['score'].updateCount( @index )
			@library['animalesfuera'].gotoAndStop @answers[@index].animal
			TweenLite.to @library['animalesfuera'], 0.5, {alpha:1, y:535, ease: Back.easeOut}
			@library['frases'].text = @answers[@index].text
		else
			@finish()
	repeatSound: =>
		createjs.Sound.play @answers[@index].sound
	finish: ->
		super
		for i in [1..6] by 1
			@library['name'+i].blink off
	window.U4A4 = U4A4