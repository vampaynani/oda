// Generated by CoffeeScript 1.6.3
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
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A6_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.positions = {
        finales: [
          {
            x: '201',
            y: '204'
          }, {
            x: '314',
            y: '211'
          }, {
            x: '408',
            y: '218'
          }, {
            x: '212',
            y: '265'
          }, {
            x: '331',
            y: '268'
          }, {
            x: '429',
            y: '273'
          }, {
            x: '228',
            y: '331'
          }, {
            x: '347',
            y: '327'
          }, {
            x: '445',
            y: '327'
          }, {
            x: '246',
            y: '399'
          }, {
            x: '364',
            y: '392'
          }, {
            x: '466',
            y: '385'
          }
        ],
        drags: [
          {
            x: '145',
            y: '528'
          }, {
            x: '232',
            y: '547'
          }, {
            x: '303',
            y: '525'
          }, {
            x: '377',
            y: '533'
          }, {
            x: '464',
            y: '523'
          }, {
            x: '540',
            y: '534'
          }, {
            x: '614',
            y: '532'
          }, {
            x: '710',
            y: '541'
          }
        ]
      };
      U5A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A1.prototype.setStage = function() {
      U5A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('btnRepeat', 'btnRepeat', 598, 245);
      this.insertBitmap('btnFinished', 'btnFinished', 598, 292);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setCalendar().introEvaluation();
    };

    U5A1.prototype.setCalendar = function() {
      var cal, calendario, i, v, _i, _j;
      cal = new createjs.Container();
      cal.x = 60;
      cal.y = 0;
      this.insertBitmap('propCalendar', 'propCalendar', 60, 128);
      calendario = 2;
      for (i = _i = 1; _i <= 12; i = ++_i) {
        v = this.createBitmap('cal' + calendario + 'Final' + i, 'cal' + calendario + 'Final' + i, this.positions.finales[i - 1].x, this.positions.finales[i - 1].y, 'mc');
        cal.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _j = 1; _j <= 8; i = ++_j) {
        v = this.createBitmap('cal' + calendario + 'Dragble' + i, 'cal' + calendario + 'Dragble' + i, this.positions.drags[i - 1].x, this.positions.drags[i - 1].y, 'mc');
        cal.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(cal);
      return this;
    };

    U5A1.prototype.introEvaluation = function() {
      return U5A1.__super__.introEvaluation.apply(this, arguments);
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

    U5A1.prototype.initEvaluation = function(e) {
      U5A1.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U5A1.prototype.evaluateAnswer = function(e) {
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

    U5A1.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U5A1.prototype.nextEvaluation = function() {
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

    U5A1.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U5A1.prototype.finish = function() {
      var i, _i, _results;
      U5A1.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U5A1 = U5A1;

    return U5A1;

  })(Oda);

}).call(this);
