class U7A5 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'bg', src:'bg.png'}
			{id: 'btnnext', src: 'btn_next.png'}
			{id: 'btnrepeat', src: 'btn_repeat.png'}

			{id: 'scene1', src:'scene_1.png'}
			{id: 'scene2', src:'scene_2.png'}
			{id: 'scene3', src:'scene_3.png'}
			{id: 'scene4', src:'scene_4.png'}	
			{id: 'scene5', src:'scene_5.png'}	
			{id: 'scene6', src:'scene_6.png'}	



		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		    {src:'sounds/TU3_U7_A5_instructions.mp3', id:'instructions'}
		]
		@game = [
			{
				texts:[
					{idx:10, t:'landed' , x:271, y:495}
					{idx:1, t:'believed' , x:187, y:495}
					{idx:2, t:'found' , x:498, y:533}
					{idx:7, t:'exploded' , x:404, y:533}
					{idx:3, t:'invented' , x:314, y:533}
					{idx:4, t:'made', x:491, y:495}
					{idx:5, t:'used', x:256, y:533}
					{idx:9, t:'killed', x:347, y:495}
					{idx:6, t:'carried', x:179, y:533}
					{idx:8,t:'caused', x:413, y:495}

				]

				text:[
					{
						questions:[
							{q: '1. What instrument did Aniz play?', a:'He played the flute.'}
							{q: '2. Who listened to Aniz?', a:'Other people and his sheep.'}
							{q: "3. Who didn't like Aniz music?", a:'The landlord.'}
						]
					}	
					{	
						questions:[	
							{q: '4. How did Aniz fell?', a:'He was very sad.'}
							{q: '5. Who made Aniz a new flute?', a:'A kind old man.'}
							{q: '6. Where did they find bamboo?', a:'In a market.'}
						]
					}	
					{	
						questions:[
							{q: '7. What did the landlord dream about?', a:'A rabbit.'}
							{q: '8. What was different about the rabbit?', a:'It had a black spot on its head.'}
							{q: '9. What did the landlord want his sons to do?', a:'To catch the rabbit.'}
						]
					}	
					{	
						questions:[
							{q: '10. Who did the oldest son talk to first?', a:'To the kind old man.'}
							{q: '11. Why did the rabbit come out of the forest?', a:'Aniz played a beautiful song.'}
							{q: '12. How did the rabbit escape?', a:'It jumped out of the bag.'}
						]
					}	
					{	
						questions:[
							{q: '13. What mistake did the sons make?', a:'They looked in the bag.'}
							{q: '14. How many people went looking for the rabbit?', a:'Four.'}
							{q: '15. Who did the landlor see in the forest?', a:'Aniz.'}
						]
					}	
					{	
						questions:[
							{q: '16. What was the shadows?', a:'Bears, tigers and wolves.'}
							{q: '17. What were they doing?', a:'They were listening to Aniz.'}
							{q: '18. Why did the landlord promise to be kind?', a:'He was afraid of the animals.'}
						]
					}	

										
				]
			}
		]
		@answers = []
		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Complete the text with the verbs.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@library.score.txtCount.color = "#BFD951"
		@library.score.txtTotal.color = "#0096DB"
		@setCuento(1)#.introEvaluation()
	setCuento: (scene) ->
		cuento = new createjs.Container()
		cuento.name = 'cuento'
		@scene = scene

		fondo = @createBitmap 'bg', 'bg', stageSize.w / 2, 0, 'tc'
		c = @createSprite "cuento", ['scene1','scene2','scene3','scene4','scene5','scene6'],null, stageSize.w / 2, 170, 'tc'
		btn = @createBitmap 'btnrepeat', 'btnrepeat', stageSize.w / 2, 570, 'mc'
		btnnext = @createBitmap 'btnnext', 'btnnext', stageSize.w / 2 + 100, 570, 'mc'


		@addToLibrary cuento
		cuento.addChild fondo, c, btn, btnnext

		palabras = new createjs.Container()
		palabras.x = 180
		palabras.y = 445

		question1 = new ClickableText 'q1', @game[0].text[scene - 1].questions[0].q, 0, 0, 0
		question2 = new ClickableText 'q2', @game[0].text[scene - 1].questions[1].q, 1, 0, 25
		question3 = new ClickableText 'q3', @game[0].text[scene - 1].questions[2].q, 2, 0, 50

		answer1 = new ClickableText 'a1', @game[0].text[scene - 1].questions[0].a, 0, 300, 0
		answer2 = new ClickableText 'a2', @game[0].text[scene - 1].questions[1].a, 1, 300, 25
		answer3 = new ClickableText 'a3', @game[0].text[scene - 1].questions[2].a, 2, 300, 50

		question1.text.font = question2.text.font = question3.text.font = '12px Quicksand'
		answer1.text.font = answer2.text.font = answer3.text.font = '12px Quicksand'
		palabras.addChild question1, question2, question3
		palabras.addChild answer1, answer2, answer3
		cuento.addChild palabras

		@addToMain cuento
		@
	introEvaluation: ->
		super
		for i in [1..@game[@scene - 1].texts.length] by 1
			@observer.subscribe 'init_evaluation', @library["t#{i}"].onInitEvaluation
		TweenLite.from @library['header'], 1, {y: -@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.from @library['cuento'], 1, {alpha: 0, y: @library['cuento'].y + 20, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		createjs.Sound.play "scene#{@scene}"
		for i in [1..@game[@scene - 1].texts.length] by 1
			@library["t#{i}"].addEventListener 'click', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		dropped = off
		for i in [1..@game[@scene - 1].positions.length] by 1
			pt = @library["hsc#{i}"].globalToLocal @stage.mouseX, @stage.mouseY
			if @library["hsc#{i}"].hitTest pt.x, pt.y
				if @answer.index is @library["hsc#{i}"].index
					if @answer.p
						if @library["sc#{i}"].currentFrame in [1,2]
							@library["sc#{i}"].currentFrame = 3
						else if @answer.p is 'p1'
							@library["sc#{i}"].currentFrame = 1
						else
							@library["sc#{i}"].currentFrame = 2
					else
						@library["sc#{i}"].currentFrame = 1
					@answer.visible = off
					createjs.Sound.play 'good'
					if @intento is 0
						@library['score'].plusOne()
					@intento = 0
					@finishEvaluation()
				else
					@intento = 1
					@warning()
					@answer.returnToPlace()
			else
				@answer.returnToPlace()
	finishEvaluation: =>
		for i in [1..@game[@scene - 1].positions.length] by 1
			if @library["sc#{i}"].currentFrame isnt @library["sc#{i}"].spriteSheet._frames.length - 1
				return
		@finish()
	finish: =>
		createjs.Sound.stop()
		createjs.Sound.play 'good'

		TweenLite.to @library['cuento'], 1, {alpha:0, y:@library['cuento'].y + 10}
		TweenLite.to @library['bg'], 1, {alpha:0}
		super
	window.U7A5 = U7A5