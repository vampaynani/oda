// Generated by CoffeeScript 1.6.3
(function() {
  var U7A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U7A4 = (function(_super) {
    __extends(U7A4, _super);

    function U7A4() {
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
          id: 'inst',
          src: 'inst.png'
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
          id: 'boy',
          src: 'boy.png'
        }, {
          id: 'girl',
          src: 'girl.png'
        }, {
          id: 'btnFalse',
          src: 'btn_False.png'
        }, {
          id: 'btnTrue',
          src: 'btn_True.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/TU2_U7_A4_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.game = {
        answers: [
          {
            text: "I always watch TV.",
            respuestas: false
          }, {
            text: "I sometimes take a shower.",
            respuestas: true
          }, {
            text: "I sometimes read.",
            respuestas: true
          }, {
            text: "I never ride my bike.",
            respuestas: false
          }, {
            text: "I never take a bath.",
            respuestas: true
          }, {
            text: "I always floss my teeth.",
            respuestas: true
          }, {
            text: "I sometimes play baseball on Wednesday.",
            respuestas: false
          }
        ]
      };
      U7A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U7A4.prototype.setStage = function() {
      U7A4.__super__.setStage.apply(this, arguments);
      this.answers = this.shuffleNoRepeat(this.game.answers, 7);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 7, 0));
      return this.setBoy().setClick().introEvaluation();
    };

    U7A4.prototype.setBoy = function() {
      this.insertBitmap('boy', 'boy', 111, 158);
      this.library.boy.scaleX = this.library.boy.scaleY = 0.9;
      return this;
    };

    U7A4.prototype.setClick = function() {
      this.insertBitmap('btnfalse', 'btnFalse', 536, 535);
      this.insertBitmap('btntrue', 'btnTrue', 409, 536);
      this.library.btnfalse.index = false;
      this.library.btntrue.index = true;
      this.library.btntrue.addEventListener('click', this.evaluateAnswer);
      this.library.btnfalse.addEventListener('click', this.evaluateAnswer);
      return this;
    };

    U7A4.prototype.introEvaluation = function() {
      U7A4.__super__.introEvaluation.apply(this, arguments);
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

    U7A4.prototype.initEvaluation = function(e) {
      U7A4.__super__.initEvaluation.apply(this, arguments);
      this.insertText('frases', this.answers[this.index].text, '20px Quicksand', '#333', 520, 500, 'center');
      return TweenLite.from(this.library.frases, 0.5, {
        alpha: 0,
        y: this.library.frases - 10,
        ease: Quart.easeOut
      });
    };

    U7A4.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      if (this.answer.index === this.answers[this.index].respuestas) {
        this.library.score.plusOne();
        createjs.Sound.play('good');
      } else {
        this.warning();
      }
      return this.finishEvaluation();
    };

    U7A4.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library.frases, 0.5, {
        alpha: 0,
        y: this.library.frases.y - 20,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U7A4.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        this.library.frases.text = this.answers[this.index].text;
        return TweenLite.to(this.library.frases, 0.5, {
          alpha: 1,
          y: this.library.frases.y + 20,
          ease: Back.easeOut
        });
      } else {
        return this.finish();
      }
    };

    U7A4.prototype.finish = function() {
      U7A4.__super__.finish.apply(this, arguments);
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

    window.U7A4 = U7A4;

    return U7A4;

  })(Oda);

}).call(this);