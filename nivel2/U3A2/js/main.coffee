class U3A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
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
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game = {
			common: [
				{id:'mattno', x: 1212, y: 232 }
				{id:'mattyes', x: 928, y: 242 }
				{id:'patno', x: 548, y: 248 }
				{id:'patyes', x: 254, y: 246 }
				{id:'labelmatt', x: 1138, y: 466 }
				{id:'labelpat', x: 470, y: 466 }
			]
			buttons: [
				{id:'btnYesTheyDo', x: 332, y: 970}
				{id:'btnYesHeDoes', x: 722, y: 970}
				{id:'btnYesSheDoes',  x: 1110, y: 970}
				{id:'btnNoTheyDont',  x: 332, y: 1078}
				{id:'btnNoHeDoesnt',  x: 722, y: 1078}
				{id:'btnNoSheDoesnt', x: 1110, y: 1078}
			]
			m1: [
				{id:'lineastable1', x: 300, y: 490}
				{id:'table1foodmattno', x: 1188, y: 570}
				{id:'table1foodmattyes', x: 848, y: 588}
				{id:'table1foodpatno', x: 530, y: 638}
				{id:'table1foodpatyes', x: 168, y: 612}		

			]
			m2: [
				{id:'lineastable2', x: 364, y: 432}
				{id:'table2foodmattyes', x: 862, y: 620}
				{id:'table2foodmattno', x: 1224, y: 614}
				{id:'table2foodpatno', x: 568, y: 626}
				{id:'table2foodpatyes', x: 162, y: 640} 
			]
			m3: [
				{id:'lineastable3', x: 326, y: 454}
				{id:'table3foodpatyes', x: 192, y: 622}
				{id:'table3foodmattno', x: 1258, y: 666}
				{id:'table3foodmattyes',  x: 894, y: 622}
				{id:'table3foodpatno',  x: 510, y: 654}
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
		@insertInstructions 'instructions', 'Read, follow the lines and click on the correct answer.', 80, 200
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 40, 1000, 18, 0
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
		@phrase = new createjs.Text '', '40px Arial', '#333333'
		@phrase.name = 'phrase'
		@phrase.textAlign = 'center'
		@phrase.x = stageSize.w / 2
		@phrase.y = 880
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
		TweenLite.from @library['common'], 1, {alpha:0, y: @library['common'].y - 40, delay: 1}
		TweenLite.from @library['menu'], 1, {alpha :0, y: @library['menu'].y - 40, delay: 1.2, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		@a_index = 0
		@phrase.text = @answers[@index].values[@a_index].text
		for i in [1..@game.buttons.length] by 1
			@library["b#{i}"].index = i
			@library["b#{i}"].addEventListener 'click', @evaluateClick
		TweenLite.from @library['phrase'], 1, {alpha: 0}
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
		TweenLite.to @library['menu'], 1, {alpha: 0, y: @library['menu'].y - 40, ease: Back.easeOut, onComplete: @nextEvaluation}
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
		TweenLite.to @library['common'], 1, {alpha:0, y: @library['common'].y - 40}
		TweenLite.to @library['menu'], 1, {alpha :0, y: @library['menu'].y - 40}
		super
	window.U3A2 = U3A2