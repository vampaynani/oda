class Score
	constructor: (name, back, front, x, y, total, count)->
		@initialize name, back, front, x, y, total, count
	Score.prototype = new createjs.Container()
	Score::Container_initialize = Score::initialize
	Score::initialize = (name, back, front, x, y, total, count)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@counter = 0
		@bmpBack = new createjs.Bitmap back
		@bmpFront = new createjs.Bitmap front
		@txtTotal = new createjs.Text total, '24px Quicksand', '#666666'
		@txtCount = new createjs.Text count, '24px Quicksand', '#FFFFFF'

		@bmpBack.x = front.width / 4 * 2
		@bmpBack.y = front.height / 4 * 2
		@txtTotal.text = total
		@txtTotal.textAlign = 'center'
		@txtTotal.x = @bmpBack.x + back.width / 2
		@txtTotal.y = @bmpBack.y + back.height / 2 - @txtTotal.getMeasuredHeight() / 2
		@txtCount.text = count
		@txtCount.textAlign = 'center'
		@txtCount.x = @bmpFront.x + front.width / 2
		@txtCount.y = @bmpFront.y + front.height / 2 - @txtCount.getMeasuredHeight() / 2
		@addChild @bmpFront, @txtCount, @bmpBack, @txtTotal
		false
	reset: ->
		@counter = 0
		@updateCount @counter
	plusOne: ->
		@counter++
		@updateCount @counter
	updateTotal: (txt) ->
		@txtTotal.text = txt
	updateCount: (txt) ->
		@txtCount.text = txt
	window.Score = Score