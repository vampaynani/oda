(function() {
  var U8A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A4 = (function(_super) {
    __extends(U8A4, _super);

    function U8A4() {
      this.finish = __bind(this.finish, this);
      this.playSound = __bind(this.playSound, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.evaluateDrop = __bind(this.evaluateDrop, this);
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
          id: 'btnfinished',
          src: 'btn_finished.png'
        }, {
          id: 'btnrepeat',
          src: 'btn_repeat.png'
        }, {
          id: 'dragble2',
          src: 'dragble_bella.png'
        }, {
          id: 'dragble3',
          src: 'dragble_benny.png'
        }, {
          id: 'dragble1',
          src: 'dragble_hana.png'
        }, {
          id: 'dragble8',
          src: 'dragble_julia.png'
        }, {
          id: 'dragble7',
          src: 'dragble_oliver.png'
        }, {
          id: 'dragble4',
          src: 'dragble_phillip.png'
        }, {
          id: 'dragble5',
          src: 'dragble_renee.png'
        }, {
          id: 'dragble6',
          src: 'dragble_stuart.png'
        }, {
          id: 'image6',
          src: 'image_bella.png'
        }, {
          id: 'image4',
          src: 'image_benny.png'
        }, {
          id: 'image5',
          src: 'image_hana.png'
        }, {
          id: 'image2',
          src: 'image_julia.png'
        }, {
          id: 'image1',
          src: 'image_oliver.png'
        }, {
          id: 'image3',
          src: 'image_phillip.png'
        }, {
          id: 'image8',
          src: 'image_renee.png'
        }, {
          id: 'image7',
          src: 'image_start.png'
        }, {
          id: 'correct',
          src: 'correct.png'
        }, {
          id: 'incorrect',
          src: 'wrong.png'
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
          src: 'sounds/TU2_U8_A4_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U8_A4_bella.mp3',
          id: 'sbella'
        }, {
          src: 'sounds/TU2_U8_A4_benny.mp3',
          id: 'sbenny'
        }, {
          src: 'sounds/TU2_U8_A4_hana.mp3',
          id: 'shana'
        }, {
          src: 'sounds/TU2_U8_A4_julia.mp3',
          id: 'sjulia'
        }, {
          src: 'sounds/TU2_U8_A4_oliver.mp3',
          id: 'soliver'
        }, {
          src: 'sounds/TU2_U8_A4_phillip.mp3',
          id: 'sphillip'
        }, {
          src: 'sounds/TU2_U8_A4_renee.mp3',
          id: 'srenee'
        }, {
          src: 'sounds/TU2_U8_A4_stuart.mp3',
          id: 'sstuart'
        }
      ];
      this.game = {
        steps: [
          {
            sound: 'sbella',
            drp: 2,
            tgt: 6
          }, {
            sound: 'sbenny',
            drp: 3,
            tgt: 4
          }, {
            sound: 'shana',
            drp: 1,
            tgt: 5
          }, {
            sound: 'sjulia',
            drp: 8,
            tgt: 2
          }, {
            sound: 'soliver',
            drp: 7,
            tgt: 1
          }, {
            sound: 'sphillip',
            drp: 4,
            tgt: 3
          }, {
            sound: 'srenee',
            drp: 5,
            tgt: 8
          }, {
            sound: 'sstuart',
            drp: 6,
            tgt: 7
          }
        ]
      };
      U8A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A4.prototype.setStage = function() {
      U8A4.__super__.setStage.apply(this, arguments);
      this.steps = this.shuffle(this.game.steps);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and drag the name to the corresponding person.', 80, 200);
      this.insertBitmap('finish', 'btnfinished', 774, 1082);
      this.insertBitmap('repeat', 'btnrepeat', 528, 1082);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 8, 0));
      return this.setKids().introEvaluation();
    };

    U8A4.prototype.setKids = function() {
      var c, caras, d, i, _i, _j;
      caras = new createjs.Container();
      caras.x = 180;
      caras.y = 300;
      caras.name = 'caras';
      this.targets = new Array();
      for (i = _i = 1; _i <= 8; i = ++_i) {
        if (i < 5) {
          c = this.createBitmap("image" + i, "image" + i, (290 * i) - 290, 0);
        } else {
          c = this.createBitmap("image" + i, "image" + i, (290 * i) - 290 * 5, 380);
        }
        this.targets.push(c);
        this.addToLibrary(c);
        caras.addChild(c);
      }
      for (i = _j = 1; _j <= 8; i = _j += 1) {
        d = new Droppable("dragble" + i, this.preload.getResult("dragble" + i), i, 1260, i * 74, this.stage);
        this.setReg(d, d.width / 2, d.height / 2);
        this.addToLibrary(d);
        caras.addChild(d);
      }
      this.addToMain(caras);
      return this;
    };

    U8A4.prototype.introEvaluation = function() {
      U8A4.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library.finish, 1, {
        alpha: 0,
        y: this.library.finish.y + 20,
        delay: 0.7
      });
      TweenLite.from(this.library.repeat, 1, {
        alpha: 0,
        y: this.library.repeat.y + 20,
        delay: 0.7
      });
      return TweenLite.from(this.library.caras, 1, {
        alpha: 0,
        y: this.library.caras.y + 40,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U8A4.prototype.initEvaluation = function(e) {
      var i, _i, _results;
      U8A4.__super__.initEvaluation.apply(this, arguments);
      createjs.Sound.play(this.steps[this.index].sound);
      this.library.repeat.addEventListener('click', this.playSound);
      this.library.finish.addEventListener('click', this.evaluateAnswer);
      _results = [];
      for (i = _i = 1; _i <= 8; i = _i += 1) {
        this.library["dragble" + i].updateDrops(this.targets);
        this.library["dragble" + i].addEventListener('dropped', this.evaluateDrop);
        _results.push(this.library["dragble" + i].initDragListener());
      }
      return _results;
    };

    U8A4.prototype.evaluateDrop = function(e) {
      this.answer = e.target;
      this.drop = e.drop;
      this.answer.putInPlace({
        x: this.drop.x + 130,
        y: this.drop.y + 300
      });
      return setTimeout(this.finishEvaluation, 1 * 1000);
    };

    U8A4.prototype.evaluateAnswer = function(e) {
      var i, res, step, _i;
      this.library.repeat.removeEventListener('click', this.playSound);
      this.library.finish.removeEventListener('click', this.evaluateAnswer);
      for (i = _i = 1; _i <= 8; i = _i += 1) {
        step = this.steps[i - 1];
        res = this.createSprite('resultado', ['incorrect', 'correct'], null, this.library["image" + step.tgt].x, this.library["image" + step.tgt].y);
        if (this.library["dragble" + step.drp].x === this.library["image" + step.tgt].x + 130) {
          this.library.score.plusOne();
          res.gotoAndStop(1);
        } else {
          res.gotoAndStop(0);
        }
        this.library.caras.addChild(res);
      }
      return setTimeout(this.finish, 2 * 1000);
    };

    U8A4.prototype.finishEvaluation = function() {
      return this.nextEvaluation();
    };

    U8A4.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.steps.length) {
        return createjs.Sound.play(this.steps[this.index].sound);
      }
    };

    U8A4.prototype.playSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play(this.steps[this.index].sound);
    };

    U8A4.prototype.finish = function() {
      TweenLite.to(this.library.finish, 1, {
        alpha: 0,
        y: this.library.finish.y + 20
      });
      TweenLite.to(this.library.repeat, 1, {
        alpha: 0,
        y: this.library.repeat.y + 20
      });
      TweenLite.to(this.library.caras, 1, {
        alpha: 0,
        y: this.library.caras.y + 40
      });
      return U8A4.__super__.finish.apply(this, arguments);
    };

    window.U8A4 = U8A4;

    return U8A4;

  })(Oda);

}).call(this);
