###

NEW ODA

###
class U8A1 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'imgballon', src: 'img_ballon.png'}
			{id: 'imgbus', src: 'img_bus.png'}
			{id: 'imgicecream', src: 'img_icecream.png'}
			{id: 'imgmovies', src: 'img_movies.png'}
			{id: 'imgocean', src: 'img_ocean.png'}
			{id: 'imgpizza', src: 'img_pizza.png'}
			{id: 'imgsandcastle', src: 'img_sandcastle.png'}
			{id: 'imgscuba', src: 'img_scuba.png'}
			{id: 'imgshopping', src: 'img_shopping.png'}
			{id: 'imgvolleyball', src: 'img_volleyball.png'}
			{id: 'bg', src: 'prop_bg.png'}
			{src:'TU3_U8_A1_Instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Drag the words to make sentences about the people in the picture.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 10, aimg: 'c1', acolor: '#FE008F', bimg: 'c2', bcolor: '#0A9BDD'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name: 'grp_btn', opts:{type:'pulseAll'}}
								{name: 'pcpt1', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt'], targets: [{text:'they'}, {text:'are'}, {text:'going'}, {text:'to'}, {text:'buy'}, {text:'a'}, {text:'balloon'}], label:'t1'}}
								{name: 'pcpt2', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt'], targets: [{text:'she'}, {text:'is'}, {text:'going'}, {text:'to'}, {text:'catch'}, {text:'the'}, {text:'bus'}], label:'t2'}}
								{name: 'pcpt3', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt'], targets: [{text:'she'}, {text:'is'}, {text:'going'}, {text:'to'}, {text:'buy'}, {text:'an'}, {text:'ice cream', success:'icecream'}], label:'t3'}}
								{name: 'pcpt4', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt', '#tcpt'], targets: [{text:'he'}, {text:'is'}, {text:'going'}, {text:'to'}, {text:'go'}, {text:'to'}, {text:'the'}, {text:'movies'}], label:'t4'}}
								{name: 'pcpt5', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt', '#tcpt'], targets: [{text:'they'}, {text:'are'}, {text:'going'}, {text:'to'}, {text:'swim'}, {text:'in'}, {text:'the'}, {text:'ocean'}], label:'t5'}}
								{name: 'pcpt6', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt'], targets: [{text:'they'}, {text:'are'}, {text:'going'}, {text:'to'}, {text:'eat'}, {text:'pizza'}], label:'t6'}}
								{name: 'pcpt7', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt'], targets: [{text:'he'}, {text:'is'}, {text:'going'}, {text:'to'}, {text:'build'}, {text:'a'}, {text:'sandcastle'}], label:'t7'}}
								{name: 'pcpt8', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt', '#tcpt'], targets: [{text:'they'}, {text:'are'}, {text:'going'}, {text:'to'}, {text:'go'}, {text:'scuba'}, {text:'diving'}], label:'t8'}}
								{name: 'pcpt9', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt'], targets: [{text:'he'}, {text:'is'}, {text:'going'}, {text:'to'}, {text:'go'}, {text:'shopping'}], label:'t9'}}
								{name: 'pcpt10', opts:{pattern:['#tcpt', '#tcpt', '#tcpt', '#tcpt', '#tcpt',  '#tcpt', '#tcpt'], targets: [{text:'she'}, {text:'is'}, {text:'going'}, {text:'to'}, {text:'hit'}, {text:'the'}, {text:'ball'}], label:'t10'}}
							]
						]
						type: 'steps'
					}
					containers:[
						
						{type: 'img', id: 'bg', x: 132, y: 187}
						{type: 'img', id: 'imgshopping', x: 557, y: 422, scale: 0.5, align: 'mr'}
						{type: 'img', id: 'imgvolleyball', x: 445, y: 351, scale: 0.5, align: 'mr'}
						{
							type: 'btn', id: 'btn1', x: 477, y: 319, index: 1, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgballon', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn2', x: 392, y: 462, index: 2, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgbus', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn3', x: 190, y: 259, index: 3, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgicecream', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn4', x: 699, y: 421, index: 4, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgmovies', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn5', x: 316, y: 264, index: 5, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgocean', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn6', x: 233, y: 415, index: 6, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgpizza', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn7', x: 554, y: 305, index: 7, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgsandcastle', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn8', x: 696, y: 236, index: 8, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgscuba', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn9', x: 558, y: 423, index: 9, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgshopping', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{
							type: 'btn', id: 'btn10', x: 446, y: 352, index: 10, target: ['grp_txt','grp_pcpt'], overTween: false, eval: 'show_choose_01'
							states: [{img: {name: 'imgvolleyball', x: 0, y: 0, scale: 0.5, align: 'mr'}}]
						}
						{type: 'txt', id: 't1', text:'What are they going to buy?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't2', text:'What is she going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't3', text:'What is she going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't4', text:'Where is going to go?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't5', text:'What are they going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't6', text:'What are they going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't7', text:'What is he going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't8', text:'What are they going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't9', text:'What is he going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'txt', id: 't10', text:'What is she going to do?', x: 400, y: 515, font:'18px Quicksand', align: 'center'}
						{type: 'pcpt', id: 'pcpt1', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt2', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt3', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt4', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt5', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt6', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt7', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt8', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt9', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'pcpt', id: 'pcpt10', x: 400, y: 550, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#eb188e'}
						{type: 'ldrg', id: 'ldrg1', x: 130, y: 126, index: 'swim', text:'swim', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg2', x: 180, y: 126, index: 'ball', text:'ball', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg3', x: 220, y: 126, index: 'he', text:'he', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg4', x: 250, y: 126, index: 'is', text:'is', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg5', x: 280, y: 126, index: 'movies', text:'movies', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg6', x: 350, y: 126, index: 'an', text:'an', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg7', x: 380, y: 126, index: 'balloon', text:'balloon', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg8', x: 450, y: 126, index: 'icecream', text:'ice cream', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg9', x: 540, y: 126, index: 'how', text:'how', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg10', x: 580, y: 126, index: 'scubadiving', text:'scuba diving', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg11', x: 690, y: 126, index: 'she', text:'she', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg12', x: 130, y: 146, index: 'jump', text:'jump', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg13', x: 180, y: 146, index: 'a', text:'a', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg14', x: 200, y: 146, index: 'eat', text:'eat', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg15', x: 240, y: 146, index: 'going', text:'going', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg16', x: 300, y: 146, index: 'what', text:'what', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg17', x: 350, y: 146, index: 'to', text:'to', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg18', x: 380, y: 146, index: 'shopping', text:'shopping', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg19', x: 470, y: 146, index: 'are', text:'are', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg20', x: 510, y: 146, index: 'do', text:'do', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg21', x: 540, y: 146, index: 'they', text:'they', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg22', x: 590, y: 146, index: 'in', text:'in', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg23', x: 620, y: 146, index: 'build', text:'build', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg24', x: 680, y: 146, index: 'ocean', text:'ocean', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg25', x: 200, y: 166, index: 'buy', text:'buy', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg26', x: 240, y: 166, index: 'sandcastle', text:'sand castle', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg27', x: 340, y: 166, index: 'bus', text:'bus', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg28', x: 380, y: 166, index: 'go', text:'go', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg29', x: 410, y: 166, index: 'the', text:'the', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg30', x: 450, y: 166, index: 'hit', text:'hit', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg31', x: 480, y: 166, index: 'pizza', text:'pizza', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg32', x: 540, y: 166, index: 'catch', text:'catch', font:'16px Quicksand', color:'#333', target: ['pcpt1','pcpt2','pcpt3','pcpt4','pcpt5','pcpt6','pcpt7','pcpt8','pcpt9','pcpt10'], eval: 'phrase_drop_03', afterSuccess: 'origin', afterFail: 'return'}
					]	
					groups: [
						{
							type:'grp', id:'grp_btn'
							group: [
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
							type:'grp', id:'grp_txt', invisible: true
							group: [
								't1'
								't2'
								't3'
								't4'
								't5'
								't6'
								't7'
								't8'
								't9'
								't10'
							]
						}
						{
							type:'grp', id:'grp_pcpt', invisible: true
							group: [
								'pcpt1'
								'pcpt2'
								'pcpt3'
								'pcpt4'
								'pcpt5'
								'pcpt6'
								'pcpt7'
								'pcpt8'
								'pcpt9'
								'pcpt10'
							]
						}
					]
				}
			]
		super()
	window.U8A1 = U8A1