// Generated by CoffeeScript 1.6.3
(function() {
  var U2A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A4 = (function(_super) {
    __extends(U2A4, _super);

    function U2A4() {
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
          id: 'finish',
          src: 'finish-btn.png'
        }, {
          id: 'repeat',
          src: 'repeat-btn.png'
        }, {
          id: 'clockbox',
          src: 'clock-container.png'
        }, {
          id: 'mc1',
          src: 'meg-clock-1.png'
        }, {
          id: 'mc2',
          src: 'meg-clock-2.png'
        }, {
          id: 'mc3',
          src: 'meg-clock-3.png'
        }, {
          id: 'mc4',
          src: 'meg-clock-4.png'
        }, {
          id: 'mc5',
          src: 'meg-clock-5.png'
        }, {
          id: 'mc6',
          src: 'meg-clock-6.png'
        }, {
          id: 'm1',
          src: 'meg-wakes.png'
        }, {
          id: 'm2',
          src: 'meg-breakfast.png'
        }, {
          id: 'm3',
          src: 'meg-leaves.png'
        }, {
          id: 'm4',
          src: 'meg-dishes.png'
        }, {
          id: 'm5',
          src: 'meg-dinner.png'
        }, {
          id: 'm6',
          src: 'meg-sleep.png'
        }, {
          id: 'jc1',
          src: 'jim-clock-1.png'
        }, {
          id: 'jc2',
          src: 'jim-clock-2.png'
        }, {
          id: 'jc3',
          src: 'jim-clock-3.png'
        }, {
          id: 'jc4',
          src: 'jim-clock-4.png'
        }, {
          id: 'jc5',
          src: 'jim-clock-5.png'
        }, {
          id: 'jc6',
          src: 'jim-clock-6.png'
        }, {
          id: 'j1',
          src: 'jim-shower.png'
        }, {
          id: 'j2',
          src: 'jim-breakfast.png'
        }, {
          id: 'j3',
          src: 'jim-leaves.png'
        }, {
          id: 'j4',
          src: 'jim-bus.png'
        }, {
          id: 'j5',
          src: 'jim-cat.png'
        }, {
          id: 'j6',
          src: 'jim-tv.png'
        }, {
          id: 'imgwrong',
          src: 'wrong.png'
        }, {
          id: 'imgcorrect',
          src: 'correct.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/TU2_U2_A4_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U2_A4_Meg.mp3',
          id: 'meg'
        }, {
          src: 'sounds/TU2_U2_A4_UncleJim.mp3',
          id: 'jim'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.answers = [
        {
          name: 'meg',
          values: [
            {
              q: 'sh1',
              a: 'mc3'
            }, {
              q: 'sh2',
              a: 'mc6'
            }, {
              q: 'sh3',
              a: 'mc4'
            }, {
              q: 'sh4',
              a: 'mc2'
            }, {
              q: 'sh5',
              a: 'mc5'
            }, {
              q: 'sh6',
              a: 'mc1'
            }
          ]
        }, {
          name: 'jim',
          values: [
            {
              q: 'sh1',
              a: 'jc4'
            }, {
              q: 'sh2',
              a: 'jc5'
            }, {
              q: 'sh3',
              a: 'jc1'
            }, {
              q: 'sh4',
              a: 'jc2'
            }, {
              q: 'sh5',
              a: 'jc6'
            }, {
              q: 'sh6',
              a: 'jc3'
            }
          ]
        }
      ];
      this.clocks = [
        {
          x: 485,
          y: 13
        }, {
          x: 527,
          y: 79
        }, {
          x: 485,
          y: 145
        }, {
          x: 527,
          y: 211
        }, {
          x: 485,
          y: 276
        }, {
          x: 527,
          y: 343
        }
      ];
      this.drops = [
        {
          x: 12,
          y: 5
        }, {
          x: 220,
          y: 5
        }, {
          x: 12,
          y: 153
        }, {
          x: 220,
          y: 153
        }, {
          x: 12,
          y: 305
        }, {
          x: 220,
          y: 305
        }
      ];
      U2A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U2A4.prototype.setStage = function() {
      U2A4.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('repeat', 'repeat', 545, 539);
      this.insertBitmap('finish', 'finish', 663, 539);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 12, 0));
      this.setMeg();
      return this.introEvaluation();
    };

    U2A4.prototype.setMeg = function() {
      var i, m1, m2, m3, m4, m5, m6, mc, meg, sh, _i, _j;
      meg = new createjs.Container();
      meg.x = 117;
      meg.y = 124;
      meg.name = 'meg';
      m1 = this.createBitmap('megWakes', 'm1', 15, 13);
      m2 = this.createBitmap('megBreakfast', 'm2', 223, 13);
      m3 = this.createBitmap('megLeaves', 'm3', 15, 161);
      m4 = this.createBitmap('megDishes', 'm4', 223, 161);
      m5 = this.createBitmap('megDinner', 'm5', 15, 313);
      m6 = this.createBitmap('megSleep', 'm6', 223, 313);
      meg.addChild(m1, m2, m3, m4, m5, m6);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        sh = new createjs.Shape();
        sh.graphics.beginFill('#FFF').setStrokeStyle(2).beginStroke('#333').drawRoundRect(0, 0, 66, 42, 10);
        sh.x = this.drops[i - 1].x;
        sh.y = this.drops[i - 1].y;
        sh.name = 'sh' + i;
        this.addToLibrary(sh);
        meg.addChild(sh);
      }
      for (i = _j = 1; _j <= 6; i = _j += 1) {
        mc = new Draggable('mc' + i, this.preload.getResult('mc' + i), i, this.clocks[i - 1].x, this.clocks[i - 1].y);
        mc.addEventListener('drop', this.evaluateDrop);
        this.observer.subscribe('init_meg_evaluation', mc.onInitEvaluation);
        this.addToLibrary(mc);
        meg.addChild(mc);
      }
      return this.addToMain(meg);
    };

    U2A4.prototype.setJim = function() {
      var i, j1, j2, j3, j4, j5, j6, jc, jim, sh, _i, _j;
      jim = new createjs.Container();
      jim.x = 117;
      jim.y = 124;
      jim.name = 'jim';
      j1 = this.createBitmap('jimShower', 'j1', 15, 13);
      j2 = this.createBitmap('jimBreakfast', 'j2', 223, 13);
      j3 = this.createBitmap('jimLeaves', 'j3', 15, 161);
      j4 = this.createBitmap('jimBus', 'j4', 223, 161);
      j5 = this.createBitmap('jimCat', 'j5', 15, 313);
      j6 = this.createBitmap('jimTv', 'j6', 223, 313);
      jim.addChild(j1, j2, j3, j4, j5, j6);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        sh = new createjs.Shape();
        sh.graphics.beginFill('#FFF').setStrokeStyle(2).beginStroke('#000').drawRoundRect(0, 0, 66, 42, 10);
        sh.x = this.drops[i - 1].x;
        sh.y = this.drops[i - 1].y;
        sh.name = 'sh' + i;
        this.addToLibrary(sh);
        jim.addChild(sh);
      }
      for (i = _j = 1; _j <= 6; i = _j += 1) {
        jc = new Draggable('jc' + i, this.preload.getResult('jc' + i), i, this.clocks[i - 1].x, this.clocks[i - 1].y);
        jc.addEventListener('drop', this.evaluateDrop);
        this.observer.subscribe('init_jim_evaluation', jc.onInitEvaluation);
        this.addToLibrary(jc);
        jim.addChild(jc);
      }
      return this.addToMain(jim);
    };

    U2A4.prototype.introEvaluation = function() {
      U2A4.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenMax.from(this.library['meg'], 1, {
        alpha: 0,
        x: this.library['meg'].x + 50,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U2A4.prototype.initEvaluation = function(e) {
      U2A4.__super__.initEvaluation.apply(this, arguments);
      this.observer.notify('init_' + this.answers[this.index].name + '_evaluation');
      this.library['repeat'].addEventListener('click', this.playSound);
      this.library['finish'].addEventListener('click', this.evaluateAnswer);
      this.sound = this.answers[this.index].name;
      return this.playSound();
    };

    U2A4.prototype.evaluateDrop = function(e) {
      var dropped, hit, i, pt;
      this.answer = e.target;
      dropped = false;
      i = 1;
      while (!(dropped === true || i > 6)) {
        hit = this.library['sh' + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (hit.hitTest(pt.x, pt.y)) {
          this.answer.x = hit.x;
          this.answer.y = hit.y;
          this.answer.blink(false);
          dropped = true;
        } else {
          i++;
          this.answer.returnToPlace();
        }
      }
      return this;
    };

    U2A4.prototype.evaluateAnswer = function(e) {
      var answer, i, res, _i;
      this.library['repeat'].removeEventListener('click', this.playSound);
      this.library['finish'].removeEventListener('click', this.evaluateAnswer);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        res = this.createSprite('resultado', ['imgwrong', 'imgcorrect'], null, this.drops[i - 1].x + 75, this.drops[i - 1].y);
        answer = this.answers[this.index].values[i - 1];
        if (this.library[answer.q].x === this.library[answer.a].x && this.library[answer.q].y === this.library[answer.a].y) {
          res.currentFrame = 1;
          this.library['score'].plusOne();
        } else {
          res.currentFrame = 0;
        }
        this.addToMain(res);
      }
      return setTimeout(this.finishEvaluation, 1 * 1000);
    };

    U2A4.prototype.finishEvaluation = function() {
      createjs.Sound.stop(this.sound);
      return TweenLite.to(this.library[this.answers[this.index].name], 0.5, {
        alpha: 0,
        x: stageSize.w,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U2A4.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        this.setJim();
        return TweenMax.from(this.library['jim'], 1, {
          alpha: 0,
          x: this.library['jim'].x + 50,
          delay: 1,
          onComplete: this.initEvaluation
        });
      } else {
        return this.finish();
      }
    };

    U2A4.prototype.playSound = function() {
      createjs.Sound.stop(this.sound);
      return createjs.Sound.play(this.sound);
    };

    U2A4.prototype.blink = function(obj, state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      obj.alpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: .5,
          repeat: -1,
          yoyo: true
        });
      }
    };

    U2A4.prototype.finish = function() {
      TweenLite.to(this.library['repeat'], 1, {
        alpha: 0,
        x: this.x + 20
      });
      TweenLite.to(this.library['finish'], 1, {
        alpha: 0,
        x: this.x + 20
      });
      TweenLite.to(this.library['jim'], 1, {
        alpha: 0,
        x: this.library['jim'].x + 50
      });
      return U2A4.__super__.finish.apply(this, arguments);
    };

    window.U2A4 = U2A4;

    return U2A4;

  })(Oda);

}).call(this);
