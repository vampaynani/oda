// Generated by CoffeeScript 1.6.3
(function() {
  var U4A5,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A5 = (function(_super) {
    __extends(U4A5, _super);

    function U4A5() {
      this.finish = __bind(this.finish, this);
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
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/TU2_U5_A5_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U5_A5_scene1.mp3',
          id: 'scene1'
        }, {
          src: 'sounds/TU2_U5_A5_scene2.mp3',
          id: 'scene2'
        }
      ];
      this.game = [
        {
          texts: [
            {
              idx: 3,
              t: "But finally Hare agrees to the race."
            }, {
              idx: 1,
              t: 'Every day Hare teases Tortoise.'
            }, {
              idx: 4,
              t: 'Many animals arrive to watch.'
            }, {
              idx: 2,
              t: "I run so fast!"
            }
          ],
          positions: [
            {
              x: '111',
              y: '160'
            }, {
              x: '330',
              y: '165'
            }, {
              x: '112',
              y: '375'
            }, {
              x: '326',
              y: '363'
            }
          ]
        }, {
          texts: [
            {
              idx: 6,
              t: "He stops to rest under the tree."
            }, {
              idx: 8,
              t: "He's the winner."
            }, {
              idx: 5,
              t: 'He runs ahead of Tortoise.'
            }, {
              idx: 7,
              t: "Hare is taking a nap!"
            }
          ],
          positions: [
            {
              x: '111',
              y: '160'
            }, {
              x: '325',
              y: '165'
            }, {
              x: '115',
              y: '365'
            }, {
              x: '330',
              y: '357'
            }
          ]
        }
      ];
      this.answers = [];
      U4A5.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A5.prototype.setStage = function() {
      var ti;
      U4A5.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      ti = this.createBitmap('title', 'title1', 350, 135, 'tc');
      ti.scaleX = ti.scaleY = 0.8;
      this.addToMain(ti);
      this.insertBitmap('btnnext', 'btn', 760, 520, 'tc');
      this.library['btnnext'].visible = false;
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 8, 0));
      return this.setCuento(1).introEvaluation();
    };

    U4A5.prototype.setCuento = function(scene) {
      var cuento, i, m, t, _i, _j, _ref, _ref1;
      cuento = new createjs.Container();
      cuento.name = 'cuento';
      this.scene = scene;
      for (i = _i = 1, _ref = this.game[scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        m = this.createSprite("sc" + i, ["" + ((scene - 1) * 4 + i), "" + ((scene - 1) * 4 + i) + "b"], null, this.game[scene - 1].positions[i - 1].x, this.game[scene - 1].positions[i - 1].y);
        m.index = (scene - 1) * 4 + i;
        m.scaleX = m.scaleY = 0.8;
        cuento.addChild(m);
        this.addToLibrary(m);
      }
      for (i = _j = 1, _ref1 = this.game[scene - 1].texts.length; _j <= _ref1; i = _j += 1) {
        t = new DraggableText("t" + i, this.game[scene - 1].texts[i - 1].t, this.game[scene - 1].texts[i - 1].idx, 700, i * 60 + 200);
        t.text.lineHeight = 20;
        t.text.lineWidth = 200;
        t.text.textAlign = 'center';
        t.setHitArea();
        this.addToLibrary(t);
        cuento.addChild(t);
      }
      this.addToMain(cuento);
      return this;
    };

    U4A5.prototype.introEvaluation = function() {
      var i, _i, _ref;
      U4A5.__super__.introEvaluation.apply(this, arguments);
      for (i = _i = 1, _ref = this.game[this.scene - 1].texts.length; _i <= _ref; i = _i += 1) {
        this.observer.subscribe('init_evaluation', this.library["t" + i].onInitEvaluation);
      }
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['title'], 1, {
        alpha: 0,
        y: this.library['title'].y + 20,
        delay: 1
      });
      return TweenLite.from(this.library['cuento'], 1, {
        alpha: 0,
        y: this.library['cuento'].y + 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U4A5.prototype.initEvaluation = function(e) {
      var i, _i, _ref, _results;
      U4A5.__super__.initEvaluation.apply(this, arguments);
      createjs.Sound.play("scene" + this.scene);
      _results = [];
      for (i = _i = 1, _ref = this.game[this.scene - 1].texts.length; _i <= _ref; i = _i += 1) {
        _results.push(this.library["t" + i].addEventListener('click', this.evaluateAnswer));
      }
      return _results;
    };

    U4A5.prototype.evaluateAnswer = function(e) {
      var dropped, i, pt, _i, _ref, _results;
      this.answer = e.target;
      dropped = false;
      _results = [];
      for (i = _i = 1, _ref = this.game[this.scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        pt = this.library["sc" + i].globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (this.library["sc" + i].hitTest(pt.x, pt.y)) {
          if (this.answer.index === this.library["sc" + i].index) {
            this.library["sc" + i].currentFrame = 1;
            this.answer.visible = false;
            createjs.Sound.play('good');
            this.library['score'].plusOne();
            _results.push(this.finishEvaluation());
          } else {
            this.warning();
            _results.push(this.answer.returnToPlace());
          }
        } else {
          _results.push(this.answer.returnToPlace());
        }
      }
      return _results;
    };

    U4A5.prototype.finishEvaluation = function() {
      var i, _i, _ref;
      for (i = _i = 1, _ref = this.game[this.scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        if (this.library["sc" + i].currentFrame === 0) {
          return;
        }
      }
      if (this.scene < 2) {
        this.library['btnnext'].visible = true;
        this.library['btnnext'].alpha = 1;
        this.library['btnnext'].y = 520;
        TweenLite.from(this.library['btnnext'], 1, {
          alpha: 0,
          y: this.library['btnnext'].y + 10
        });
        return this.library['btnnext'].addEventListener('click', this.nextEvaluation);
      } else {
        return this.nextEvaluation();
      }
    };

    U4A5.prototype.nextEvaluation = function() {
      var i, _i, _ref, _results;
      this.index++;
      createjs.Sound.stop();
      if (this.index < this.game.length) {
        TweenLite.to(this.library['btnnext'], 1, {
          alpha: 0,
          y: this.library['btnnext'].y + 10
        });
        TweenLite.to(this.library['cuento'], 1, {
          alpha: 0,
          y: this.library['cuento'].y + 10
        });
        this.setCuento(this.index + 1);
        createjs.Sound.play("scene" + this.scene);
        TweenLite.from(this.library['cuento'], 1, {
          alpha: 0,
          y: this.library['cuento'].y + 10
        });
        _results = [];
        for (i = _i = 1, _ref = this.game[this.scene - 1].texts.length; _i <= _ref; i = _i += 1) {
          this.library["t" + i].onInitEvaluation();
          _results.push(this.library["t" + i].addEventListener('click', this.evaluateAnswer));
        }
        return _results;
      } else {
        return setTimeout(this.finish, 2 * 1000);
      }
    };

    U4A5.prototype.finish = function() {
      TweenLite.to(this.library['title'], 1, {
        alpha: 0,
        y: this.library['title'].y + 20
      });
      TweenLite.to(this.library['cuento'], 1, {
        alpha: 0,
        y: this.library['cuento'].y - 50
      });
      return U4A5.__super__.finish.apply(this, arguments);
    };

    window.U4A5 = U4A5;

    return U4A5;

  })(Oda);

}).call(this);
