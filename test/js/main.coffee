class U1A1 extends Oda
<<<<<<< HEAD
	constructor: -> 
		manifest = [
			{id: 'head', src:'head.png'}
			{id: 'yo', src:'nina_jugando.png'}
		]
		sounds = [
			{id: 'good', src:'boing.mp3'}
		]
		super null, manifest, sounds		
	setStage: ->
		super
		@insertBitmap 'header', 'head', 10, 12
		@insertBitmap 'pintura', 'yo', 20, 30, 'tr'
		@addToMain	new Score 'score', @preload.getResult('head'), @preload.getResult('yo'), 100, 100, 5, 0
		@introEvaluation()
	introEvaluation: ->
=======
	constructor: ->
		manifest = [
			{id:'head', src:'head.png'}
			{id:'borrar', src:'borrar.png'}
			{id:'c1', src:'circle1.png'}
			{id:'c2', src:'circle2.png'}
		]
		sounds = [
			{id:'good', src:'boring.mp3'}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', 10, 12
		@insertBitmap 'borrar', 'borrar', 30, 80, 'mc'
		@addToMain new Score 'score',@preload.getResult('c1'), @preload.getResult('c2'), 10, 100, 5 , 0
		@introEvaluation()
	introEvaluation:->
>>>>>>> 7661125581f1a81752bf70f8dce8706a705beb55
		TweenLite.from @library['header'], 1, {alpha:0, y:@library['header'].y-20}

	window.U1A1 = U1A1