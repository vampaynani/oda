###

NEW ODA

###
class U4A2 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'c1', src: 'circle1.png'}
		    {id:'c2', src: 'circle2.png'}
		    {id:'balloon1', src:'balloon_1.png'}
			{id:'balloon2', src:'balloon_2.png'}
			{id:'balloon3', src:'balloon_3.png'}
			{id:'repeat', src:'btn_repeat.png'}
			{id:'docquestion', src:'doc_question.png'}
			{id:'docright', src:'doc_right.png'}
			{id:'docwrong', src:'doc_wrong.png'}
			{src:'TU3_U4_A2_bugbite.mp3', id:'s/bugbite'}
			{src:'TU3_U4_A2_chickenpox.mp3', id:'s/chickenpox'}
			{src:'TU3_U4_A2_cold.mp3', id:'s/cold'}
			{src:'TU3_U4_A2_cough.mp3', id:'s/cough'}
			{src:'TU3_U4_A2_earache.mp3', id:'s/earache'}
			{src:'TU3_U4_A2_eye.mp3', id:'s/eye'}
			{src:'TU3_U4_A2_fever.mp3', id:'s/fever'}
			{src:'TU3_U4_A2_finger.mp3', id:'s/finger'}
			{src:'TU3_U4_A2_headache.mp3', id:'s/headache'}
			{src:'TU3_U4_A2_hiccups.mp3', id:'s/hiccups'}
			{src:'TU3_U4_A2_hot.mp3', id:'s/hot'}
			{src:'TU3_U4_A2_knee.mp3', id:'s/knee'}
			{src:'TU3_U4_A2_runnynose.mp3', id:'s/runnynose'}
			{src:'TU3_U4_A2_sorethroat.mp3', id:'s/sorethroat'}
			{src:'TU3_U4_A2_stomachache.mp3', id:'s/stomachache'}
			{src:'TU3_U4_A2_sunburn.mp3', id:'s/sunburn'}
			{src:'TU3_U4_A2_tired.mp3', id:'s/tired'}
			{src:'TU3_U4_A2_toothache.mp3', id:'s/toothache'}
			{src:'TU3_U4_A2_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Listen, read and click on the correct advice.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 18, aimg: 'c1', acolor: '#FE008F', bimg: 'c2', bcolor: '#0A9BDD'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/chickenpox'}}
								{name: 'btn1', opts:{txt: {text:'You shouldn\'t scratch yourself.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should go to the dentist.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should wash it with soap and watter.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/eye'}}
								{name: 'btn1', opts:{txt: {text:'You should wash your eye with water.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should wear sunglasses.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should rub your eye.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'snd', opts:{id: 's/cold'}}
								{name: 'btn1', opts:{txt: {text:'You should hold your breath.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should sit outside.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should take some vitamin C.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/stomachache'}}
								{name: 'btn1', opts:{txt: {text:'You should eat more candy.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should take some medicine.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should cover your mouth.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/knee'}}
								{name: 'btn1', opts:{txt: {text:'You should put some cream on it.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should eat some candy.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should scratch it.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/earache'}}
								{name: 'btn1', opts:{txt: {text:'You should put some cream on it.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should go to the doctor.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should go to bed.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'snd', opts:{id: 's/toothache'}}
								{name: 'btn1', opts:{txt: {text:'You should go to the eye doctor.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should drink some tea with honey.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should go to the dentist.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'snd', opts:{id: 's/cough'}}
								{name: 'btn1', opts:{txt: {text:'You should go swimming.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should put cream on it.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should take some medicine.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'snd', opts:{id: 's/fever'}}
								{name: 'btn1', opts:{txt: {text:'You should drink a glass of water.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should wash with soap and water.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should go to the doctor.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'snd', opts:{id: 's/finger'}}
								{name: 'btn1', opts:{txt: {text:'You should put a bondage on it.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should get your finger dirty.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should wash your finger with soap.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'snd', opts:{id: 's/sunburn'}}
								{name: 'btn1', opts:{txt: {text:'You should wear sunglasses.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You shouldn\'t take a bath.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should sit in the shade.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/hiccups'}}
								{name: 'btn1', opts:{txt: {text:'You should hold your breath.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You shouldn\'t eat any chicken soup.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should take some medicine.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/hot'}}
								{name: 'btn1', opts:{txt: {text:'You should wear a warm coat.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should take your temperature.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should run outside.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/bugbite'}}
								{name: 'btn1', opts:{txt: {text:'You should put cream on it.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You shouldn\'t get some rest.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should go to bed.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/tired'}}
								{name: 'btn1', opts:{txt: {text:'You should call a doctor.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You shouldn\'t go to bed late at night.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should take a hot shower.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:1}}
								{name: 'snd', opts:{id: 's/sorethroat'}}
								{name: 'btn1', opts:{txt: {text:'You should drink some tea with honey.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should eat a snack.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should sit in the shade.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'snd', opts:{id: 's/runnynose'}}
								{name: 'btn1', opts:{txt: {text:'You should go to bed.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should blow it.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should eat an apple.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'snd', opts:{id: 's/headache'}}
								{name: 'btn1', opts:{txt: {text:'You shouldn\'t blow your nose.', font:'14px Quicksand', color: '#FFF', align:'center', x: -20, y: -50, lineWidth: 180}, img: {name:'balloon1', align:'bc'}}}
								{name: 'btn2', opts:{txt: {text:'You should exercise.', font:'14px Quicksand', color: '#FFF', align:'center', x: 10, y: -45, lineWidth: 180}, img: {name:'balloon2', align:'bc'}}}
								{name: 'btn3', opts:{txt: {text:'You should rest.', font:'14px Quicksand', color: '#FFF', align:'center', x: 0, y: -45, lineWidth: 180}, img: {name:'balloon3', align:'bc'}}}
							]
						]
						mixed: true
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'docquestion', x: 341, y: 144}
						{
							type: 'btn', id: 'btn1', x: 224, y: 289, index: 1, target: 'global', eval: 'global_01'
							states: [{txt: {text: '', name: 'b1', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn2', x: 613, y: 356, index: 2, target: 'global', eval: 'global_01'
							states: [{txt: {text: '', name: 'b2', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn3', x: 396, y: 523, index: 3, target: 'global', eval: 'global_01'
							states: [{txt: {text: '', name: 'b3', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'repeat', x: 489, y: 197, align: 'tc', isRepeat: true
							states:[{img: {name:'repeat', x: 0, y: 0}}]
						}
					]
					groups: []
				}
			]
		super()
	window.U4A2 = U4A2