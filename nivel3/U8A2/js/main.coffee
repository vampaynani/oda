###

NEW ODA

###
class U8A2 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'btnrepeat', src:'btn_repeat.png'}
			{id: 'menuAshton', src:'ashton.png'}
			{id: 'menuCarla', src:'carla.png'}
			{id: 'menuEva', src:'eva.png'}
			{id: 'menuJack', src:'jack.png'}
			{id: 'menuKevin', src:'kevin.png'}
			{id: 'menuMarissa', src:'marissa.png'}
			{id: 'menuRenee', src:'renee.png'}
			{id: 'menuSam', src:'sam.png'}
			{id: 'menuWilson', src:'wilson.png'}
			{id: 'ballonAshtonDragble', src:'ballon_ashton_dragble.png'}
			{id: 'ballonCarlaDragble', src:'ballon_carla_dragble.png'}
			{id: 'ballonEvaDragble', src:'ballon_eva_dragble.png'}
			{id: 'ballonJackDragble', src:'ballon_jack_dragble.png'}
			{id: 'ballonKevinDragble', src:'ballon_kevin_dragble.png'}
			{id: 'ballonMarissaDragble', src:'ballon_marissa_dragble.png'}
			{id: 'ballonReneeDragble', src:'ballon_renee_dragble.png'}
			{id: 'ballonSamDragble', src:'ballon_sam_dragble.png'}
			{id: 'ballonWilsonDragble', src:'ballon_wilson_dragble.png'}
			{id: 'imageAshtonDragble', src:'image_ashton_dragble.png'}
			{id: 'imageCarlaDragble', src:'image_carla_dragble.png'}
			{id: 'imageEvaDragble', src:'image_eva_dragble.png'}
			{id: 'imageJackDragble', src:'image_jack_dragble.png'}
			{id: 'imageKevinDragble', src:'image_kevin_dragble.png'}
			{id: 'imageMarissaDragble', src:'image_marissa_dragble.png'}
			{id: 'imageReneeDragble', src:'image_renee_dragble.png'}
			{id: 'imageSamDragble', src:'image_sam_dragble.png'}
			{id: 'imageWilsonDragble', src:'image_wilson_dragble.png'}
			{id: 'spAshtonBig1', src:'prop_ashton_big0001.png'}
			{id: 'spAshtonBig2', src:'prop_ashton_big0002.png'}
			{id: 'spCarlaBig1', src:'prop_carla_big0001.png'}
			{id: 'spCarlaBig2', src:'prop_carla_big0002.png'}
			{id: 'spEvaBig1', src:'prop_eva_big0001.png'}
			{id: 'spEvaBig2', src:'prop_eva_big0002.png'}
			{id: 'spJackBig1', src:'prop_jack_big0001.png'}
			{id: 'spJackBig2', src:'prop_jack_big0002.png'}
			{id: 'spKevinBig1', src:'prop_kevin_big0001.png'}
			{id: 'spKevinBig2', src:'prop_kevin_big0002.png'}
			{id: 'spMarissaBig1', src:'prop_marissa_big0001.png'}
			{id: 'spMarissaBig2', src:'prop_marissa_big0002.png'}
			{id: 'spReneeBig1', src:'prop_renee_big0001.png'}
			{id: 'spReneeBig2', src:'prop_renee_big0002.png'}
			{id: 'spSamBig1', src:'prop_sam_big0001.png'}
			{id: 'spSamBig2', src:'prop_sam_big0002.png'}
			{id: 'spWilsonBig1', src:'prop_wilson_big0001.png'}
			{id: 'spWilsonBig2', src:'prop_wilson_big0002.png'}
			{src:'TU3_U8_A2_instructions.mp3', id:'s/instructions'}
			{src:'TU3_U8_A2_ashton.mp3', id:'s/ashton'}
			{src:'TU3_U8_A2_carla.mp3', id:'s/carla'}
			{src:'TU3_U8_A2_eva.mp3', id:'s/eva'}
			{src:'TU3_U8_A2_jack.mp3', id:'s/jack'}
			{src:'TU3_U8_A2_kevin.mp3', id:'s/kevin'}
			{src:'TU3_U8_A2_marissa.mp3', id:'s/marissa'}
			{src:'TU3_U8_A2_renee.mp3', id:'s/renee'}
			{src:'TU3_U8_A2_sam.mp3', id:'s/sam'}
			{src:'TU3_U8_A2_wilson.mp3', id:'s/wilson'}
		]
		@btnClick = (dispatcher, target) =>
			console.log @, dispatcher, target
			@selection = lib[dispatcher].index
			lib[dispatcher].removeAllEventListeners()
			lib.grp_btn.update {type:'fadeOut'}
			#lib.grp_idrags.update {type:'fadeIn'}
			#lib.grp_tdrags.update {type:'fadeIn'}
			#lib.grp_sprites.update {type:'fadeIn', target:"sp#{@selection}"}
		@drgDrop = (dispatcher, target) =>
			console.log @, dispatcher, target
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Click, listen and match.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 10, aimg: 'c1', acolor: '#333', bimg: 'c2', bcolor: '#333'}
			scenes:[
				{
					answers: {
						collection: []
						type: 'steps'
					}
					containers:[
						{
							type: 'btn', id: 'btn1', x: 100, y: 290, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuAshton', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn2', x: 250, y: 290, index: 2, target: null
							eval: @btnClick
							states: [{img: {name: 'menuCarla', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn3', x: 400, y: 290, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuEva', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn4', x: 550, y: 290, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuJack', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn5', x: 700, y: 290, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuKevin', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn6', x: 180, y: 490, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuMarissa', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn7', x: 330, y: 490, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuRenee', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn8', x: 480, y: 490, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuSam', x: 0, y: 0, align: 'bc'}}]
						}
						{
							type: 'btn', id: 'btn9', x: 630, y: 490, index: 1, target: null
							eval: @btnClick
							states: [{img: {name: 'menuWilson', x: 0, y: 0, align: 'bc'}}]
						}
						{type: 'spr', id: 'spAshton', imgs: ['spAshtonBig1','spAshtonBig2'], frames: null, x: 400, y:300, align: 'mc'}
						{type: 'spr', id: 'spCarla', imgs: ['spCarlaBig1','spCarlaBig2'], frames: null, x: 400, y:300, align: 'mc'}
						{type: 'spr', id: 'spEva', imgs: ['spEvaBig1','spEvaBig2'], frames: null, x: 400, y:300, align: 'mc'}
						{type: 'spr', id: 'spJack', imgs: ['spJackBig1','spJackBig2'], frames: null, x: 400, y:300, align: 'mc'}
						{type: 'spr', id: 'spKevin', imgs: ['spKevinBig1','spKevinBig2'], frames: null, x: 400, y:300, align: 'mc'}
						{type: 'drg', id: 'spJack', name: 'ballonAshton', x: 400, y: 300, index: 'jack', align: 'mc', target: 'iwcpt1', eval: @drgDrop, afterSuccess: 'hide', afterFail: 'return'}
					]	
					groups: [
						{
							type: 'grp', id: 'grp_sprites'
							group: [
								'spAshton'
								''
							]
						}
						{
							type: 'grp', id: 'grp_btn'
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
							]
						}
					]
				}
			]
		super()
	window.U8A2 = U8A2