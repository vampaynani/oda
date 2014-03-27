class U2A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'lady', src: 'lady.png'}
			{id: 'repeat', src: 'repeat_btn.png'}
			{id:'bed' , src: 'bed.png'},  
		    {id:'broom' , src: 'broom.png'},  
		    {id:'kitchen' , src: 'clean-kitchen.png'},  
		    {id:'toys' , src: 'clean-toys.png'},  
		    {id:'cat' , src: 'feed-cat.png'},  
		    {id:'dog' , src: 'feed-dog.png'},  
		    {id:'fish' , src: 'feed-fish.png'},  
		    {id:'garbage' , src: 'out-garbage.png'},  
		    {id:'doll' , src: 'play-doll.png'},  
		    {id:'soup' , src: 'soup.png'},  
		    {id:'swipe' , src: 'swipe.png'},  
		    {id:'walkdog' , src: 'walk-dog.png'},  
		    {id:'dishes' , src: 'wash-dishes.png'},  
		    {id:'plants' , src: 'water-plants.png'}  
		]
		sounds = [
			{src:'sounds/TU2_U2_A2_instructions.mp3', id:'instructions'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'skitchen'}
		    {src:'sounds/TU2_U2_A2_feedTheCat.mp3', id:'scat'}
		    {src:'sounds/TU2_U2_A2_feedTheDog.mp3', id:'sdog'}
		    {src:'sounds/TU2_U2_A2_feedTheFish.mp3', id:'sfish'}
		    {src:'sounds/TU2_U2_A2_makeYourBed.mp3', id:'sbed'}
		    {src:'sounds/TU2_U2_A2_pickUpYourRoom.mp3', id:'sdoll'}
		    {src:'sounds/TU2_U2_A2_putAwayYourToys.mp3', id:'stoys'}
		    {src:'sounds/TU2_U2_A2_setTheTable.mp3', id:'ssoup'}
		    {src:'sounds/TU2_U2_A2_sweepTheFloor.mp3', id:'sswipe'}
		    {src:'sounds/TU2_U2_A2_sweepTheKitchen.mp3', id:'skitchen1'}
		    {src:'sounds/TU2_U2_A2_takeOutTheBroom.mp3', id:'sbroom'}
		    {src:'sounds/TU2_U2_A2_takeOutTheTrash.mp3', id:'sgarbage'}
		    {src:'sounds/TU2_U2_A2_walkTheDog.mp3', id:'swalkdog'}
		    {src:'sounds/TU2_U2_A2_washTheDishes.mp3', id:'sdishes'}
		    {src:'sounds/TU2_U2_A2_waterThePlants.mp3', id:'splants'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			answers: [
				{id:'kitchen', a: false}
				{id:'cat', a: false}
				{id:'dog', a: false}
				{id:'fish', a: false}
				{id:'bed', a: false}
				{id:'doll', a: false}
				{id:'toys', a: false}
				{id:'soup', a: false}
				{id:'swipe', a: false}
				{id:'broom', a: false}
				{id:'garbage', a: false}
				{id:'walkdog', a: false}
				{id:'dishes', a: false}
				{id:'plants', a: false}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @game.answers[..]
		for answer in @answers
			answer.a = false
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and click on the correct picture.', 80, 200
		@insertBitmap 'teacher', 'lady', 500, 268
		@insertBitmap 'repeat', 'repeat', 882, 420
		@insertSprite 'choose1', ['kitchen','cat','dog','fish','bed','doll','toys','soup','swipe','broom','garbage','walkdog','dishes','plants'], {'kitchen':0,'cat':1,'dog':2,'fish':3,'bed':4,'doll':5,'toys':6,'soup':7,'swipe':8,'broom':9,'garbage':10,'walkdog':11,'dishes':12,'plants':13}, 540, 904, 'mc'
		@insertSprite 'choose2', ['kitchen','cat','dog','fish','bed','doll','toys','soup','swipe','broom','garbage','walkdog','dishes','plants'], {'kitchen':0,'cat':1,'dog':2,'fish':3,'bed':4,'doll':5,'toys':6,'soup':7,'swipe':8,'broom':9,'garbage':10,'walkdog':11,'dishes':12,'plants':13}, 1182, 904, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 14, 0
		@introEvaluation()
	introEvaluation: ->
		super
		@library['choose1'].alpha = 0
		@library['choose1'].scaleX = @library['choose1'].scaleY = 0.3
		@library['choose2'].alpha = 0
		@library['choose2'].scaleX = @library['choose2'].scaleY = 0.3
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['teacher'], 1, {alpha: 0, y: @library['teacher'].y + 100, delay: 1}
		TweenLite.from @library['repeat'], 1, {alpha: 0, y: @library['repeat'].y + 100, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@showPhrase()
		@library['choose1'].addEventListener 'click', @evaluateAnswer
		@library['choose2'].addEventListener 'click', @evaluateAnswer
		@library['repeat'].addEventListener 'click', @repeat
	evaluateAnswer: (e) =>
		@answer = e.target
		selection = @answers.where id: @phrase.id
		selection[0].a = on
		if @phrase.id is @answer.currentAnimation
			createjs.Sound.play 'good'
			@library['score'].plusOne()
		else
			@warning()
		setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		TweenMax.to [@library['choose1'], @library['choose2']], 1, {alpha: 0, scaleX: 0.3, scaleY: 0.3, ease:Elastic.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		console.log @index
		if @index < @answers.length
			@showPhrase()
		else
			@finish()
	showPhrase: =>
		rand = if Math.random() > 0.5 then 1 else 2
		other = if rand is 1 then 2 else 1
		@phrase = @getPhrase()
		others = @answers.filter (answer) =>
			answer.id isnt @phrase.id
		fake = Math.floor Math.random() * others.length
		@library['choose' + rand].gotoAndStop @phrase.id
		@library['choose' + other].gotoAndStop others[fake].id
		createjs.Sound.play "s#{@phrase.id}"
		TweenMax.to [@library['choose1'], @library['choose2']], 1, {alpha: 1, scaleX: 1, scaleY: 1, ease:Elastic.easeOut}
	getPhrase: ->
		possible = @answers.filter (answer) ->
			answer.a is off
		id = Math.floor Math.random() * possible.length
		possible[id]
	repeat: (e) =>
		createjs.Sound.play "s#{@phrase.id}"
	shuffle: (a) ->
		for i in [a.length..1]
			j = Math.floor Math.random() * ( i + 1 )
			[a[i], a[j]] = [a[j], a[i]]
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: ->
		TweenLite.to @library['teacher'], 1, {alpha: 0, y: @library['teacher'].y + 50}
		TweenLite.to @library['repeat'], 1, {alpha: 0, y: @library['repeat'].y + 50}
		super
	window.U2A2 = U2A2