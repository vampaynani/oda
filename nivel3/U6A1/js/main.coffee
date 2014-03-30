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
			score:{type: 'points', x:20, y:500, init: 0, total: 24, aimg: 'c1', acolor: '#EB2D3C', bimg: 'c2', bcolor: '#C3DB5B'}
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
						{type: 'swct', id: 'wcpt1', x: 214, y: 368, margin: 10, uwidth: 20, font: '24px Quicksand', scolor: '#eb2d3d', align: 'tc', eval:'drop_03'}
						{type: 'swct', id: 'wcpt2', x: 608, y: 368, margin: 10, uwidth: 20, font: '24px Quicksand', scolor: '#eb2d3d', align: 'tc', eval:'drop_03'}
						{type: 'swct', id: 'wcpt3', x: 415, y: 547, margin: 10, uwidth: 20, font: '24px Quicksand', scolor: '#eb2d3d', align: 'tc', eval:'drop_03'}
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
				{
					answers: {
						collection: [
							[
								{name:'grp1_0', opts:{type:'fadeIn', target:'scene2bison'}}
								{name: 'pcpt1', opts:{pattern:['#tcpt'], targets: [{text:'leg'}]}}
								{name: 'pcpt2', opts:{pattern:['#tcpt'], targets: [{text:'horn'}]}}
								{name:'grp0_1', opts:{type:'choose'}}
								{name:'grp0_2', opts:{type:'hide'}}
								{name:'grp0_3', opts:{type:'hide'}}
								{name:'grp0_4', opts:{type:'hide'}}
							]
							[
								{name:'grp1_0', opts:{type:'fadeIn', target:'scene2velociraptor'}}
								{name: 'pcpt3', opts:{pattern:['#tcpt'], targets: [{text:'feather'}]}}
								{name: 'pcpt4', opts:{pattern:['#tcpt'], targets: [{text:'teeth'}]}}
								{name: 'pcpt5', opts:{pattern:['#tcpt'], targets: [{text:'claw'}]}}
								{name: 'pcpt6', opts:{pattern:['#tcpt'], targets: [{text:'wing'}]}}
								{name:'grp0_1', opts:{type:'hide'}}
								{name:'grp0_2', opts:{type:'choose'}}
								{name:'grp0_3', opts:{type:'hide'}}
								{name:'grp0_4', opts:{type:'hide'}}
							]
							[
								{name:'grp1_0', opts:{type:'fadeIn', target:'scene2mauisaurus'}}
								{name: 'pcpt7', opts:{pattern:['#tcpt'], targets: [{text:'fin'}]}}
								{name: 'pcpt8', opts:{pattern:['#tcpt'], targets: [{text:'head'}]}}
								{name: 'pcpt9', opts:{pattern:['#tcpt'], targets: [{text:'neck'}]}}
								{name:'grp0_1', opts:{type:'hide'}}
								{name:'grp0_2', opts:{type:'hide'}}
								{name:'grp0_3', opts:{type:'choose'}}
								{name:'grp0_4', opts:{type:'hide'}}
							]
							[
								{name:'grp1_0', opts:{type:'fadeIn', target:'scene2mamut'}}
								{name: 'pcpt10', opts:{pattern:['#tcpt'], targets: [{text:'tail'}]}}
								{name: 'pcpt11', opts:{pattern:['#tcpt'], targets: [{text:'hair'}]}}
								{name: 'pcpt12', opts:{pattern:['#tcpt'], targets: [{text:'tusk'}]}}
								{name:'grp0_1', opts:{type:'hide'}}
								{name:'grp0_2', opts:{type:'hide'}}
								{name:'grp0_3', opts:{type:'hide'}}
								{name:'grp0_4', opts:{type:'choose'}}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'propwords', x: 115, y: 490}
						{type: 'img', id: 'scene2bison', x: 400, y: 300, align: 'mc'}
						{type: 'img', id: 'scene2mamut', x: 400, y: 300, align: 'mc'}
						{type: 'img', id: 'scene2velociraptor', x: 400, y: 300, align: 'mc'}
						{type: 'img', id: 'scene2mauisaurus', x: 400, y: 300, align: 'mc'}
						{type: 'pcpt', id: 'pcpt1', x: 120, y: 297, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt2', x: 700, y: 163, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt3', x: 205, y: 274, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt4', x: 660, y: 254, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt5', x: 185, y: 434, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt6', x: 680, y: 384, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt7', x: 137, y: 326, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt8', x: 670, y: 212, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt9', x: 670, y: 425, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt10', x: 175, y: 414, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt11', x: 145, y: 213, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'pcpt', id: 'pcpt12', x: 655, y: 336, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#F00', stroke: 1}
						{type: 'ldrg', id: 'ldrg1', x: 140, y: 520, index: 'horn', text:'horn', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg2', x: 220, y: 510, index: 'feather', text:'feather', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg3', x: 340, y: 500, index: 'tail', text:'tail', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg4', x: 430, y: 500, index: 'fin', text:'fin', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg5', x: 510, y: 502, index: 'head', text:'head', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg6', x: 600, y: 510, index: 'teeth', text:'teeth', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg7', x: 200, y: 545, index: 'tusk', text:'tusk', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg8', x: 290, y: 535, index: 'neck', text:'neck', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg9', x: 380, y: 535, index: 'claw', text:'claw', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg10', x: 460, y: 535, index: 'wing', text:'wing', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg11', x: 550, y: 540, index: 'leg', text:'leg', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
						{type: 'ldrg', id: 'ldrg12', x: 650, y: 545, index: 'hair', text:'hair', font:'24px Quicksand', color:'#333', eval: 'drop_02_02', afterSuccess: 'hide', afterFail: 'return'
						target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10','pcpt11','pcpt12']}
					]
					groups: [
						{
							type: 'grp', id: 'grp1_0', invisible: true
							group: [
								'scene2bison'
								'scene2mamut'
								'scene2velociraptor'
								'scene2mauisaurus'
							]
						}
						{
							type: 'grp', id: 'grp0_1', invisible: true
							group: [
								'pcpt1'
								'pcpt2'
							]
						}
						{
							type: 'grp', id: 'grp0_2', invisible: true
							group: [
								'pcpt3'
								'pcpt4'
								'pcpt5'
								'pcpt6'
							]
						}
						{
							type: 'grp', id: 'grp0_3', invisible: true
							group: [
								'pcpt7'
								'pcpt8'
								'pcpt9'
							]
						}
						{
							type: 'grp', id: 'grp0_4', invisible: true
							group: [
								'pcpt10'
								'pcpt11'
								'pcpt12'
							]
						}
					]
				}
			]
		super()
	window.U6A1 = U6A1