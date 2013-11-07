// Generated by CoffeeScript 1.6.3
(function() {
  var U4A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A6 = (function(_super) {
    __extends(U4A6, _super);

    function U4A6() {
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
          src: 'texto_look.png'
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
          id: 'n1',
          src: 'question.png'
        }, {
          id: 'scene1',
          src: 'scenebrazil.png'
        }, {
          id: 'scene2',
          src: 'scenechina.png'
        }, {
          id: 'scene3',
          src: 'sceneindia.png'
        }, {
          id: 'n2',
          src: 'verb.png'
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
      this.textos = {
        esc1: {
          nube1: [
            {
              p: 'When',
              x: '25',
              y: '35'
            }, {
              p: 'What',
              x: '90',
              y: '22'
            }, {
              p: 'Where',
              x: '70',
              y: '70'
            }
          ],
          nube2: [
            {
              p: 'celebrate',
              x: '26',
              y: '20'
            }, {
              p: 'do',
              x: '50',
              y: '72'
            }, {
              p: 'wear',
              x: '85',
              y: '58'
            }
          ],
          preguntas: [
            {
              question1: 'Where',
              frase1: 'do they ',
              question2: 'celebrate',
              frase2: 'Reveillon?',
              answer: 'In Brazil.'
            }, {
              question1: 'When',
              frase1: 'do they ',
              question2: 'celebrate',
              frase2: 'Reveillon?',
              answer: 'On January 1st.'
            }, {
              question1: 'What',
              frase1: 'do they ',
              question2: 'wear',
              frase2: '?',
              answer: 'White clothes.'
            }
          ]
        }
      };
      U4A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A6.prototype.setStage = function() {
      U4A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setScene().setQuestion().introEvaluation();
    };

    U4A6.prototype.setScene = function() {
      var escena, n1, n2, nube1, nube2, t1n1, t1n2, t2n1, t2n2, t3n1, t3n2;
      escena = 1;
      this.insertBitmap('scene' + escena, 'scene' + escena, stageSize.w / 2, 150, 'tc');
      nube1 = new createjs.Container();
      nube1.x = 210;
      nube1.y = 480;
      n1 = this.createBitmap('n1', 'n1', 0, 0);
      t1n1 = new DraggableText('t1n1', this.textos.esc1.nube1[0].p, 0, this.textos.esc1.nube1[0].x, this.textos.esc1.nube1[0].y);
      t2n1 = new DraggableText('t2n1', this.textos.esc1.nube1[1].p, 1, this.textos.esc1.nube1[1].x, this.textos.esc1.nube1[1].y);
      t3n1 = new DraggableText('t3n1', this.textos.esc1.nube1[2].p, 2, this.textos.esc1.nube1[2].x, this.textos.esc1.nube1[2].y);
      nube1.addChild(n1, t1n1, t2n1, t3n1);
      nube2 = new createjs.Container();
      nube2.x = 440;
      nube2.y = 480;
      n2 = this.createBitmap('n2', 'n2', 0, 0);
      t1n2 = new DraggableText('t0n2', this.textos.esc1.nube2[0].p, 0, this.textos.esc1.nube2[0].x, this.textos.esc1.nube2[0].y);
      t2n2 = new DraggableText('t1n2', this.textos.esc1.nube2[1].p, 1, this.textos.esc1.nube2[1].x, this.textos.esc1.nube2[1].y);
      t3n2 = new DraggableText('t2n2', this.textos.esc1.nube2[2].p, 2, this.textos.esc1.nube2[2].x, this.textos.esc1.nube2[2].y);
      nube2.addChild(n2, t1n2, t2n2, t3n2);
      this.addToMain(nube1);
      this.addToMain(nube2);
      return this;
    };

    U4A6.prototype.setQuestion = function() {
      var i, q1, q2, question, todo, txt1, txt2, txt3, txt4, txt5, _i;
      question = new createjs.Container();
      question.x = 0;
      question.y = 410;
      for (i = _i = 2; _i <= 2; i = ++_i) {
        txt1 = new createjs.Text('Q: ', '24px Arial', '#333');
        txt1.x = 0;
        q1 = new WordContainer('q1', this.textos.esc1.preguntas[i].question1, '#ccc', '#f00', 30, 0, 10, 10);
        q1.x = 30;
        txt2 = new createjs.Text(this.textos.esc1.preguntas[i].frase1, '24px Arial', '#333');
        txt2.x = q1.w + q1.x + 20;
        q2 = new WordContainer('q2', this.textos.esc1.preguntas[i].question2, '#ccc', '#f00', 30, 0, 10, 10);
        q2.x = txt2.x + txt2.getMeasuredWidth();
        txt3 = new createjs.Text(this.textos.esc1.preguntas[i].frase2, '24px Arial', '#333');
        txt3.x = q2.w + q2.x + 20;
        txt4 = new createjs.Text('A: ', '24px Arial', '#333');
        txt4.x = 0;
        txt5 = new createjs.Text(this.textos.esc1.preguntas[i].answer, '24px Arial', '#333');
        txt5.x = 30;
        txt4.y = txt5.y = 30;
        question.addChild(txt1, q1, txt2, q2, txt3, txt4, txt5);
        todo = txt3.x + txt3.getMeasuredWidth();
        question.x = (800 - todo) / 2;
        console.log(todo);
      }
      this.addToMain(question);
      return this;
    };

    U4A6.prototype.introEvaluation = function() {
      return U4A6.__super__.introEvaluation.apply(this, arguments);
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

    U4A6.prototype.initEvaluation = function(e) {
      U4A6.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U4A6.prototype.evaluateAnswer = function(e) {
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

    U4A6.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U4A6.prototype.nextEvaluation = function() {
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

    U4A6.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U4A6.prototype.finish = function() {
      var i, _i, _results;
      U4A6.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U4A6 = U4A6;

    return U4A6;

  })(Oda);

}).call(this);
