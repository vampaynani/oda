class U8A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'scene1', src:'btn_powhatan.png'}
			{id: 'scene2', src:'btn_alaska.png'}
 			{id: 'n1', src:'tag_verb.png'}
			{id: 'n2', src:'tag_pronoun.png'}
			{id: 'btnnoWas', src:'bt_noWas.png'}
			{id: 'btnnoWere', src:'bt_noWere.png'}
			{id: 'btnyesWas', src:'bt_yesWas.png'}
			{id: 'btnyesWere', src:'bt_yesWere.png'}

		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U8_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			common: [
				{id:'btnyesWas', x:0, y:0}
				{id:'btnyesWere', x:1, y:0}
				{id:'btnnoWas', x:0, y:1}
				{id:'btnnoWere', x:1, y:1}
			]	
			scenes : [
				{	
					steps: [
						{pattern:['#wc','there ','#wc',' village?'], targets: ['Was','a'], a:'yesWas'}
						{pattern:['#wc','there ','#wc',' trees?'], targets: ['Were','any'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' fish?'], targets: ['Were','any'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' lot of noise?'], targets: ['Was','a'], a:'noWas'}
						{pattern:['#wc','there ','#wc',' igloos?'], targets: ['Were','any'], a:'noWere'}
						{pattern:['#wc','there ','#wc',' deer?'], targets: ['Were','any'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' city?'], targets: ['Was','a'], a:'noWas'}
						{pattern:['#wc','there ','#wc',' cars?'], targets: ['Were','any'], a:'noWere'}
						{pattern:['#wc','there ','#wc',' clean water?'], targets: ['Was','any'], a:'yesWas'}
						{pattern:['#wc','there ','#wc',' canoes?'], targets: ['Were','any'], a:'yesWere'}
					]	
					opt1:[
						{i:1, t:'Was', x:60, y:15}
						{i:2, t:'Were', x:25, y:40}
					]
					opt2:[
						{i:1, t:'a', x:46, y:20}
						{i:2, t:'any', x:35, y:45}
					]
				}
				{	
					steps: [
						{pattern:['#wc','there ','#wc',' seals?'], targets: ['Were','any'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' wigwams?'], targets: ['Were','any'], a:'noWere'}
						{pattern:['#wc','there ','#wc',' garbage dump?'], targets: ['Was','a'], a:'noWas'}
						{pattern:['#wc','there ','#wc',' railroad?'], targets: ['Was','a'], a:'noWas'}
						{pattern:['#wc','there ','#wc',' igloos?'], targets: ['Were','a'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' foxes?'], targets: ['Were','any'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' snow?'], targets: ['Was','any'], a:'yesWas'}
						{pattern:['#wc','there ','#wc',' owls?'], targets: ['Were','any'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' children?'], targets: ['Were','any'], a:'yesWere'}
						{pattern:['#wc','there ','#wc',' air pollution?'], targets: ['Was','any'], a:'noWas'}
					]	
					opt1:[
						{i:1, t:'Was', x:25, y:35}
						{i:2, t:'Were', x:70, y:70}
					]
					opt2:[
						{i:1, t:'a', x:26, y:20}
						{i:2, t:'any', x:50, y:72}
					]
				}	
			
			]
		super null, manifest, sounds
	setStage: ->
		super
		@escena = 1
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertInstructions 'instructions', 'Click on one of the pictures. Drag the words to make a question. Then click on the answer.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 20, 0
		@setScene( 1 ).setDropper( 1 ).setNube1().setNube2().setBtn().introEvaluation()
	setScene: (scene) ->
		@scene = @game.scenes[scene - 1]
		@intento = 0
		@sc = @createBitmap "scene", "scene#{scene}", 120, 150
		@addToMain @sc
		@
	setDropper: (step) ->
		@step = step
		if @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()

		i = 0
		npos = 0
		for t in @scene.steps[step - 1].pattern
			if t is '#wc'
				txt = @scene.steps[step - 1].targets[i]
				h = new WordContainer "h#{i}", '', '#FFF', '#F00', npos, 5
				h.index = i
				dropper.addChild h
				@addToLibrary h
				npos += h.width + 10
				i++
			else
				h = @createText '', t,'24px Quicksand','#333', npos, 0
				dropper.addChild h
				npos += h.getMeasuredWidth() + 20
		dropper.x = npos / 2
		dropper.y = 380

		@
	setNube1: ->
		container = new createjs.Container()
		container.x = 600
		container.y = 180
		container.name = 'nube1'
		container.removeAllChildren()

		back = @createBitmap 'backNube1', 'n1', 0, 0
		container.addChild back

		for opt in @scene.opt1
			d = new DroppableText "n1d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	setNube2: ->
		container = new createjs.Container()
		container.x = 600
		container.y = 280
		container.name = 'nube2'
		container.removeAllChildren()
		back = @createBitmap 'backNube2', 'n2', 0, 0
		container.addChild back

		for opt in @scene.opt2
			d = new DroppableText "n2d#{opt.i}", opt.t, opt.t, opt.x, opt.y, @stage
			container.addChild d
			@addToLibrary d
		
		@addToMain container
		@
	setBtn: ->
		container = new createjs.Container()
		container.x = 160
		container.y = 450
		container.name = 'btns'
		for i in [0..3]
			a = @createBitmap @game.common[i].id, @game.common[i].id,  @game.common[i].x * 260, @game.common[i].y * 60
			container.addChild a

		@addToMain container
		@
	introEvaluation: ->
		super
		TweenLite.from @library.header, 1, {y:-@library.header.height}
		TweenLite.from @library.instructions, 1, {alpha: 0, x: 0, delay: 0.5}
		TweenLite.from @library.scene, 1, {alpha: 0, y: @library.scene.y + 20, delay: 1}
		TweenLite.from @library.dropper, 1, {alpha: 0, y: @library.dropper.y + 20, delay: 1}
		TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20, delay: 1.5}
		TweenLite.from @library.btns, 1, {alpha: 0, y: @library.btns.y + 20, delay: 1.5}
		TweenLite.from @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
	initEvaluation: (e) =>
		super
		for opt in @scene.opt1
			@library["n1d#{opt.i}"].updateDrops @library.h0
			@library["n1d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n1d#{opt.i}"].initDragListener()
		for opt in @scene.opt2
			@library["n2d#{opt.i}"].updateDrops @library.h1
			@library["n2d#{opt.i}"].addEventListener 'dropped', @evaluateAnswer
			@library["n2d#{opt.i}"].initDragListener()
	evaluateAnswer: (e) =>
		@answer = e.target
		@drop = e.drop
		if @answer.index is @scene.steps[@step - 1].targets[@drop.index]
			@answer.visible = false
			@drop.changeText @answer.index
			if @intento is 0
				@library['score'].plusOne()
			@intento = 0
			createjs.Sound.play 'good'
			@finishEvaluation()
		else
			@warning()
			@intento = 1
			@answer.returnToPlace()
	finishEvaluation: =>
		if @library.h0.text.text is '' or @library.h1.text.text is ''
			return
		setTimeout @clearEvaluation, 1 * 1000
	clearEvaluation: (e) =>
		for opt in @scene.opt1
			@library["n1d#{opt.i}"].visible = true
			@library["n1d#{opt.i}"].returnToPlace()
		for opt in @scene.opt2
			@library["n2d#{opt.i}"].visible = true
			@library["n2d#{opt.i}"].returnToPlace()
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: @library.dropper.y + 20, onComplete: @nextEvaluation}
	nextEvaluation: =>
		@index++
		if @index < @scene.steps.length
			@setDropper @index + 1
			TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 390}
			for opt in @scene.opt1
				@library["n1d#{opt.i}"].updateDrops @library.h0
			for opt in @scene.opt2
				@library["n2d#{opt.i}"].updateDrops @library.h1
		else
			if @escena isnt 3
				@escena++
				@index = 0
				#TweenLite.to @library.sc, 0.5, {alpha: 0, y: @library.dropper.y + 20}
				@mainContainer.removeChild @sc
				TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20}
				TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20}
				@setScene( @escena ).setDropper(1).setNube1().setNube2().initEvaluation()
				TweenLite.from @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20}
				TweenLite.from @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20}
				TweenLite.to @library.dropper, 0.5, {alpha: 1, y: 390}
			else
				@finish()
	finish: ->
		TweenLite.to @library.scene, 1, {alpha: 0, y: @library.scene.y + 20}
		TweenLite.to @library.nube1, 1, {alpha: 0, y: @library.nube1.y + 20}
		TweenLite.to @library.nube2, 1, {alpha: 0, y: @library.nube2.y + 20}
		TweenLite.to @library.dropper, 0.5, {alpha: 0, y: 390}
		TweenLite.to @library.btns, 1, {alpha: 0, y: @library.btns.y + 20}
		super
	window.U8A2 = U8A2