###

NEW ODA

###
class U3A3 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'repeatbtn', src: 'repeat-btn.png'}
			{id: 'bubble1', src:'1.png'}
 			{id: 'bubble2', src:'2.png'}
 			{id: 'bubble3', src:'3.png'}
 			{id: 'bubble4', src:'4.png'}
 			{id: 'bubble5', src:'5.png'}
 			{id: 'bubble6', src:'6.png'}
 			{id: 'bubble7', src:'7.png'}
 			{id: 'bubble8', src:'8.png'}
 			{id: 'bubble9', src:'9.png'}
 			{id: 'bubble10', src:'10.png'}
 			{id: 'bubble11', src:'11.png'}
 			{id: 'bubble12', src:'12.png'}
 			{id: 'pag1club1', src:'club1.png'}
 			{id: 'pag1club2', src:'club2.png'}
 			{id: 'pag1club3', src:'club3.png'}
 			{id: 'pag1club4', src:'club4.png'}
 			{id: 'pag1club5', src:'club5.png'}
 			{id: 'pag1club6', src:'club6.png'}
 			{id: 'pag2club1', src:'club7.png'}
 			{id: 'pag2club2', src:'club8.png'}
 			{id: 'pag2club3', src:'club9.png'}
 			{id: 'pag2club4', src:'club10.png'}
 			{id: 'pag2club5', src:'club11.png'}
 			{id: 'pag2club6', src:'club12.png'}
			{src:'TU3_U3_A3_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Read what the students say and click on the best club for each one.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 12, aimg: 'c1', acolor: '#0096DB', bimg: 'c2', bcolor: '#BFD951'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name:'global',opts:{success:1}}
								{name: 'grp1', opts:{type: 'fadeIn', target: 'bubble1'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'grp1', opts:{type: 'fadeIn', target: 'bubble2'}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'grp1', opts:{type: 'fadeIn', target: 'bubble3'}}
							]
							[
								{name:'global',opts:{success:4}}
								{name: 'grp1', opts:{type: 'fadeIn', target: 'bubble4'}}
							]
							[
								{name:'global',opts:{success:5}}
								{name: 'grp1', opts:{type: 'fadeIn', target: 'bubble5'}}
							]
							[
								{name:'global',opts:{success:6}}
								{name: 'grp1', opts:{type: 'fadeIn', target: 'bubble6'}}
							]
						]
						mixed: true
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'bubble1', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble2', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble3', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble4', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble5', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble6', x: 400, y: 500, align: 'tc'}
						{
							type: 'btn', id: 'btn4', x: 240, y: 310, index: 4, eval: 'global_01'
							states: [
								{
									img: {name: 'pag1club4', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn5', x: 400, y: 310, index: 5, eval: 'global_01'
							states: [
								{
									img: {name: 'pag1club5', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn6', x: 560, y: 310, index: 6, eval: 'global_01'
							states: [
								{
									img: {name: 'pag1club6', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn1', x: 240, y: 140, index: 1, eval: 'global_01'
							states: [
								{
									img: {name: 'pag1club1', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn2', x: 400, y: 140, index: 2, eval: 'global_01'
							states: [
								{
									img: {name: 'pag1club2', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn3', x: 560, y: 140, index: 3, eval: 'global_01'
							states: [
								{
									img: {name: 'pag1club3', x: 0, y: 0, align: 'tc'}
								}
							]
						}
					]
					groups: [
						{
							type:'grp', id:'grp1', invisible:true
							group:[
								'bubble1'
								'bubble2'
								'bubble3'
								'bubble4'
								'bubble5'
								'bubble6'
							]
						}
					]
				}
				{
					answers: {
						collection: [
							[
								{name:'global',opts:{success:1}}
								{name: 'grp2', opts:{type: 'fadeIn', target: 'bubble7'}}
							]
							[
								{name:'global',opts:{success:2}}
								{name: 'grp2', opts:{type: 'fadeIn', target: 'bubble8'}}
							]
							[
								{name:'global',opts:{success:3}}
								{name: 'grp2', opts:{type: 'fadeIn', target: 'bubble9'}}
							]
							[
								{name:'global',opts:{success:4}}
								{name: 'grp2', opts:{type: 'fadeIn', target: 'bubble10'}}
							]
							[
								{name:'global',opts:{success:5}}
								{name: 'grp2', opts:{type: 'fadeIn', target: 'bubble11'}}
							]
							[
								{name:'global',opts:{success:6}}
								{name: 'grp2', opts:{type: 'fadeIn', target: 'bubble12'}}
							]
						]
						mixed: true
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'bubble7', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble8', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble9', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble10', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble11', x: 400, y: 500, align: 'tc'}
						{type: 'img', id: 'bubble12', x: 400, y: 500, align: 'tc'}
						{
							type: 'btn', id: 'btn4', x: 240, y: 310, index: 4, eval: 'global_01'
							states: [
								{
									img: {name: 'pag2club4', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn5', x: 400, y: 310, index: 5, eval: 'global_01'
							states: [
								{
									img: {name: 'pag2club5', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn6', x: 560, y: 310, index: 6, eval: 'global_01'
							states: [
								{
									img: {name: 'pag2club6', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn1', x: 240, y: 140, index: 1, eval: 'global_01'
							states: [
								{
									img: {name: 'pag2club1', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn2', x: 400, y: 140, index: 2, eval: 'global_01'
							states: [
								{
									img: {name: 'pag2club2', x: 0, y: 0, align: 'tc'}
								}
							]
						}
						{
							type: 'btn', id: 'btn3', x: 560, y: 140, index: 3, eval: 'global_01'
							states: [
								{
									img: {name: 'pag2club3', x: 0, y: 0, align: 'tc'}
								}
							]
						}
					]
					groups: [
						{
							type:'grp', id:'grp2', invisible:true
							group:[
								'bubble7'
								'bubble8'
								'bubble9'
								'bubble10'
								'bubble11'
								'bubble12'
							]
						}
					]
				}
			]
		super()
	window.U3A3 = U3A3