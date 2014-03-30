###

NEW ODA

###
class U5A6 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'q1', src:'1.png'}
			{id:'q2', src:'2.png'}
			{id:'q3', src:'3.png'}
			{id:'q4', src:'4.png'}
			{id:'q5', src:'5.png'}
			{id:'q6', src:'6.png'}
			{id:'q7', src:'7.png'}
			{id:'q8', src:'8.png'}
			{id:'q9', src:'9.png'}
			{id:'planetearth', src:'planet_earth.png'}
			{src:'TU3_U5_A6_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Read the dialogs and solve the puzzle with past tense verbs.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 10, aimg: 'c1', acolor: '#ff9933', bimg: 'c2', bcolor: '#bfd951'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{
									name:'cwd1'
									opts:{
										matrix:[
											['#','#','#','#','#','#','#','#','#','#','#','#','p','#']
											['#','#','#','k','#','#','#','d','#','f','#','#','o','#']
											['#','#','#','i','#','w','#','u','#','i','#','#','l','#']
											['#','#','l','l','#','a','#','m','#','l','#','#','l','#']
											['u','s','i','l','#','s','#','p','#','l','#','p','u','c']
											['s','a','v','e','-','t','h','e','-','e','a','r','t','h']
											['e','v','e','d','#','e','#','d','#','d','#','o','e','a']
											['d','e','d','#','#','d','#','#','#','-','#','d','d','n']
											['#','d','#','#','#','#','#','#','#','u','#','u','#','g']
											['#','#','#','#','#','#','#','#','#','p','#','c','#','e']
											['#','#','#','#','#','#','#','#','#','#','#','e','#','d']
											['#','#','#','#','#','#','#','#','#','#','#','d','#','#']
										]
										words:[
											{
												x: 5, y: 55, target:'q1', complete: false
												coords:['04', '05', '06', '07']
											}
											{
												x: 25, y: 55, target:'q2', complete: false
												coords:['14', '15', '16', '17', '18']
											}
											{
												x: 45, y: 35, target:'q3', complete: false
												coords:['23', '24', '25', '26', '27']
											}
											{
												x: 65, y: -5, target:'q3_1', complete: false
												coords:['31', '32', '33', '34', '35', '36']
											}
											{
												x: 105, y: 15, target:'q4', complete: false
												coords:['52', '53', '54', '55', '56', '57']
											}
											{
												x: 145, y: -5, target:'q9', complete: false
												coords:['71', '72', '73', '74', '75', '76']
											}
											{
												x: 185, y: -5, target:'q8', complete: false
												coords:['91', '92', '93', '94', '95', '96', '98','99']
											}
											{
												x: 225, y: 55, target:'q7', complete: false
												coords:['114', '115', '116', '117', '118', '119', '1110','1111']
											}
											{
												x: 245, y: -25, target:'q6', complete: false
												coords:['120', '121', '122', '123', '124', '125', '126', '127']
											}
											{
												x: 265, y: 55, target:'q5', complete: false
												coords:['134', '135', '136', '137', '138', '139', '1310']
											}
										]
									}
								}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'q1', x: 295, y: 205, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q2', x: 100, y: 229, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q3', x: 113, y: 388, scale: 0.55, align: 'mc'}
						{type: 'img', name: 'q3_1', id: 'q3', x: 113, y: 388, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q4', x: 255, y: 482, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q5', x: 656, y: 485, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q6', x: 783, y: 388, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q7', x: 615, y: 345, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q8', x: 649, y: 229, scale: 0.55, align: 'mc'}
						{type: 'img', id: 'q9', x: 506, y: 175, scale: 0.55, align: 'mc'}
						{type:'cwd', id: 'cwd1', x: 230, y: 251, font: '20px Quicksand', fcolor:'#333', uwidth: 20, uheight: 20, stroke: 1, scolor: '#000'}
						{type: 'abc', id: 'abc1', x: 400, y: 560, font:'20px Quicksand', fcolor:'#333', uwidth: 22, uheight: 34, margin: 10, target:'cwd1', eval:'drop_04'}
					]
					groups: []
				}
			]
		super()
	window.U5A6 = U5A6