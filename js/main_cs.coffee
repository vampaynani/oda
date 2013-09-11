class Draggable
	constructor: (@name, @img, @side, @sel, @x, @y)->
		@initialize name, img, side, sel, x, y

U1A1: 
	init: ->
		preload = new createjs.LoadQueue false
		preload.addEventListener 'complete', @handleComplete
		preload.addEventListener 'progress', @handleProgress
		preload.loadManifest [
			{id:'isb', src: imgurl+'test.jpg'}
			{id:'isb', src: imgurl+'test1.jpg'}
		]
		false
	handleProgress: ->
		percent = Math.round preload.progress * 100
		$('#preloader').text percent+'%'
		false
	handleComplete: ->
		$('#preloader').hide()
		initAssets()
		setStage()
		setListeners()
		createjs.Ticker.addListener window
		createjs.Ticker.setFPS 60

$(document).ready ->
	u1a1 = new U1A1
	u1a1.init()