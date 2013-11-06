class WordCompleter
	constructor: (name, text, label, bgcolor, stcolor, x, y, w=100, h=20)->
		@initialize name, text, label, bgcolor, stcolor, x, y, w, h
	WordCompleter.prototype = new createjs.Container()
	WordCompleter::Container_initialize = WordCompleter::initialize
	WordCompleter::initialize = (name, text, label, bgcolor, stcolor, x, y, w, h)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@label = new createjs.Text label, '26px Quicksand', '#333'
		@label.x = w + 10
		@text = new createjs.Text text,'26px Quicksand','#333'
		@graphic = new createjs.Graphics().beginFill( bgcolor ).drawRect( 0, 0, w, h ).setStrokeStyle( 3 ).beginStroke( stcolor ).moveTo( 0, h ).lineTo( w, h );
		@shape = new createjs.Shape @graphic
		@text.textAlign = 'center'
		@text.x = w / 2
		@addChild @shape, @text, @label
		false
	changeLabel: (text)->
		@label.text = text
	changeText: (text) ->
		@text.text = text
		@text.textAlign = 'center'
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	window.WordCompleter = WordCompleter