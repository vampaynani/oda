class ChooseText
	constructor: (name, prev, text1, text2, comp, success, x, y)->
		@initialize name, prev, text1, text2, comp, success, x, y
	ChooseText.prototype = new createjs.Container()
	ChooseText::Container_initialize = ChooseText::initialize
	ChooseText::initialize = (name, prev, text1, text2, comp, success, x, y)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@pos = x:x, y:y
		@success = success
		@prev = new createjs.Text prev, '32px Quicksand', '#333333'
		@firstOption = new ClickableText text1, text1, 1, @prev.getMeasuredWidth() + 20, 0
		@slash = new createjs.Text '/', '32px Quicksand', '#333333'
		@slash.x = @firstOption.x + @firstOption.width
		@secondOption = new ClickableText text2, text2, 2, @slash.x + @slash.getMeasuredWidth() + 20, 0
		complement = comp ? ''
		@complement = new createjs.Text complement, '32px Quicksand', '#333333'
		@complement.x = @secondOption.x + @secondOption.width
		@width = @complement.x + @complement.getMeasuredWidth() + 20

		@firstOption.addEventListener 'click', @_dispatchSelection
		@secondOption.addEventListener 'click', @_dispatchSelection
		
		@addChild @prev, @firstOption, @slash, @secondOption, @complement
		false
	_dispatchSelection: (e) =>
		@dispatchEvent {type:'selection', success: e.currentTarget.index is @success}
	window.ChooseText = ChooseText