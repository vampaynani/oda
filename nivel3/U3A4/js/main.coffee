###

NEW ODA

###
class U3A4 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id: 'n1', src: 'nube1.png'}
		    {id: 'n2', src: 'nube2.png'}
		    {id: 'n3', src: 'nube3.png'}
			{id: 'caras', src:'caras.png'}
			{id: 'img01', src:'imagenes0001.png'}#ballet
			{id: 'img02', src:'imagenes0002.png'}#skate
			{id: 'img03', src:'imagenes0003.png'}#chat
			{id: 'img04', src:'imagenes0004.png'}#drum
			{id: 'img05', src:'imagenes0005.png'}#karate
			{id: 'img06', src:'imagenes0006.png'}#study
			{id: 'img07', src:'imagenes0007.png'}#gimnasia
			{id: 'img08', src:'imagenes0008.png'}#swim
			{id: 'img09', src:'imagenes0009.png'}#violin
			{id: 'img10', src:'imagenes0010.png'}#PCGAMES
			{src:'TU3_U3_A4_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Look and click on the words to make a sentence.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 10, aimg: 'c1', acolor: '#0096DB', bimg: 'c2', bcolor: '#BFD951'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img01'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'love'}, {text:'taking'}, {text:'ballet class', success:'balletclass'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img02'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'like'}, {text:'going'}, {text:'roller skating', success:'rollerskating'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img03'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'like'}, {text:'chatting'}, {text:'online with friends', success:'onlinewithfriends'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img04'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'don\'t like', success:'dontlike'}, {text:'playing'}, {text:'in the school band', success:'intheschoolband'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img05'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'love'}, {text:'taking'}, {text:'karate lessons', success:'karatelessons'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img06'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'love'}, {text:'learning'}, {text:'English', success:'english'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img07'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'hate'}, {text:'doing'}, {text:'gymnastics'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img08'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'don\'t like', success:'dontlike'}, {text:'taking'}, {text:'swimming lessons', success:'swimminglessons'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img09'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'like'}, {text:'playing'}, {text:'the violin', success:'theviolin'}]}}
							]
							[
								{name: 'grp1', opts:{type: 'fadeIn', target: 'img10'}}
								{name: 'pcpt1', opts:{pattern:['I', '#tcpt', '#tcpt', '#tcpt', '.'], targets: [{text:'hate'}, {text:'playing'}, {text:'computer games', success:'computergames'}]}}
							]
						]
						mixed: true
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'caras', x: 670, y: 120}
						{type: 'img', id: 'img01', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img02', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img03', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img04', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img05', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img06', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img07', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img08', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img09', x: 400, y: 225, align: 'mc'}
						{type: 'img', id: 'img10', x: 400, y: 225, align: 'mc'}
						{type: 'pcpt', id: 'pcpt1', x: 400, y: 560, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#0098d7'}
						{type: 'img', id: 'n1', x: 72, y: 339}
						{
							type: 'btn', id: 'btn_n11', x: 109, y: 360, index: 'love', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'love', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n12', x: 126, y: 390, index: 'dontlike', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'don\'t like', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n13', x: 108, y: 418, index: 'hate', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'hate', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n14', x: 156, y: 438, index: 'like', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'like', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{type: 'img', id: 'n2', x: 241, y: 336}
						{
							type: 'btn', id: 'btn_n21', x: 275, y: 357, index: 'going', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'going', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n22', x: 320, y: 385, index: 'chatting', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'chatting', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n23', x: 275, y: 412, index: 'doing', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'doing', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n24', x: 340, y: 438, index: 'playing', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'playing', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n25', x: 258, y: 442, index: 'taking', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'taking', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n26', x: 324, y: 480, index: 'learning', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'learning', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{type: 'img', id: 'n3', x: 437, y: 310}
						{
							type: 'btn', id: 'btn_n31', x: 491, y: 343, index: 'rollerskating', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'roller skating', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n32', x: 456, y: 371, index: 'theviolin', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'the violin', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n33', x: 480, y: 403, index: 'onlinewithfriends', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'online with friends', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n34', x: 458, y: 437, index: 'intheschoolband', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'in the school band', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n35', x: 494, y: 474, index: 'english', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'English', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n36', x: 630, y: 338, index: 'balletclass', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'ballet class', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n37', x: 601, y: 376, index: 'computergames', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'computer games', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n38', x: 645, y: 425, index: 'gymnastics', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'gymnastics', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n39', x: 611, y: 470, index: 'karatelessons', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'karate lessons', x: 0, y: 0, font: '20px Quicksand'}}]
						}
						{
							type: 'btn', id: 'btn_n310', x: 554, y: 501, index: 'swimminglessons', target: 'pcpt1', eval: 'click_O1'
							states: [{txt: {text: 'swimming lessons', x: 0, y: 0, font: '20px Quicksand'}}]
						}
					]
					groups: [
						{
							type:'grp', id:'grp1', invisible:true
							group:[
								'img01'
								'img02'
								'img03'
								'img04'
								'img05'
								'img06'
								'img07'
								'img08'
								'img09'
								'img10'
							]
						}
					]
				}
			]
		super()
	window.U3A4 = U3A4