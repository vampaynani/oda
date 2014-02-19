###

NEW ODA

###
class U6A1 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id:'propclaw', src:'prop_claw.png'}
			{id:'propfeather', src:'prop_feather.png'}
			{id:'propfin', src:'prop_fin.png'}
			{id:'prophair', src:'prop_hair.png'}
			{id:'prophead', src:'prop_head.png'}
			{id:'prophorn', src:'prop_horn.png'}
			{id:'propleg', src:'prop_leg.png'}
			{id:'propneck', src:'prop_neck.png'}
			{id:'proptail', src:'prop_tail.png'}
			{id:'propteeth', src:'prop_teeth.png'}
			{id:'proptusk', src:'prop_tusk.png'}
			{id:'propwing', src:'prop_wing.png'}
			{id:'propwords', src:'prop_words.png'}
			{id:'scene2bison', src:'scene2_bison.png'}
			{id:'scene2mamut', src:'scene2_mamut.png'}
			{id:'scene2mauisaurus', src:'scene2_mauisaurus.png'}
			{id:'scene2velociraptor', src:'scene2_velociraptor.png'}
			{src:'TU3_U6_A1_instructions.mp3', id:'s/instructions'}
		    {src:'TU3_U6_A1_instructions2.mp3', id:'s/instructions2'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Look and drag the letters to form a word.', sound:'s/instructions', played: false}, {text:'Now label the pictures.', sound:'s/instructions2', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 24, aimg: 'c1', acolor: '#333', bimg: 'c2', bcolor: '#333'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name:'grp1', opts:{type:'choose'}}
								{name:'wcpt1', opts:{word:'tusk', target: 'proptusk'}}
								{name:'wcpt2', opts:{word:'fin', target: 'propfin'}}
								{name:'wcpt3', opts:{word:'claw', target: 'propclaw'}}
							]
							[
								{name:'grp2', opts:{type:'choose'}}
								{name:'wcpt1', opts:{word:'horn', target: 'prophorn'}}
								{name:'wcpt2', opts:{word:'leg', target: 'propleg'}}
								{name:'wcpt3', opts:{word:'feather', target: 'propfeather'}}
							]
							[
								{name:'grp3', opts:{type:'choose'}}
								{name:'wcpt1', opts:{word:'wing', target: 'propwing'}}
								{name:'wcpt2', opts:{word:'neck', target: 'propneck'}}
								{name:'wcpt3', opts:{word:'hair', target: 'prophair'}}
							]
							[
								{name:'grp4', opts:{type:'choose'}}
								{name:'wcpt1', opts:{word:'head', target: 'prophead'}}
								{name:'wcpt2', opts:{word:'teeth', target: 'propteeth'}}
								{name:'wcpt3', opts:{word:'tail', target: 'proptail'}}
							]
						]
						mixed: true
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'proptusk', x: 204, y: 258, align: 'mc'}
						{type: 'img', id: 'propfin', x: 598, y: 258, align: 'mc'}
						{type: 'img', id: 'propclaw', x: 405, y: 437, align: 'mc'}
						{type: 'img', id: 'prophorn', x: 204, y: 258, align: 'mc'}
						{type: 'img', id: 'propleg', x: 598, y: 258, align: 'mc'}
						{type: 'img', id: 'propfeather', x: 405, y: 437, align: 'mc'}
						{type: 'img', id: 'propwing', x: 204, y: 258, align: 'mc'}
						{type: 'img', id: 'propneck', x: 598, y: 258, align: 'mc'}
						{type: 'img', id: 'prophair', x: 405, y: 437, align: 'mc'}
						{type: 'img', id: 'prophead', x: 204, y: 258, align: 'mc'}
						{type: 'img', id: 'propteeth', x: 598, y: 258, align: 'mc'}
						{type: 'img', id: 'proptail', x: 405, y: 437, align: 'mc'}
						{type: 'wcpt', id: 'wcpt1', x: 214, y: 368, margin: 10, uwidth: 20, font: '24px Quicksand', scolor: '#eb2d3d', align: 'tc', eval:'drop_03'}
						{type: 'wcpt', id: 'wcpt2', x: 608, y: 368, margin: 10, uwidth: 20, font: '24px Quicksand', scolor: '#eb2d3d', align: 'tc', eval:'drop_03'}
						{type: 'wcpt', id: 'wcpt3', x: 415, y: 547, margin: 10, uwidth: 20, font: '24px Quicksand', scolor: '#eb2d3d', align: 'tc', eval:'drop_03'}
					]
					groups: [
						{
							type: 'grp', id: 'grp1', invisible: true
							group: [
								'proptusk'
								'propfin'
								'propclaw'
							]
						}
						{
							type: 'grp', id: 'grp2', invisible: true
							group: [
								'prophorn'
								'propleg'
								'propfeather'
							]
						}
						{
							type: 'grp', id: 'grp3', invisible: true
							group: [
								'propwing'
								'propneck'
								'prophair'
							]
						}
						{
							type: 'grp', id: 'grp4', invisible: true
							group: [
								'prophead'
								'propteeth'
								'proptail'
							]
						}
					]
				}
			]
		super()
	window.U6A1 = U6A1