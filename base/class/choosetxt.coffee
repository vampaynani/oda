class ChooseText
	constructor: (name, text1, text2, success, x, y)->
		@initialize name, text1, text2, success, x, y
	ChooseText.prototype = new createjs.Container()
	ChooseText::Container_initialize = ChooseText::initialize
	ChooseText::initialize = (name, text1, text2, success, x, y)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@pos = x:x, y:y
		@success = success
		@firstOption = new ClickableText text1, text1, 1, 0, 0
		@slash = new createjs.Text '/', '16px Quicksand', '#333333'
		@slash.x = @firstOption.x + @firstOption.width
		@secondOption = new ClickableText text2, text2, 2, @slash.x + @slash.getMeasuredWidth() + 10, 0
		@firstOption.addEventListener 'click', @_dispatchEvent
		@secondOption.addEventListener 'click', @_dispatchEvent
		@addChild @firstOption, @slash, @secondOption
		false
	_dispatchEvent: (e) =>
		@dispatchEvent {type:'selection', success: e.target.index is @success}
	window.ChooseText = ChooseText