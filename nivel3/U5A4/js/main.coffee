###

NEW ODA

###
class U5A4 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id:'c1', src: 'circle1.png'}
			{id:'c2', src: 'circle2.png'}
			{id: 'sc1', src:'btn_powhatan.png'}
			{id: 'sc2', src:'btn_alaska.png'}
 			{id: 'n1', src:'tag_verb.png'}
			{id: 'n2', src:'tag_pronoun.png'}
			{id: 'btnnoWas', src:'bt_noWas.png'}
			{id: 'btnnoWere', src:'bt_noWere.png'}
			{id: 'btnyesWas', src:'bt_yesWas.png'}
			{id: 'btnyesWere', src:'bt_yesWere.png'}
			{src:'TU3_U5_A4_instructions.mp3', id:'s/instructions'}
			{src:'TU3_U5_A4_instructions2.mp3', id:'s/instructions2'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Click on one of the pictures.', sound:'s/instructions', played: false},{text:'Drag the words to make a question. Then click on the answer', sound:'s/instructions2', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 20, aimg: 'c1', acolor: '#333', bimg: 'c2', bcolor: '#333'}
			scenes:[
				{
					answers: {
						collection: []
					}
					containers:[
						{
							type: 'btn', id: 'btn1', x: 400, y: 230, index: 1, target: 'global', eval: 'savechoose'
							states: [{img: {name: 'sc1', align: 'mc', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn2', x: 400, y: 450, index: 2, target: 'global', eval: 'savechoose'
							states: [{img: {name: 'sc2', align: 'mc', x: 0, y: 0}}]
						}
					]
					groups: [
						
					]
				}
				{
					answers: {
						collection: [
						]
						type:'steps'
					}
					containers:[
						{type:'img', id:'sc1'}
					]
					groups: [
						
					]
				}
			]
		super()
	window.U5A4 = U5A4