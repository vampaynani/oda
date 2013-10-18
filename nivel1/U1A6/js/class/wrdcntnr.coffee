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
		@text = new createjs.Text text,'20px Arial','#333'
		@graphic = new createjs.Graphics().beginStroke( stcolor ).beginFill( bgcolor ).drawRect( 0, 0, w, h );
		@shape = new createjs.Shape @graphic
		@text.textAlign = 'center'
		@text.x = w / 2
		@addChild @shape, @text
		false
	changeText: (text) ->
		@text.text = text
		@text.textAlign = 'center'
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	window.WordContainer = WordContainer