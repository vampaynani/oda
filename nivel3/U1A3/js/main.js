// Generated by CoffeeScript 1.6.3
(function() {
  var U1A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A3 = (function(_super) {
    __extends(U1A3, _super);

    function U1A3() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'pleca1.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'repeatbtn',
          src: 'repeat-btn.png'
        }, {
          id: 'playagain',
          src: 'play_again.png'
        }, {
          id: 'startgame',
          src: 'start_game.png'
        }, {
          id: 'btnFalse',
          src: 'btn_false.png'
        }, {
          id: 'btnTrue',
          src: 'btn_true.png'
        }, {
          id: 'lugar1',
          src: 'aquarium.png'
        }, {
          id: 'lugar2',
          src: 'museum.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU3_U1_A3_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        scenes: [
          {
            answers: [
              {
                text: "Dana and Jake aren't watching a movie.",
                respuestas: false
              }, {
                text: "Dave and John are swimming with the dolphins.",
                respuestas: true
              }, {
                text: "Emma and Doris aren't feeding the elephants.",
                respuestas: true
              }, {
                text: "Alison isn't taking a nap.",
                respuestas: false
              }, {
                text: "Dave and John aren't feeding the dolphins.",
                respuestas: true
              }, {
                text: "Alison is eating a hamburger.",
                respuestas: false
              }, {
                text: "Carl is taking a photograph.",
                respuestas: false
              }, {
                text: "Mitch is eating a hamburger.",
                respuestas: true
              }, {
                text: "Mitch and Stella are eating a snack.",
                respuestas: true
              }, {
                text: "Stella isn't eating a banana.",
                respuestas: true
              }, {
                text: "Emma and Doris aren't feeding the turtles.",
                respuestas: false
              }, {
                text: "Carl is talking on his cell phone.",
                respuestas: true
              }
            ]
          }, {
            answers: [
              {
                text: "Spot is taking a picture.",
                respuestas: false
              }, {
                text: "Diana is explaining the exhibit.",
                respuestas: true
              }, {
                text: "Kyle is buying a snack.",
                respuestas: false
              }, {
                text: "Katie isn't sitting down.",
                respuestas: true
              }, {
                text: "Spot is posing for a picture.",
                respuestas: true
              }, {
                text: "Ava isn't posing for a picture.",
                respuestas: true
              }, {
                text: "Ava isn't listening to the guide.",
                respuestas: true
              }, {
                text: "Katie isn't taking a nap.",
                respuestas: false
              }, {
                text: "Zoe isn't watching the performance.",
                respuestas: false
              }, {
                text: "Phil and Arthur aren't eating popcorn.",
                respuestas: true
              }, {
                text: "Diana is listening to the guide.",
                respuestas: false
              }, {
                text: "Lindsey is looking for souvenirs.",
                respuestas: true
              }
            ]
          }
        ]
      };
      U1A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A3.prototype.setStage = function() {
      U1A3.__super__.setStage.apply(this, arguments);
      this.escena = 1;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Read, look and click on True or False.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 14, 0));
      return this.setScene(1).setClick().introEvaluation();
    };

    U1A3.prototype.setScene = function(scene) {
      this.scene = this.game.scenes[scene - 1];
      this.answers = this.shuffleNoRepeat(this.scene.answers, 7);
      this.insertBitmap('boy', "lugar" + scene, stageSize.w / 2, 490, 'bc');
      return this;
    };

    U1A3.prototype.setClick = function() {
      this.insertBitmap('btnfalse', 'btnFalse', 407, 571);
      this.insertBitmap('btntrue', 'btnTrue', 280, 571);
      this.library.btnfalse.index = false;
      this.library.btntrue.index = true;
      this.library.btntrue.addEventListener('click', this.evaluateAnswer);
      this.library.btnfalse.addEventListener('click', this.evaluateAnswer);
      return this;
    };

    U1A3.prototype.introEvaluation = function() {
      U1A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0
      });
      TweenLite.from(this.library.boy, 1, {
        alpha: 0,
        y: this.library.boy.y - 10,
        ease: Quart.easeOut
      });
      TweenLite.from(this.library.btnfalse, 1, {
        alpha: 0,
        y: this.library.btnfalse.y - 10,
        ease: Quart.easeOut,
        delay: 0.5
      });
      return TweenLite.from(this.library.btntrue, 1, {
        alpha: 0,
        y: this.library.btntrue.y - 10,
        ease: Quart.easeOut,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U1A3.prototype.initEvaluation = function(e) {
      U1A3.__super__.initEvaluation.apply(this, arguments);
      this.insertText('frases', this.answers[this.index].text, '20px Quicksand', '#333', stageSize.w / 2, 520, 'center');
      return TweenLite.from(this.library.frases, 0.5, {
        alpha: 0,
        y: this.library.frases - 10,
        ease: Quart.easeOut
      });
    };

    U1A3.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      if (this.answer.index === this.answers[this.index].respuestas) {
        this.library.score.plusOne();
        createjs.Sound.play('good');
      } else {
        this.warning();
      }
      return this.finishEvaluation();
    };

    U1A3.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library.frases, 0.5, {
        alpha: 0,
        y: this.library.frases.y - 20,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U1A3.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        this.library.frases.text = this.answers[this.index].text;
        return TweenLite.to(this.library.frases, 0.5, {
          alpha: 1,
          y: this.library.frases.y + 20,
          ease: Back.easeOut
        });
      } else {
        if (this.escena === 1) {
          this.index = 0;
          this.escena = 2;
          TweenLite.to(this.library.btnfalse, 1, {
            alpha: 0,
            y: this.library.btnfalse.y - 10,
            ease: Quart.easeOut
          });
          TweenLite.to(this.library.btntrue, 1, {
            alpha: 0,
            y: this.library.btntrue.y - 10,
            ease: Quart.easeOut
          });
          TweenLite.to(this.library.boy, 1, {
            alpha: 0,
            y: this.library.boy.y - 10,
            ease: Quart.easeOut
          });
          TweenLite.to(this.library.frases, 0.5, {
            alpha: 0,
            y: this.library.frases - 10,
            ease: Quart.easeOut
          });
          return this.setScene(2).setClick().initEvaluation();
        } else {
          return this.finish();
        }
      }
    };

    U1A3.prototype.finish = function() {
      U1A3.__super__.finish.apply(this, arguments);
      TweenLite.to(this.library.btnfalse, 1, {
        alpha: 0,
        y: this.library.btnfalse.y - 10,
        ease: Quart.easeOut
      });
      TweenLite.to(this.library.btntrue, 1, {
        alpha: 0,
        y: this.library.btntrue.y - 10,
        ease: Quart.easeOut
      });
      TweenLite.to(this.library.boy, 1, {
        alpha: 0,
        y: this.library.boy.y - 10,
        ease: Quart.easeOut
      });
      return TweenLite.to(this.library.frases, 0.5, {
        alpha: 0,
        y: this.library.frases - 10,
        ease: Quart.easeOut
      });
    };

    /*	
    	setAquarium:  ->
    		aquarium = new createjs.Container()
    		aquarium.x = 120
    		aquarium.y = 80
    
    		fondo = @createBitmap 'aqPropbg', 'aqPropbg', 15, 75
    		aquarium.addChild fondo
    		@addToLibrary fondo
    
    		for i in [0..8]
    			label = @createBitmap @personaje.aquarium[i].id, @personaje.aquarium[i].id, @personaje.aquarium[i].x, @personaje.aquarium[i].y
    			aquarium.addChild label
    			@addToLibrary label
    			
    		for i in [0..0]
    			text = new createjs.Text @preguntas.aquarium[i].statement,'24px Arial','#333'
    			text.x = stageSize.w / 2 - 75
    			text.y = 420
    			text.textAlign = 'center'
    			aquarium.addChild text
    
    		@addToMain aquarium
    		@
    	setMuseum:  ->
    		museum = new createjs.Container()
    		museum.x = 120
    		museum.y = 60
    
    		fondo = @createBitmap 'smPropbg', 'smPropbg', 73, 22
    		museum.addChild fondo
    		@addToLibrary fondo
    
    		for i in [0..7]
    			label = @createBitmap @personaje.museum[i].id, @personaje.museum[i].id, @personaje.museum[i].x, @personaje.museum[i].y
    			museum.addChild label
    			@addToLibrary label
    			
    		for i in [0..0]
    			text = new createjs.Text @preguntas.museum[i].statement,'24px Arial','#333'
    			text.x = stageSize.w / 2 - 75
    			text.y = 440
    			text.textAlign = 'center'
    			museum.addChild text
    
    		@addToMain museum
    		@
    	introEvaluation: ->
    		super
    		
    		for i in [1..6] by 1
    			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation
    
    		@library['characters'].currentFrame = @answers[@index].id
    
    		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
    		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
    		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
    		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
    		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
    		
    	initEvaluation: (e) =>
    		super
    		@library['characters'].currentFrame = @answers[@index].id
    		createjs.Sound.play @answers[@index].sound
    		TweenLite.to @library['characters'], 0.5, {alpha: 1, y: stageSize.h - 180, ease: Quart.easeOut}
    	evaluateAnswer: (e) =>
    		@answer = e.target
    		pt = @library['dropname'].globalToLocal @stage.mouseX, @stage.mouseY
    		if @library['dropname'].hitTest pt.x, pt.y
    			if @answer.index is @answers[@index].id
    				@answer.blink off
    				setTimeout @finishEvaluation, 1 * 1000
    			else
    				@warning()
    				@answer.returnToPlace()
    		else
    			@answer.returnToPlace()
    	finishEvaluation: =>
    		TweenLite.to @library['characters'], 0.5, {alpha: 0, y: -200, ease: Back.easeOut, onComplete: @nextEvaluation}
    		@answer.returnToPlace()
    	nextEvaluation: =>
    		@index++
    		if @index < @answers.length
    			@library['score'].updateCount( @index )
    			@library['characters'].alpha = 1
    			@library['characters'].y = stageSize.h - 180
    			@library['characters'].currentFrame = @answers[@index].id
    			createjs.Sound.play @answers[@index].sound
    			TweenLite.from @library['characters'], 0.5, {alpha: 0, y: @library['characters'].y + 20, ease: Quart.easeOut}
    		else
    			@finish()
    	repeatSound: =>
    		createjs.Sound.play @answers[@index].sound
    	finish: ->
    		super
    		for i in [1..6] by 1
    			@library['name'+i].blink off
    */


    window.U1A3 = U1A3;

    return U1A3;

  })(Oda);

}).call(this);
