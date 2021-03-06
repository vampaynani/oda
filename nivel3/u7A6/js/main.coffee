###

NEW ODA

###
class U7A6 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'1p1', src:'1p0001.png'}
			{id:'1p2', src:'1p0002.png'}
			{id:'2p1', src:'2p0001.png'}
			{id:'2p2', src:'2p0002.png'}
			{id:'3p1', src:'3p0001.png'}
			{id:'3p2', src:'3p0002.png'}
			{id:'4p1', src:'4p0001.png'}
			{id:'4p2', src:'4p0002.png'}
			{id:'5p1', src:'5p0001.png'}
			{id:'5p2', src:'5p0002.png'}
			{id:'6p1', src:'6p0001.png'}
			{id:'6p2', src:'6p0002.png'}
			{id:'7p1', src:'7p0001.png'}
			{id:'7p2', src:'7p0002.png'}
			{id:'8p1', src:'8p0001.png'}
			{id:'8p2', src:'8p0002.png'}
			{id:'9p1', src:'9p0001.png'}
			{id:'9p2', src:'9p0002.png'}
			{id:'10p1', src:'10p0001.png'}
			{id:'10p2', src:'10p0002.png'}
			{id:'line', src:'line.png'}
			{id:'area', src:'prop_area.png'}
			{id:'bg', src:'prop_bg.png'}
			{src:'TU3_U7_A6_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Click on the numbers, unscramble the answers and find them in the word search.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 20, aimg: 'c1', acolor: '#0096DB', bimg: 'c2', bcolor: '#BFD951'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{
									name:'wsch1'
									opts:{
										matrix:[
											['e', 's', 'c', 'a', 'l', 'c', 'u', 'l', 'a', 't', 'o', 'r']
											['m', 'b', 'a', 'm', 'e', 'r', 'c', 't', 'o', 'r', 'w', 'a']
											['b', 'a', 'm', 'b', 'o', 'o', 'o', 'c', 'g', 'g', 'd', 'c']
											['a', 'b', 'l', 'a', 'r', 'c', 'm', 'o', 'm', 'u', 'e', 'a']
											['c', 'o', 'r', 'm', 'a', 'r', 't', 'm', 'e', 'n', 'r', 'l']
											['l', 'e', 'c', 'e', 'v', 'e', 'r', 'p', 'e', 'p', 'a', 'n']
											['e', 'd', 'u', 't', 'c', 'h', 'e', 'a', 'f', 'o', 'k', 'o']
											['v', 'e', 'r', 'i', 'a', 'g', 'l', 's', 'r', 'w', 'a', 'm']
											['e', 's', 't', 'a', 'm', 'o', 'u', 's', 'u', 'd', 'n', 'a']
											['r', 'h', 'i', 'b', 'e', 'r', 'n', 'a', 't', 'e', 'o', 'd']
											['c', 'o', 'p', 's', 'l', 'e', 'o', 'd', 'i', 'r', 'e', 'e']
											['e', 'c', 'h', 'o', 'p', 's', 't', 'i', 'c', 'k', 's', 't']
										]
										words:[
											{
												target:'ln1', fx:'fadeIn', enabled:false, complete: false
												coords:['1_6','2_6','3_6','4_6','5_6']
											}
											{
												target:'ln2', fx:'fadeIn', enabled:false, complete: false
												coords:['11_5','11_6','11_7','11_8','11_9']
											}
											{
												target:'ln3', fx:'fadeIn', enabled:false, complete: false
												coords:['7_2','7_3','7_4','7_5','7_6','7_7','7_8']
											}
											{
												target:'ln4', fx:'fadeIn', enabled:false, complete: false
												coords:['1_11','2_11','3_11','4_11','5_11','6_11','7_11','8_11','9_11','10_11']
											}
											{
												target:'ln5', fx:'fadeIn', enabled:false, complete: false
												coords:['4_6','4_7','4_8','4_9','4_10']
											}
											{
												target:'ln6', fx:'fadeIn', enabled:true, complete: false
												coords:['0_2','1_2','2_2','3_2','4_2','5_2']
											}
											{
												target:'ln7', fx:'fadeIn', enabled:false, complete: false
												coords:['1_9','2_9','3_9','4_9','5_9','6_9','7_9','8_9','9_9']
											}
											{
												target:'ln8', fx:'fadeIn', enabled:false, complete: false
												coords:['9_2','9_3','9_4','9_5','9_6','9_7','9_8','9_9','9_10']
											}
											{
												target:'ln9', fx:'fadeIn', enabled:false, complete: false
												coords:['0_4','0_5','0_6','0_7','0_8','0_9']
											}
											{
												target:'ln10', fx:'fadeIn', enabled:false, complete: false
												coords:['2_0','3_0','4_0','5_0','6_0','7_0','8_0','9_0','10_0','11_0']
											}
										]
									}
								}
								{name:'swct1', opts:{prev:'The', word:'Dutch', target: 'dutch', fx:'fadeIn'}}
								{name:'swct2', opts:{prev:'A', word:'nomad', target: 'nomad', fx:'fadeIn'}}
								{name:'swct3', opts:{prev:'A', word:'compass', target: 'compass', fx:'fadeIn'}}
								{name:'swct4', opts:{word:'chopsticks', target: 'chopsticks', fx:'fadeIn'}}
								{name:'swct5', opts:{prev:'By', word:'camel', target: 'camel', fx:'fadeIn'}}
								{name:'swct6', opts:{word:'bamboo', target: 'bamboo', fx:'fadeIn'}}
								{name:'swct7', opts:{prev:'They', word:'hibernate', target: 'hibernate', fx:'fadeIn'}}
								{name:'swct8', opts:{word:'gunpowder', target: 'gunpowder', fx:'fadeIn'}}
								{name:'swct9', opts:{word:'clever', target: 'clever', fx:'fadeIn'}}
								{name:'swct10', opts:{prev:'A', word:'calculator', target: 'calculator', fx:'fadeIn'}}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'bg', x: 840, y: 380, align:'tr'}
						{type: 'img', id: 'area', x: 40, y: 215}
						{
							type: 'btn', id: 'btn1', x: 77, y: 190, index: 1, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '1p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '1p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn2', x: 140, y: 190, index: 2, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '2p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '2p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn3', x: 203, y: 190, index: 3, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '3p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '3p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn4', x: 266, y: 190, index: 4, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '4p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '4p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn5', x: 329, y: 190, index: 5, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '5p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '5p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn6', x: 77, y: 425, index: 6, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '6p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '6p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn7', x: 140, y: 425, index: 7, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '7p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '7p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn8', x: 203, y: 425, index: 8, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '8p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '8p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn9', x: 266, y: 425, index: 9, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '9p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '9p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{
							type: 'btn', id: 'btn10', x: 329, y: 425, index: 10, target: ['grp1','grp2'], eval: 'show_choose_01'
							states: [
								{img: {name: '10p1', x: 0, y: 0, align: 'mc'}}
								{img: {name: '10p2', x: 0, y: 0, align: 'mc'}}
							]
						}
						{type: 'txt', id: 'txt1', text:'Who invented the telescope?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt2', text:'What do you call a person with no permanent home?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt3', text:'What instrument shows north, south, east and west?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt4', text:'What do Chinese people use to eat food?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt5', text:'How did people travel on the Silk Road?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt6', text:'What plant do pandas mainly eat?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt7', text:'What do most bears do during the winter?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt8', text:'What are fireworks made from?', x: 200, y: 235, font:'22px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt9', text:'What\'s another word for \'intelligent\'?', x: 200, y: 235, align: 'center', lineWidth: 250}
						{type: 'txt', id: 'txt10', text:'What do you use to do sums in math class?', x: 200, y: 235, align: 'center', lineWidth: 250}
						{type: 'wsch', id: 'wsch1', x: 420, y: 148, font: '20px Quicksand', uwidth: 25, uheight: 25, radius: 12.5, shcolor:'#F00', shape:'circle'}
						{
							type: 'swct', id: 'swct1', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 0}
						}
						{
							type: 'swct', id: 'swct2', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 1}
						}
						{
							type: 'swct', id: 'swct3', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 2}
						}
						{
							type: 'swct', id: 'swct4', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 3}
						}
						{
							type: 'swct', id: 'swct5', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 4}
						}
						{
							type: 'swct', id: 'swct6', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 5}
						}
						{
							type: 'swct', id: 'swct7', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 6}
						}
						{
							type: 'swct', id: 'swct8', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 7}
						}
						{
							type: 'swct', id: 'swct9', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 8}
						}
						{
							type: 'swct', id: 'swct10', x: 200, y: 330, margin: 5, uwidth: 20, font: '22px Quicksand', scolor: '#0098d7', bcolor: 'rgba(255,255,255,0.1)', align: 'tc', eval:'word_drop_01'
							oncomplete: {function: 'word_complete_01', target:'wsch1', index: 9}
						}
						{type: 'txt', id: 'dutch', text:'Dutch', x: 170, y: 465, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'bamboo', text:'bamboo', x: 300, y: 465, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'clever', text:'clever', x: 430, y: 465, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'compass', text:'compass', x: 160, y: 495, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'nomad', text:'nomad', x: 290, y: 495, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'chopsticks', text:'chopsticks', x: 420, y: 495, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'camel', text:'camel', x: 150, y: 525, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'hibernate', text:'hibernate', x: 280, y: 525, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'gunpowder', text:'gunpowder', x: 410, y: 525, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'txt', id: 'calculator', text:'calculator', x: 270, y: 555, font:'18px Quicksand', align: 'center', lineWidth: 250}
						{type: 'img', name:'ln1', id: 'line', x: 170, y: 475, align:'mc'}
						{type: 'img', name:'ln2', id: 'line', x: 290, y: 505, align:'mc'}
						{type: 'img', name:'ln3', id: 'line', x: 160, y: 505, align:'mc'}
						{type: 'img', name:'ln4', id: 'line', x: 420, y: 505, align:'mc'}
						{type: 'img', name:'ln5', id: 'line', x: 150, y: 535, align:'mc'}
						{type: 'img', name:'ln6', id: 'line', x: 300, y: 475, align:'mc'}
						{type: 'img', name:'ln7', id: 'line', x: 280, y: 535, align:'mc'}
						{type: 'img', name:'ln8', id: 'line', x: 410, y: 535, align:'mc'}
						{type: 'img', name:'ln9', id: 'line', x: 430, y: 475, align:'mc'}
						{type: 'img', name:'ln10', id: 'line', x: 270, y: 565, align:'mc'}
					]	
					groups: [
						{
							type: 'grp', id: 'grp_lines', invisible: true
							group:[
								'ln1'
								'ln2'
								'ln3'
								'ln4'
								'ln5'
								'ln6'
								'ln7'
								'ln8'
								'ln9'
								'ln10'
							]
						}
						{
							type: 'grp', id: 'grp_words', invisible: true
							group:[
								'dutch'
								'bamboo'
								'clever'
								'compass'
								'nomad'
								'chopsticks'
								'camel'
								'hibernate'
								'gunpowder'
								'calculator'
							]
						}
						{
							type: 'grp', id: 'grp0'
							group:[
								'btn1'
								'btn2'
								'btn3'
								'btn4'
								'btn5'
								'btn6'
								'btn7'
								'btn8'
								'btn9'
								'btn10'
							]
						}
						{
							type: 'grp', id: 'grp1', invisible: true
							group: [
								'swct1'
								'swct2'
								'swct3'
								'swct4'
								'swct5'
								'swct6'
								'swct7'
								'swct8'
								'swct9'
								'swct10'
							]
						}
						{
							type: 'grp', id: 'grp2', invisible: true
							group: [
								'txt1'
								'txt2'
								'txt3'
								'txt4'
								'txt5'
								'txt6'
								'txt7'
								'txt8'
								'txt9'
								'txt10'
							]
						}
					]
				}
			]
		super()
	window.U7A6 = U7A6