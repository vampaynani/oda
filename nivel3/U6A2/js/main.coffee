class U6A2 extends Oda
	constructor: ->
		manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'playagain', src:'play_again.png'}
			{id: 'startgame', src:'start_game.png'}
			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'propimg0', src:'prop_img.png'}
			{id: 'propimg1', src:'prop_img1.png'}
			{id: 'propimg2', src:'prop_img2.png'}
			{id: 'propimg3', src:'prop_img3.png'}
			{id: 'propimg4', src:'prop_img4.png'}
			{id: 'propimg5', src:'prop_img5.png'}

			{id: 'tag1', src:'tag_1.png'}
			{id: 'tag1580', src:'tag_1580.png'}
			{id: 'tag2', src:'tag_2.png'}
			{id: 'tag28', src:'tag_28.png'}
			{id: 'tag280', src:'tag_280.png'}
			{id: 'tag3', src:'tag_3.png'}
			{id: 'tag33', src:'tag_33.png'}
			{id: 'tag35', src:'tag_35.png'}
			{id: 'tag4', src:'tag_4.png'}
			{id: 'tag40000', src:'tag_40000.png'}
			{id: 'tag4500', src:'tag_4500.png'}
			{id: 'tag815', src:'tag_815.png'}
			{id: 'tag590', src:'tag_590.png'}
			{id: 'tag900', src:'tag_900.png'}


		]
		sounds = [
			{src:'sounds/good.mp3', id:'good'}
		    {src:'sounds/TU3_U6_A2_instructions.mp3', id:'instructions'}
		    {src:'sounds/wrong.mp3', id:'wrong'}
		]
		@game =
			nubes:[
				{txt: '1', img:'tag1', x:741, y:315}
				{txt: '1580', img:'tag1580', x:702, y:163}
				{txt: '2',  img:'tag2',  x:70, y:264}
				{txt: '28', img:'tag28', x:668, y:351}
				{txt: '280', img:'tag280', x:151, y:210}
				{txt: '3', img:'tag3', x:158, y:300}
				{txt: '3.3',  img:'tag33',  x:602, y:227}
				{txt: '35', img:'tag35', x:715, y:261}
				{txt: '4', img:'tag4', x:616, y:297}
				{txt: '40000', img:'tag40000', x:89, y:352}
				{txt: '4500', img:'tag4500', x:89, y:159}
				{txt: '815', img:'tag815', x:554, y:152}
				{txt: '590', img:'tag590', x:257, y:162}
				{txt: '900', img:'tag900', x:339, y:150}
			]
			passports:[
				{x: 130, y: 130, values: ['Eric Schmidt', 'Germany', 'blue', 'brown', '1m 10cm']}
				{x: 430, y: 135, values: ['Melanie Murphy', 'Ireland', 'green', 'red', '1m 7cm']}
				{x: 130, y: 304, values: ['Cassandra Wang', 'China', 'dark brown', 'black', '1m 15cm']}
				{x: 434, y: 304, values: ['Saul Peterson', 'Canada', 'light brown', 'blonde', '1m 14cm']}
			]
			steps:[

				{pattern:["Can you believe that", "#wc", "years ago there", "#br", "were camels in Los Angeles, California? They were", "#br", "#wc", "meters tall. They weighed", "#wc", "kilograms."], targets:['40,000', '4',  '590']}
				{pattern:["This animal was an ancient bison.", "#br", "it was", "#wc", "meters tall amd weighed", "#wc", "kilograms.", "#br", "Its horns were", "#wc", "centimeters long."], targets:['2','900','35']}
				{pattern:["This animal was a ground sloth.", "#br", "it weighed", "#wc", "kilograms and", "#br", "was", "#wc", "meters tall."], targets:['1580','2']}
				{pattern:["This animal was a Columbian mammoth. It was", "#br", "enormous. It weighed", "#wc", "kilograms and was", "#wc", "#br", "meters tall. Its tusks were", "#wc", "meters long!"], targets:['	4500','4','3']}
				{pattern:["This animal was a short-faced bear.", "#br", "It was much bigger than the modern grizzly bear.", "#br", "It was", "#wc", "meters tall and weighed", "#wc", "kilograms."], targets:['3.3', '815']}
				{pattern:["This animal was a saber-toothed cat. It wasn't", "#br", "very big --it was only", "#wc", "meter tall amd it weighed", "#br", "#wc", "kilograms. But it had long sharp fangs-- they", "#br", "were", "#wc", "centimeters long!"], targets:['1','280','28']}
			]
			positions:[
				{x:'65', y:'22'}
				{x:'77', y:'50'}
				{x:'84', y:'78'}
				{x:'90', y:'106'}
				{x:'68', y:'134'}
			]


		super null, manifest, sounds
	setStage: ->
		super
		@intento = 0
		@steps =  @game.steps
		@insertBitmap 'header', 'head', stageSize.w / 2, 0, 'tc'
		@insertBitmap 'btnrepeat', 'btnrepeat', stageSize.w / 2, 560, 'tc'
		@insertInstructions 'instructions', 'Listen and drag the numbers to complete the descriptions.', 40, 100
		@addToMain new Score 'score', (@preload.getResult 'c1'), (@preload.getResult 'c2'), 20, 500, 16, 0
		@insertSprite 'animals', ['propimg0','propimg1','propimg2','propimg3','propimg4','propimg5'], null, stageSize.w / 2, 325, 'mc'
		@setDropper( 1 )#.setPassports().introEvaluation()
		@setNubes()
	setNubes: ->
		nubes = new createjs.Container() 
		for i in [1..@game.nubes.length]
			n = @createBitmap @game.nubes[i-1].img, @game.nubes[i-1].img, @game.nubes[i-1].x, @game.nubes[i-1].y , 'tc'

			t = new DroppableText "text#{i}", @game.nubes[i-1].txt, i, @game.nubes[i-1].x,  @game.nubes[i-1].y + 10, @stage
			t.textAlign = 'center'
			@addToLibrary t			
			nubes.addChild n, t


		@addToMain nubes
		@
	setPassports: ->
		i = 1
		for passport in @game.passports
			p = new createjs.Container()
			p.x = passport.x
			p.y = passport.y
			p.name = "pass#{i}"
			f = @createBitmap "p#{i}", "pas#{i}", 0, 0
			p.addChild f
			@addToMain p
			for j in [0..passport.values.length - 1] by 1
				n = new DroppableText "p#{i}v#{j}", passport.values[j], passport.values[j], @game.positions[j].x,  @game.positions[j].y, @stage
				@addToLibrary n
				p.addChild n
			i++
		@
	setDropper: (step) ->
		@step = step
		if @library.dropper and @mainContainer.contains @library.dropper
			dropper = @library.dropper
		else
			dropper = new createjs.Container()
			dropper.x = 150
			dropper.y = 445
			dropper.name = 'dropper'
			@addToMain dropper
		dropper.removeAllChildren()
		
		i = 0
		j = 0
		npos = 0
		@targets = new Array()
		for t in @steps[step - 1].pattern
			ny = j * 30 + 7
			if t is '#br'
				npos = 0
				j++
			else if t is '#wc'
				txt = @steps[step - 1].targets[i]
				h = new WordContainer "h#{i}", "#{txt}", '#FFF', '#F00', npos, ny
				h.text.font = '20px Quicksand'
				h.index = i
				dropper.addChild h
				@addToLibrary h
				@targets.push h
				npos += h.width + 7
				i++
			else
				h = @createText '', t,'20px Quicksand','#333', npos, ny
				dropper.addChild h
				npos += h.getMeasuredWidth() + 12
		@
 
	window.U6A2 = U6A2