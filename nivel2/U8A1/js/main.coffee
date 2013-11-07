class U5A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 			{id:'carta1', src:'carta1.png'}
			{id:'carta2', src:'carta2.png'}
			{id:'carta3', src:'carta3.png'}
			{id:'game1btn', src:'game1_btn.png'}
			{id:'game2btn', src:'game2_btn.png'}
			{id:'game3btn', src:'game3_btn.png'}


			{id:'game1Box', src:'game1/box.png'}
			{id:'game1Chopsticks', src:'game1/chopsticks.png'}
			{id:'game1Chopsticks2', src:'game1/chopsticks2.png'}
			{id:'game1Cookie', src:'game1/cookie.png'}
			{id:'game1Doll', src:'game1/doll.png'}
			{id:'game1Doll2', src:'game1/doll2.png'}
			{id:'game1Fan', src:'game1/fan.png'}
			{id:'game1Fan2', src:'game1/fan2.png'}
			{id:'game1Fourtunecookie', src:'game1/fourtune-cookie.png'}
			{id:'game1Mask', src:'game1/mask.png'}
			{id:'game1Mask2', src:'game1/mask2.png'}
			{id:'game1Necklace2', src:'game1/necklace2.png'}
			{id:'game1Puppet', src:'game1/puppet.png'}
			{id:'game1Treasure box', src:'game1/treasure-box.png'}
			{id:'game1Wooden puppet', src:'game1/wooden-puppet.png'}
			{id:'game1Necklace', src:'game1/Necklace.png'}
			{id:'game2Australia2', src:'game2/australia2.png'}
			{id:'game2Australia', src:'game2/australia.png'}
			{id:'game2Brazil ', src:'game2/brazil.png'}
			{id:'game2Brazil2', src:'game2/brazil2.png'}
			{id:'game2Canada2', src:'game2/canada2.png'}
			{id:'game2Canada', src:'game2/canada.png'}
			{id:'game2China2', src:'game2/china2.png'}
			{id:'game2China', src:'game2/china.png'}
			{id:'game2France2', src:'game2/france2.png'}
			{id:'game2France', src:'game2/france.png'}
			{id:'game2Germany2', src:'game2/germany2.png'}
			{id:'game2Germany', src:'game2/germany.png'}
			{id:'game2India2', src:'game2/india2.png'}
			{id:'game2India', src:'game2/india.png'}
			{id:'game2Mexico ', src:'game2/mexico.png'}
			{id:'game2Mexico2', src:'game2/mexico2.png'}
			{id:'game3035', src:'game3/0-35.png'}
			{id:'game3050', src:'game3/0-50.png'}
			{id:'game3n1160', src:'game3/11-60.png'}
			{id:'game3n1340', src:'game3/13-40.png'}
			{id:'game3n1600', src:'game3/16-00.png'}
			{id:'game3n2150', src:'game3/21-50.png'}
			{id:'game3n2510', src:'game3/25-10.png'}
			{id:'game3n3210', src:'game3/32-10.png'}
			{id:'game3Evelendollarsandsixtycents', src:'game3/evelen-dollars-and-sixty-cents.png'}
			{id:'game3Fidtycents', src:'game3/fidty-cents.png'}
			{id:'game3Sixteendollars', src:'game3/sixteen-dollars.png'}
			{id:'game3Thirteendollarsandfortycents', src:'game3/thirteen-dollars-and-forty-cents.png'}
			{id:'game3Thirtyfivecents', src:'game3/thirty-five-cents.png'}
			{id:'game3Thirtytwodollarsandten.cents', src:'game3/thirty-two-dollars-and-ten-cents.png'}
			{id:'game3Twentyfivedollarsandtencent', src:'game3/twenty-five-dollars-and-ten-cent.png'}
			{id:'game3Twentyonedollarsandfiftycents', src:'game3/twenty-one-dollars-and-fifty-cents.png'}


		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/TU2_U4_A6_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@answers = [	
		]


		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@insertBitmap 'game1btn', 'game1btn', 753, 460
		@insertBitmap 'game2btn', 'game2btn', 753, 505
		@insertBitmap 'game3btn', 'game3btn', 753, 550
	
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 5, 0
		@setCards().introEvaluation()
	setCards:  ->
		juego = new createjs.Container()
		juego.x = 200
		juego.y = 180	
		game = 1
		for h in [0..3]
			for i in [0..3]
				c = @createBitmap 'carta'+game, 'carta'+game, i*130, h*110, 'mc'
				c.scaleX = c.scaleY = 0.6
				juego.addChild c
				@addToLibrary c
		@addToMain juego
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
	evaluateAnswer: (e) =>
		@answer = e.target
		pt = @library['dropname'].globalToLocal @stage.mouseX, @stage.mouseY
		if @library['dropname'].hitTest pt.x, pt.y
			if @answer.index is @answers[@index].id
				@answer.blink off
				setTimeout @finishEvaluation, 1 * 1000
			else
				@warning()
				@answer.returnToPlace()
		else
			@answer.returnToPlace()
	finishEvaluation: =>
		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
		@answer.returnToPlace()
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@library['score'].updateCount( @index )
			@library['characters'].alpha = 1
			@library['characters'].y = stageSize.h - 180
			@library['characters'].currentFrame = @answers[@index].id
			createjs.Sound.play @answers[@index].sound
			TweenLite.from @library['characters'], 0.5, {alpha: 0, y: @library['characters'].y + 20, ease: Quart.easeOut}
		else
			@finish()
	repeatSound: =>
		createjs.Sound.play @answers[@index].sound
	finish: ->
		super
		for i in [1..6] by 1
			@library['name'+i].blink off
	window.U5A6 = U5A6