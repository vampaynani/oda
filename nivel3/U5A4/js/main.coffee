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
		@evaluateDrop03 = (dispatcher, target) ->
			if lib[dispatcher].index is target.success
				target.complete = true
				target.update()
				lib[dispatcher].afterSuccess()
				target.parent.currentTarget++
				if target.parent.currentTarget is target.parent.droptargets.length
					next = target.parent.nextGroup
					lib.score.plusOne()
					createjs.Sound.play 's/good'
					lib[next].setInvisible false
			else
				lib[dispatcher].afterFail()
				lib.scene.fail()
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Click on one of the pictures.', sound:'s/instructions', played: false},{text:'Drag the words to make a question. Then click on the answer.', sound:'s/instructions2', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 20, aimg: 'c1', acolor: '#ff9933', bimg: 'c2', bcolor: '#bfd951'}
			scenes:[
				{
					answers: {
						collection: []
						type: 'steps'
						chooseEnabled: true
					}
					containers:[
						{
							type: 'btn', id: 'btn1', x: 400, y: 230, index: 1, eval: 'choose_01'
							states: [{img: {name: 'sc1', align: 'mc', x: 0, y: 0}}]
						}
						{
							type: 'btn', id: 'btn2', x: 400, y: 450, index: 2, eval: 'choose_01'
							states: [{img: {name: 'sc2', align: 'mc', x: 0, y: 0}}]
						}
						
					]
					groups: []
				}
				{
					answers: {
						collection: [
							[
								{name:'global',opts:{success:'yeswas'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'village?'], targets: [{text:'was', success:'was'}, {text:'a', success:'a'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'nowas'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'city?'], targets: [{text:'was', success:'was'}, {text:'a', success:'a'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'nowas'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'lot of noise?'], targets: [{text:'was', success:'was'}, {text:'a', success:'a'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswas'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'clean water?'], targets: [{text:'was', success:'was'}, {text:'any', success:'any'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'nowere'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'igloos?'], targets: [{text:'were', success:'were'}, {text:'any', success:'any'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'trees?'], targets: [{text:'were', success:'were'}, {text:'any', success:'any'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'fish?'], targets: [{text:'were', success:'were'}, {text:'any', success:'any'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'canoes?'], targets: [{text:'were', success:'were'}, {text:'any', success:'any'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'nowere'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'cars?'], targets: [{text:'were', success:'were'}, {text:'any', success:'any'}], nextGroup: 'sc1grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt1', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'deer?'], targets: [{text:'were', success:'were'}, {text:'any', success:'any'}], nextGroup: 'sc1grp0'}}
							]
						]
						type: 'steps'
						mixed: true
						choose: 3
						chooseEnabled: true
					}
					containers:[
						{type: 'img', id: 'sc1', x: 120, y: 150}
						{type: 'pcpt', id: 'pcpt1', x: 370, y: 380, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#f59743'}
						{type: 'img', id: 'n1', x: 600, y: 180}
						{type: 'ldrg', id: 'ldrg1', x: 625,  y: 205, index: 'was', text:'was', font:'20px Quicksand', color:'#333', target: 'pcpt1', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg2', x: 660,  y: 225, index: 'were', text:'were', font:'20px Quicksand', color:'#333', target: 'pcpt1', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'img', id: 'n2', x: 600, y: 280}
						{type: 'ldrg', id: 'ldrg3', x: 626,  y: 300, index: 'a', text:'a', font:'20px Quicksand', color:'#333', target: 'pcpt1', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg4', x: 650,  y: 322, index: 'any', text:'any', font:'20px Quicksand', color:'#333', target: 'pcpt1', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{
							type: 'btn', id: 'sc1btn_s1', x: 300, y: 450, index: 'yeswas', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnyesWas', x: 0, y: 0, align: 'mc'}}]
						}
						{
							type: 'btn', id: 'sc1btn_s2', x: 550, y: 450, index: 'yeswere', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnyesWere', x: 0, y: 0, align: 'mc'}}]
						}
						{
							type: 'btn', id: 'sc1btn_s3', x: 300, y: 510, index: 'nowas', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnnoWas', x: 0, y: 0, align: 'mc'}}]
						}
						{
							type: 'btn', id: 'sc1btn_s4', x: 550, y: 510, index: 'nowere', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnnoWere', x: 0, y: 0, align: 'mc'}}]
						}
					]
					groups: [
						{
							type: 'grp', id: 'sc1grp0', invisible: true
							group: [
								'sc1btn_s1'
								'sc1btn_s2'
								'sc1btn_s3'
								'sc1btn_s4'
							]
						}
					]
				}
				{
					answers: {
						collection: [
							[
								{name:'global',opts:{success:'nowas'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'garbage dump?'], targets: [{text:'was'}, {text:'a'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'nowas'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'railroad?'], targets: [{text:'was'}, {text:'a'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'seals?'], targets: [{text:'were'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswas'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'snow?'], targets: [{text:'was'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'igloos?'], targets: [{text:'were'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'children?'], targets: [{text:'were'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'nowere'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'wigwams?'], targets: [{text:'were'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'foxes?'], targets: [{text:'were'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'yeswere'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'owls?'], targets: [{text:'were'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
							[
								{name:'global',opts:{success:'nowas'}}
								{name: 'pcpt2', opts: {pattern: ['#tcpt', 'there', '#tcpt', 'air pollution?'], targets: [{text:'was'}, {text:'any'}], nextGroup: 'sc2grp0'}}
							]
						]
						type: 'steps'
						mixed: true
						choose: 3
						chooseEnabled: true
					}
					containers:[
						{type: 'img', id: 'sc2', x: 120, y: 150}
						{type: 'pcpt', id: 'pcpt2', x: 370, y: 380, font: '24px Quicksand', margin: 10, align: 'tc', scolor: '#f59743'}
						{type: 'img', id: 'n1', x: 600, y: 180}
						{type: 'ldrg', id: 'ldrg_12', x: 625,  y: 205, index: 'was', text:'was', font:'20px Quicksand', color:'#333', target: 'pcpt2', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg_22', x: 660,  y: 225, index: 'were', text:'were', font:'20px Quicksand', color:'#333', target: 'pcpt2', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'img', id: 'n2', x: 600, y: 280}
						{type: 'ldrg', id: 'ldrg_32', x: 626,  y: 300, index: 'a', text:'a', font:'20px Quicksand', color:'#333', target: 'pcpt2', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{type: 'ldrg', id: 'ldrg_42', x: 650,  y: 322, index: 'any', text:'any', font:'20px Quicksand', color:'#333', target: 'pcpt2', eval: @evaluateDrop03, afterSuccess: 'origin', afterFail: 'return'}
						{
							type: 'btn', id: 'btn_s1', x: 300, y: 450, index: 'yeswas', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnyesWas', x: 0, y: 0, align: 'mc'}}]
						}
						{
							type: 'btn', id: 'btn_s2', x: 550, y: 450, index: 'yeswere', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnyesWere', x: 0, y: 0, align: 'mc'}}]
						}
						{
							type: 'btn', id: 'btn_s3', x: 300, y: 510, index: 'nowas', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnnoWas', x: 0, y: 0, align: 'mc'}}]
						}
						{
							type: 'btn', id: 'btn_s4', x: 550, y: 510, index: 'nowere', target: 'global', eval: 'global_01'
							states: [{img: {name: 'btnnoWere', x: 0, y: 0, align: 'mc'}}]
						}
					]
					groups: [
						{
							type: 'grp', id: 'sc2grp0', invisible: true
							group: [
								'btn_s1'
								'btn_s2'
								'btn_s3'
								'btn_s4'
							]
						}
					]
				}
			]
		super()
	window.U5A4 = U5A4