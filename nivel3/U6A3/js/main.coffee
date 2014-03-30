###

NEW ODA

###
class U6A3 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'volcan', src:'prop_img.png'}
			{id:'btnready', src:'btn_ready.png'}
			{id:'crossword', src:'prop_crossword.png'}
			{id:'q1', src:'q1.png'}
			{id:'q2', src:'q2.png'}
			{id:'q3', src:'q3.png'}
			{id:'q4', src:'q4.png'}
			{id:'q5', src:'q5.png'}
			{id:'q6', src:'q6.png'}
			{id:'q7', src:'q7.png'}
			{id:'q8', src:'q8.png'}
			{id:'q9', src:'q9.png'}
			{id:'q10', src:'q10.png'}
			{src:'TU3_U6_A3_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Click on the crossword, read the clues and write the answers.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 10, aimg: 'c1', acolor: '#EB2D3C', bimg: 'c2', bcolor: '#C3DB5B'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{
									name:'cwd1'
									opts:{
										matrix:[
											['#','#','#','#','#','#','#','#','#','f','o','r','e','s','t']
											['#','#','#','#','#','#','#','#','#','#','c','#','#','#','#']
											['#','#','#','#','#','#','#','l','a','k','e','#','#','#','#']
											['#','#','#','#','#','#','c','#','#','#','a','#','#','#','#']
											['#','#','#','#','#','v','o','l','c','a','n','o','#','#','#']
											['#','#','#','#','s','#','n','#','#','#','#','#','#','#','#']
											['#','#','#','#','w','#','t','#','#','#','#','#','#','#','#']
											['t','s','u','n','a','m','i','#','#','#','#','#','#','#','#']
											['#','#','#','#','m','#','n','#','#','#','#','#','#','#','#']
											['#','#','#','#','p','#','e','#','#','#','#','#','#','#','#']
											['#','#','#','i','#','#','n','#','#','#','#','#','#','#','#']
											['#','d','e','s','e','r','t','#','#','#','#','#','#','#','#']
											['#','#','#','l','#','#','#','#','#','#','#','#','#','#','#']
											['l','a','v','a','#','#','#','#','#','#','#','#','#','#','#']
											['#','#','#','n','#','#','#','#','#','#','#','#','#','#','#']
											['#','#','#','d','#','#','#','#','#','#','#','#','#','#','#']
										]
										words:[
											{
												x: 165, y: 0, target:'forest', eval:'show_click_01', index: 'q1', target: 'grp1_0', complete: false
												coords:['90', '100', '110', '120', '130', '140']
											}
											{
												x: 205, y: -25, target:'ocean', eval:'show_click_01', index: 'q2', target: 'grp1_0', complete: false
												coords:['100', '101', '102', '103', '104']
											}
											{
												x: 145, y: 20, target:'lake', eval:'show_click_01', index: 'q3', target: 'grp1_0', complete: false
												coords:['72', '82', '92', '102']
											}
											{
												x: 125, y: 40, target:'continent', eval:'show_click_01', index: 'q4', target: 'grp1_0', complete: false
												coords:['63', '64', '65', '66', '67', '68', '69', '610', '611']
											}
											{
												x: 85, y: 80, target:'volcano', eval:'show_click_01', index: 'q5', target: 'grp1_0', complete: false
												coords:['54', '64', '74', '84', '94', '104', '114']
											}
											{
												x: 65, y: 100, target:'swamp', eval:'show_click_01', index: 'q6', target: 'grp1_0', complete: false
												coords:['45', '46', '47', '48', '49']
											}
											{
												x: -20, y: 140, target:'tsunami', eval:'show_click_01', index: 'q7', target: 'grp1_0', complete: false
												coords:['07', '17', '27', '37', '47', '57', '67']
											}
											{
												x: 65, y: 180, target:'island', eval:'show_click_01', index: 'q8', target: 'grp1_0', complete: false
												coords:['310', '311', '312', '313', '314', '315']
											}
											{
												x: 5, y: 220, target:'desert', eval:'show_click_01', index: 'q9', target: 'grp1_0', complete: false
												coords:['111', '211', '311', '411', '511', '611']
											}
											{
												x: -25, y: 260, target:'lava', eval:'show_click_01', index: 'q10', target: 'grp1_0', complete: false
												coords:['013', '113', '213', '313']
											}
										]
									}
								}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'volcan', x: 495, y: 777, align: 'mc'}
						{type: 'img', id: 'q1', x: 5, y: 18}
						{type: 'img', id: 'q2', x: 10, y: 0}
						{type: 'img', id: 'q3', x: 10, y: 12}
						{type: 'img', id: 'q4', x: 10, y: 11}
						{type: 'img', id: 'q5', x: 10, y: 0}
						{type: 'img', id: 'q6', x: 15, y: 0}
						{type: 'img', id: 'q7', x: 20, y: 0}
						{type: 'img', id: 'q8', x: 15, y: -8}
						{type: 'img', id: 'q9', x: 18, y: -10}
						{type: 'img', id: 'q10', x: 20, y: -18}
						{type:'cwd', id: 'cwd1', x: 285, y: 156, font: '20px Quicksand', fcolor:'#333', uwidth: 20, uheight: 20, stroke: 1, scolor: '#000'}
						{type: 'abc', id: 'abc1', x: 400, y: 560, font:'20px Quicksand', fcolor:'#333', uwidth: 22, uheight: 34, margin: 10, target:'cwd1', eval:'drop_04'}
					]
					groups: [
						{
							type: 'grp', id: 'grp1_0', invisible: true
							group: [
								'q1'
								'q2'
								'q3'
								'q4'
								'q5'
								'q6'
								'q7'
								'q8'
								'q9'
								'q10'
							]
						}
					]
				}
			]
		super()
	window.U6A3 = U6A3