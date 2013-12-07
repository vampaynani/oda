class U1A1 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'teacher', src:'prop_bg.png'}
			{id: 'repeat', src: 'repeat-btn.png'}
			{id: 'animals1', src:'animals_1.png'}
			{id: 'animals2', src:'animals_2.png'}
			{id: 'art1', src:'art_1.png'}
			{id: 'art2', src:'art_2.png'}
			{id: 'cellphone1', src:'cellphone_1.png'}
			{id: 'cellphone2', src:'cellphone_2.png'}
			{id: 'drink1', src:'drink_1.png'}
			{id: 'drink2', src:'drink_2.png'}
			{id: 'fish1', src:'fish_1.png'}
			{id: 'fish2', src:'fish_2.png'}
			{id: 'line1', src:'line_1.png'}
			{id: 'line2', src:'line_2.png'}
			{id: 'pictures1', src:'pictures_1.png'}
			{id: 'pictures2', src:'pictures_2.png'}
			{id: 'run1', src:'run_1.png'}
			{id: 'run2', src:'run_2.png'}
			{id: 'trash1', src:'trash_1.png'}
			{id: 'trash2', src:'trash_2.png'}
		]
		sounds = [
			{src:'sounds/TU2_U1_A1_Instructions.mp3', id:'instructions'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			answers: [
				{id:'animals', a: false}
				{id:'art', a: false}
				{id:'cellphone', a: false}
				{id:'drink', a: false}
				{id:'fish', a: false}
				{id:'line', a: false}
				{id:'pictures', a: false}
				{id:'run', a: false}
				{id:'trash', a: false}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @game.answers[..]
		for answer in @answers
			answer.a = false
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Look and drag the parts of the sentences to the speech bubbles.', 40, 100
		@insertBitmap 'teacher', 'teacher', stageSize.w / 2, 124, 'tc'
		@insertBitmap 'repeat', 'repeat', stageSize.w / 2, 310, 'tc'
		@insertSprite 'choose1', ['animals1', 'art1', 'cellphone1', 'drink1', 'fish1', 'line1', 'pictures1', 'run1', 'trash1'], {animals:0, art:1, cellphone:2, drink:3, fish:4, line:5, pictures:6, run:7, trash:8}, 285, 452, 'mc'
		@insertSprite 'choose2', ['animals2', 'art2', 'cellphone2', 'drink2', 'fish2', 'line2', 'pictures2', 'run2', 'trash2'], {animals:0, art:2, cellphone:2, drink:3, fish:4, line:5, pictures:6, run:7, trash:8}, 520, 452, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 10, 0
		@introEvaluation()
	introEvaluation: ->
		super
		@library['choose1'].alpha = 0
		@library['choose1'].scaleX = @library['choose1'].scaleY = 0.3
		@library['choose2'].alpha = 0
		@library['choose2'].scaleX = @library['choose2'].scaleY = 0.3
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['teacher'], 1, {alpha: 0, y: @library['teacher'].y + 50, delay: 1}
		TweenLite.from @library['repeat'], 1, {alpha: 0, y: @library['repeat'].y + 50, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@showPhrase()
		@library['choose1'].addEventListener 'click', @evaluateAnswer
		@library['choose2'].addEventListener 'click', @evaluateAnswer
		@library['repeat'].addEventListener 'click', @repeat
	evaluateAnswer: (e) =>
		@answer = e.target
		if @phrase.id is @answer.currentAnimation
			selection = @answers.where id:@phrase.id
			selection[0].a = on
			createjs.Sound.play 'good'
			@library['choose1'].removeEventListener 'click', @evaluateAnswer
			@library['choose2'].removeEventListener 'click', @evaluateAnswer
			setTimeout @finishEvaluation, 1 * 1000
		else
			TweenMax.to [@library['choose1'], @library['choose2']], 1, {alpha: 0, scaleX: 0.3, scaleY: 0.3, ease:Elastic.easeOut, onComplete: @showPhrase}
			@warning()
	finishEvaluation: =>
		@library['score'].plusOne()
		TweenMax.to [@library['choose1'], @library['choose2']], 1, {alpha: 0, scaleX: 0.3, scaleY: 0.3, ease:Elastic.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
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
		@library["choose#{rand}"].gotoAndStop @phrase.id
		@library["choose#{other}"].gotoAndStop others[fake].id
		createjs.Sound.play "s#{@phrase.id}"
		@library['choose1'].addEventListener 'click', @evaluateAnswer
		@library['choose2'].addEventListener 'click', @evaluateAnswer
		TweenMax.to [@library['choose1'], @library['choose2']], 1, {alpha: 1, scaleX: 1, scaleY: 1, ease:Elastic.easeOut}
	getPhrase: ->
		possible = @answers.filter (answer) ->
			answer.a is off
		id = Math.floor Math.random() * possible.length
		possible[id]
	repeat: (e) =>
		createjs.Sound.stop()
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
		TweenLite.to @library['teacher'], 1, {alpha: 0, y: @library['teacher'].y + 50, delay: 0.1}
		TweenLite.to @library['repeat'], 1, {alpha: 0, y: @library['repeat'].y + 50, delay: 0.1}
		super
	window.U1A1 = U1A1