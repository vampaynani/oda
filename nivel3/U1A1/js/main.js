(function() {
  var U1A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A1 = (function(_super) {
    __extends(U1A1, _super);

    function U1A1() {
      this.repeat = __bind(this.repeat, this);
      this.showPhrase = __bind(this.showPhrase, this);
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
          id: 'teacher',
          src: 'prop_bg.png'
        }, {
          id: 'repeat',
          src: 'repeat-btn.png'
        }, {
          id: 'animals1',
          src: 'animals.png'
        }, {
          id: 'animals2',
          src: 'animals.png'
        }, {
          id: 'art1',
          src: 'art.png'
        }, {
          id: 'art2',
          src: 'art.png'
        }, {
          id: 'cellphone1',
          src: 'cellphone.png'
        }, {
          id: 'cellphone2',
          src: 'cellphone.png'
        }, {
          id: 'drink1',
          src: 'drink.png'
        }, {
          id: 'drink2',
          src: 'drink.png'
        }, {
          id: 'fish1',
          src: 'fish.png'
        }, {
          id: 'fish2',
          src: 'fish.png'
        }, {
          id: 'line1',
          src: 'line.png'
        }, {
          id: 'line2',
          src: 'line.png'
        }, {
          id: 'pictures1',
          src: 'pictures.png'
        }, {
          id: 'pictures2',
          src: 'pictures.png'
        }, {
          id: 'run1',
          src: 'run.png'
        }, {
          id: 'run2',
          src: 'run.png'
        }, {
          id: 'trash1',
          src: 'trash.png'
        }, {
          id: 'trash2',
          src: 'trash.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/TU3_U1_A1_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU3_U1_A1_dontTouch.mp3',
          id: 'sart'
        }, {
          src: 'sounds/TU3_U1_A1_dontTakePictures.mp3',
          id: 'spictures'
        }, {
          src: 'sounds/TU3_U1_A1_dontFeed.mp3',
          id: 'sanimals'
        }, {
          src: 'sounds/TU3_U1_A1_dontCut.mp3',
          id: 'sline'
        }, {
          src: 'sounds/TU3_U1_A1_dontEat.mp3',
          id: 'sdrink'
        }, {
          src: 'sounds/TU3_U1_A1_dontScare.mp3',
          id: 'sfish'
        }, {
          src: 'sounds/TU3_U1_A1_dontUseCell.mp3',
          id: 'scellphone'
        }, {
          src: 'sounds/TU3_U1_A1_dontThrow.mp3',
          id: 'strash'
        }, {
          src: 'sounds/TU3_U1_A1_dontRun.mp3',
          id: 'srun'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }
      ];
      this.game = {
        answers: [
          {
            id: 'animals',
            a: false
          }, {
            id: 'art',
            a: false
          }, {
            id: 'cellphone',
            a: false
          }, {
            id: 'drink',
            a: false
          }, {
            id: 'fish',
            a: false
          }, {
            id: 'line',
            a: false
          }, {
            id: 'pictures',
            a: false
          }, {
            id: 'run',
            a: false
          }, {
            id: 'trash',
            a: false
          }
        ]
      };
      U1A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A1.prototype.setStage = function() {
      var answer, _i, _len, _ref;
      U1A1.__super__.setStage.apply(this, arguments);
      this.answers = this.game.answers.slice(0);
      _ref = this.answers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        answer = _ref[_i];
        answer.a = false;
      }
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and click on the correct picture.', 40, 100);
      this.insertBitmap('teacher', 'teacher', stageSize.w / 2, 124, 'tc');
      this.insertBitmap('repeat', 'repeat', stageSize.w / 2, 310, 'tc');
      this.insertSprite('choose1', ['animals1', 'art1', 'cellphone1', 'drink1', 'fish1', 'line1', 'pictures1', 'run1', 'trash1'], {
        animals: 0,
        art: 1,
        cellphone: 2,
        drink: 3,
        fish: 4,
        line: 5,
        pictures: 6,
        run: 7,
        trash: 8
      }, 285, 452, 'mc');
      this.insertSprite('choose2', ['animals2', 'art2', 'cellphone2', 'drink2', 'fish2', 'line2', 'pictures2', 'run2', 'trash2'], {
        animals: 0,
        art: 1,
        cellphone: 2,
        drink: 3,
        fish: 4,
        line: 5,
        pictures: 6,
        run: 7,
        trash: 8
      }, 520, 452, 'mc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 9, 0));
      this.library.score.txtCount.color = "#bfd951";
      this.library.score.txtTotal.color = "#ff9933";
      return this.introEvaluation();
    };

    U1A1.prototype.introEvaluation = function() {
      U1A1.__super__.introEvaluation.apply(this, arguments);
      this.library['choose1'].alpha = 0;
      this.library['choose1'].scaleX = this.library['choose1'].scaleY = 0.3;
      this.library['choose2'].alpha = 0;
      this.library['choose2'].scaleX = this.library['choose2'].scaleY = 0.3;
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['teacher'], 1, {
        alpha: 0,
        y: this.library['teacher'].y + 50,
        delay: 1
      });
      return TweenLite.from(this.library['repeat'], 1, {
        alpha: 0,
        y: this.library['repeat'].y + 50,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U1A1.prototype.initEvaluation = function(e) {
      U1A1.__super__.initEvaluation.apply(this, arguments);
      this.showPhrase();
      this.library['choose1'].addEventListener('click', this.evaluateAnswer);
      this.library['choose2'].addEventListener('click', this.evaluateAnswer);
      return this.library['repeat'].addEventListener('click', this.repeat);
    };

    U1A1.prototype.evaluateAnswer = function(e) {
      var selection;
      this.answer = e.target;
      selection = this.answers.where({
        id: this.phrase.id
      });
      selection[0].a = true;
      if (this.phrase.id === this.answer.currentAnimation) {
        createjs.Sound.play('good');
        this.library['score'].plusOne();
        this.library['choose1'].removeEventListener('click', this.evaluateAnswer);
        this.library['choose2'].removeEventListener('click', this.evaluateAnswer);
      } else {
        this.warning();
      }
      return setTimeout(this.finishEvaluation, 1 * 1000);
    };

    U1A1.prototype.finishEvaluation = function() {
      return TweenMax.to([this.library['choose1'], this.library['choose2']], 1, {
        alpha: 0,
        scaleX: 0.3,
        scaleY: 0.3,
        ease: Elastic.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U1A1.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        return this.showPhrase();
      } else {
        return this.finish();
      }
    };

    U1A1.prototype.showPhrase = function() {
      var fake, other, others, rand,
        _this = this;
      rand = Math.random() > 0.5 ? 1 : 2;
      other = rand === 1 ? 2 : 1;
      this.phrase = this.getPhrase();
      others = this.answers.filter(function(answer) {
        return answer.id !== _this.phrase.id;
      });
      fake = Math.floor(Math.random() * others.length);
      console.log(this.phrase.id, others[fake].id);
      this.library["choose" + rand].gotoAndStop(this.phrase.id);
      this.library["choose" + other].gotoAndStop(others[fake].id);
      console.log("s" + this.phrase.id);
      createjs.Sound.play("s" + this.phrase.id);
      this.library['choose1'].addEventListener('click', this.evaluateAnswer);
      this.library['choose2'].addEventListener('click', this.evaluateAnswer);
      return TweenMax.to([this.library['choose1'], this.library['choose2']], 1, {
        alpha: 1,
        scaleX: 1,
        scaleY: 1,
        ease: Elastic.easeOut
      });
    };

    U1A1.prototype.getPhrase = function() {
      var id, possible;
      possible = this.answers.filter(function(answer) {
        return answer.a === false;
      });
      id = Math.floor(Math.random() * possible.length);
      return possible[id];
    };

    U1A1.prototype.repeat = function(e) {
      createjs.Sound.stop();
      return createjs.Sound.play("s" + this.phrase.id);
    };

    U1A1.prototype.shuffle = function(a) {
      var i, j, _i, _ref, _ref1, _results;
      _results = [];
      for (i = _i = _ref = a.length; _ref <= 1 ? _i <= 1 : _i >= 1; i = _ref <= 1 ? ++_i : --_i) {
        j = Math.floor(Math.random() * (i + 1));
        _results.push((_ref1 = [a[j], a[i]], a[i] = _ref1[0], a[j] = _ref1[1], _ref1));
      }
      return _results;
    };

    U1A1.prototype.blink = function(obj, state) {
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

    U1A1.prototype.finish = function() {
      TweenLite.to(this.library['teacher'], 1, {
        alpha: 0,
        y: this.library['teacher'].y + 50,
        delay: 0.1
      });
      TweenLite.to(this.library['repeat'], 1, {
        alpha: 0,
        y: this.library['repeat'].y + 50,
        delay: 0.1
      });
      return U1A1.__super__.finish.apply(this, arguments);
    };

    window.U1A1 = U1A1;

    return U1A1;

  })(Oda);

}).call(this);
