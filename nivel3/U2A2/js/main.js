// Generated by CoffeeScript 1.6.3
(function() {
  var U2A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A2 = (function(_super) {
    __extends(U2A2, _super);

    function U2A2() {
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
          src: 'mag-clock-1.png'
        }, {
          id: 'mc2',
          src: 'mag-clock-2.png'
        }, {
          id: 'mc3',
          src: 'mag-clock-3.png'
        }, {
          id: 'mc4',
          src: 'mag-clock-4.png'
        }, {
          id: 'mc5',
          src: 'mag-clock-5.png'
        }, {
          id: 'mc6',
          src: 'mag-clock-6.png'
        }, {
          id: 'm1',
          src: 'mag-eggs.png'
        }, {
          id: 'm2',
          src: 'mag-chickens.png'
        }, {
          id: 'm3',
          src: 'mag-sheep.png'
        }, {
          id: 'm4',
          src: 'mag-butter.png'
        }, {
          id: 'm5',
          src: 'mag-berries.png'
        }, {
          id: 'm6',
          src: 'mag-bake.png'
        }, {
          id: 'jc1',
          src: 'bob-clock-1.png'
        }, {
          id: 'jc2',
          src: 'bob-clock-2.png'
        }, {
          id: 'jc3',
          src: 'bob-clock-3.png'
        }, {
          id: 'jc4',
          src: 'bob-clock-4.png'
        }, {
          id: 'jc5',
          src: 'bob-clock-5.png'
        }, {
          id: 'jc6',
          src: 'bob-clock-6.png'
        }, {
          id: 'j1',
          src: 'bob-cow.png'
        }, {
          id: 'j2',
          src: 'bob-vegetables.png'
        }, {
          id: 'j3',
          src: 'bob-go.png'
        }, {
          id: 'j4',
          src: 'bob-compost.png'
        }, {
          id: 'j5',
          src: 'bob-ground.png'
        }, {
          id: 'j6',
          src: 'bob-clean.png'
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
      this.game = [
        {
          name: 'mag',
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
          name: 'bob',
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
      U2A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U2A2.prototype.setStage = function() {
      U2A2.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and drag the clocks to the correct picture.', 40, 100);
      this.insertBitmap('repeat', 'repeat', 545, 539);
      this.insertBitmap('finish', 'finish', 663, 539);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 12, 0));
      this.setmag();
      return this.introEvaluation();
    };

    U2A2.prototype.setmag = function() {
      var i, m1, m2, m3, m4, m5, m6, mag, mc, sh, _i, _j;
      mag = new createjs.Container();
      mag.x = 117;
      mag.y = 124;
      this.current = mag.name = 'mag';
      m1 = this.createBitmap('magEggs', 'm1', 15, 13);
      m2 = this.createBitmap('magChickens', 'm2', 223, 13);
      m3 = this.createBitmap('magSheep', 'm3', 15, 161);
      m4 = this.createBitmap('magButter', 'm4', 223, 161);
      m5 = this.createBitmap('magBerries', 'm5', 15, 313);
      m6 = this.createBitmap('magBake', 'm6', 223, 313);
      mag.addChild(m1, m2, m3, m4, m5, m6);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        sh = this.createBitmap('clockbox', 'clockbox', this.drops[i - 1].x, this.drops[i - 1].y);
        sh.name = 'sh' + i;
        this.addToLibrary(sh);
        mag.addChild(sh);
      }
      for (i = _j = 1; _j <= 6; i = _j += 1) {
        mc = new Draggable('mc' + i, this.preload.getResult('mc' + i), i, this.clocks[i - 1].x, this.clocks[i - 1].y);
        mc.addEventListener('drop', this.evaluateDrop);
        this.observer.subscribe('init_mag_evaluation', mc.onInitEvaluation);
        this.addToLibrary(mc);
        mag.addChild(mc);
      }
      return this.addToMain(mag);
    };

    U2A2.prototype.setbob = function() {
      var bob, i, j1, j2, j3, j4, j5, j6, jc, sh, _i, _j;
      bob = new createjs.Container();
      bob.x = 117;
      bob.y = 124;
      this.current = bob.name = 'bob';
      j1 = this.createBitmap('bobCow', 'j1', 15, 13);
      j2 = this.createBitmap('bobVegetables', 'j2', 223, 13);
      j3 = this.createBitmap('bobGo', 'j3', 15, 161);
      j4 = this.createBitmap('bobCompost', 'j4', 223, 161);
      j5 = this.createBitmap('bobGround', 'j5', 15, 313);
      j6 = this.createBitmap('bobClean', 'j6', 223, 313);
      bob.addChild(j1, j2, j3, j4, j5, j6);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        sh = this.createBitmap('clockbox', 'clockbox', this.drops[i - 1].x, this.drops[i - 1].y);
        sh.name = 'sh' + i;
        this.addToLibrary(sh);
        bob.addChild(sh);
      }
      for (i = _j = 1; _j <= 6; i = _j += 1) {
        jc = new Draggable('jc' + i, this.preload.getResult('jc' + i), i, this.clocks[i - 1].x, this.clocks[i - 1].y);
        jc.addEventListener('drop', this.evaluateDrop);
        this.observer.subscribe('init_bob_evaluation', jc.onInitEvaluation);
        this.addToLibrary(jc);
        bob.addChild(jc);
      }
      return this.addToMain(bob);
    };

    U2A2.prototype.introEvaluation = function() {
      U2A2.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenMax.from(this.library['mag'], 1, {
        alpha: 0,
        x: this.library['mag'].x + 50,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U2A2.prototype.initEvaluation = function(e) {
      U2A2.__super__.initEvaluation.apply(this, arguments);
      this.observer.notify('init_' + this.game[this.index].name + '_evaluation');
      this.library['repeat'].addEventListener('click', this.playSound);
      this.library['finish'].addEventListener('click', this.evaluateAnswer);
      this.sound = this.game[this.index].name;
      return this.playSound();
    };

    U2A2.prototype.evaluateDrop = function(e) {
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

    U2A2.prototype.evaluateAnswer = function(e) {
      var answer, i, res, _i;
      this.library['repeat'].removeEventListener('click', this.playSound);
      this.library['finish'].removeEventListener('click', this.evaluateAnswer);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        res = this.createSprite('resultado', ['imgwrong', 'imgcorrect'], null, this.drops[i - 1].x + 75, this.drops[i - 1].y);
        answer = this.game[this.index].values[i - 1];
        if (this.library[answer.q].x === this.library[answer.a].x && this.library[answer.q].y === this.library[answer.a].y) {
          res.currentFrame = 1;
          this.library['score'].plusOne();
        } else {
          res.currentFrame = 0;
        }
        this.library[this.current].addChild(res);
      }
      return setTimeout(this.finishEvaluation, 1 * 1000);
    };

    U2A2.prototype.finishEvaluation = function() {
      createjs.Sound.stop(this.sound);
      return TweenLite.to(this.library[this.game[this.index].name], 0.5, {
        alpha: 0,
        x: stageSize.w,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U2A2.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.game.length) {
        this.setbob();
        return TweenMax.from(this.library['bob'], 1, {
          alpha: 0,
          x: this.library['bob'].x + 50,
          delay: 1,
          onComplete: this.initEvaluation
        });
      } else {
        return this.finish();
      }
    };

    U2A2.prototype.playSound = function() {
      createjs.Sound.stop(this.sound);
      return createjs.Sound.play(this.sound);
    };

    U2A2.prototype.blink = function(obj, state) {
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

    U2A2.prototype.finish = function() {
      TweenLite.to(this.library['repeat'], 1, {
        alpha: 0,
        x: this.x + 20
      });
      TweenLite.to(this.library['finish'], 1, {
        alpha: 0,
        x: this.x + 20
      });
      TweenLite.to(this.library['bob'], 1, {
        alpha: 0,
        x: this.library['bob'].x + 50
      });
      return U2A2.__super__.finish.apply(this, arguments);
    };

    window.U2A2 = U2A2;

    return U2A2;

  })(Oda);

}).call(this);
