class U1A4 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'teacher', src: 'teacher.png'}
			{id: 'repeat', src: 'repeat_btn.png'}
			{id:'arrive' , src: 'arrive_time.png'}
			{id:'quiet' , src: 'be_quiet.png'}
			{id:'bus' , src: 'bus_late.png'}
			{id:'eat' , src: 'eat_class.png'}
			{id:'aud' , src: 'run_aud.png'}
			{id:'run' , src: 'run_hall.png'}
			{id:'cafe' , src: 'trash_cafeteria.png'}
		    {id:'library' , src: 'talk_library.png'}
		    {id:'movies' , src: 'watch_movies.png'}
		    {id:'trash' , src: 'throw_trash.png'}
		    {id:'walk' , src: 'walk_hall.png'}
		]
		sounds = [
			{src:'sounds/TU2_U1_A4_instructions.mp3', id:'instructions'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U1_A4_arriveClass.mp3', id:'sarrive'}
		    {src:'sounds/TU2_U1_A4_beQuiet.mp3', id:'squiet'}
		    {src:'sounds/TU2_U1_A4_dontBeLate.mp3', id:'sbus'}
		    {src:'sounds/TU2_U1_A4_dontEat.mp3', id:'seat'}
		    {src:'sounds/TU2_U1_A4_dontRunAuditorium.mp3', id:'saud'}
		    {src:'sounds/TU2_U1_A4_dontRunHall.mp3', id:'srun'}
		    {src:'sounds/TU2_U1_A4_keepCafe.mp3', id:'scafe'}
		    {src:'sounds/TU2_U1_A4_sitQuietly.mp3', id:'smovies'}
		    {src:'sounds/TU2_U1_A4_talkQuietly.mp3', id:'slibrary'}
		    {src:'sounds/TU2_U1_A4_throwAway.mp3', id:'strash'}
		    {src:'sounds/TU2_U1_A4_walkHall.mp3', id:'swalk'}
			{src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = 
			answers: [
				{id:'arrive', a: false}
				{id:'quiet', a: false}
				{id:'bus', a: false}
				{id:'eat', a: false}
				{id:'aud', a: false}
				{id:'run', a: false}
				{id:'cafe', a: false}
				{id:'library', a: false}
				{id:'movies', a: false}
				{id:'trash', a: false}
				{id:'walk', a: false}
			]
		super null, manifest, sounds
	setStage: ->
		super
		@answers = @game.answers[..]
		for answer in @answers
			answer.a = false
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Listen and click on the correct picture.', 80, 200
		@insertBitmap 'teacher', 'teacher', 500, 268
		@insertBitmap 'repeat', 'repeat', 882, 420
		@insertSprite 'choose1', ['arrive','quiet','bus','eat','aud','run','cafe','library','movies','trash','walk'], {arrive:0, quiet:1, bus:2, eat:3, aud:4, run:5, cafe:6, library:7, movies:8, trash:9, walk:10}, 540, 904, 'mc'
		@insertSprite 'choose2', ['arrive','quiet','bus','eat','aud','run','cafe','library','movies','trash','walk'], {arrive:0, quiet:1, bus:2, eat:3, aud:4, run:5, cafe:6, library:7, movies:8, trash:9, walk:10}, 1182, 904, 'mc'
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 10, 0
		@introEvaluation()
	introEvaluation: ->
		super
		@library['choose1'].alpha = 0
		@library['choose1'].scaleX = @library['choose1'].scaleY = 0.6
		@library['choose2'].alpha = 0
		@library['choose2'].scaleX = @library['choose2'].scaleY = 0.6
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
		if @phrase.id is @answer.currentAnimation
			selection = @answers.where id:@phrase.id
			selection[0].a = on
			createjs.Sound.play 'good'
			@library['score'].plusOne()
			@library['choose1'].removeEventListener 'click', @evaluateAnswer
			@library['choose2'].removeEventListener 'click', @evaluateAnswer
			setTimeout @finishEvaluation, 1 * 1000
		else
			TweenMax.to [@library['choose1'], @library['choose2']], 1, {alpha: 0, scaleX: 0.6, scaleY: 0.6, ease:Elastic.easeOut, onComplete: @finishEvaluation}
			@warning()
	finishEvaluation: =>
		TweenMax.to [@library['choose1'], @library['choose2']], 1, {alpha: 0, scaleX: 0.6, scaleY: 0.6, ease:Elastic.easeOut, onComplete: @nextEvaluation}
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
		@library['choose1'].addEventListener 'click', @evaluateAnswer
		@library['choose2'].addEventListener 'click', @evaluateAnswer
		createjs.Sound.play "s#{@phrase.id}"
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
		TweenMax.to obj, 0.5, {alpha:0.5, repeat:-1, yoyo:true}  if state
	finish: ->
		TweenLite.to @library['teacher'], 1, {alpha: 0, y: @library['teacher'].y + 100, delay: 0.1}
		TweenLite.to @library['repeat'], 1, {alpha: 0, y: @library['repeat'].y + 100, delay: 0.1}
		super
	window.U1A4 = U1A4