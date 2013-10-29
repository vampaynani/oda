class ClickableText
	constructor: (name, text, index, x, y)->
		@initialize name, text, index, x, y
	ClickableText.prototype = new createjs.Container()
	ClickableText::Container_initialize = ClickableText::initialize
	ClickableText::initialize = (name, text, index, x, y)->
		@Container_initialize()
		@name = name
		@index = index
		@x = x
		@y = y
		@pos = x:x, y:y
		@text = new createjs.Text text, '16px Arial', '#333333'
		@width = @text.getMeasuredWidth()
		@height = @text.getMeasuredHeight()
		hit = new createjs.Shape()
		hit.graphics.beginFill('#000').drawRect(0, 0, @text.getMeasuredWidth(), @text.getMeasuredHeight())
		@text.hitArea = hit
		@addChild @text
		false
	window.ClickableText = ClickableText