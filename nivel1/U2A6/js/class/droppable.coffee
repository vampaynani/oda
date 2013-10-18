class Droppable
	constructor: (name, color, x, y, w, h)->
		@initialize name, color, x, y, w, h
	Droppable.prototype = new createjs.Container()
	Droppable::Container_initialize = Droppable::initialize
	Droppable::initialize = (name, color, x, y, w, h)->
		@Container_initialize()
		@name = name
		@x = x
		@y = y
		@graphic = new createjs.Graphics().beginFill( color ).drawRect( 0, 0, w, h)
		@shape = new createjs.Shape @graphic
		@addChild @shape
		false
	window.Droppable = Droppable