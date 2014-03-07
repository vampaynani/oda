class Button
	constructor: (name, image, index, x, y)->
		@initialize name, image, index, x, y
	Button.prototype = new createjs.Container()
	Button::Container_initialize = Button::initialize
	Button::initialize = (name, image, index, x, y)->
		@Container_initialize()
		@name = name
		@bitmap = new createjs.Bitmap image
		@index = index
		@x = x
		@y = y
		@pos = x:x, y:y
		@addChild @bitmap
		false
	blink: (state=on) ->
		TweenMax.killTweensOf @
		@.alpha = 1
		TweenMax.to @, 0.5, {alpha:.2, repeat:-1, yoyo:true}  if state
	window.Button = Button