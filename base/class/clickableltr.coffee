class ClickableLetter
	constructor: (name, text, index, x, y)->
		@initialize name, text, index, x, y
	ClickableLetter.prototype = new createjs.Container()
	ClickableLetter::Container_initialize = ClickableLetter::initialize
	ClickableLetter::initialize = (name, text, index, x, y)->
		@Container_initialize()
		@name = name
		@index = index
		@x = x
		@y = y
		@pos = x:x, y:y
		@text = new createjs.Text text, '20px Quicksand', '#333333'
		@w = if @text.getMeasuredWidth() + 10 > 40 then @text.getMeasuredWidth() + 10 else 40 
		@h = if @text.getMeasuredHeight() + 6 > 30 then @text.getMeasuredHeight() + 6 else 30
		hit = new createjs.Shape()
		hit.graphics.beginFill('#000').drawRect(-5, -3, @w, @h)
		@text.hitArea = hit
		@addChild @text
		false
	window.ClickableLetter = ClickableLetter