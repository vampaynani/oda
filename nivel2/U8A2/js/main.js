(function() {
  var U8A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A2 = (function(_super) {
    __extends(U8A2, _super);

    function U8A2() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.clearEvaluation = __bind(this.clearEvaluation, this);
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
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U8_A2_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        scenes: [
          {
            steps: [
              {
                frase: 'In Brazil.',
                pattern: ['#wc', 'do they ', '#wc', ' Reveillon?'],
                targets: ['Where', 'celebrate']
              }, {
                frase: 'On January 1st.',
                pattern: ['#wc', 'do they', '#wc', 'Reveillon?'],
                targets: ['When', 'celebrate']
              }, {
                frase: 'White clothes.',
                pattern: ['#wc', 'do they', '#wc', '?'],
                targets: ['What', 'wear']
              }, {
                frase: 'They float boats with flowers and candles in the sea.',
                pattern: ['#wc', 'do they', '#wc', '?'],
                targets: ['What', 'do']
              }
            ],
            opt1: [
              {
                i: 1,
                t: 'When',
                x: 50,
                y: 70
              }, {
                i: 2,
                t: 'What',
                x: 180,
                y: 44
              }, {
                i: 3,
                t: 'Where',
                x: 140,
                y: 140
              }
            ],
            opt2: [
              {
                i: 1,
                t: 'celebrate',
                x: 52,
                y: 40
              }, {
                i: 2,
                t: 'do',
                x: 100,
                y: 144
              }, {
                i: 3,
                t: 'wear',
                x: 170,
                y: 116
              }
            ]
          }, {
            steps: [
              {
                frase: 'Moon cakes and pomelos.',
                pattern: ['#wc', 'do they', '#wc', '?'],
                targets: ['What', 'eat']
              }, {
                frase: 'In September.',
                pattern: ['#wc', 'do they', '#wc', '?'],
                targets: ['When', 'celebrate']
              }, {
                frase: 'Family and friends.',
                pattern: ['#wc', 'do they', '#wc', '?'],
                targets: ['Who', 'visit']
              }, {
                frase: 'Lanterns.',
                pattern: ['#wc', 'do they', '#wc', '?'],
                targets: ['What', 'carry']
              }
            ],
            opt1: [
              {
                i: 1,
                t: 'When',
                x: 50,
                y: 70
              }, {
                i: 2,
                t: 'What',
                x: 130,
                y: 34
              }, {
                i: 3,
                t: 'Who',
                x: 180,
                y: 90
              }, {
                i: 4,
                t: 'Where',
                x: 140,
                y: 140
              }
            ],
            opt2: [
              {
                i: 1,
                t: 'visit',
                x: 80,
                y: 30
              }, {
                i: 2,
                t: 'eat',
                x: 100,
                y: 144
              }, {
                i: 3,
                t: 'celebrate',
                x: 50,
                y: 81
              }, {
                i: 4,
                t: 'carry',
                x: 170,
                y: 116
              }
            ]
          }, {
            steps: [
              {
                frase: 'Beautiful jewelry.',
                pattern: ['#wc', 'do the women', '#wc', '?'],
                targets: ['What', 'wear']
              }, {
                frase: 'In India.',
                pattern: ['#wc', 'do they', '#wc', ' Diwali?'],
                targets: ['Where', 'celebrate']
              }, {
                frase: 'In October or November.',
                pattern: ['#wc', 'do they', '#wc', ' Diwali?'],
                targets: ['When', 'celebrate']
              }, {
                frase: 'They watch fireworks and light candles for good luck.',
                pattern: ['#wc', 'do they', '#wc', '?'],
                targets: ['What', 'do']
              }
            ],
            opt1: [
              {
                i: 1,
                t: 'When',
                x: 50,
                y: 70
              }, {
                i: 2,
                t: 'What',
                x: 130,
                y: 34
              }, {
                i: 3,
                t: 'Who',
                x: 180,
                y: 90
              }, {
                i: 4,
                t: 'Where',
                x: 140,
                y: 140
              }
            ],
            opt2: [
              {
                i: 1,
                t: 'wear',
                x: 170,
                y: 116
              }, {
                i: 2,
                t: 'do',
                x: 100,
                y: 144
              }, {
                i: 3,
                t: 'celebrate',
                x: 52,
                y: 40
              }
            ]
          }
        ]
      };
      U8A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A2.prototype.setStage = function() {
      U8A2.__super__.setStage.apply(this, arguments);
      this.escena = 1;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Drag the words to form a question.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 24, 0));
      return this.setScene(1).setDropper(1).setNube1().setNube2().introEvaluation();
    };

    U8A2.prototype.setScene = function(scene) {
      this.scene = this.game.scenes[scene - 1];
      this.intento = 0;
      this.sc = this.createBitmap("scene", "scene" + scene, stageSize.w / 2, 300, 'tc');
      this.addToMain(this.sc);
      return this;
    };

    U8A2.prototype.setDropper = function(step) {
      var a, dropper, h, i, npos, q, t, txt, _i, _len, _ref;
      this.step = step;
      if (this.library.dropper) {
        dropper = this.library.dropper;
      } else {
        dropper = new createjs.Container();
        dropper.y = 780;
        dropper.name = 'dropper';
      }
      dropper.alpha = 1;
      if (!dropper.parent) {
        this.addToMain(dropper);
      }
      dropper.removeAllChildren();
      q = this.createText('q', 'Q:', '48px Quicksand', '#333', 240, 0);
      dropper.addChild(q);
      i = 0;
      npos = q.x + q.getMeasuredWidth() + 20;
      _ref = this.scene.steps[step - 1].pattern;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        t = _ref[_i];
        if (t === '#wc') {
          txt = this.scene.steps[step - 1].targets[i];
          h = new WordContainer("h" + i, "" + txt, '#FFF', '#eb188e', npos, 0, 100, 50);
          h.index = i;
          dropper.addChild(h);
          this.addToLibrary(h);
          npos += h.width + 20;
          i++;
        } else {
          h = this.createText('', t, '48px Quicksand', '#333', npos, 0);
          dropper.addChild(h);
          npos += h.getMeasuredWidth() + 20;
        }
      }
      a = this.createText('a', "A: " + this.scene.steps[this.step - 1].frase, '48px Quicksand', '#333', 240, 80);
      dropper.addChild(a);
      return this;
    };

    U8A2.prototype.setNube1 = function() {
      var back, container, d, opt, _i, _len, _ref;
      container = new createjs.Container();
      container.x = 420;
      container.y = 960;
      container.name = 'nube1';
      container.removeAllChildren();
      back = this.createBitmap('backNube1', 'n1', 0, 0);
      container.addChild(back);
      _ref = this.scene.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        d = new DroppableText("n1d" + opt.i, opt.t, opt.t, opt.x, opt.y, this.stage);
        container.addChild(d);
        this.addToLibrary(d);
      }
      this.addToMain(container);
      return this;
    };

    U8A2.prototype.setNube2 = function() {
      var back, container, d, opt, _i, _len, _ref;
      container = new createjs.Container();
      container.x = 880;
      container.y = 960;
      container.name = 'nube2';
      container.removeAllChildren();
      back = this.createBitmap('backNube2', 'n2', 0, 0);
      container.addChild(back);
      _ref = this.scene.opt2;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        d = new DroppableText("n2d" + opt.i, opt.t, opt.t, opt.x, opt.y, this.stage);
        container.addChild(d);
        this.addToLibrary(d);
      }
      this.addToMain(container);
      return this;
    };

    U8A2.prototype.introEvaluation = function() {
      U8A2.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library.scene, 1, {
        alpha: 0,
        y: this.library.scene.y + 40,
        delay: 1
      });
      TweenLite.from(this.library.dropper, 1, {
        alpha: 0,
        y: this.library.dropper.y + 40,
        delay: 1
      });
      TweenLite.from(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y + 40,
        delay: 1.5
      });
      return TweenLite.from(this.library.nube2, 1, {
        alpha: 0,
        y: this.library.nube2.y + 40,
        delay: 1.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U8A2.prototype.initEvaluation = function(e) {
      var opt, _i, _j, _len, _len1, _ref, _ref1, _results;
      U8A2.__super__.initEvaluation.apply(this, arguments);
      _ref = this.scene.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        this.library["n1d" + opt.i].updateDrops(this.library.h0);
        this.library["n1d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        this.library["n1d" + opt.i].initDragListener();
      }
      _ref1 = this.scene.opt2;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        opt = _ref1[_j];
        this.library["n2d" + opt.i].updateDrops(this.library.h1);
        this.library["n2d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        _results.push(this.library["n2d" + opt.i].initDragListener());
      }
      return _results;
    };

    U8A2.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      this.drop = e.drop;
      if (this.answer.index === this.scene.steps[this.step - 1].targets[this.drop.index]) {
        this.answer.visible = false;
        this.drop.changeText(this.answer.index);
        if (this.intento === 0) {
          this.library['score'].plusOne();
        }
        this.intento = 0;
        createjs.Sound.play('good');
        return this.finishEvaluation();
      } else {
        this.warning();
        this.intento = 1;
        return this.answer.returnToPlace();
      }
    };

    U8A2.prototype.finishEvaluation = function() {
      if (this.library.h0.text.text === '' || this.library.h1.text.text === '') {
        return;
      }
      return setTimeout(this.clearEvaluation, 1 * 1000);
    };

    U8A2.prototype.clearEvaluation = function(e) {
      var opt, _i, _j, _len, _len1, _ref, _ref1;
      _ref = this.scene.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        this.library["n1d" + opt.i].visible = true;
        this.library["n1d" + opt.i].returnToPlace();
      }
      _ref1 = this.scene.opt2;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        opt = _ref1[_j];
        this.library["n2d" + opt.i].visible = true;
        this.library["n2d" + opt.i].returnToPlace();
      }
      return TweenLite.to(this.library.dropper, 0.5, {
        alpha: 0,
        y: this.library.dropper.y + 40,
        onComplete: this.nextEvaluation
      });
    };

    U8A2.prototype.nextEvaluation = function() {
      var opt, _i, _j, _len, _len1, _ref, _ref1, _results;
      this.index++;
      if (this.index < this.scene.steps.length) {
        this.setDropper(this.index + 1);
        TweenLite.to(this.library.dropper, 0.5, {
          alpha: 1,
          y: 780
        });
        _ref = this.scene.opt1;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          opt = _ref[_i];
          this.library["n1d" + opt.i].updateDrops(this.library.h0);
        }
        _ref1 = this.scene.opt2;
        _results = [];
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          opt = _ref1[_j];
          _results.push(this.library["n2d" + opt.i].updateDrops(this.library.h1));
        }
        return _results;
      } else {
        if (this.escena !== 3) {
          this.escena++;
          this.index = 0;
          this.mainContainer.removeChild(this.sc);
          TweenLite.to(this.library.nube1, 1, {
            alpha: 0,
            y: this.library.nube1.y + 40
          });
          TweenLite.to(this.library.nube2, 1, {
            alpha: 0,
            y: this.library.nube2.y + 40
          });
          this.setScene(this.escena).setDropper(1).setNube1().setNube2().initEvaluation();
          TweenLite.from(this.library.nube1, 1, {
            alpha: 0,
            y: this.library.nube1.y + 40
          });
          TweenLite.from(this.library.nube2, 1, {
            alpha: 0,
            y: this.library.nube2.y + 40
          });
          return TweenLite.to(this.library.dropper, 0.5, {
            alpha: 1,
            y: 780
          });
        } else {
          return this.finish();
        }
      }
    };

    U8A2.prototype.finish = function() {
      TweenLite.to(this.library.scene, 1, {
        alpha: 0,
        y: this.library.scene.y + 40
      });
      TweenLite.to(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y + 40
      });
      TweenLite.to(this.library.nube2, 1, {
        alpha: 0,
        y: this.library.nube2.y + 40
      });
      TweenLite.to(this.library.dropper, 0.5, {
        alpha: 0,
        y: 780
      });
      return U8A2.__super__.finish.apply(this, arguments);
    };

    window.U8A2 = U8A2;

    return U8A2;

  })(Oda);

}).call(this);
