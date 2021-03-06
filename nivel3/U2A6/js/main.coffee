###

NEW ODA

###
class U2A6 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'btnAreFew', src:'btn_arefew.png'}
			{id: 'btnAreLot', src:'btn_arelot.png'}
			{id: 'btnAreNone', src:'btn_arenone.png'}
			{id: 'btnIsLittle', src:'btn_islittle.png'}
			{id: 'btnIsLot', src:'btn_islot.png'}
			{id: 'btnIsNone', src:'btn_isnone.png'}
			{id: 'fondo', src:'fondo.png'}
			{id: 'objectBlueberries', src:'object_blueberries_7.png'}
			{id: 'objectButter', src:'object_butter_3.png'}
			{id: 'objectCheese', src:'object_cheese_6.png'}
			{id: 'objectEggs', src:'object_eggs_1.png'}
			{id: 'objectHoney', src:'object_honey_5.png'}
			{id: 'objectMeat1', src:'object_meat_12.png'}
			{id: 'objectMilk', src:'object_milk_2.png'}
			{id: 'objectMushrooms', src:'object_mushrooms_11.png'}
			{id: 'objectPeppers', src:'object_peppers_8.png'}
			{id: 'objectPopcorn', src:'object_popcorn_10.png'}
			{id: 'objectPumpkins', src:'object_pumpkins_9.png'}
			{id: 'objectYarn', src:'object_yarn_4.png'}
			{src:'TU3_U2_A6_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Look and click on the correct options. Careful! You are only allowed two errors!', sound:'s/instructions', played: false}]}
			score:{type: 'clock', x: 20, y: 500, init: 80, aimg: 'c2', acolor: '#C3DB5B'}
			scenes:[
				{
					answers: {
						collection: [
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
							[{name:'grd1'}]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'fondo', x: 0, y: 123}
						{
							type: 'grd', id: 'grd1', x: 290, y: 240, columns: 4, rows: 3, uwidth: 127, uheight: 125, align:'evenodd', mixed: true
							label: {x: 180, y: -110, font: '20px Quicksand', color: '#333', align: 'center'}
							cells: [
								{txt: 'How many are there?', img: 'objectEggs', success: 'arenone'}
								{txt: 'How many are there?', img: 'objectBlueberries', success: 'arelot'}
								{txt: 'How much is there?', img: 'objectMeat1', success: 'islittle'}
								{txt: 'How much is there?', img: 'objectYarn', success: 'islot'}
								{txt: 'How much is there?', img: 'objectPopcorn', success: 'islot'}
								{txt: 'How much is there?', img: 'objectMilk', success: 'islittle'}
								{txt: 'How much is there?', img: 'objectButter', success: 'isnone'}
								{txt: 'How many are there?', img: 'objectPeppers', success: 'arelot'}
								{txt: 'How many are there?', img: 'objectMushrooms', success: 'arenone'}
								{txt: 'How many are there?', img: 'objectPumpkins', success: 'arefew'}
								{txt: 'How much is there?', img: 'objectHoney', success: 'islot'}
								{txt: 'How much is there?', img: 'objectCheese', success: 'islot'}
							]
						}
						{
							type: 'btn', id: 'btn1', x: 40, y: 260, index: 'islot', target: 'grd1', eval: 'click_03'
							states: [{img: {name: 'btnIsLot', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn2', x: 40, y: 300, index: 'islittle', target: 'grd1', eval: 'click_03'
							states: [{img: {name: 'btnIsLittle', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn3', x: 40, y: 340, index: 'isnone', target: 'grd1', eval: 'click_03'
							states: [{img: {name: 'btnIsNone', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn4', x: 40, y: 380, index: 'arelot', target: 'grd1', eval: 'click_03'
							states: [{img: {name: 'btnAreLot', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn5', x: 40, y: 420, index: 'arefew', target: 'grd1', eval: 'click_03'
							states: [{img: {name: 'btnAreFew', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn6', x: 40, y: 460, index: 'arenone', target: 'grd1', eval: 'click_03'
							states: [{img: {name: 'btnAreNone', x: 0, y: 0}}]
						}
					]
					groups: []
				}
			]
		super()
	window.U2A6 = U2A6