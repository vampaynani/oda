class U3A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'inst', src: 'texto_look.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
 
			{id: 'guia1', src:'guia1.png'}
			{id: 'guia2', src:'guia2.png'}
			{id: 'guia3', src:'guia3.png'}
 
			{id: 'btnNoHeDoesnt', src:'btn_NoHeDoesnt.png'}
			{id: 'btnNoSheDoesnt', src:'btn_NoSheDoesnt.png'}
			{id: 'btnNoTheyDont', src:'btn_NoTheyDont.png'}
			{id: 'btnYesHeDoes', src:'btn_YesHeDoes.png'}
			{id: 'btnYesSheDoes', src:'btn_YesSheDoes.png'}
			{id: 'btnYesTheyDo', src:'btn_YesTheyDo.png'}
 
			{id: 'mattno', src:'matt_no.png'}
			{id: 'mattyes', src:'matt_yes.png'}
			{id: 'patno', src:'pat_no.png'}
			{id: 'patyes', src:'pat_yes.png'}
 
			{id: 'labelmatt', src:'label_matt.png'}
			{id: 'labelpat', src:'label_pat.png'}
 
			{id: 'lineastable1', src:'lineas-table1.png'}
			{id: 'lineastable2', src:'lineas-table2.png'}
			{id: 'lineastable3', src:'lineas-table3.png'}
 
			{id: 'table1foodmattno', src:'table1/food_matt_no.png'}
			{id: 'table1foodmattyes', src:'table1/food_matt_yes.png'}
			{id: 'table1foodpatno', src:'table1/food_pat_no.png'}
			{id: 'table1foodpatyes', src:'table1/food_pat_yes.png'}
			{id: 'table2foodmattno', src:'table2/food_matt_no.png'}
			{id: 'table2foodmattyes', src:'table2/food_matt_yes.png'}
			{id: 'table2foodpatno', src:'table2/food_pat_no.png'}
			{id: 'table2foodpatyes', src:'table2/food_pat_yes.png'}
			{id: 'table3foodmattno', src:'table3/food_matt_no.png'}
			{id: 'table3foodmattyes', src:'table3/food_matt_yes.png'}
			{id: 'table3foodpatno', src:'table3/food_pat_no.png'}
			{id: 'table3foodpatyes', src:'table3/food_pat_yes.png'}
		]
		sounds = [
			{src:'sounds/boing.mp3', id:'boing'}
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U3_A2_instructions.mp3', id:'instructions'}
		]
		@game = {
			common: [
				{id:'mattno', x:'606' , y:'116' }
				{id:'mattyes',  x:'464' , y:'121' }
				{id:'patno',  x:'274' , y:'124' }
				{id:'patyes', x:'127' , y:'123' }
				{id:'labelmatt',  x:'569' , y:'233' }
				{id:'labelpat', x:'235' , y:'233' }
			]
			buttons: [
				{id:'btnYesTheyDo', x:'166' , y:'485' }
				{id:'btnYesHeDoes', x:'361' , y:'485' }
				{id:'btnYesSheDoes',  x:'555' , y:'485' }
				{id:'btnNoTheyDont',  x:'166' , y:'539' }
				{id:'btnNoHeDoesnt',  x:'361' , y:'539' }
				{id:'btnNoSheDoesnt', x:'555' , y:'539' }
			]
			m1: [
				{id:'lineastable1', x:'150' , y:'245' }
				{id:'table1foodmattno',  x:'594' , y:'285' }
				{id:'table1foodmattyes',  x:'424' , y:'294' }
				{id:'table1foodpatno', x:'265' , y:'319' }
				{id:'table1foodpatyes',  x:'84' , y:'306' }		

			]
			m2: [
				{id:'lineastable2', x:'182' , y:'216' }
				{id:'table2foodmattyes', x:'431' , y:'310' }
				{id:'table2foodmattno', x:'612' , y:'307' }
				{id:'table2foodpatno', x:'284' , y:'313' }
				{id:'table2foodpatyes',  x:'81' , y:'320' } 
			]
			m3: [
				{id:'lineastable3', x:'163' , y:'227' }
				{id:'table3foodpatyes', x:'96' , y:'311' }
				{id:'table3foodmattno', x:'629' , y:'333' }
				{id:'table3foodmattyes',  x:'447' , y:'311' }
				{id:'table3foodpatno',  x:'255' , y:'327' }
			]
		}
		@answers = [
			{
				values: [
					{text:'Does Pat like salad?', index:6}
					{text:'Does Matt like beets?', index: 5}
					{text:'Do Pat and Matt like beets?', index: 4}
					{text:'Does Pat like corn?', index: 3}
					{text:'Do Pat and Matt like steak?', index: 1}
					{text:'Does Matt like salad?', index: 2}
				]
			}
			{
				values: [
					{text:'Does Pat like pineapple?', index:6}
					{text:'Does Pat like ham?', index: 3}
					{text:'Does Matt like grapes?', index: 5}
					{text:'Do Matt and Pat like ham?', index: 1}
					{text:'Does Matt like eggs?', index: 5}
					{text:'Does Pat like grapes?', index: 3}
				]
			}
			{
				values: [
					{text:'Do Matt and Pat like milk?', index:1}
					{text:'Does Matt like cherries?', index: 2}
					{text:'Does Matt like cheese?', index: 5}
					{text:'Does Pat like milk?', index: 3}
					{text:'Does Pat like cherries?', index: 6}
					{text:'Do Matt and Pat like cucumbers?', index: 4}
				]
			}
		]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 18, 0
		@setCommon().setMenu(1).introEvaluation()
	setCommon: ->
		common = new createjs.Container()
		common.name = 'common'
		for value in @game.common
			v = @createBitmap value.id, value.id, value.x, value.y
			common.addChild v
			@addToLibrary v
		for i in [1..@game.buttons.length] by 1
			value = @game.buttons[i - 1]
			v = @createBitmap "b#{i}", value.id, value.x, value.y
			common.addChild v
			@addToLibrary v
		@phrase = new createjs.Text '', '20px Arial', '#333333'
		@phrase.name = 'phrase'
		@phrase.textAlign = 'center'
		@phrase.x = stageSize.w / 2
		@phrase.y = 440
		@addToMain common, @phrase
		@
	setMenu: (num) ->
		menu = new createjs.Container()
		menu.name = 'menu'
		for value in @game["m#{num}"]
			v = @createBitmap value.id, value.id, value.x, value.y
			menu.addChild v
			@addToLibrary v
		@addToMain menu
		@
	introEvaluation: ->
		super
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha:0, x: 0, delay: 0.5}
		TweenLite.from @library['common'], 1, {alpha:0, y: @library['common'].y - 20, delay: 1}
		TweenLite.from @library['menu'], 1, {alpha :0, y: @library['menu'].y - 20, delay: 1.2, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@a_index = 0
		@phrase.text = @answers[@index].values[@a_index].text
		for i in [1..@game.buttons.length] by 1
			@library["b#{i}"].index = i
			@library["b#{i}"].addEventListener 'click', @evaluateClick
		TweenLite.from @library['phrase'], 1, {alpha:0}
	evaluateClick: (e) =>
		@answer = e.target
		if @answer.index is @answers[@index].values[@a_index].index
			@library['score'].plusOne()
			createjs.Sound.play 'good'
		else
			@warning()
		TweenLite.to @library['phrase'], 1, {alpha:0, onComplete: @evaluateAnswer}
	evaluateAnswer: =>
		@a_index++
		if @a_index < @answers[@index].values.length
			@phrase.text = @answers[@index].values[@a_index].text
			TweenLite.to @library['phrase'], 1, {alpha:1}
		else
			setTimeout @finishEvaluation, 1 * 1000
	finishEvaluation: =>
		TweenLite.to @library['menu'], 1, {alpha: 0, y: @library['menu'].y - 20, ease: Back.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @answers.length
			@a_index = 0
			@phrase.text = @answers[@index].values[@a_index].text
			@setMenu @index + 1
			TweenLite.to @library['phrase'], 1, {alpha:1}
			TweenLite.to @library['menu'], 1, {alpha :1, y: 0}
		else
			@finish()
	finish: ->
		super
	window.U3A2 = U3A2