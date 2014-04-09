###

NEW ODA

###
class U8A5 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'propbg', src:'prop_bg.png'}
			{id: 'propwords', src:'prop_words.png'}
			{id: 'img1', src:'img_1.png'}
			{id: 'img2', src:'img_2.png'}
			{id: 'img3', src:'img_3.png'}
			{id: 'img4', src:'img_4.png'}
			{id: 'img5', src:'img_5.png'}
			{id: 'img6', src:'img_6.png'}
			{id: 'img7', src:'img_7.png'}
			{id: 'img8', src:'img_8.png'}
			{id: 'img9', src:'img_9.png'}
			{id: 'img10', src:'img_10.png'}
			{src:'TU3_U8_A5_instructions.mp3', id:'s/instructions'}
		]
		@onDrop = (dispatcher, target) =>
			a = lib[dispatcher]
			b = target
			c = target.parent
			if a.index is b.success
				b.complete = true
				b.update()
				a.afterSuccess()
				lib.scene.success()
				d2oda.methods.delay 1000, ->
					c.fadeOut()
					lib.grp_solve.update {type:'fadeOut'}
			else
				a.afterFail()
				lib.scene.fail()
		@btnClick = (dispatcher) =>
			@selection = lib[dispatcher].index
			lib[dispatcher].scaleX = lib[dispatcher].scaleY = 1
			lib[dispatcher].removeAllEventListeners()
			lib.grp_pcpt.update {type:'fadeIn', ignoreY:true, ignoreCurrentAlpha:true, target:"pcpt#{@selection}"}
			lib.grp_solve.update {type:'fadeIn'}
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Find and click on ten objects. Then drag the words to complete the questions.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 10, aimg: 'c1', acolor: '#FE008F', bimg: 'c2', bcolor: '#0A9BDD'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name: 'pcpt1', opts:{pattern:['#tcpt', 'climbed out of the water first?', '#rtn', 'Honupo\'okea, the Great Mother Turtle.'], targets: [{text:'Who'}]}}
								{name: 'pcpt2', opts:{pattern:['#tcpt', 'did Honupo\'okea create a nest with her flippers?', '#rtn', 'She created a nest for her egg.'], targets: [{text:'Why'}]}}
								{name: 'pcpt3', opts:{pattern:['#tcpt', 'waited in the water while Honupo\'okea built her nest?', '#rtn', 'Honu\'ea, the Great Father Turtle.'], targets: [{text:'Who'}]}}
								{name: 'pcpt4', opts:{pattern:['#tcpt', 'did the egg look like?', '#rtn', 'It was completely round and smooth.'], targets: [{text:'What'}]}}
								{name: 'pcpt5', opts:{pattern:['#tcpt', 'did Honupo\'okea cover the egg?', '#rtn', 'She brushed soft, Black sand over it.'], targets: [{text:'How'}]}}
								{name: 'pcpt6', opts:{pattern:['#tcpt', 'did the two turtles create next?', '#rtn', 'They created a pool of fresh water.'], targets: [{text:'What'}]}}
								{name: 'pcpt7', opts:{pattern:['#tcpt', 'did the two turtles go after that?', '#rtn', 'They returned to the ocean.'], targets: [{text:'Where'}]}}
								{name: 'pcpt8', opts:{pattern:['#tcpt', 'did Honupo\'okea come back to the beach?', '#rtn', 'When her egg was going to hatch.'], targets: [{text:'When'}]}}
								{name: 'pcpt9', opts:{pattern:['#tcpt', 'wasn\'t Kauila a turtle at the end?', '#rtn', 'She became a human girl.'], targets: [{text:'Why'}]}}
								{name: 'pcpt10', opts:{pattern:['#tcpt', 'does Kauila live now?', '#rtn', 'She continues to live by her pool of fresh water.'], targets: [{text:'Where'}]}}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id:'propbg', x: -14, y:120}
						{
							type: 'btn', id: 'img1', x: 660, y: 208, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'img1', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img2', x: 642, y: 295, index: 2, target: null
							eval: @btnClick
							states: [{img: {name: 'img2', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img3', x: 594, y: 399, index: 3, target: null
							eval: @btnClick
							states: [{img: {name: 'img3', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img4', x: 487, y: 445, index: 4, target: null
							eval: @btnClick
							states: [{img: {name: 'img4', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img5', x: 275, y: 366, index: 5, target: null
							eval: @btnClick
							states: [{img: {name: 'img5', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img6', x: 407, y: 223, index: 6, target: null
							eval: @btnClick
							states: [{img: {name: 'img6', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img7', x: -8, y: 287, index: 7, target: null
							eval: @btnClick
							states: [{img: {name: 'img7', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img8', x: 430, y: 409, index: 8, target: null
							eval: @btnClick
							states: [{img: {name: 'img8', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img9', x: 490, y: 300, index: 9, target: null
							eval: @btnClick
							states: [{img: {name: 'img9', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'img10', x: 658, y: 414, index: 10, target: null
							eval: @btnClick
							states: [{img: {name: 'img10', x: 0, y: 0}}]
						}
						{type: 'img', id:'propwords', x: 163, y: 480}
						{type: 'pcpt', id: 'pcpt1', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt2', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt3', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt4', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt5', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt6', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt7', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt8', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt9', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt10', x: 240, y: 550, font: '17px Quicksand', margin: 5, stroke: 2, scolor: '#eb188e'}
						{type: 'ldrg', id: 'ldrg1', x: 193, y: 497, index: 'When', text:'When', font:'17px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: @onDrop, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg2', x: 273, y: 497, index: 'Who', text:'Who', font:'17px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: @onDrop, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg3', x: 343, y: 497, index: 'What', text:'What', font:'17px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: @onDrop, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg4', x: 413, y: 497, index: 'Where', text:'Where', font:'17px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: @onDrop, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg5', x: 498, y: 497, index: 'Why', text:'Why', font:'17px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: @onDrop, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg6', x: 573, y: 497, index: 'How', text:'How', font:'17px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: @onDrop, afterSuccess: 'origin', afterFail: 'return'}
					]
					groups: [
						{
							type: 'grp', id:'grp_pcpt', invisible: true
							group:[
								'pcpt1'
								'pcpt2'
								'pcpt3'
								'pcpt4'
								'pcpt5'
								'pcpt6'
								'pcpt7'
								'pcpt8'
								'pcpt9'
								'pcpt10'
							]
						}
						{
							type: 'grp', id:'grp_solve', invisible: true
							group: [
								'ldrg1'
								'ldrg2'
								'ldrg3'
								'ldrg4'
								'ldrg5'
								'ldrg6'
								'propwords'
							]
						}
					]
				}
			]
		super()
	window.U8A5 = U8A5
