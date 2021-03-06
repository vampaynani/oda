###

NEW ODA

###
class U2A2 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'finish', src: 'finish-btn.png'}
			{id: 'repeat', src: 'repeat-btn.png'}
			{id: 'clockbox', src: 'clock-container.png'}
			{id: 'mc1', src: 'mag-clock-1.png'}
			{id: 'mc2', src: 'mag-clock-2.png'}
			{id: 'mc3', src: 'mag-clock-3.png'}
			{id: 'mc4', src: 'mag-clock-4.png'}
			{id: 'mc5', src: 'mag-clock-5.png'}
			{id: 'mc6', src: 'mag-clock-6.png'}
			{id: 'm1', src: 'mag-eggs.png'}
			{id: 'm2', src: 'mag-chickens.png'}
			{id: 'm3', src: 'mag-sheep.png'}
			{id: 'm4', src: 'mag-butter.png'}
			{id: 'm5', src: 'mag-berries.png'}
			{id: 'm6', src: 'mag-bake.png'}
			{id: 'jc1', src: 'bob-clock-1.png'}
			{id: 'jc2', src: 'bob-clock-2.png'}
			{id: 'jc3', src: 'bob-clock-3.png'}
			{id: 'jc4', src: 'bob-clock-4.png'}
			{id: 'jc5', src: 'bob-clock-5.png'}
			{id: 'jc6', src: 'bob-clock-6.png'}
			{id: 'j1', src: 'bob-cow.png'}
			{id: 'j2', src: 'bob-vegetables.png'}
			{id: 'j3', src: 'bob-go.png'}
			{id: 'j4', src: 'bob-compost.png'}
			{id: 'j5', src: 'bob-ground.png'}
			{id: 'j6', src: 'bob-clean.png'}
			{id: 'wrong', src: 'wrong.png'}
			{id: 'correct', src: 'correct.png'}
			{id:'s/instructions', src:'TU3_U2_A2_instructions.mp3'}
			{id:'s/uno', src:'TU3_U2_A2_1.mp3'}
			{id:'s/dos', src:'TU3_U2_A2_2.mp3'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Listen and drag the clocks to the correct pictures.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 12, aimg: 'c1', acolor: '#EB2D3C', bimg: 'c2', bcolor: '#C3DB5B'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name:'snd', opts:{id:'s/uno'}}
								{
									name:'stps1'
									opts:{
										bcolor:'#e5eeb8', scolor:'#bfd951', stroke:2, width: 66, height: 42, radius: 10
										containers:[
											{type: 'rshp', name:'stp1', success: 5, x:129, y:129}
											{type: 'rshp', name:'stp2', success: 4, x:337, y:129}
											{type: 'rshp', name:'stp3', success: 3, x:129, y:277}
											{type: 'rshp', name:'stp4', success: 2, x:337, y:277}
											{type: 'rshp', name:'stp5', success: 6, x:129, y:429}
											{type: 'rshp', name:'stp6', success: 1, x:337, y:429}
										]
									}
								}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'j1', x: 132, y: 137}
						{type: 'img', id: 'j2', x: 340, y: 137}
						{type: 'img', id: 'j3', x: 132, y: 285}
						{type: 'img', id: 'j4', x: 340, y: 285}
						{type: 'img', id: 'j5', x: 132, y: 437}
						{type: 'img', id: 'j6', x: 340, y: 437}
						{type: 'stps', id:'stps1'}
						{type: 'drg', id: 'jc1', name: 'clk1', x: 602, y: 137, index: 1, target: 'stps1', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'jc2', name: 'clk2', x: 644, y: 203, index: 2, target: 'stps1', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'jc3', name: 'clk3', x: 602, y: 269, index: 3, target: 'stps1', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'jc4', name: 'clk4', x: 644, y: 335, index: 4, target: 'stps1', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'jc5', name: 'clk5', x: 603, y: 400, index: 5, target: 'stps1', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'jc6', name: 'clk6', x: 644, y: 467, index: 6, target: 'stps1', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{
							type: 'btn', id: 'finish', x: 663, y: 539, target:'stps1', isFinish: true
							states:[
								img: {name:'finish', x: 0, y: 0}
							]
						}
						{
							type: 'btn', id: 'repeat', x: 545, y: 539, isRepeat: true
							states:[
								img: {name:'repeat', x: 0, y: 0}
							]
						}
					]
					groups:[]
				}
				{
					answers: {
						collection: [
							[
								{name:'snd', opts:{id:'s/dos'}}
								{
									name:'stps2'
									opts:{
										bcolor:'#e5eeb8', scolor:'#bfd951', stroke:2, width: 66, height: 42, radius: 10
										containers:[
											{type: 'rshp', name:'stp1', success: 5, x:129, y:129}
											{type: 'rshp', name:'stp2', success: 4, x:337, y:129}
											{type: 'rshp', name:'stp3', success: 6, x:129, y:277}
											{type: 'rshp', name:'stp4', success: 3, x:337, y:277}
											{type: 'rshp', name:'stp5', success: 1, x:129, y:429}
											{type: 'rshp', name:'stp6', success: 2, x:337, y:429}
										]
									}
								}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'm1', x: 132, y: 137}
						{type: 'img', id: 'm2', x: 340, y: 137}
						{type: 'img', id: 'm3', x: 132, y: 285}
						{type: 'img', id: 'm4', x: 340, y: 285}
						{type: 'img', id: 'm5', x: 132, y: 437}
						{type: 'img', id: 'm6', x: 340, y: 437}
						{type: 'stps', id:'stps2'}
						{type: 'drg', id: 'mc1', name: 'clk21', x: 602, y: 137, index: 1, target: 'stps2', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'origin'}
						{type: 'drg', id: 'mc2', name: 'clk22', x: 644, y: 203, index: 2, target: 'stps2', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'mc3', name: 'clk23', x: 602, y: 269, index: 3, target: 'stps2', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'mc4', name: 'clk24', x: 644, y: 335, index: 4, target: 'stps2', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'mc5', name: 'clk25', x: 603, y: 400, index: 5, target: 'stps2', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{type: 'drg', id: 'mc6', name: 'clk26', x: 644, y: 467, index: 6, target: 'stps2', eval: 'drop_01', afterSuccess: 'inplace', afterFail: 'return'}
						{
							type: 'btn', id: 'finish', x: 663, y: 539, target:'stps2', isFinish: true
							states:[
								img: {name:'finish', x: 0, y: 0}
							]
						}
						{
							type: 'btn', id: 'repeat', x: 545, y: 539, isRepeat: true
							states:[
								img: {name:'repeat', x: 0, y: 0}
							]
						}
					]
					groups:[]
				}
			]
		super()
	window.U2A2 = U2A2