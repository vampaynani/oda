###

NEW ODA

###
class U3A1 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'finish', src:'btn_finished.png'}
			{id: 'repeat', src:'btn_repeat.png'}
			{id: 'dragbledontlike', src: 'dragble_dontlike.png'}
			{id: 'dragblehate', src: 'dragble_hate.png'}
			{id: 'dragblelike', src: 'dragble_like.png'}
			{id: 'dragblelove', src: 'dragble_love.png'}
			{id: 'fondo', src: 'fondo.png'}
		    {id:'wrong', src: 'wrong.png'}
		    {id:'correct', src: 'correct.png'}
			{src:'TU3_U3_A1_instructions.mp3', id:'s/instructions'}
			{src:'TU3_U3_A1_bella.mp3', id:'s/che1'}
			{src:'TU3_U3_A1_aiden.mp3', id:'s/che2'}
			{src:'TU3_U3_A1_paisley.mp3', id:'s/che3'}
			{src:'TU3_U3_A1_jacob.mp3', id:'s/che4'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Listen and drag the faces to the correct place on the chart.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 24, aimg: 'c1', acolor: '#0096DB', bimg: 'c2', bcolor: '#BFD951'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name:'snd', opts:{id:'s/che1'}}
								{
									name:'ccpt1'
									opts:{
										containers:[
											{name: 'ccpt1_1', x: 0, y: 0, success: 'dontlike'}
											{name: 'ccpt1_2', x: 0, y: 49, success: 'like'}
											{name: 'ccpt1_3', x: 0, y: 98, success: 'love'}
											{name: 'ccpt1_4', x: 0, y: 145, success: 'dontlike'}
											{name: 'ccpt1_5', x: 0, y: 194, success: 'love'}
											{name: 'ccpt1_6', x: 0, y: 242, success: '#empty'}
										]
									}
								}
							]
							[
								{name:'snd', opts:{id:'s/che2'}}
								{
									name:'ccpt1'
									opts:{
										containers:[
											{name: 'ccpt1_1', x: 120, y: 0, success: 'dontlike'}
											{name: 'ccpt1_2', x: 120, y: 49, success: '#empty'}
											{name: 'ccpt1_3', x: 120, y: 98, success: 'hate'}
											{name: 'ccpt1_4', x: 120, y: 145, success: 'like'}
											{name: 'ccpt1_5', x: 120, y: 194, success: 'like'}
											{name: 'ccpt1_6', x: 120, y: 242, success: 'love'}
										]
									}
								}
							]
							[
								{name:'snd', opts:{id:'s/che3'}}
								{
									name:'ccpt1'
									opts:{
										containers:[
											{name: 'ccpt1_1', x: 250, y: 0, success: 'love'}
											{name: 'ccpt1_2', x: 250, y: 49, success: 'love'}
											{name: 'ccpt1_3', x: 250, y: 98, success: 'like'}
											{name: 'ccpt1_4', x: 250, y: 145, success: 'hate'}
											{name: 'ccpt1_5', x: 250, y: 194, success: '#empty'}
											{name: 'ccpt1_6', x: 250, y: 242, success: 'like'}
										]
									}
								}
							]
							[
								{name:'snd', opts:{id:'s/che4'}}
								{
									name:'ccpt1'
									opts:{
										containers:[
											{name: 'ccpt1_1', x: 380, y: 0, success: '#empty'}
											{name: 'ccpt1_2', x: 380, y: 49, success: 'dontlike'}
											{name: 'ccpt1_3', x: 380, y: 98, success: 'like'}
											{name: 'ccpt1_4', x: 380, y: 145, success: 'like'}
											{name: 'ccpt1_5', x: 380, y: 194, success: 'love'}
											{name: 'ccpt1_6', x: 380, y: 242, success: 'hate'}
										]
									}
								}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'fondo', x: 400, y: 130, align: 'tc'}
						{type: 'ccpt', id: 'ccpt1', x: 236, y: 226, uwidth: 85, uheight: 40}
						{type: 'drg', id: 'dragblelove', name: 'drg1', x: 150, y: 540, index: 'love', target: 'ccpt1', eval: 'clon_01', afterSuccess: 'origin', afterFail: 'origin'}
						{type: 'drg', id: 'dragblelike', name: 'drg2', x: 220, y: 540, index: 'like', target: 'ccpt1', eval: 'clon_01', afterSuccess: 'origin', afterFail: 'origin'}
						{type: 'drg', id: 'dragbledontlike', name: 'drg3', x: 290, y: 540, index: 'dontlike', target: 'ccpt1', eval: 'clon_01', afterSuccess: 'origin', afterFail: 'origin'}
						{type: 'drg', id: 'dragblehate', name: 'drg4', x: 360, y: 540, index: 'hate', target: 'ccpt1', eval: 'clon_01', afterSuccess: 'origin', afterFail: 'origin'}
						{
							type: 'btn', id: 'finish', x: 610, y: 540, target:'ccpt1', isFinish: true
							states:[
								img: {name:'finish', x: 0, y: 0}
							]
						}
						{
							type: 'btn', id: 'repeat', x: 480, y: 540, isRepeat: true
							states:[
								img: {name:'repeat', x: 0, y: 0}
							]
						}
					]
					groups: []
				}
			]
		super()
	window.U3A1 = U3A1