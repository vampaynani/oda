class U4A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
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
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A4_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			answers: [
				{text:"A camel eats meat.", animal: 'camel', respuestas:'off', showanimal:'incamel'}
				{text:"A jaguar eats meat.", animal:'jaguar', respuestas:'on', showanimal:'injaguar'}
				{text:"A dolphin can fly.", animal:'dolphin', respuestas:'off', showanimal:'indolphin'}
				{text:"An octopus can jump.", animal:'octopus', respuestas:'off', showanimal:'inoctopus'}
				{text:"Elephants live in the desert.", animal:'elephant', respuestas:'off', showanimal:'inelephant'}
				{text:"An elephant has a beak.", animal:'elephant', respuestas:'off', showanimal:'inelephant'}
				{text:"A lion has paws.", animal: 'lion', respuestas:'on', showanimal: 'inlion' }
				{text:"A parrot has claws.", animal: 'parrot', respuestas:'on', showanimal:'inparrot'}
				{text:"Sharks have wings.", animal:'shark', respuestas:'off', showanimal:'inshark'}		
				{text:"A lizard can crawl.", animal:'lizard', respuestas:'on', showanimal:'inlizard'}
				{text:"Snakes have scales.", animal:'snake', respuestas:'on', showanimal:'insnake'}
				{text:"Monkeys can't climb.", animal: 'monkey', respuestas:'off', showanimal:'inmonkey'}
				{text:"Giraffes live in the jungle.", animal:'giraffe', respuestas:'off', showanimal:'ingiraffe'}
				{text:"Whales have a tail.", animal:'whale', respuestas:'on', showanimal:'inwhale'}
				{text:"An octopus can change colors.", animal:'octopus', respuestas:'on', showanimal:'inoctopus'}
				{text:"A baby dolphin drinks milk.", animal:'dolphin', respuestas:'on', showanimal:'indolphin'}
				{text:"A parrot can't speak.", animal: 'parrot', respuestas:'on', showanimal:'inparrot'}
				{text:"Lizards eat insects.", animal: 'lizard', respuestas:'on', showanimal:'inlizard'}
				{text:"A scorpion can't crawl.", animal: 'scorpion', respuestas:'off', showanimal:'inscorpion'}
				{text:"Monkeys don't have feathers.", animal:'monkey', respuestas:'on', showanimal:'inmonkey'}
				{text:"Snakes don't have fur.", animal:'snake', respuestas:'on', showanimal:'insnake'}
				{text:"Giraffes don't have a tail.", animal:'giraffe', respuestas:'off', showanimal:'ingiraffe'}
				{text:"A jaguar doesn't have fur.", animal:'jaguar', respuestas:'off', showanimal:'injaguar'}
				{text:"A lion can sleep in trees.", animal:'lion', respuestas: 'on', showanimal:'inlion'}
				{text:"A whale can't crawl.", animal:'whale', respuestas:'on', showanimal:'inwhale'}
				{text:"A crocodile has a tail.", animal:'crocodile', respuestas:'on', showanimal:'incrocodile'}
				{text:"Zebras can run.", animal:'zebra', respuestas:'on', showanimal:'inzebra'}
				{text:"Camels live in the grasslands.", animal:'camel', respuestas:'off', showanimal:'incamel'}
			]

		super null, manifest, sounds
	setStage: ->
		super
		@answers = @shuffleNoRepeat @game.answers, 16
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look at the pictures, read the sentences and click on True or False.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 16, 0
		@setAnimals().setClick().introEvaluation()
	setAnimals: ->
		@insertBitmap 'framedesert', 'framedesert', 894, 618
		@insertBitmap 'framegrasslands', 'framegrasslands', 894, 262
		@insertBitmap 'framejungle', 'framejungle', 348, 618
		@insertBitmap 'frameocean', 'frameocean', 336, 262

	
		@insertBitmap 'incamel', 'incamel', 892, 730 
		@insertBitmap 'incrocodile', 'incrocodile', 564, 838
		@insertBitmap 'indolphin', 'indolphin', 336, 434
		@insertBitmap 'inelephant', 'inelephant', 1210, 360
		@insertBitmap 'ingiraffe', 'ingiraffe', 904, 276
		@insertBitmap 'injaguar', 'injaguar', 320, 752
		@insertBitmap 'inlion', 'inlion', 1080, 296
		@insertBitmap 'inlizard', 'inlizard', 1122, 686
		@insertBitmap 'inmonkey', 'inmonkey', 610, 628
		@insertBitmap 'inoctopus', 'inoctopus', 348, 280
		@insertBitmap 'inparrot', 'inparrot', 346, 652
		@insertBitmap 'inscorpion', 'inscorpion', 1110, 820
		@insertBitmap 'inshark', 'inshark', 584, 280
		@insertBitmap 'insnake', 'insnake', 1202, 732
		@insertBitmap 'inwhale', 'inwhale', 480, 438
		@insertBitmap 'inzebra', 'inzebra', 1026, 396
		@insertSprite 'animalesfuera', ['outcamel', 'outcrocodile', 'outdolphin', 'outelephant',  'outgiraffe', 'outjaguar', 'outlion', 'outlizard', 'outmonkey', 'outoctopus', 'outparrot', 'outscorpion', 'outshark', 'outsnake', 'outwhale', 'outzebra'], {camel:0, crocodile:1, dolphin: 2, elephant: 3, giraffe: 4, jaguar: 5, lion: 6, lizard: 7, monkey: 8, octopus: 9, parrot: 10, scorpion: 11, shark: 12, snake: 13, whale: 14, zebra: 15}, 486, 1070, 'mc'
		@allInvisible()
		@
	allInvisible: ->
		@library['incamel'].visible = false
		@library['incrocodile'].visible = false
		@library['indolphin'].visible = false
		@library['inelephant'].visible = false
		@library['ingiraffe'].visible = false
		@library['injaguar'].visible = false
		@library['inlion'].visible = false
		@library['inlizard'].visible = false
		@library['inmonkey'].visible = false
		@library['inoctopus'].visible = false
		@library['inparrot'].visible = false
		@library['inscorpion'].visible = false
		@library['inshark'].visible = false
		@library['insnake'].visible = false 
		@library['inwhale'].visible = false
		@library['inzebra'].visible = false
	setClick: -> 
		@insertBitmap 'btnfalse', 'btnfalse', 1072, 1070
		@insertBitmap 'btntrue', 'btntrue', 818, 1072
		@library.btnfalse.index = 'off'
		@library.btntrue.index = 'on'
		@library['btntrue'].addEventListener 'click', @evaluateAnswer
		@library['btnfalse'].addEventListener 'click', @evaluateAnswer
		@
	introEvaluation: ->
		super
		@library.animalesfuera.visible = off
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha :0, x: 0}
		TweenLite.from @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 20, ease: Quart.easeOut}
		TweenLite.from @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 20, ease: Quart.easeOut}
		TweenLite.from @library.frameocean, 1, {alpha: 0, y: @library.frameocean.y - 20, ease: Quart.easeOut, delay:0.4}
		TweenLite.from @library.framejungle, 1, {alpha: 0, y: @library.framejungle.y - 20, ease: Quart.easeOut, delay:0.6}
		TweenLite.from @library.framegrasslands, 1, {alpha: 0, y: @library.framegrasslands.y - 20, ease: Quart.easeOut, delay:0.8}
		TweenLite.from @library.framedesert, 1, {alpha: 0, y: @library.framedesert.y - 20, ease: Quart.easeOut, delay:1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@library.animalesfuera.visible = on
		@library.animalesfuera.gotoAndStop @answers[@index].animal
		@insertText 'frases', @answers[@index].text, '40px Quicksand', '#333', 820, 1000
		TweenLite.from @library.frases, 0.5, {alpha: 0, y: @library.frases - 20, ease: Quart.easeOut}
		TweenLite.from @library.animalesfuera, 0.5, {alpha:0, y:@library.animalesfuera.y - 40}
	evaluateAnswer: (e) =>
		@answer = e.target
		if @answer.index is @answers[@index].respuestas
			@library.score.plusOne()
			createjs.Sound.play 'good'
			if not @library[@answers[@index].showanimal].visible
				@library[@answers[@index].showanimal].visible = on
				TweenLite.from @library[@answers[@index].showanimal], 1, {alpha:0, ease: Back.easeOut}	
		else
			@warning()	
		TweenLite.to @library.animalesfuera, 0.5, {alpha:0, y:stageSize.h, ease: Back.easeOut, onComplete: @nextEvaluation}	
	finishEvaluation: =>
		@nextEvaluation()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library.animalesfuera.gotoAndStop @answers[@index].animal
			TweenLite.to @library.animalesfuera, 0.5, {alpha:1, y:1070, ease: Back.easeOut}
			@library.frases.text = @answers[@index].text
		else
			setTimeout @finish, 1 * 1000
	finish: =>
		@allInvisible()
		TweenLite.to @library.btnfalse, 1, {alpha: 0, y: @library.btnfalse.y - 20, ease: Quart.easeOut}
		TweenLite.to @library.btntrue, 1, {alpha: 0, y: @library.btntrue.y - 20, ease: Quart.easeOut}
		TweenLite.to @library.frameocean, 1, {alpha: 0, y: @library.frameocean.y - 20, ease: Quart.easeOut, delay:0.4}
		TweenLite.to @library.framejungle, 1, {alpha: 0, y: @library.framejungle.y - 20, ease: Quart.easeOut, delay:0.6}
		TweenLite.to @library.framegrasslands, 1, {alpha: 0, y: @library.framegrasslands.y - 20, ease: Quart.easeOut, delay:0.8}
		TweenLite.to @library.framedesert, 1, {alpha: 0, y: @library.framedesert.y - 20, ease: Quart.easeOut, delay:1}
		TweenLite.to @library.frases, 0.5, {alpha: 0, y: @library.frases - 20, ease: Quart.easeOut}
		super
	window.U4A4 = U4A4