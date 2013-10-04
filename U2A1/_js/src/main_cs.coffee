class Draggable
	constructor: (@name, @img, @side, @sel, @x, @y)->
		@initialize name, img, side, sel, x, y

class U1A1
	constructor: -> 
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
		false

$(document).ready ->
	u1a1 = new U1A1()
	u1a1.init()
	false

class window.Test
 
  constructor: ->
    @stage = new createjs.Stage(document.getElementById 'canvas')
    @circle = {x: 10, y: 20, r: 10}
    TweenLite.to(@circle, 2, {delay: 2, x: 500, y: 20, ease: Elastic.easeOut})
    createjs.Ticker.addListener @
 
  drawCircle: =>
    circle = new createjs.Shape()
    circle.graphics.beginFill('#606').drawCircle(@circle.x, @circle.y, @circle.r)
    @stage.addChild(circle)
 
  tick: ->
    @stage.removeAllChildren()
    @drawCircle()
    @stage.update()
 
window.init = ->
  new Test()