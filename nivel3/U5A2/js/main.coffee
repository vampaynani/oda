###

NEW ODA

###
class U5A2 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id:'c1', src: 'circle1.png'}
			{id:'c2', src: 'circle2.png'}
			{id: 'final', src:'fondofinal.png'}
			{id: 'cancion', src:'cancion.png'}
			{id: 'correct', src:'correct.png'}
			{id: 'wrong', src:'wrong.png'}
			{src:'TU3_U5_A2_instructions.mp3', id:'s/instructions'}
			{src:'TU3_U5_A2_song.mp3', id:'s/song'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Drag the verbs to complete the song.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 12, aimg: 'c1', acolor: '#ff9933', bimg: 'c2', bcolor: '#bfd951'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name: 'pcct1', opts: {pattern: ['When I', '#tcpt', 'a boy, I lived in Riverville.'], targets: [{text:'weren\'t', success:'was'}]}}
								{name: 'pcct2', opts: {pattern: ['There', '#tcpt', 'lots of factories and big steel mills.'], targets: [{text:'weren\'t', success:'were'}]}}
								{name: 'pcct3', opts: {pattern: ['The city', '#tcpt', 'dirty. There','#tcpt','smoke everywhere!'], targets: [{text:'weren\'t', success:'was'},{text:'weren\'t', success:'were'}]}}
								{name: 'pcct4', opts: {pattern: ['There', '#tcpt', 'a park... or any fresh air!'], targets: [{text:'weren\'t', success:'wasnt'}]}}
								{name: 'pcct5', opts: {pattern: ['There', '#tcpt', 'any flowers. There','#tcpt','any trees.'], targets: [{text:'weren\'t', success:'werent'},{text:'weren\'t', success:'werent'}]}}
								{name: 'pcct6', opts: {pattern: ['There', '#tcpt', 'lots of pollution. We all coughed and sneezed!'], targets: [{text:'weren\'t', success:'were'}]}}
								{name: 'pcct7', opts: {pattern: ['The rivers', '#tcpt', 'full of garbage and junk.'], targets: [{text:'weren\'t', success:'were'}]}}
								{name: 'pcct8', opts: {pattern: ['The water', '#tcpt', 'black and slimy with muck.'], targets: [{text:'weren\'t', success:'was'}]}}
								{name: 'pcct9', opts: {pattern: ['There', '#tcpt', 'always noise and traffic in the street.'], targets: [{text:'weren\'t', success:'were'}]}}
								{name: 'pcct10', opts: {pattern: ['It', '#tcpt', 'so loud, you couldn\'t hear yourself speak!'], targets: [{text:'weren\'t', success:'was'}]}}
							]
							[
								{name:'snd', opts:{id:'s/song', successoncomplete: true}}
								{name: 'grp1', opts:{type: 'fadeIn', target: 'final'}}
							]
						]
						type:'steps'
					}
					containers:[
						{type: 'img', id: 'cancion', x: 57, y: 120, scale: 0.7}
						{type: 'img', id: 'final', x: 650, y: 280, align: 'tc', scale: 0.7}
						{type:'pcct', id: 'pcct1', x: 65, y: 202, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct2', x: 65, y: 232, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct3', x: 65, y: 262, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct4', x: 65, y: 292, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct5', x: 65, y: 322, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct6', x: 65, y: 352, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct7', x: 65, y: 382, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct8', x: 65, y: 412, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct9', x: 65, y: 442, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type:'pcct', id: 'pcct10', x: 65, y: 472, font: '15px Quicksand', margin: 10, scolor: '#f59743'}
						{type: 'ldrg', id: 'ldrg1', x: 70, y: 132, index: 'was', text:'was', font:'15px Quicksand', color:'#333', target: ['pcct1','pcct2','pcct3','pcct4','pcct5','pcct6','pcct7','pcct8','pcct9','pcct10'], eval: 'drop_02_01', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg2', x: 110, y: 132, index: 'wasnt', text:'wasn\'t', font:'15px Quicksand', color:'#333', target: ['pcct1','pcct2','pcct3','pcct4','pcct5','pcct6','pcct7','pcct8','pcct9','pcct10'], eval: 'drop_02_01', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg3', x: 170, y: 132, index: 'were', text:'were', font:'15px Quicksand', color:'#333', target: ['pcct1','pcct2','pcct3','pcct4','pcct5','pcct6','pcct7','pcct8','pcct9','pcct10'], eval: 'drop_02_01', afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg4', x: 215, y: 132, index: 'werent', text:'weren\'t', font:'15px Quicksand', color:'#333', target: ['pcct1','pcct2','pcct3','pcct4','pcct5','pcct6','pcct7','pcct8','pcct9','pcct10'], eval: 'drop_02_01', afterSuccess: 'origin', afterFail: 'return'}
					]
					groups: [
						{
							type: 'grp', id: 'grp1', invisible: true
							group: [
								'final'
							]
						}
					]
				}
			]
		super()
	window.U5A2 = U5A2