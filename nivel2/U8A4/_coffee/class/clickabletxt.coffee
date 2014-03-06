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
		@text = new createjs.Text text, '32px Quicksand', '#333333'
		@width = @text.getMeasuredWidth() + 20
		@height = @text.getMeasuredHeight() + 6
		hit = new createjs.Shape()
		hit.graphics.beginFill('#000').drawRect(-10, -6, @text.getMeasuredWidth() + 40, @text.getMeasuredHeight() + 12)
		@text.hitArea = hit
		@addChild @text
		false
	setLineWidth: (width) ->
		@text.lineWidth = width
		h = @text.getMeasuredHeight() + 12
		w = if @width > width then width + 20 else @width 
		hit = new createjs.Shape()
		switch @text.textAlign
			when 'left' then hit.graphics.c().beginFill('rgba(0,0,0,0.1)').drawRect(0, 0, w, h)
			when 'center' then hit.graphics.c().beginFill('rgba(0,0,0,0.1)').drawRect(-w/2, 0, w, h)
			when 'right' then hit.graphics.c().beginFill('rgba(0,0,0,0.1)').drawRect(-w, 0, w, h)
		@text.hitArea = hit
		@width = w
		false
	window.ClickableText = ClickableText