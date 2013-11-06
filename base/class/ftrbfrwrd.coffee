class AfterBeforeWord
	constructor: (name, after_label, text, before_label, bgcolor, stcolor, x, y, w=100, h=20)->
		@initialize name, after_label, text, before_label, bgcolor, stcolor, x, y, w, h
	AfterBeforeWord.prototype = new createjs.Container()
	AfterBeforeWord::Container_initialize = AfterBeforeWord::initialize
	AfterBeforeWord::initialize = (name, after_label, text, before_label, bgcolor, stcolor, x, y, w, h)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@alabel = new createjs.Text after_label, '26px Quicksand', '#333'
		@text = new createjs.Text text,'26px Quicksand','#333'
		@blabel = new createjs.Text before_label, '26px Quicksand', '#333'
		@graphic = new createjs.Graphics().beginFill( bgcolor ).drawRect( 0, 0, w, h ).setStrokeStyle( 3 ).beginStroke( stcolor ).moveTo( 0, h ).lineTo( w, h );
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
	window.AfterBeforeWord = AfterBeforeWord