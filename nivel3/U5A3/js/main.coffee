class U2A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'prof', src: 'prop_teacher.png'}
			{id: 'repeat', src: 'btn_repeat.png'}

			{id:'electricity1', src:'electricity_1.png'}
			{id:'electricity2', src:'electricity_2.png'}
			{id:'gasoline1', src:'gasoline_1.png'}
			{id:'gasoline2', src:'gasoline_2.png'}
			{id:'lights1', src:'lights_1.png'}
			{id:'lights2', src:'lights_2.png'}
			{id:'plasticbags1', src:'plasticbags_1.png'}
			{id:'plasticbags2', src:'plasticbags_2.png'}
			{id:'pollair1', src:'pollair_1.png'}
			{id:'pollair2', src:'pollair_2.png'}
			{id:'pollwater1', src:'pollwater_1.png'}
			{id:'pollwater2', src:'pollwater_2.png'}
			{id:'recycle1', src:'recycle_1.png'}
			{id:'recycle2', src:'recycle_2.png'}
			{id:'species1', src:'species_1.png'}
			{id:'species2', src:'species_2.png'}
			{id:'teeth1', src:'teeth_1.png'}
			{id:'teeth2', src:'teeth_2.png'}
			{id:'transport1', src:'transport_1.png'}
			{id:'transport2', src:'transport_2.png'}
			{id:'trash1', src:'trash_1.png'}
			{id:'trash2', src:'trash_2.png'}
			{id:'water1', src:'water_1.png'}
			{id:'water2', src:'water_2.png'}

		]
		sounds = [
			{src:'sounds/TU2_U2_A2_instructions.mp3', id:'instructions'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'selectricity1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'sgasoline1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'slights1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'splasticbags1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'spollair1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'spollwater1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'srecycle1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'sspecies1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'steeth1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'stransport1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'strash1'}
			{src:'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3', id:'swater1'}
		
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			answers: [
				{id:'electricity1', a:false}
				{id:'gasoline1', a:false}
				{id:'lights1', a:false}
				{id:'plasticbags1', a:false}
				{id:'pollair1', a:false}
				{id:'pollwater1', a:false}
				{id:'recycle1', a:false}
				{id:'species1', a:false}
				{id:'teeth1', a:false}
				{id:'transport1', a:false}
				{id:'trash1', a:false}
				{id:'water1', a:false}

			]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @game.answers[..]
		for answer in @answers
			answer.a = false
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and click on the correct picture.', 40, 100
		@insertBitmap 'teacher', 'prof', 550, stageSize.h / 2, 'mc'
		@insertBitmap 'repeat', 'repeat', 610, stageSize.h / 2 + 140, 'mc'
		@insertSprite 'choose1', ['electricity1', 'gasoline1', 'lights1', 'plasticbags1', 'pollair1', 'pollwater1', 'recycle1', 'species1', 'teeth1', 'transport1', 'trash1', 'water1'], {'electricity1':0, 'gasoline1':1, 'lights1':2, 'plasticbags1':3, 'pollair1':4, 'pollwater1':5, 'recycle1':6, 'species1':7, 'teeth1':8, 'transport1':9, 'trash1':10, 'water1':11}, 240, 222, 'mc'
		@insertSprite 'choose2', ['electricity2', 'gasoline2', 'lights2', 'plasticbags2', 'pollair2', 'pollwater2', 'recycle2', 'species2', 'teeth2', 'transport2', 'trash2', 'water2'], {'electricity2':0, 'gasoline2':1, 'lights2':2, 'plasticbags2':3, 'pollair2':4, 'pollwater2':5, 'recycle2':6, 'species2':7, 'teeth2':8, 'transport2':9, 'trash2':10, 'water2':11}, 240, 432, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 14, 0
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
			selection = @answers.where id: @phrase.id
			selection[0].a = on
			createjs.Sound.play 'good'
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