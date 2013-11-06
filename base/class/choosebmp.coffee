class ChooseBitmap
	constructor: (name, img1, img2, success, x, y)->
		@initialize name, img1, img2, success, x, y
	ChooseBitmap.prototype = new createjs.Container()
	ChooseBitmap::Container_initialize = ChooseBitmap::initialize
	ChooseBitmap::initialize = (name, img1, img2, success, x, y)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@pos = x:x, y:y
		@success = success
		@firstOption = new createjs.Bitmap img1
		@firstOption.width = img1.width
		@firstOption.index = 1
		@secondOption = new createjs.Bitmap img2
		@secondOption.width = img2.width
		@secondOption.x = @firstOption.width + 20
		@secondOption.index = 2
		@firstOption.addEventListener 'click', @_dispatchEvent
		@secondOption.addEventListener 'click', @_dispatchEvent
		@addChild @firstOption, @secondOption
		false
	_dispatchEvent: (e) =>
		@dispatchEvent {type:'selection', success: e.target.index is @success}
	window.ChooseBitmap = ChooseBitmap