// Generated by CoffeeScript 1.6.3
(function() {
  var U1A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A4 = (function(_super) {
    __extends(U1A4, _super);

    function U1A4() {
      this.finish = __bind(this.finish, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.endGame = __bind(this.endGame, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.evaluateTextDrop = __bind(this.evaluateTextDrop, this);
      this.evaluateImageDrop = __bind(this.evaluateImageDrop, this);
      this.startGame = __bind(this.startGame, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      this.setmariposa = __bind(this.setmariposa, this);
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
          id: 'flecha1',
          src: 'flecha_1.png'
        }, {
          id: 'flecha2',
          src: 'flecha_2.png'
        }, {
          id: 'flecha3',
          src: 'flecha_3.png'
        }, {
          id: 'flecha4',
          src: 'flecha_4.png'
        }, {
          id: 'flecha5',
          src: 'flecha_5.png'
        }, {
          id: 'wrong',
          src: 'wrong.png'
        }, {
          id: 'correct',
          src: 'correct.png'
        }, {
          id: 'mariposaStart1',
          src: 'image_1_dragble.png'
        }, {
          id: 'mariposaStart2',
          src: 'image_2_dragble.png'
        }, {
          id: 'mariposaStart3',
          src: 'image_3_dragble.png'
        }, {
          id: 'mariposaStart4',
          src: 'image_4_dragble.png'
        }, {
          id: 'mariposaStart5',
          src: 'image_5_dragble.png'
        }, {
          id: 'mariposabtnready',
          src: 'btn_finished.png'
        }, {
          id: 'mariposalabel',
          src: 'caterpillar_label.png'
        }, {
          id: 'mariposastep1',
          src: 'image_1_dropArea.png'
        }, {
          id: 'mariposastep2',
          src: 'image_2_dropArea.png'
        }, {
          id: 'mariposastep3',
          src: 'image_3_dropArea.png'
        }, {
          id: 'mariposastep4',
          src: 'image_4_dropArea.png'
        }, {
          id: 'mariposastep5',
          src: 'image_5_dropArea.png'
        }, {
          id: 'mariposaline1',
          src: 'verso_1_dropArea.png'
        }, {
          id: 'mariposaline2',
          src: 'verso_2_dropArea.png'
        }, {
          id: 'mariposaline3',
          src: 'verso_3_dropArea.png'
        }, {
          id: 'mariposaline4',
          src: 'verso_4_dropArea.png'
        }, {
          id: 'mariposaline5',
          src: 'verso_5_dropArea.png'
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
      this.textos = [
        {
          uno: 'Caterpillar, catterpillar, up in the tree. Where do you come from? Please tell me.',
          x: '154',
          y: '150'
        }, {
          uno: "Wake up now. I can't believe my eyes! Leaving the cocoon. What a big surprise!",
          x: '98',
          y: '417'
        }, {
          uno: "Then you are a caterpillar, long and green, With one goal in life--to eat, eat, eat!",
          x: '230',
          y: '460'
        }, {
          uno: "Now you are a butterfly with wings so new. Fly far away, up into the blue!",
          x: '134',
          y: '504'
        }, {
          uno: "Build a little house called cocoon. Sleep a little while. I'll see you very soon!",
          x: '99',
          y: '547'
        }, {
          uno: "Tiny little eggs under a leaf, Oh so difficult for me to see!",
          x: '329',
          y: '547'
        }
      ];
      this.positions = {
        drags: [
          {
            x: '550',
            y: '506'
          }, {
            x: '630',
            y: '506'
          }, {
            x: '590',
            y: '438'
          }, {
            x: '501',
            y: '438'
          }, {
            x: '677',
            y: '438'
          }
        ],
        drops: [
          {
            x: '482',
            y: '184'
          }, {
            x: '565',
            y: '130'
          }, {
            x: '656',
            y: '175'
          }, {
            x: '622',
            y: '268'
          }, {
            x: '517',
            y: '278'
          }
        ],
        flechas: [
          {
            x: '478',
            y: '273'
          }, {
            x: '511',
            y: '140'
          }, {
            x: '652',
            y: '134'
          }, {
            x: '727',
            y: '261'
          }, {
            x: '595',
            y: '360'
          }
        ]
      };
      this.mariposa = {
        drags: [
          {
            id: 'mariposaStart1'
          }, {
            id: 'mariposaStart2'
          }, {
            id: 'mariposaStart3'
          }, {
            id: 'mariposaStart4'
          }, {
            id: 'mariposaStart5'
          }
        ],
        texts: [
          {
            t: "Wake up now. I can't believe my eyes! Leaving the cocoon. What a big surprise!",
            x: '98',
            y: '417',
            w: 230
          }, {
            t: "Then you are a caterpillar, long and green, With one goal in life--to eat, eat, eat!",
            x: '230',
            y: '460',
            w: 230
          }, {
            t: "Now you are a butterfly with wings so new. Fly far away, up into the blue!",
            x: '134',
            y: '504',
            w: 230
          }, {
            t: "Build a little house called cocoon. Sleep a little while. I'll see you very soon!",
            x: '99',
            y: '547',
            w: 220
          }, {
            t: "Tiny little eggs under a leaf, Oh so difficult for me to see!",
            x: '329',
            y: '547',
            w: 180
          }, {
            t: 'Caterpillar, catterpillar, up in the tree. Where do you come from? Please tell me.',
            x: '154',
            y: '150',
            w: 230
          }
        ]
      };
      this.positions = {
        dragsImg: [
          {
            x: '550',
            y: '506'
          }, {
            x: '630',
            y: '506'
          }, {
            x: '590',
            y: '438'
          }, {
            x: '501',
            y: '438'
          }, {
            x: '677',
            y: '438'
          }
        ],
        steps: [
          {
            x: 126,
            y: 207
          }, {
            x: 144,
            y: 250
          }, {
            x: 126,
            y: 293
          }, {
            x: 144,
            y: 335
          }, {
            x: 126,
            y: 377
          }
        ],
        drops: [
          {
            x: '482',
            y: '184'
          }, {
            x: '565',
            y: '130'
          }, {
            x: '656',
            y: '175'
          }, {
            x: '622',
            y: '268'
          }, {
            x: '517',
            y: '278'
          }
        ],
        flechas: [
          {
            x: '478',
            y: '273'
          }, {
            x: '511',
            y: '140'
          }, {
            x: '652',
            y: '134'
          }, {
            x: '727',
            y: '261'
          }, {
            x: '595',
            y: '360'
          }
        ],
        ready: {
          x: 577,
          y: 383
        },
        start: {
          x: 284,
          y: 539
        },
        score: {
          x: 86,
          y: 191
        },
        titulo: {
          x: 410,
          y: 131
        }
      };
      this.answers = {
        mariposa: [
          {
            t: 'mariposastep1',
            d: 'd3'
          }, {
            t: 'mariposastep2',
            d: 'd5'
          }, {
            t: 'mariposastep3',
            d: 'd4'
          }, {
            t: 'mariposastep4',
            d: 'd2'
          }, {
            t: 'mariposastep5',
            d: 'd1'
          }, {
            t: 'dt5',
            d: 'mariposaline1'
          }, {
            t: 'dt2',
            d: 'mariposaline2'
          }, {
            t: 'dt4',
            d: 'mariposaline3'
          }, {
            t: 'dt1',
            d: 'mariposaline4'
          }, {
            t: 'dt3',
            d: 'mariposaline5'
          }
        ]
      };
      U1A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A4.prototype.setStage = function() {
      U1A4.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 10, 0));
      this.setmariposa();
      return this.startGame;
    };

    U1A4.prototype.setmariposa = function(e) {
      var f, i, l, label, mariposa, ready, s, v, value, _i, _j, _k, _ref, _ref1;
      mariposa = new createjs.Container();
      this.current = mariposa.name = 'mariposa';
      for (i = _i = 1; _i <= 5; i = _i += 1) {
        s = this.createBitmap('mariposastep' + i, "mariposastep" + i, this.positions.drops[i - 1].x, this.positions.drops[i - 1].y);
        f = this.createBitmap('flecha' + i, "flecha" + i, this.positions.flechas[i - 1].x, this.positions.flechas[i - 1].y);
        l = this.createBitmap('mariposaline' + i, "mariposaline" + i, this.positions.steps[i - 1].x, this.positions.steps[i - 1].y - 25);
        this.addToLibrary(s, l);
        mariposa.addChild(s, f, l);
      }
      label = this.createBitmap('label', 'mariposalabel', this.positions.titulo.x, this.positions.titulo.y, 'tc');
      ready = new Button('btnready', this.preload.getResult('mariposabtnready'), 'ready', this.positions.ready.x, this.positions.ready.y);
      mariposa.addChild(label, ready);
      this.addToLibrary(ready);
      for (i = _j = 1, _ref = this.mariposa.drags.length; _j <= _ref; i = _j += 1) {
        value = this.mariposa.drags[i - 1];
        v = new Draggable("d" + i, this.preload.getResult(value.id), i, this.positions.dragsImg[i - 1].x, this.positions.dragsImg[i - 1].y);
        v.scaleX = v.scaleY = 0.8;
        this.observer.subscribe('init_mariposa', v.initDragListener);
        v.addEventListener('drop', this.evaluateImageDrop);
        mariposa.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _k = 1, _ref1 = this.mariposa.texts.length; _k <= _ref1; i = _k += 1) {
        value = this.mariposa.texts[i - 1];
        if (i === this.mariposa.texts.length) {
          v = new createjs.Text(value.t, '12px Arial', '#333');
          v.x = value.x;
          v.y = value.y;
          v.text.lineWidth = value.w;
          this.addToMain(v);
        } else {
          v = new DraggableText("dt" + i, value.t, i, value.x, value.y);
          v.text.font = '12px Arial';
          v.text.lineHeight = 14;
          v.text.lineWidth = value.w;
          v.setHitArea();
          this.observer.subscribe('init_mariposa', v.initDragListener);
          v.addEventListener('drop', this.evaluateTextDrop);
        }
        mariposa.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(mariposa);
      this.introEvaluation();
      this.startGame();
      return this;
    };

    U1A4.prototype.introEvaluation = function() {
      U1A4.__super__.introEvaluation.apply(this, arguments);
      return this.playInstructions(this);
    };

    U1A4.prototype.initEvaluation = function(e) {
      return U1A4.__super__.initEvaluation.apply(this, arguments);
    };

    U1A4.prototype.startGame = function(e) {
      this.observer.notify("init_" + this.current);
      console.log('start');
      return this.library.btnready.addEventListener('click', this.evaluateAnswer);
    };

    U1A4.prototype.evaluateImageDrop = function(e) {
      var dropped, hit, i, pt;
      this.answer = e.target;
      dropped = false;
      i = 1;
      while (!(dropped === true || i > 5)) {
        hit = this.library["" + this.current + "step" + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (hit.hitTest(pt.x, pt.y)) {
          this.answer.putInPlace({
            x: hit.x,
            y: hit.y
          }, 1, this.answer.scaleX, this.answer.scaleY);
          dropped = true;
        } else {
          i++;
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace(1, this.answer.scaleX, this.answer.scaleY);
      }
    };

    U1A4.prototype.evaluateTextDrop = function(e) {
      var dropped, hit, i, pt;
      this.answer = e.target;
      dropped = false;
      i = 1;
      while (!(dropped === true || i > 5)) {
        hit = this.library["" + this.current + "line" + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (hit.hitTest(pt.x, pt.y)) {
          if (this.current === 'mariposa') {
            this.answer.putInPlace({
              x: hit.x + 40,
              y: hit.y + 7
            }, 1, this.answer.scaleX, this.answer.scaleY);
          }
          dropped = true;
        } else {
          i++;
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace(1, this.answer.scaleX, this.answer.scaleY);
      }
    };

    U1A4.prototype.evaluateAnswer = function(e) {
      var npt, pt, r, value, _i, _len, _ref;
      this.complete = true;
      this.library.btnready.removeEventListener('click', this.evaluateAnswer);
      this.library.btnready.blink(false);
      _ref = this.answers[this.current];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        pt = this.library[value.t].localToLocal(5, 5, this.library[value.d]);
        if (this.library[value.t].name.length > 3) {
          npt = this.library[value.t].localToLocal(0, 0, this.mainContainer);
        } else {
          npt = this.library[value.d].localToLocal(0, 0, this.mainContainer);
        }
        if (this.library[value.t].hitTest(pt.x, pt.y)) {
          this.library.score.plusOne();
          r = this.createBitmap('correct', 'correct', npt.x, npt.y);
        } else {
          this.complete = false;
          r = this.createBitmap('wrong', 'wrong', npt.x, npt.y);
        }
        this.library[this.current].addChild(r);
      }
      return setTimeout(this.finishEvaluation, 2 * 1000);
    };

    U1A4.prototype.endGame = function(e) {
      this.complete = false;
      return this.finishEvaluation();
    };

    U1A4.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library[this.current], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.finish
      });
    };

    U1A4.prototype.finish = function() {
      return U1A4.__super__.finish.apply(this, arguments);
    };

    window.U1A4 = U1A4;

    return U1A4;

  })(Oda);

}).call(this);
