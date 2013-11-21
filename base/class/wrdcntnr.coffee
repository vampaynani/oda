class WordContainer
	constructor: (name, text, bgcolor, stcolor, x, y, w=100, h=20)->
		@initialize name, text, bgcolor, stcolor, x, y, w, h
	WordContainer.prototype = new createjs.Container()
	WordContainer::Container_initialize = WordContainer::initialize
	WordContainer::initialize = (name, text, bgcolor, stcolor, x, y, w, h)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@text = new createjs.Text text,'24px Quicksand','#333'
		if text isnt ''
			w = @text.getMeasuredWidth() + 10
		@width = w
		@height = h
		@shape = new createjs.Shape(new createjs.Graphics().beginFill( bgcolor ).drawRect( 0, 0, w, h ).setStrokeStyle(3).beginStroke( stcolor ).moveTo( 0, h ).lineTo( w, h ));
		@text.text = ''
		@text.x = w / 2
		@text.y = h - @text.getMeasuredHeight()
		@addChild @shape, @text
		false
	setRectShape: (bgcolor, stcolor, thin, w, h) ->
		@shape.graphics = new createjs.Graphics().clear().beginFill( bgcolor ).setStrokeStyle( thin ).beginStroke( stcolor ).drawRect( 0, 0, w, h );
	changeText: (text) ->
		@text.text = text
		@text.textAlign = 'center'
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.2, {alpha:.2, repeat:-1, yoyo:true}  if state
	window.WordContainer = WordContainer