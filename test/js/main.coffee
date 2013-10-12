class U1A1 extends Oda
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
		TweenLite.from @library['header'], 1, {alpha:0, y:@library['header'].y-20}

	window.U1A1 = U1A1