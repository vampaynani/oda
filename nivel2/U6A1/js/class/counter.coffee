class Counter
	constructor: (name, count, back, x, y)->
		@initialize name, count, back, x, y
	Counter.prototype = new createjs.Container()
	Counter::Container_initialize = Counter::initialize
	Counter::initialize = (name, count, back, x, y)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@count = count
		@text = new createjs.Text @count, '24px Arial', '#ffffff'
		@text.textAlign = 'center'
		@text.x = 30
		@text.y = 5
		shape = new createjs.Shape()
		shape.graphics.beginFill( back ).drawRoundRect(0, 0, 60, 36, 10)
		@addChild shape, @text
		false
	start: ->
		@time = setInterval @doCount, 1000
	doCount: =>
		if @count > 0
			@count--
			@text.text = @count	
			@dispatchEvent 'timer_event'
		else
			clearInterval @time 
			@dispatchEvent 'timer_complete'
	stop: ->
		clearInterval @time 
	window.Counter = Counter