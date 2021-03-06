(function() {
  var U5A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A1 = (function(_super) {
    __extends(U5A1, _super);

    function U5A1() {
      this.repeatSound = __bind(this.repeatSound, this);
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
          id: 'btnFinished',
          src: 'btn_finished.png'
        }, {
          id: 'propCalendar',
          src: 'prop_calendar.png'
        }, {
          id: 'btnRepeat',
          src: 'btn_repeat.png'
        }, {
          id: 'cal1Final2',
          src: 'cal1/cal1final2.png'
        }, {
          id: 'cal1Final6',
          src: 'cal1/cal1final6.png'
        }, {
          id: 'cal1Final9',
          src: 'cal1/cal1final9.png'
        }, {
          id: 'cal1Final11',
          src: 'cal1/cal1final11.png'
        }, {
          id: 'cal1Final3',
          src: 'cal1/final_sled.png'
        }, {
          id: 'cal1Final4',
          src: 'cal1/final_scooter.png'
        }, {
          id: 'cal1Final10',
          src: 'cal1/final_rake.png'
        }, {
          id: 'cal1Final7',
          src: 'cal1/final_noshoes.png'
        }, {
          id: 'cal1Final12',
          src: 'cal1/final_grandma.png'
        }, {
          id: 'cal1Final5',
          src: 'cal1/final_flowers.png'
        }, {
          id: 'cal1Final1',
          src: 'cal1/final_chocolate.png'
        }, {
          id: 'cal1Final8',
          src: 'cal1/final_cake.png'
        }, {
          id: 'cal1Dragble8',
          src: 'cal1/dragble_sled.png'
        }, {
          id: 'cal1Dragble4',
          src: 'cal1/dragble_scooter.png'
        }, {
          id: 'cal1Dragble6',
          src: 'cal1/dragble_rake.png'
        }, {
          id: 'cal1Dragble7',
          src: 'cal1/dragble_noshoes.png'
        }, {
          id: 'cal1Dragble1',
          src: 'cal1/dragble_grandma.png'
        }, {
          id: 'cal1Dragble5',
          src: 'cal1/dragble_flowers.png'
        }, {
          id: 'cal1Dragble2',
          src: 'cal1/dragble_chocolate.png'
        }, {
          id: 'cal1Dragble3',
          src: 'cal1/dragble_cake.png'
        }, {
          id: 'cal2Final12',
          src: 'cal2/cal2final12.png'
        }, {
          id: 'cal2Final6',
          src: 'cal2/cal2final6.png'
        }, {
          id: 'cal2Final8',
          src: 'cal2/cal2final8.png'
        }, {
          id: 'cal2Final10',
          src: 'cal2/cal2final10.png'
        }, {
          id: 'cal2Final9',
          src: 'cal2/final_soccer.png'
        }, {
          id: 'cal2Final1',
          src: 'cal2/final_snowman.png'
        }, {
          id: 'cal2Final7',
          src: 'cal2/final_pool.png'
        }, {
          id: 'cal2Final5',
          src: 'cal2/final_picnic.png'
        }, {
          id: 'cal2Final2',
          src: 'cal2/final_kite.png'
        }, {
          id: 'cal2Final11',
          src: 'cal2/final_guitar.png'
        }, {
          id: 'cal2Final3',
          src: 'cal2/final_eggs.png'
        }, {
          id: 'cal2Final4',
          src: 'cal2/final_bike.png'
        }, {
          id: 'cal2Dragble2',
          src: 'cal2/dragble_soccer.png'
        }, {
          id: 'cal2Dragble3',
          src: 'cal2/dragble_snowman.png'
        }, {
          id: 'cal2Dragble1',
          src: 'cal2/dragble_pool.png'
        }, {
          id: 'cal2Dragble8',
          src: 'cal2/dragble_picnic.png'
        }, {
          id: 'cal2Dragble7',
          src: 'cal2/dragble_kite.png'
        }, {
          id: 'cal2Dragble4',
          src: 'cal2/dragble_guitar.png'
        }, {
          id: 'cal2Dragble6',
          src: 'cal2/dragble_eggs.png'
        }, {
          id: 'cal2Dragble5',
          src: 'cal2/dragble_bike.png'
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
          src: 'sounds/TU2_U5_A1_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U5_A1_calendar1.mp3',
          id: 'cal1'
        }, {
          src: 'sounds/TU2_U5_A1_calendar2.mp3',
          id: 'cal2'
        }
      ];
      this.game = [
        {
          finales: [
            {
              x: 365,
              y: 396
            }, {
              x: 588,
              y: 400
            }, {
              x: 776,
              y: 424
            }, {
              x: 390,
              y: 520
            }, {
              x: 612,
              y: 514
            }, {
              x: 794,
              y: 530
            }, {
              x: 423,
              y: 646
            }, {
              x: 650,
              y: 642
            }, {
              x: 830,
              y: 634
            }, {
              x: 451,
              y: 779
            }, {
              x: 680,
              y: 744
            }, {
              x: 890,
              y: 750
            }
          ],
          drags: [
            {
              x: 140,
              y: 1016
            }, {
              x: 314,
              y: 1054
            }, {
              x: 456,
              y: 1010
            }, {
              x: 604,
              y: 1026
            }, {
              x: 778,
              y: 1006
            }, {
              x: 930,
              y: 1028
            }, {
              x: 1078,
              y: 1024
            }, {
              x: 1270,
              y: 1042
            }
          ],
          drops: [
            {
              id: 'cal1Dragble2',
              tgt: 'cal1Final1'
            }, {
              id: 'cal1Dragble8',
              tgt: 'cal1Final3'
            }, {
              id: 'cal1Dragble4',
              tgt: 'cal1Final4'
            }, {
              id: 'cal1Dragble5',
              tgt: 'cal1Final5'
            }, {
              id: 'cal1Dragble7',
              tgt: 'cal1Final7'
            }, {
              id: 'cal1Dragble3',
              tgt: 'cal1Final8'
            }, {
              id: 'cal1Dragble6',
              tgt: 'cal1Final10'
            }, {
              id: 'cal1Dragble1',
              tgt: 'cal1Final12'
            }
          ]
        }, {
          finales: [
            {
              x: 362,
              y: 386
            }, {
              x: 584,
              y: 404
            }, {
              x: 776,
              y: 424
            }, {
              x: 386,
              y: 510
            }, {
              x: 616,
              y: 518
            }, {
              x: 794,
              y: 526
            }, {
              x: 418,
              y: 640
            }, {
              x: 632,
              y: 636
            }, {
              x: 848,
              y: 634
            }, {
              x: 432,
              y: 770
            }, {
              x: 684,
              y: 766
            }, {
              x: 916,
              y: 731
            }
          ],
          drags: [
            {
              x: 140,
              y: 1016
            }, {
              x: 314,
              y: 1054
            }, {
              x: 456,
              y: 1010
            }, {
              x: 564,
              y: 1026
            }, {
              x: 698,
              y: 1006
            }, {
              x: 890,
              y: 1028
            }, {
              x: 1078,
              y: 1024
            }, {
              x: 1230,
              y: 1042
            }
          ],
          drops: [
            {
              id: 'cal2Dragble3',
              tgt: 'cal2Final1'
            }, {
              id: 'cal2Dragble7',
              tgt: 'cal2Final2'
            }, {
              id: 'cal2Dragble6',
              tgt: 'cal2Final3'
            }, {
              id: 'cal2Dragble5',
              tgt: 'cal2Final4'
            }, {
              id: 'cal2Dragble8',
              tgt: 'cal2Final5'
            }, {
              id: 'cal2Dragble1',
              tgt: 'cal2Final7'
            }, {
              id: 'cal2Dragble2',
              tgt: 'cal2Final9'
            }, {
              id: 'cal2Dragble4',
              tgt: 'cal2Final11'
            }
          ]
        }
      ];
      U5A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A1.prototype.setStage = function() {
      U5A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and drag the pictures to the correct month on the calendar.', 80, 200);
      this.insertBitmap('btnRepeat', 'btnRepeat', 1196, 490);
      this.insertBitmap('btnFinished', 'btnFinished', 1196, 584);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 16, 0));
      return this.setCalendar(1).introEvaluation();
    };

    U5A1.prototype.setCalendar = function(calendar) {
      var c, cal, hit, i, v, _i, _j;
      this.calendar = calendar;
      cal = new createjs.Container();
      cal.name = 'calendar';
      cal.x = 120;
      cal.y = 0;
      this.insertBitmap('propCalendar', 'propCalendar', 120, 256);
      for (i = _i = 1; _i <= 12; i = ++_i) {
        c = new createjs.Container();
        c.name = "cal" + calendar + "Final" + i;
        c.x = this.game[calendar - 1].finales[i - 1].x;
        c.y = this.game[calendar - 1].finales[i - 1].y;
        if (calendar === 1) {
          if (i === 2 || i === 6 || i === 9 || i === 11) {
            v = this.createBitmap("", "cal" + calendar + "Final" + i, 0, 0);
            c.addChild(v);
          } else {
            hit = new createjs.Shape();
            hit.graphics.beginFill('rgba(255,255,255,0.1)').drawRect(-50, -50, 180, 110);
            c.addChild(hit);
          }
        } else if (calendar === 2) {
          if (i === 6 || i === 8 || i === 10 || i === 12) {
            v = this.createBitmap("", "cal" + calendar + "Final" + i, 0, 0);
            c.addChild(v);
          } else {
            hit = new createjs.Shape();
            hit.graphics.beginFill('rgba(255,255,255,0.1)').drawRect(-50, -50, 180, 110);
            c.addChild(hit);
          }
        }
        cal.addChild(c);
        this.addToLibrary(c);
      }
      for (i = _j = 1; _j <= 8; i = ++_j) {
        v = new Draggable("cal" + calendar + "Dragble" + i, this.preload.getResult("cal" + calendar + "Dragble" + i), "cal" + calendar + "Final" + i, this.game[calendar - 1].drags[i - 1].x, this.game[calendar - 1].drags[i - 1].y);
        v.onInitEvaluation();
        cal.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(cal);
      TweenLite.to(cal, 1, {
        alpha: 1,
        y: 0
      });
      return this;
    };

    U5A1.prototype.introEvaluation = function() {
      U5A1.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library.btnRepeat, 1, {
        alpha: 0,
        y: this.library.btnRepeat.y + 40,
        delay: 0.5
      });
      return TweenLite.from(this.library.btnFinished, 1, {
        alpha: 0,
        y: this.library.btnFinished.y + 40,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U5A1.prototype.initEvaluation = function(e) {
      var i, _i;
      U5A1.__super__.initEvaluation.apply(this, arguments);
      for (i = _i = 1; _i <= 8; i = ++_i) {
        this.library["cal" + this.calendar + "Dragble" + i].addEventListener('drop', this.evaluateDrop);
      }
      this.library.btnRepeat.addEventListener('click', this.repeatSound);
      this.library.btnFinished.addEventListener('click', this.evaluateAnswer);
      return createjs.Sound.play("cal" + this.calendar);
    };

    U5A1.prototype.evaluateDrop = function(e) {
      var drop, dropped, pt, relation, v, _i, _len, _ref;
      this.answer = e.target;
      dropped = false;
      _ref = this.game[this.calendar - 1].drops;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        drop = _ref[_i];
        pt = this.library[drop.tgt].globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (this.library[drop.tgt].hitTest(pt.x, pt.y)) {
          dropped = true;
          this.answer.visible = false;
          relation = this.game[this.calendar - 1].drops.where({
            id: this.answer.name
          });
          v = this.createBitmap(relation[0].id, relation[0].tgt, 45, 25);
          v.hitter = this.answer;
          v.addEventListener('mousedown', function(e) {
            var cv;
            cv = e.currentTarget;
            return cv.addEventListener('pressmove', function(ev) {
              var parent;
              if (cv.hitter) {
                cv.removeAllEventListeners();
                parent = cv.parent;
                while (parent.children.length > 1) {
                  parent.removeChildAt(parent.children.length - 1);
                }
                cv.hitter.visible = true;
                return cv.hitter.returnToPlace();
              }
            });
          });
          this.setReg(v, v.width / 2, v.height / 2);
          this.library[drop.tgt].addChild(v);
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace();
      }
    };

    U5A1.prototype.evaluateAnswer = function(e) {
      var answers, i, _i, _ref;
      this.library.btnRepeat.removeEventListener('click', this.repeatSound);
      this.library.btnFinished.removeEventListener('click', this.evaluateAnswer);
      createjs.Sound.stop();
      answers = this.game[this.calendar - 1].drops;
      for (i = _i = 1, _ref = answers.length; _i <= _ref; i = _i += 1) {
        if (this.library[answers[i - 1].tgt].children.length > 1) {
          if (this.library[answers[i - 1].tgt].children[1].name === answers[i - 1].id) {
            this.blink(this.library[answers[i - 1].tgt]);
            this.library.score.plusOne();
          }
        }
      }
      return setTimeout(this.finishEvaluation, 4 * 1000);
    };

    U5A1.prototype.finishEvaluation = function() {
      TweenLite.to(this.library.calendar, 1, {
        alpha: 0,
        y: this.library.calendar.y - 40
      });
      return TweenLite.to(this.library.propCalendar, 1, {
        alpha: 0,
        y: this.library.propCalendar.y - 40,
        onComplete: this.nextEvaluation
      });
    };

    U5A1.prototype.nextEvaluation = function() {
      var i, _i;
      this.index++;
      if (this.index < this.game.length) {
        this.setCalendar(this.index + 1);
        for (i = _i = 1; _i <= 8; i = ++_i) {
          this.library["cal" + this.calendar + "Dragble" + i].addEventListener('drop', this.evaluateDrop);
        }
        this.library.btnRepeat.addEventListener('click', this.repeatSound);
        this.library.btnFinished.addEventListener('click', this.evaluateAnswer);
        createjs.Sound.stop();
        return createjs.Sound.play("cal" + this.calendar);
      } else {
        return this.finish();
      }
    };

    U5A1.prototype.repeatSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play("cal" + this.calendar);
    };

    U5A1.prototype.finish = function() {
      createjs.Sound.stop();
      TweenLite.to(this.library.btnRepeat, 1, {
        alpha: 0,
        y: this.library.btnRepeat.y + 40
      });
      TweenLite.to(this.library.btnFinished, 1, {
        alpha: 0,
        y: this.library.btnFinished.y + 40
      });
      return U5A1.__super__.finish.apply(this, arguments);
    };

    window.U5A1 = U5A1;

    return U5A1;

  })(Oda);

}).call(this);
