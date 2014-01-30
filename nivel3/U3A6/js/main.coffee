###

NEW ODA

###
class U3A6 extends Oda
	constructor: ->
		@manifest = [
			{id: 'head', src: 'pleca1.png'}
		    {id:'c1' , src: 'circle1.png'}
		    {id:'c2' , src: 'circle2.png'}
		    {id: 'cooking', src: 'image_cooking.png'}
			{id: 'dancing', src: 'image_dancing.png'}
			{id: 'making', src: 'image_making.png'}
			{id: 'painting', src: 'image_painting.png'}
			{id: 'playing', src: 'image_playing.png'}
			{id: 'singing', src: 'image_singing.png'}
			{id: 'numbercooking', src: 'number_cooking.png'}
			{id: 'numberdancing', src: 'number_dancing.png'}
			{id: 'numbermaking', src: 'number_making.png'}
			{id: 'numberpainting', src: 'number_painting.png'}
			{id: 'numberplaying', src: 'number_playing.png'}
			{id: 'numbersinging', src: 'number_singing.png'}
			{id: 'crosswords', src: 'prop_crossword.png'}
			{id: '$a', src: 'a.png'}
			{id: '$b', src: 'b.png'}
			{id: '$c', src: 'c.png'}
			{id: '$d', src: 'd.png'}
			{id: '$e', src: 'e.png'}
			{id: '$f', src: 'f.png'}
			{id: '$g', src: 'g.png'}
			{id: '$h', src: 'h.png'}
			{id: '$i', src: 'i.png'}
			{id: '$j', src: 'j.png'}
			{id: '$k', src: 'k.png'}
			{id: '$l', src: 'l.png'}
			{id: '$m', src: 'm.png'}
			{id: '$n', src: 'n.png'}
			{id: '$o', src: 'o.png'}
			{id: '$p', src: 'p.png'}
			{id: '$q', src: 'q.png'}
			{id: '$r', src: 'r.png'}
			{id: '$s', src: 's.png'}
			{id: '$t', src: 't.png'}
			{id: '$u', src: 'u.png'}
			{id: '$v', src: 'v.png'}
			{id: '$w', src: 'w.png'}
			{id: '$x', src: 'x.png'}
			{id: '$y', src: 'y.png'}
			{id: '$z', src: 'z.png'}
			{src:'TU3_U3_A6_instructions.mp3', id:'s/instructions'}
		]
		@game = 
			header: 'head'
			instructions: {x: 40, y: 100, states: [{text:'Look and drag the letters to complete the crossword puzzle.', sound:'s/instructions', played: false}]}
			score:{type: 'points', x:20, y:500, init: 0, total: 6, aimg: 'c1', acolor: '#333', bimg: 'c2', bcolor: '#333'}
			scenes:[
				{
					answers: {
						collection: [
							[
								{
									name:'cwd'
									matrix:[
										[x,x,x,x,x,x,x,x,p,x,x,x,x,x]
										[x,x,x,x,x,x,x,x,l,x,x,x,x,x]
										[x,x,x,x,x,x,x,d,a,n,c,i,n,g]
										[x,x,x,x,x,x,x,x,y,x,x,x,x,x]
										[x,x,x,x,x,x,m,x,i,x,s,x,x,x]
										[x,x,x,x,x,p,a,i,n,t,i,n,g,x]
										[x,x,x,x,x,x,k,x,g,x,n,x,x,x]
										[x,x,x,x,x,x,i,x,$,x,g,x,x,x]
										[x,x,x,x,x,x,n,x,t,x,i,x,x,x]
										[c,o,o,k,i,n,g,x,h,x,n,x,x,x]
										[x,x,x,x,x,x,$,x,e,x,g,x,x,x]
										[x,x,x,x,x,x,c,x,$,x,x,x,x,x]
										[x,x,x,x,x,x,r,x,f,x,x,x,x,x]
										[x,x,x,x,x,x,a,x,l,x,x,x,x,x]
										[x,x,x,x,x,x,f,x,u,x,x,x,x,x]
										[x,x,x,x,x,x,t,x,t,x,x,x,x,x]
										[x,x,x,x,x,x,s,x,e,x,x,x,x,x]
									]
									words:[
										{coords:[
											{x:8,y:0}
											{x:8,y:1}
											{x:8,y:2}
											{x:8,y:3}
											{x:8,y:4}
											{x:8,y:5}
											{x:8,y:6}
											{x:8,y:8}
											{x:8,y:9}
											{x:8,y:10}
											{x:8,y:12}
											{x:8,y:13}
											{x:8,y:14}
											{x:8,y:15}
											{x:8,y:16}
										], target:'playing'}
										{coords:[
											{x:7,y:2}
											{x:8,y:2}
											{x:9,y:2}
											{x:10,y:2}
											{x:11,y:2}
											{x:12,y:2}
											{x:13,y:2}
										], target:'dancing'}
										{coords:[
											{x:6,y:4}
											{x:6,y:5}
											{x:6,y:6}
											{x:6,y:7}
											{x:6,y:8}
											{x:6,y:11}
											{x:6,y:12}
											
										], target:'making'}
										{coords:[
											{x:0,y:9}
											{x:1,y:9}
											{x:2,y:9}
											{x:3,y:9}
											{x:4,y:9}
											{x:5,y:9}
											{x:6,y:9}
										], target:'cooking'}
									]
								}
							]
						]
						type: 'steps'
					}
					containers:[
						{type: 'img', id: 'cooking', x: 564, y: 422, align: 'mc'}
						{type: 'img', id: 'numbercooking', x: 547, y: 354}
						{type: 'img', id: 'dancing', x: 109, y: 258, align: 'mc'}
						{type: 'img', id: 'numberdancing', x: 63, y: 185}
						{type: 'img', id: 'making', x: 193, y: 403, align: 'mc'}
						{type: 'img', id: 'numbermaking', x: 136, y: 370}
						{type: 'img', id: 'painting', x: 688, y: 297, align: 'mc'}
						{type: 'img', id: 'numberpainting', x: 587, y: 244}
						{type: 'img', id: 'playing', x: 263, y: 200, align: 'mc'}
						{type: 'img', id: 'numberplaying', x: 237, y: 137}
						{type: 'img', id: 'singing', x: 708, y: 159, align: 'mc'}
						{type: 'img', id: 'numbersinging', x: 681, y: 80}
						{type:'cwd', id: 'cwd1', x: 285, y: 56, font: '14px Quicksand', fcolor:'#333', uwidth: 20, uheight: 20, stroke: 1, scolor: '#333'}
						{type: 'abc', id: 'abc1', x: 400, y: 560, font:'20px Quicksand', fcolor:'#333', uwidth: 22, uheight: 34, margin: 10, target:'cwd1'}
					]
					groups: []
				}
			]
		super()
	window.U3A6 = U3A6