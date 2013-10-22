class WordCompleter
	constructor: (name, after_label, text, before_label, bgcolor, stcolor, x, y, w=100, h=20)->
		@initialize name, after_label, text, before_label, bgcolor, stcolor, x, y, w, h
	WordCompleter.prototype = new createjs.Container()
	WordCompleter::Container_initialize = WordCompleter::initialize
	WordCompleter::initialize = (name, after_label, text, before_label, bgcolor, stcolor, x, y, w, h)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@alabel = new createjs.Text after_label, '26px Arial', '#333'
		@text = new createjs.Text text,'26px Arial','#333'
		@blabel = new createjs.Text before_label, '26px Arial', '#333'
		@graphic = new createjs.Graphics().beginFill( bgcolor ).drawRect( 0, 0, w, h ).beginStroke( stcolor ).moveTo( 0, h ).lineTo( w, h );
		@shape = new createjs.Shape @graphic
		@text.textAlign = 'center'
		@shape.x = @alabel.getMeasuredWidth() 
		@text.x = @alabel.getMeasuredWidth() + w / 2
		@blabel.x = @alabel.getMeasuredWidth() + w
		@width = @alabel.getMeasuredWidth() + w + @blabel.getMeasuredWidth()
		@addChild @shape, @alabel, @text, @blabel
		false
	changeAfterLabel: (text)->
		@label.text = text
	changeBeforeLabel: (text)->
		@label.text = text
	changeText: (text) ->
		@text.text = text
		@text.textAlign = 'center'
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	window.WordCompleter = WordCompleter