(function() {
  var U6A5,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U6A5 = (function(_super) {
    __extends(U6A5, _super);

    function U6A5() {
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
          id: 'nube1',
          src: 'nube1.png'
        }, {
          id: 'nube2',
          src: 'nube2.png'
        }, {
          id: 'nube3',
          src: 'nube1.png'
        }, {
          id: 'nube4',
          src: 'nube2.png'
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
          id: '9',
          src: '9.png'
        }, {
          id: '10',
          src: '10.png'
        }, {
          id: '11',
          src: '11.png'
        }, {
          id: '12',
          src: '12.png'
        }, {
          id: '13',
          src: '13.png'
        }, {
          id: '14',
          src: '14.png'
        }, {
          id: '15',
          src: '15.png'
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
          id: '9b',
          src: '9b.png'
        }, {
          id: '10b',
          src: '10b.png'
        }, {
          id: '11b',
          src: '11b.png'
        }, {
          id: '12b',
          src: '12b.png'
        }, {
          id: '13b',
          src: '13b.png'
        }, {
          id: '14b',
          src: '14b.png'
        }, {
          id: '15b',
          src: '15b.png'
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
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU3_U6_A5_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU3_U6_A5_song_1.mp3',
          id: 'scene1'
        }, {
          src: 'sounds/TU3_U6_A5_song_2.mp3',
          id: 'scene2'
        }, {
          src: 'sounds/TU3_U6_A5_song_3.mp3',
          id: 'scene3'
        }, {
          src: 'sounds/TU3_U6_A5_song_4.mp3',
          id: 'scene4'
        }
      ];
      this.game = [
        {
          texts: [
            {
              idx: 2,
              t: "He couldn't go down the cliff--it was too dangerous",
              x: 254,
              y: 432
            }, {
              idx: 3,
              t: 'Simon started to think that Joe was dead',
              x: 254,
              y: 450
            }, {
              idx: 1,
              t: 'Joe was hanging on the rope like a big heavy spider',
              x: 254,
              y: 468
            }, {
              idx: 4,
              t: 'In a second, the weight --his friend, Joe-- was gone',
              x: 254,
              y: 486
            }
          ],
          positions: [
            {
              id: '1',
              x: 70,
              y: 190
            }, {
              id: '2',
              x: 415,
              y: 190
            }, {
              id: '3',
              x: 415,
              y: 270
            }, {
              id: '4',
              x: 415,
              y: 350
            }
          ],
          nube: {
            id: 'nube1',
            x: 78,
            y: 404
          }
        }, {
          texts: [
            {
              idx: 6,
              t: "He saw a lot of ice",
              x: 584,
              y: 280
            }, {
              idx: 7,
              t: "He didn't want to die",
              x: 584,
              y: 300
            }, {
              idx: 5,
              t: 'Everything went dark',
              x: 584,
              y: 320
            }
          ],
          positions: [
            {
              id: '5',
              x: 114,
              y: 202
            }, {
              id: '6',
              x: 114,
              y: 265
            }, {
              id: '7',
              x: 114,
              y: 330
            }
          ],
          nube: {
            id: 'nube2',
            x: 474,
            y: 250
          }
        }, {
          texts: [
            {
              idx: 12,
              t: 'In his dreams, he heard Joe yelling, "Simon! Simon!"',
              x: 254,
              y: 432
            }, {
              idx: 10,
              t: 'They were so happy and excited',
              x: 254,
              y: 450
            }, {
              idx: 9,
              t: 'Now he was safe',
              x: 254,
              y: 468
            }, {
              idx: 11,
              t: 'He planned to leave the next day',
              x: 254,
              y: 486
            }
          ],
          positions: [
            {
              id: '8',
              x: 70,
              y: 190
            }, {
              id: '9',
              x: 70,
              y: 288
            }, {
              id: '10',
              x: 415,
              y: 190
            }, {
              id: '11',
              x: 415,
              y: 317
            }
          ],
          nube: {
            id: 'nube1',
            x: 78,
            y: 404
          }
        }, {
          texts: [
            {
              idx: 15,
              t: "Suddenly, he heard his name again",
              x: 584,
              y: 280
            }, {
              idx: 16,
              t: "Joe was alive!",
              x: 584,
              y: 300
            }, {
              idx: 13,
              t: "There wasn't any wind",
              x: 584,
              y: 340
            }, {
              idx: 14,
              t: 'He opened the tent and looked around',
              x: 584,
              y: 320
            }
          ],
          positions: [
            {
              id: '12',
              x: 114,
              y: 202
            }, {
              id: '13',
              x: 114,
              y: 265
            }, {
              id: '14',
              x: 114,
              y: 320
            }, {
              id: '15',
              x: 114,
              y: 365
            }
          ],
          nube: {
            id: 'nube2',
            x: 474,
            y: 250
          }
        }
      ];
      this.answers = [];
      U6A5.__super__.constructor.call(this, null, manifest, sounds);
    }

    U6A5.prototype.setStage = function() {
      U6A5.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.insertBitmap('bg', 'bg', 0, 30);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen, read and drag the correct words to the text.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 15, 0));
      this.library.score.txtCount.color = "#C3DB5B";
      this.library.score.txtTotal.color = "#EB2D3C";
      return this.setCuento(1).introEvaluation();
    };

    U6A5.prototype.setCuento = function(scene) {
      var cuento, hit, i, m, nube, t, _i, _j, _ref, _ref1;
      cuento = new createjs.Container();
      cuento.name = 'cuento';
      this.scene = scene;
      nube = this.createBitmap(this.game[scene - 1].nube.id, this.game[scene - 1].nube.id, this.game[scene - 1].nube.x, this.game[scene - 1].nube.y);
      cuento.addChild(nube);
      for (i = _i = 1, _ref = this.game[scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        m = this.createSprite("sc" + i, ["" + this.game[scene - 1].positions[i - 1].id, "" + this.game[scene - 1].positions[i - 1].id + "b"], null, this.game[scene - 1].positions[i - 1].x, this.game[scene - 1].positions[i - 1].y);
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
        t = new DraggableText("t" + i, this.game[scene - 1].texts[i - 1].t, this.game[scene - 1].texts[i - 1].idx, this.game[scene - 1].texts[i - 1].x, this.game[scene - 1].texts[i - 1].y - 5);
        t.text.textAlign = 'center';
        t.text.font = '11px Quicksand';
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

    U6A5.prototype.introEvaluation = function() {
      var i, _i, _ref;
      U6A5.__super__.introEvaluation.apply(this, arguments);
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

    U6A5.prototype.initEvaluation = function(e) {
      var i, _i, _ref, _results;
      U6A5.__super__.initEvaluation.apply(this, arguments);
      createjs.Sound.play("scene" + this.scene);
      _results = [];
      for (i = _i = 1, _ref = this.game[this.scene - 1].texts.length; _i <= _ref; i = _i += 1) {
        _results.push(this.library["t" + i].addEventListener('click', this.evaluateAnswer));
      }
      return _results;
    };

    U6A5.prototype.evaluateAnswer = function(e) {
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

    U6A5.prototype.finishEvaluation = function() {
      var i, _i, _ref;
      for (i = _i = 1, _ref = this.game[this.scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        if (this.library["sc" + i].currentFrame === 0) {
          return;
        }
      }
      return this.nextEvaluation();
    };

    U6A5.prototype.nextEvaluation = function() {
      var i, _i, _ref, _results;
      this.index++;
      createjs.Sound.stop();
      if (this.index < this.game.length) {
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
        this.finalscene = 0;
        return this.finish();
      }
    };

    U6A5.prototype.finish = function() {
      createjs.Sound.stop();
      createjs.Sound.play('good');
      TweenLite.to(this.library['cuento'], 1, {
        alpha: 0,
        y: this.library['cuento'].y + 10
      });
      TweenLite.to(this.library['bg'], 1, {
        alpha: 0
      });
      return U6A5.__super__.finish.apply(this, arguments);
    };

    window.U6A5 = U6A5;

    return U6A5;

  })(Oda);

}).call(this);
