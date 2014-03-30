###

NEW ODA

###
class U6A6 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
			{id: 'c1', src: 'circle1.png'}
			{id: 'c2', src: 'circle2.png'}
			{id: 'fondo', src: 'fondo.png'}
			{id:'ch01', src:'animal_sable0001.png'}
			{id:'ch02', src:'animal_sable0002.png'}
			{id:'ch03', src:'animal_sable0003.png'}
			{id:'ch04', src:'animal_sable0004.png'}
			{id:'ch05', src:'animal_sable0005.png'}
			{id:'ch06', src:'animal_sable0006.png'}
			{id:'peoplecookedwithfire', src:'people-cooked-with-fire.png'}
			{id:'peoplehadpetwolves', src:'people-had-pet-wolves.png'}
			{id:'theyatemeat', src:'they-ate-meat.png'}
			{id:'theyhuntedmammoths', src:'they-hunted-mammoths.png'}
			{id:'theylivedintents', src:'they-lived-in-tents.png'}
			{id:'theymadetoolsfrombones', src:'they-made-tools-from-bones.png'}
			{id:'theypaintedpicturesincaves', src:'they-painted-pictures-in-caves.png'}
			{id:'theyworeanimalskins', src:'they-wore-animal-skins.png'}
			{src:'TU3_U6_A6_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Click on the letters to guess the sentences.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 8, aimg: 'c1', acolor: '#EB2D3C', bimg: 'c2', bcolor: '#C3DB5B'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'peoplecookedwithfire'}}
								{name:'wcpt1', opts:{word:'people cooked with fire', target: 'peoplecookedwithfire'}}
								{name:'abc1', opts:{reset:true}}
							]
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'peoplehadpetwolves'}}
								{name:'wcpt1', opts:{word:'people had pet wolves', target: 'peoplehadpetwolves'}}
								{name:'abc1', opts:{reset:true}}
							]
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'theyatemeat'}}
								{name:'wcpt1', opts:{word:'they ate meat', target: 'theyatemeat'}}
								{name:'abc1', opts:{reset:true}}
							]
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'theyhuntedmammoths'}}
								{name:'wcpt1', opts:{word:'they hunted mammoths', target: 'theyhuntedmammoths'}}
								{name:'abc1', opts:{reset:true}}
							]
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'theylivedintents'}}
								{name:'wcpt1', opts:{word:'they lived in tents', target: 'theylivedintents'}}
								{name:'abc1', opts:{reset:true}}
							]
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'theymadetoolsfrombones'}}
								{name:'wcpt1', opts:{word:'they made tools from bones', target: 'theymadetoolsfrombones'}}
								{name:'abc1', opts:{reset:true}}
							]
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'theypaintedpicturesincaves'}}
								{name:'wcpt1', opts:{word:'they painted pictures in caves', target: 'theypaintedpicturesincaves'}}
								{name:'abc1', opts:{reset:true}}
							]
							[
								{name:'hangman', opts:{type:'fadeIn', target:'ch01'}}
								{name:'grp1_1', opts:{type:'fadeIn', target:'theyworeanimalskins'}}
								{name:'wcpt1', opts:{word:'they wore animal skins', target: 'theyworeanimalskins'}}
								{name:'abc1', opts:{reset:true}}
							]
						]
						mixed: true
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'fondo', x: 456, y: 250, align:'mc'}
						{type: 'img', id: 'ch01', x: 511, y: 203}
						{type: 'img', id: 'ch02', x: 511, y: 203}
						{type: 'img', id: 'ch03', x: 511, y: 203}
						{type: 'img', id: 'ch04', x: 511, y: 203}
						{type: 'img', id: 'ch05', x: 511, y: 203}
						{type: 'img', id: 'ch06', x: 511, y: 203}
						{type: 'img', id: 'peoplecookedwithfire', x: 300, y: 330, align:'mc'}
						{type: 'img', id: 'peoplehadpetwolves', x: 300, y: 330, align:'mc'}
						{type: 'img', id: 'theyatemeat', x: 300, y: 330, align:'mc'}
						{type: 'img', id: 'theyhuntedmammoths', x: 300, y: 330, align:'mc'}
						{type: 'img', id: 'theylivedintents', x: 300, y: 330, align:'mc'}
						{type: 'img', id: 'theymadetoolsfrombones', x: 300, y: 330, align:'mc'}
						{type: 'img', id: 'theypaintedpicturesincaves', x: 300, y: 330, align:'mc'}
						{type: 'img', id: 'theyworeanimalskins', x: 300, y: 330, align:'mc'}
						{type: 'wcpt', id: 'wcpt1', x: 400, y: 460, margin: 10, uwidth: 20, font: '24px Quicksand', scolor: '#eb2d3d', align: 'tc', eval:'drop_03'}
						{type: 'abc', id: 'abc1', x: 400, y: 560, font:'20px Quicksand', fcolor:'#333', uwidth: 22, uheight: 34, margin: 10, clickable:true, target:'wcpt1', eval:'hangman_click_01'}
					]
					groups: [
						{
							type: 'grp', id: 'hangman', invisible: true
							group: [
								'ch01'
								'ch02'
								'ch03'
								'ch04'
								'ch05'
								'ch06'
							]
						}
						{
							type: 'grp', id: 'grp1_1', invisible: true
							group: [
								'peoplecookedwithfire'
								'peoplehadpetwolves'
								'theyatemeat'
								'theyhuntedmammoths'
								'theylivedintents'
								'theymadetoolsfrombones'
								'theypaintedpicturesincaves'
								'theyworeanimalskins'
							]
						}
					]
				}
			]
		super()
	window.U6A6 = U6A6