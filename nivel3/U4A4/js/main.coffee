###

NEW ODA

###
class U4A4 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'c1', src: 'circle1.png'}
		    {id:'c2', src: 'circle2.png'}
		    {id: 'btnH', src:'btn_H.png'}
			{id: 'btnU', src:'btn_U.png'}
		    {id:'repeat', src:'btn_repeat.png'}
			{src:'TU3_U4_A4_1.mp3', id:'s/1'}
		    {src:'TU3_U4_A4_2.mp3', id:'s/2'}
		    {src:'TU3_U4_A4_3.mp3', id:'s/3'}
		    {src:'TU3_U4_A4_4.mp3', id:'s/4'}
		    {src:'TU3_U4_A4_5.mp3', id:'s/5'}
		    {src:'TU3_U4_A4_6.mp3', id:'s/6'}
		    {src:'TU3_U4_A4_7.mp3', id:'s/7'}
		    {src:'TU3_U4_A4_8.mp3', id:'s/8'}
		    {src:'TU3_U4_A4_9.mp3', id:'s/9'}
		    {src:'TU3_U4_A4_10.mp3', id:'s/10'}
		    {src:'TU3_U4_A4_11.mp3', id:'s/11'}
		    {src:'TU3_U4_A4_12.mp3', id:'s/12'}
		    {src:'TU3_U4_A4_13.mp3', id:'s/13'}
		    {src:'TU3_U4_A4_14.mp3', id:'s/14'}
		    {src:'TU3_U4_A4_15.mp3', id:'s/15'}
		    {src:'TU3_U4_A4_16.mp3', id:'s/16'}
		    {src:'TU3_U4_A4_17.mp3', id:'s/17'}
		    {src:'TU3_U4_A4_18.mp3', id:'s/18'}
		    {src:'TU3_U4_A4_19.mp3', id:'s/19'}
		    {src:'TU3_U4_A4_20.mp3', id:'s/20'}
			{src:'TU3_U4_A4_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Listen and click on the correct option.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 20, aimg: 'c1', acolor: '#FE008F', bimg: 'c2', bcolor: '#0A9BDD'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/1'}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/2'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/3'}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/4'}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/5'}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/6'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/7'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/8'}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/9'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/10'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/11'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/12'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/13'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/14'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/15'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/16'}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/17'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/18'}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/19'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/20'}}
							]
						]
						mixed: true
						type: 'steps'
					}
					containers:[
						{
							type: 'btn', id: 'btn1', x: 509, y: 286, index: 1, target: 'global', eval: 'global_01', overScale: 0.85
							states: [{img: {name: 'btnH', align: 'mc', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn2', x: 330, y: 473, index: 2, target: 'global', eval: 'global_01', overScale: 0.85
							states: [{img: {name: 'btnU', align: 'mc', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'repeat', x: 600, y: 541, align: 'tc', isRepeat: true
							states:[{img: {name:'repeat', x: 0, y: 0}}]
						}
					]
					groups: []
				}
			]
		super()
	window.U4A4 = U4A4