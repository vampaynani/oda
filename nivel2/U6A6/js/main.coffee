class U6A6 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'inst', src: 'inst.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'crossWords',  src: 'cruci.png'}
			{id: 'btn3', src:'btn_chef.png'}
			{id: 'btn1', src:'btn_doctor.png'}
			{id: 'btn8', src:'btn_firefighter.png'}
			{id: 'btn2', src:'btn_mechanic.png'}
			{id: 'btn6', src:'btn_police.png'}
			{id: 'btn4', src:'btn_salesclerk.png'}
			{id: 'btn7', src:'btn_vet.png'}
			{id: 'btn5', src:'btn_waiter.png'}
			{id: 'numberchef', src:'number_chef.png'}
			{id: 'numberdoctor', src:'number_doctor.png'}
			{id: 'numberfirefighter', src:'number_firefighter.png'}
			{id: 'numbermechanic', src:'number_mechanic.png'}
			{id: 'numberpolice', src:'number_police.png'}
			{id: 'numbersalesclerk', src:'number_salesclerk.png'}
			{id: 'numbervet', src:'number_vet.png'}
			{id: 'numberwaiter', src:'number_waiter.png'}
			{id: 'personchef', src:'person_chef.png'}
			{id: 'persondoctor', src:'person_doctor.png'}
			{id: 'personfirefighter', src:'person_firefighter.png'}
			{id: 'personmechanic', src:'person_mechanic.png'}
			{id: 'personpolice', src:'person_police.png'}
			{id: 'personsalesclerk', src:'person_salesclerk.png'}
			{id: 'personvet', src:'person_vet.png'}
			{id: 'personwaiter', src:'person_waiter.png'}
			{id: 'prophelper', src:'prop_helper.png'}

			{id: 'aLetra', src: 'a.png'}
			{id: 'bLetra', src: 'b.png'}
			{id: 'cLetra', src: 'c.png'}
			{id: 'dLetra', src: 'd.png'}
			{id: 'eLetra', src: 'e.png'}
			{id: 'fLetra', src: 'f.png'}
			{id: 'gLetra', src: 'g.png'}
			{id: 'hLetra', src: 'h.png'}
			{id: 'iLetra', src: 'i.png'}
			{id: 'jLetra', src: 'j.png'}
			{id: 'kLetra', src: 'k.png'}
			{id: 'lLetra', src: 'l.png'}
			{id: 'mLetra', src: 'm.png'}
			{id: 'nLetra', src: 'n.png'}
			{id: 'oLetra', src: 'o.png'}
			{id: 'pLetra', src: 'p.png'}
			{id: 'qLetra', src: 'q.png'}
			{id: 'rLetra', src: 'r.png'}
			{id: 'sLetra', src: 's.png'}
			{id: 'tLetra', src: 't.png'}
			{id: 'uLetra', src: 'u.png'}
			{id: 'vLetra', src: 'v.png'}
			{id: 'wLetra', src: 'w.png'}
			{id: 'xLetra', src: 'x.png'}
			{id: 'yLetra', src: 'y.png'}
			{id: 'zLetra', src: 'z.png'}
		]
		sounds = [
			{src:'sounds/TU2_U1_A6_instructions.mp3', id:'instructions'}
			{src:'sounds/boing.mp3', id:'boing'}
		    {src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU2_U1_A6_bass.mp3', id:'bass'}
		    {src:'sounds/TU2_U1_A6_drum.mp3', id:'drum'}
		    {src:'sounds/TU2_U1_A6_flute.mp3', id:'flute'}
		    {src:'sounds/TU2_U1_A6_guitar.mp3', id:'guitar'}
		    {src:'sounds/TU2_U1_A6_piano.mp3', id:'piano'}
		    {src:'sounds/TU2_U1_A6_saxophone.mp3', id:'saxophone'}
		    {src:'sounds/TU2_U1_A6_tambourine.mp3', id:'tambourine'}
		    {src:'sounds/TU2_U1_A6_trumpet.mp3', id:'trumpet'}
		    {src:'sounds/TU2_U1_A6_violin.mp3', id:'violin'}
		    {src:'sounds/wrong.mp3', id:'wrong'}	
		]
		@abc = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
		@numbers = [
			{id:'1', x:1, y:0}
			{id:'2', x:5, y:3}
			{id:'3', x:8, y:1}
			{id:'4', x:11, y:-1}
			{id:'5', x:13, y:-1}
			{id:'6', x:-1, y:5}
			{id:'7', x:8, y:7}
			{id:'8', x:-1, y:10}
		]
		@containers = [
			{id:'d', x:1, y:1, a:true}
			{id:'o', x:1, y:2}
			{id:'c', x:1, y:3}
			{id:'t', x:1, y:4}
			{id:'o', x:1, y:5}
			{id:'r', x:1, y:6}
			{id:'m', x:5, y:4, a:true}
			{id:'e', x:5, y:5}
			{id:'c', x:5, y:6}
			{id:'h', x:5, y:7}
			{id:'a', x:5, y:8}
			{id:'n', x:5, y:9}
			{id:'i', x:5, y:10}
			{id:'c', x:5, y:11}
			{id:'c', x:8, y:2, a:true}
			{id:'h', x:8, y:3}
			{id:'e', x:8, y:4}
			{id:'f', x:8, y:5}
			{id:'s', x:11, y:0, a:true}
			{id:'a', x:11, y:1}
			{id:'l', x:11, y:2}
			{id:'e', x:11, y:3}
			{id:'s', x:11, y:4}
			{id:'c', x:11, y:5}
			{id:'l', x:11, y:6}
			{id:'e', x:11, y:7}
			{id:'r', x:11, y:8}
			{id:'k', x:11, y:9}
			{id:'w', x:13, y:0, a:true}
			{id:'a', x:13, y:1}
			{id:'i', x:13, y:2}
			{id:'t', x:13, y:3}
			{id:'e', x:13, y:4}
			{id:'r', x:13, y:5}
			{id:'p', x:0, y:5, a:true}
			{id:'l', x:2, y:5}
			{id:'i', x:3, y:5}
			{id:'c', x:4, y:5}
			{id:'o', x:7, y:5}
			{id:'f', x:9, y:5}
			{id:'i', x:10, y:5}
			{id:'e', x:12, y:5}
			{id:'v', x:8, y:8, a:true}
			{id:'e', x:8, y:9}
			{id:'t', x:8, y:10}
			{id:'f', x:0, y:10, a:true}
			{id:'i', x:1, y:10}
			{id:'r', x:2, y:10}
			{id:'e', x:3, y:10}
			{id:'f', x:4, y:10}
			{id:'g', x:6, y:10}
			{id:'h', x:7, y:10}
			{id:'e', x:9, y:10}
			{id:'r', x:10, y:10}
			
		]
		@helps = [
			'He / She helpssick animals'
			'He / She helpssick animals'
			'He / She helpssick animals'
			'He / She helpssick animals'
			'He / She helpssick animals'
			'He / She helpssick animals'
			'He / She helpssick animals'
			'He / She helpssick animals'
		]
		@answers = 
			drum: r: off, c: [0, 1, 2, 3]
			guitar: r: off, c:[4, 5, 6, 7, 8, 9]
			tambourine: r: off, c:[10, 11, 12, 13, 14, 2, 15, 6, 16, 17]
			trumpet: r: off, c:[10, 18, 19, 20, 21, 22, 23]
			flute: r: off, c:[24, 25, 26, 27, 28]
			bass: r: off, c:[29, 30, 31, 32]
			piano: r: off, c:[21,33,30,34,35]
			saxophone: r: off, c:[32,36,37,38,39,40,41,42,28]
		super null, manifest, sounds
	setStage: ->
		super
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'instructions', 'inst', 20, 100
		#@insertBitmap 'crosswordsBack', 'crossWords', 227, 120
		doc = @createBitmap 'persondoctor', 'persondoctor', '77', '121'
		mec = @createBitmap 'personmechanic', 'personmechanic', '137', '194'
		chef = @createBitmap 'personchef', 'personchef', '27', '208'
		sales = @createBitmap 'personsalesclerk', 'personsalesclerk', '79', '325'
		wait = @createBitmap 'personwaiter', 'personwaiter', '580', '117'
		poli = @createBitmap 'personpolice', 'personpolice', '681', '204'
		vet = @createBitmap 'personvet', 'personvet', '579', '224'
		fire = @createBitmap 'personfirefighter', 'personfirefighter', '632', '318'
		doc.scaleX = doc.scaleY = mec.scaleX = mec.scaleY = chef.scaleX = chef.scaleY = sales.scaleX = sales.scaleY = wait.scaleX = wait.scaleY = poli.scaleX = poli.scaleY = vet.scaleX = vet.scaleY = fire.scaleX = fire.scaleY = 0.5
		@addToMain doc, mec, chef, sales, wait, poli, vet, fire

		@insertBitmap 'numberdoctor', 'numberdoctor', '65', '138'
		@insertBitmap 'numbermechanic', 'numbermechanic', '125', '227'
		@insertBitmap 'numberchef', 'numberchef', '28', '251'
		@insertBitmap 'numbersalesclerk', 'numbersalesclerk', '65', '342'
		@insertBitmap 'numberwaiter', 'numberwaiter', '615', '132'
		@insertBitmap 'numberpolice', 'numberpolice', '670', '227'
		@insertBitmap 'numbervet', 'numbervet', '582', '251'
		@insertBitmap 'numberfirefighter', 'numberfirefighter', '618', '342'

		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 8, 0
		@createHelp()
		@createDroppers()
		@createAlphabet()
		@introEvaluation()
	createHelp: ->
		@insertBitmap 'prophelper', 'prophelper', '130', '514'
		for i in [1..8]
			@insertBitmap 'btn'+i, 'btn'+i, (i*40)+110, '534'
			t = new createjs.Text @helps[i-1],'14px Arial','#333'
			t.x = 480
			t.y = 540
			@addToMain t
	createAlphabet: ->
		alphabet = new createjs.Container()
		alphabet.x = 115
		alphabet.y = 410
		alphabet.name = 'alphabet'
		for i in [0..@abc.length - 1] by 1
			letter = @abc[i]
			if i <= 13
				letterObj = new Draggable letter, (@preload.getResult letter+'Letra'), letter, 41.5*i, 0
			else
				letterObj = new Draggable letter, (@preload.getResult letter+'Letra'), letter, 41.5*i-540, 34
			letterObj.onInitEvaluation()
			alphabet.addChild letterObj	
			@addToLibrary letterObj
		@addToMain alphabet
	createDroppers: ->
		crosswords = new createjs.Container()
		crosswords.x = 245
		crosswords.y = 216
		crosswords.name = 'crosswords'
		for i in [0..@containers.length - 1] by 1
			drop = new WordContainer 'h'+i, '#ccc', '#FFF', '#999', @containers[i].x*23, @containers[i].y*23, 23, 23
			drop.id = @containers[i].id
			@addToLibrary drop
			crosswords.addChild drop
		for i in [0..7]
			t = new createjs.Text @numbers[i].id,'14px Arial','#333'
			t.x = @numbers[i].x*23 + 6
			t.y = @numbers[i].y*23 + 4
			crosswords.addChild t
		@addToMain crosswords
	introEvaluation: ->
		super
		@library['crosswords'].y = 135
		@library['crosswords'].alpha = 1
		@library['alphabet'].y = 430
		@library['alphabet'].alpha = 1
		
		for i in [0..@containers.length - 1] by 1
			if(@containers[i].a)
				@library['h'+i].changeText @containers[i].id
			else
				@library['h'+i].changeText ''
		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
		TweenLite.from @library['alphabet'], 1, {alpha: 0, y: @library['alphabet'].y + 50, delay: 1.5}
		TweenLite.from @library['crosswords'], 1, {alpha: 0, y: @library['crosswords'].y + 50, delay: 1, onComplete: @playInstructions, onCompleteParams: [@]}
 	initEvaluation: (e) =>
		super
		for letter in @abc
			@library[letter].addEventListener 'drop', @evaluateAnswer
	evaluateAnswer: (e) =>
		@answer = e.target
		for i in [0..@containers.length - 1] by 1
			hit = @library['h'+i]
			pt = hit.globalToLocal @stage.mouseX, @stage.mouseY
			if hit.hitTest pt.x, pt.y
				if hit.id is @answer.index
					hit.changeText hit.id
					@answer.x = @answer.pos.x
					@answer.y = @answer.pos.y
					@evaluate 'drum'
					@evaluate 'guitar'
					@evaluate 'tambourine'
					@evaluate 'trumpet'
					@evaluate 'flute'
					@evaluate 'bass'
					@evaluate 'piano'
					@evaluate 'saxophone'
				else
					@warning()
			else
				@answer.returnToPlace()
	evaluate: (instrument) ->
		ready = true
		if not @answers[instrument].r
			for box in @answers[instrument].c
				if @library['h'+box].text.text is ''
					ready = false
			if ready
				@instrument = instrument
				snd = createjs.Sound.play instrument
				snd.addEventListener 'complete', @finishEvaluation
				@answers[instrument].r = on
				@library['score'].plusOne()
	finishEvaluation: =>
		TweenMax.allTo [@library[@instrument],@library[@instrument+'No']], 1, {alpha:0, ease:Quart.easeOut, onComplete: @nextEvaluation}
	nextEvaluation: =>
		complete = on
		for instrument of @answers
			if @answers[instrument].r is off
				complete = off
		TweenLite.to @library['alphabet'], 0.5, {alpha:0, y: @library['alphabet'].y - 100, ease:Quart.easeOut} if complete
		TweenLite.to @library['crosswords'], 0.5, {alpha:0, y: @library['crosswords'].y - 100, ease:Quart.easeOut, onComplete: @finish} if complete
	blink: (obj, state = on) ->
		TweenMax.killTweensOf obj
		obj.alpha = 1
		TweenMax.to obj, 0.5, {alpha:.5, repeat:-1, yoyo:true}  if state
	finish: =>
		super
	window.U6A6 = U6A6