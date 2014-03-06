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
		@text = new createjs.Text text, '40px Quicksand', '#333333'
		@w = if @text.getMeasuredWidth() + 20 > 80 then @text.getMeasuredWidth() + 20 else 80 
		@h = if @text.getMeasuredHeight() + 12 > 60 then @text.getMeasuredHeight() + 12 else 40
		hit = new createjs.Shape()
		hit.graphics.beginFill('#000').drawRect(-10, -6, @w, @h)
		@text.hitArea = hit
		@addChild @text
		false
	window.ClickableLetter = ClickableLetter