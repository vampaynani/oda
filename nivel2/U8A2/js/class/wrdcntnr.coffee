class WordContainer
	constructor: (name, text, bgcolor, stcolor, x, y, w=100, h=20)->
		@initialize name, text, bgcolor, stcolor, x, y, w, h
	WordContainer.prototype = new createjs.Container()
	WordContainer::Container_initialize = WordContainer::initialize
	WordContainer::initialize = (name, text, bgcolor, stcolor, x, y,w=10, h=20)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@text = new createjs.Text text,'24px Arial','#333'
		@graphic = new createjs.Graphics().beginFill( bgcolor ).drawRect( 0, 0,  @text.getMeasuredWidth()+10, @text.getMeasuredHeight()).beginStroke( stcolor ).moveTo( 0, @text.getMeasuredHeight() ).lineTo(  @text.getMeasuredWidth()+10, @text.getMeasuredHeight());
		@shape = new createjs.Shape @graphic
		@w = @text.getMeasuredWidth()

		@text.x = w / 2

		@addChild @shape 
		false
	changeText: (text) ->
		@text.text = text
		@text.textAlign = 'center'
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.2, {alpha:.2, repeat:-1, yoyo:true}  if state
	window.WordContainer = WordContainer