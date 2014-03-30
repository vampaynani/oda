(function() {
  var U2A5,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A5 = (function(_super) {
    __extends(U2A5, _super);

    function U2A5() {
      this.finish = __bind(this.finish, this);
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
          id: 'bg',
          src: 'bg.png'
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
          id: '1p1',
          src: '1p1.png'
        }, {
          id: '1p2',
          src: '1p2.png'
        }, {
          id: '3p1',
          src: '3p1.png'
        }, {
          id: '3p2',
          src: '3p2.png'
        }, {
          id: '6p1',
          src: '6p1.png'
        }, {
          id: '6p2',
          src: '6p2.png'
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
          src: 'sounds/TU3_U2_A5_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU3_U2_A5_scene1.mp3',
          id: 'scene1'
        }
      ];
      this.game = [
        {
          texts: [
            {
              idx: 1,
              t: 'doors',
              x: '701',
              y: '492',
              p: 'p1'
            }, {
              idx: 1,
              t: 'table',
              x: '665',
              y: '547',
              p: 'p2'
            }, {
              idx: 2,
              t: 'stomach',
              x: '731',
              y: '532'
            }, {
              idx: 3,
              t: 'fountain',
              x: '557',
              y: '497',
              p: 'p1'
            }, {
              idx: 3,
              t: 'flutes',
              x: '496',
              y: '484',
              p: 'p2'
            }, {
              idx: 4,
              t: 'cup',
              x: '595',
              y: '542'
            }, {
              idx: 5,
              t: 'flowers',
              x: '574',
              y: '459'
            }, {
              idx: 6,
              t: 'eyes',
              x: '659',
              y: '468',
              p: 'p1'
            }, {
              idx: 6,
              t: 'question',
              x: '518',
              y: '533',
              p: 'p2'
            }, {
              idx: 7,
              t: 'trouble',
              x: '634',
              y: '511'
            }
          ],
          positions: [
            {
              x: 64,
              y: 177
            }, {
              x: 64,
              y: 258
            }, {
              x: 64,
              y: 350
            }, {
              x: 64,
              y: 403
            }, {
              x: 412,
              y: 177
            }, {
              x: 412,
              y: 287
            }, {
              x: 412,
              y: 392
            }
          ]
        }
      ];
      this.answers = [];
      U2A5.__super__.constructor.call(this, null, manifest, sounds);
    }

    U2A5.prototype.setStage = function() {
      U2A5.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.insertBitmap('bg', 'bg', 0, 50);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen, read and drag the correct words to the text.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 10, 0));
      this.library.score.txtCount.color = "#C3DB5B";
      this.library.score.txtTotal.color = "#EB2D3C";
      return this.setCuento(1).introEvaluation();
    };

    U2A5.prototype.setCuento = function(scene) {
      var cuento, hit, i, m, t, _i, _j, _ref, _ref1;
      cuento = new createjs.Container();
      cuento.name = 'cuento';
      this.scene = scene;
      for (i = _i = 1, _ref = this.game[scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        if (i === 2 || i === 4 || i === 5 || i === 7) {
          m = this.createSprite("sc" + i, ["" + ((scene - 1) * 4 + i), "" + ((scene - 1) * 4 + i) + "b"], null, this.game[scene - 1].positions[i - 1].x, this.game[scene - 1].positions[i - 1].y);
        } else {
          m = this.createSprite("sc" + i, ["" + ((scene - 1) * 4 + i), "" + ((scene - 1) * 4 + i) + "p1", "" + ((scene - 1) * 4 + i) + "p2", "" + ((scene - 1) * 4 + i) + "b"], null, this.game[scene - 1].positions[i - 1].x, this.game[scene - 1].positions[i - 1].y);
        }
        hit = new createjs.Shape();
        hit.graphics.beginFill("rgba(255,255, 255, 0.1)").drawRect(0, 0, m.width, m.height);
        hit.name = "hsc" + i;
        hit.x = this.game[scene - 1].positions[i - 1].x;
        hit.y = this.game[scene - 1].positions[i - 1].y;
        cuento.addChild(hit);
        hit.index = (scene - 1) * 4 + i;
        cuento.addChild(hit, m);
        this.addToLibrary(hit, m);
      }
      for (i = _j = 1, _ref1 = this.game[scene - 1].texts.length; _j <= _ref1; i = _j += 1) {
        t = new DraggableText("t" + i, this.game[scene - 1].texts[i - 1].t, this.game[scene - 1].texts[i - 1].idx, this.game[scene - 1].texts[i - 1].x, this.game[scene - 1].texts[i - 1].y);
        t.text.textAlign = 'center';
        t.setHitArea();
        if (this.game[scene - 1].texts[i - 1].p) {
          t.p = this.game[scene - 1].texts[i - 1].p;
        }
        this.addToLibrary(t);
        cuento.addChild(t);
      }
      this.addToMain(cuento);
      return this;
    };

    U2A5.prototype.introEvaluation = function() {
      var i, _i, _ref;
      U2A5.__super__.introEvaluation.apply(this, arguments);
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
      return TweenLite.from(this.library['cuento'], 1, {
        alpha: 0,
        y: this.library['cuento'].y + 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U2A5.prototype.initEvaluation = function(e) {
      var i, _i, _ref, _results;
      U2A5.__super__.initEvaluation.apply(this, arguments);
      createjs.Sound.play("scene" + this.scene);
      _results = [];
      for (i = _i = 1, _ref = this.game[this.scene - 1].texts.length; _i <= _ref; i = _i += 1) {
        _results.push(this.library["t" + i].addEventListener('click', this.evaluateAnswer));
      }
      return _results;
    };

    U2A5.prototype.evaluateAnswer = function(e) {
      var dropped, i, pt, _i, _ref, _ref1, _results;
      this.answer = e.currentTarget;
      dropped = false;
      _results = [];
      for (i = _i = 1, _ref = this.game[this.scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        pt = this.library["hsc" + i].globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (this.library["hsc" + i].hitTest(pt.x, pt.y)) {
          if (this.answer.index === this.library["hsc" + i].index) {
            if (this.answer.p) {
              if ((_ref1 = this.library["sc" + i].currentFrame) === 1 || _ref1 === 2) {
                this.library["sc" + i].gotoAndStop(3);
              } else if (this.answer.p === 'p1') {
                this.library["sc" + i].gotoAndStop(1);
              } else {
                this.library["sc" + i].gotoAndStop(2);
              }
            } else {
              this.library["sc" + i].gotoAndStop(1);
            }
            this.answer.visible = false;
            createjs.Sound.play('good');
            if (this.intento === 0) {
              this.library['score'].plusOne();
            }
            this.intento = 0;
            _results.push(this.finishEvaluation());
          } else {
            this.intento = 1;
            this.warning();
            _results.push(this.answer.returnToPlace());
          }
        } else {
          _results.push(this.answer.returnToPlace());
        }
      }
      return _results;
    };

    U2A5.prototype.finishEvaluation = function() {
      var i, _i, _ref;
      for (i = _i = 1, _ref = this.game[this.scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        if (this.library["sc" + i].currentFrame !== this.library["sc" + i].spriteSheet._frames.length - 1) {
          return;
        }
      }
      return this.finish();
    };

    U2A5.prototype.finish = function() {
      createjs.Sound.stop();
      createjs.Sound.play('good');
      TweenLite.to(this.library['bg'], 1, {
        alpha: 0
      });
      TweenLite.to(this.library['cuento'], 1, {
        alpha: 0,
        y: this.library['cuento'].y + 10
      });
      return U2A5.__super__.finish.apply(this, arguments);
    };

    window.U2A5 = U2A5;

    return U2A5;

  })(Oda);

}).call(this);
