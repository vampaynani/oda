class Observer
	constructor: ->
		@subscribers = []
	notify: (item) ->
		subscriber.callback(item) for subscriber in @subscribers when subscriber.item is item
	subscribe: (to, onNotify) ->
		@subscribers.push {'item':to, 'callback':onNotify}
	window.Observer = Observer