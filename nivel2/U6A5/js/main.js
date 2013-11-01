// Generated by CoffeeScript 1.6.3
(function() {
  var U5A5,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A5 = (function(_super) {
    __extends(U5A5, _super);

    function U5A5() {
      this.repeatSound = __bind(this.repeatSound, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'pleca.png'
        }, {
          id: 'inst',
          src: 'texto_look.png.png'
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
          id: 'title1',
          src: 'title1.png'
        }, {
          id: '1',
          src: '1.png'
        }, {
          id: '2',
          src: '2.png'
        }, {
          id: '3',
          src: '3.png'
        }, {
          id: '4',
          src: '4.png'
        }, {
          id: '5',
          src: '5.png'
        }, {
          id: '6',
          src: '6.png'
        }, {
          id: '7',
          src: '7.png'
        }, {
          id: '8',
          src: '8.png'
        }, {
          id: '1b',
          src: '1b.png'
        }, {
          id: '2b',
          src: '2b.png'
        }, {
          id: '3b',
          src: '3b.png'
        }, {
          id: '4b',
          src: '4b.png'
        }, {
          id: '5b',
          src: '5b.png'
        }, {
          id: '6b',
          src: '6b.png'
        }, {
          id: '7b',
          src: '7b.png'
        }, {
          id: '8b',
          src: '8b.png'
        }, {
          id: 'btn',
          src: 'btn.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A6_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.answers = [];
      this.preguntas = [
        {
          tipo: 'texto',
          imagen: 'toastMilkJuice',
          pregunta: "What's for breakfast?",
          opcionUno: 'Cereal. milk and juice',
          opcionDos: 'Toast, milk and juice'
        }, {
          tipo: 'texto',
          imagen: 'zebras',
          pregunta: 'Do zebras live in the grasslands?',
          opcionUno: 'Yes, they do.',
          opcionDos: "No, they don't."
        }, {
          tipo: 'imagen',
          pregunta: 'It has fins and scales. What is it?',
          opcionUno: 'fish',
          opcionDos: 'parrot'
        }, {
          tipo: 'imagen',
          pregunta: 'This animal is endangered',
          opcionUno: 'rhino',
          opcionDos: 'snake'
        }
      ];
      this.positions = {
        p1: [
          {
            x: '231',
            y: '260'
          }, {
            x: '465',
            y: '271'
          }, {
            x: '220',
            y: '475'
          }, {
            x: '460',
            y: '473'
          }, {
            x: '221',
            y: '260'
          }, {
            x: '455',
            y: '261'
          }, {
            x: '220',
            y: '468'
          }, {
            x: '450',
            y: '463'
          }
        ]
      };
      this.texto = {
        t1: [
          {
            uno: "Phil and his mom call out for Bo."
          }, {
            uno: 'Suddenly, Bo starts barking and pulling hard.'
          }, {
            uno: "Everyone is worried. Where's Jack?"
          }, {
            uno: "Phil's mom puts on her coat and boots."
          }
        ],
        t2: [
          {
            uno: "He wants to interview Phil and his mom about Jack's amazing rescue."
          }, {
            uno: 'They take Jack to the hospital in an ambulance.'
          }, {
            uno: 'He is sitting in the snow next to Jack!'
          }, {
            uno: 'Phil and his mom follow the sound of Bo barking.'
          }
        ]
      };
      U5A5.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A5.prototype.setStage = function() {
      U5A5.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('title1', 'title1', 350, 120, 'tc');
      this.insertBitmap('btn', 'btn', 760, 520, 'tc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setCuento().introEvaluation();
    };

    U5A5.prototype.setCuento = function() {
      var c, cuento, i, m, t, text, _i, _j, _k, _l;
      cuento = new createjs.Container();
      t = new createjs.Text('Part', '14px Arial', '#333');
      t.x = 530;
      t.y = 140;
      cuento.addChild(t);
      for (i = _i = 1; _i <= 4; i = ++_i) {
        m = this.createSprite(i + 'imagen', [i, i + 'b'], null, this.positions.p1[i - 1].x, this.positions.p1[i - 1].y, 'mc');
        cuento.addChild(m);
        this.addToLibrary(m);
      }
      c = 1;
      for (i = _j = 1; _j <= 4; i = ++_j) {
        text = new DraggableText(this.texto.t1[i - 1].uno, this.texto.t1[i - 1].uno, i, 620, (i * 60) + 200);
        cuento.addChild(text);
      }
      for (i = _k = 5; _k <= 8; i = ++_k) {
        m = this.createSprite(i + 'imagen', [i, i + 'b'], null, this.positions.p1[i - 1].x, this.positions.p1[i - 1].y, 'mc');
        cuento.addChild(m);
        this.addToLibrary(m);
      }
      for (i = _l = 1; _l <= 4; i = ++_l) {
        text = new DraggableText(this.texto.t2[i - 1].uno, this.texto.t2[i - 1].uno, i, 620, (i * 60) + 200);
        cuento.addChild(text);
      }
      this.addToMain(cuento);
      return this;
    };

    U5A5.prototype.introEvaluation = function() {
      return U5A5.__super__.introEvaluation.apply(this, arguments);
      /*
      		for i in [1..6] by 1
      			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation
      
      		@library['characters'].currentFrame = @answers[@index].id
      
      		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
      		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
      		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
      		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
      		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
      */

    };

    U5A5.prototype.initEvaluation = function(e) {
      U5A5.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U5A5.prototype.evaluateAnswer = function(e) {
      var pt;
      this.answer = e.target;
      pt = this.library['dropname'].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library['dropname'].hitTest(pt.x, pt.y)) {
        if (this.answer.index === this.answers[this.index].id) {
          this.answer.blink(false);
          return setTimeout(this.finishEvaluation, 1 * 1000);
        } else {
          this.warning();
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U5A5.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U5A5.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        this.library['score'].updateCount(this.index);
        this.library['characters'].alpha = 1;
        this.library['characters'].y = stageSize.h - 180;
        this.library['characters'].currentFrame = this.answers[this.index].id;
        createjs.Sound.play(this.answers[this.index].sound);
        return TweenLite.from(this.library['characters'], 0.5, {
          alpha: 0,
          y: this.library['characters'].y + 20,
          ease: Quart.easeOut
        });
      } else {
        return this.finish();
      }
    };

    U5A5.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U5A5.prototype.finish = function() {
      var i, _i, _results;
      U5A5.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U5A5 = U5A5;

    return U5A5;

  })(Oda);

}).call(this);