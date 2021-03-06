(function() {
  var U2A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A2 = (function(_super) {
    __extends(U2A2, _super);

    function U2A2() {
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
          id: 'inst',
          src: 'inst.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'lady',
          src: 'lady.png'
        }, {
          id: 'repeat',
          src: 'repeat_btn.png'
        }, {
          id: 'bed',
          src: 'bed.png'
        }, {
          id: 'broom',
          src: 'broom.png'
        }, {
          id: 'kitchen',
          src: 'clean-kitchen.png'
        }, {
          id: 'toys',
          src: 'clean-toys.png'
        }, {
          id: 'cat',
          src: 'feed-cat.png'
        }, {
          id: 'dog',
          src: 'feed-dog.png'
        }, {
          id: 'fish',
          src: 'feed-fish.png'
        }, {
          id: 'garbage',
          src: 'out-garbage.png'
        }, {
          id: 'doll',
          src: 'play-doll.png'
        }, {
          id: 'soup',
          src: 'soup.png'
        }, {
          id: 'swipe',
          src: 'swipe.png'
        }, {
          id: 'walkdog',
          src: 'walk-dog.png'
        }, {
          id: 'dishes',
          src: 'wash-dishes.png'
        }, {
          id: 'plants',
          src: 'water-plants.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/TU2_U2_A2_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'skitchen'
        }, {
          src: 'sounds/TU2_U2_A2_feedTheCat.mp3',
          id: 'scat'
        }, {
          src: 'sounds/TU2_U2_A2_feedTheDog.mp3',
          id: 'sdog'
        }, {
          src: 'sounds/TU2_U2_A2_feedTheFish.mp3',
          id: 'sfish'
        }, {
          src: 'sounds/TU2_U2_A2_makeYourBed.mp3',
          id: 'sbed'
        }, {
          src: 'sounds/TU2_U2_A2_pickUpYourRoom.mp3',
          id: 'sdoll'
        }, {
          src: 'sounds/TU2_U2_A2_putAwayYourToys.mp3',
          id: 'stoys'
        }, {
          src: 'sounds/TU2_U2_A2_setTheTable.mp3',
          id: 'ssoup'
        }, {
          src: 'sounds/TU2_U2_A2_sweepTheFloor.mp3',
          id: 'sswipe'
        }, {
          src: 'sounds/TU2_U2_A2_sweepTheKitchen.mp3',
          id: 'skitchen1'
        }, {
          src: 'sounds/TU2_U2_A2_takeOutTheBroom.mp3',
          id: 'sbroom'
        }, {
          src: 'sounds/TU2_U2_A2_takeOutTheTrash.mp3',
          id: 'sgarbage'
        }, {
          src: 'sounds/TU2_U2_A2_walkTheDog.mp3',
          id: 'swalkdog'
        }, {
          src: 'sounds/TU2_U2_A2_washTheDishes.mp3',
          id: 'sdishes'
        }, {
          src: 'sounds/TU2_U2_A2_waterThePlants.mp3',
          id: 'splants'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        answers: [
          {
            id: 'kitchen',
            a: false
          }, {
            id: 'cat',
            a: false
          }, {
            id: 'dog',
            a: false
          }, {
            id: 'fish',
            a: false
          }, {
            id: 'bed',
            a: false
          }, {
            id: 'doll',
            a: false
          }, {
            id: 'toys',
            a: false
          }, {
            id: 'soup',
            a: false
          }, {
            id: 'swipe',
            a: false
          }, {
            id: 'broom',
            a: false
          }, {
            id: 'garbage',
            a: false
          }, {
            id: 'walkdog',
            a: false
          }, {
            id: 'dishes',
            a: false
          }, {
            id: 'plants',
            a: false
          }
        ]
      };
      U2A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U2A2.prototype.setStage = function() {
      var answer, _i, _len, _ref;
      U2A2.__super__.setStage.apply(this, arguments);
      this.answers = this.game.answers.slice(0);
      _ref = this.answers;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        answer = _ref[_i];
        answer.a = false;
      }
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and click on the correct picture.', 80, 200);
      this.insertBitmap('teacher', 'lady', 500, 268);
      this.insertBitmap('repeat', 'repeat', 882, 420);
      this.insertSprite('choose1', ['kitchen', 'cat', 'dog', 'fish', 'bed', 'doll', 'toys', 'soup', 'swipe', 'broom', 'garbage', 'walkdog', 'dishes', 'plants'], {
        'kitchen': 0,
        'cat': 1,
        'dog': 2,
        'fish': 3,
        'bed': 4,
        'doll': 5,
        'toys': 6,
        'soup': 7,
        'swipe': 8,
        'broom': 9,
        'garbage': 10,
        'walkdog': 11,
        'dishes': 12,
        'plants': 13
      }, 540, 904, 'mc');
      this.insertSprite('choose2', ['kitchen', 'cat', 'dog', 'fish', 'bed', 'doll', 'toys', 'soup', 'swipe', 'broom', 'garbage', 'walkdog', 'dishes', 'plants'], {
        'kitchen': 0,
        'cat': 1,
        'dog': 2,
        'fish': 3,
        'bed': 4,
        'doll': 5,
        'toys': 6,
        'soup': 7,
        'swipe': 8,
        'broom': 9,
        'garbage': 10,
        'walkdog': 11,
        'dishes': 12,
        'plants': 13
      }, 1182, 904, 'mc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 14, 0));
      return this.introEvaluation();
    };

    U2A2.prototype.introEvaluation = function() {
      U2A2.__super__.introEvaluation.apply(this, arguments);
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
        y: this.library['teacher'].y + 100,
        delay: 1
      });
      return TweenLite.from(this.library['repeat'], 1, {
        alpha: 0,
        y: this.library['repeat'].y + 100,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U2A2.prototype.initEvaluation = function(e) {
      U2A2.__super__.initEvaluation.apply(this, arguments);
      this.showPhrase();
      this.library['choose1'].addEventListener('click', this.evaluateAnswer);
      this.library['choose2'].addEventListener('click', this.evaluateAnswer);
      return this.library['repeat'].addEventListener('click', this.repeat);
    };

    U2A2.prototype.evaluateAnswer = function(e) {
      var selection;
      this.answer = e.target;
      selection = this.answers.where({
        id: this.phrase.id
      });
      selection[0].a = true;
      if (this.phrase.id === this.answer.currentAnimation) {
        createjs.Sound.play('good');
        this.library['score'].plusOne();
      } else {
        this.warning();
      }
      return setTimeout(this.finishEvaluation, 1 * 1000);
    };

    U2A2.prototype.finishEvaluation = function() {
      return TweenMax.to([this.library['choose1'], this.library['choose2']], 1, {
        alpha: 0,
        scaleX: 0.3,
        scaleY: 0.3,
        ease: Elastic.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U2A2.prototype.nextEvaluation = function() {
      this.index++;
      console.log(this.index);
      if (this.index < this.answers.length) {
        return this.showPhrase();
      } else {
        return this.finish();
      }
    };

    U2A2.prototype.showPhrase = function() {
      var fake, other, others, rand,
        _this = this;
      rand = Math.random() > 0.5 ? 1 : 2;
      other = rand === 1 ? 2 : 1;
      this.phrase = this.getPhrase();
      others = this.answers.filter(function(answer) {
        return answer.id !== _this.phrase.id;
      });
      fake = Math.floor(Math.random() * others.length);
      this.library['choose' + rand].gotoAndStop(this.phrase.id);
      this.library['choose' + other].gotoAndStop(others[fake].id);
      createjs.Sound.play("s" + this.phrase.id);
      return TweenMax.to([this.library['choose1'], this.library['choose2']], 1, {
        alpha: 1,
        scaleX: 1,
        scaleY: 1,
        ease: Elastic.easeOut
      });
    };

    U2A2.prototype.getPhrase = function() {
      var id, possible;
      possible = this.answers.filter(function(answer) {
        return answer.a === false;
      });
      id = Math.floor(Math.random() * possible.length);
      return possible[id];
    };

    U2A2.prototype.repeat = function(e) {
      return createjs.Sound.play("s" + this.phrase.id);
    };

    U2A2.prototype.shuffle = function(a) {
      var i, j, _i, _ref, _ref1, _results;
      _results = [];
      for (i = _i = _ref = a.length; _ref <= 1 ? _i <= 1 : _i >= 1; i = _ref <= 1 ? ++_i : --_i) {
        j = Math.floor(Math.random() * (i + 1));
        _results.push((_ref1 = [a[j], a[i]], a[i] = _ref1[0], a[j] = _ref1[1], _ref1));
      }
      return _results;
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
      TweenLite.to(this.library['teacher'], 1, {
        alpha: 0,
        y: this.library['teacher'].y + 50
      });
      TweenLite.to(this.library['repeat'], 1, {
        alpha: 0,
        y: this.library['repeat'].y + 50
      });
      return U2A2.__super__.finish.apply(this, arguments);
    };

    window.U2A2 = U2A2;

    return U2A2;

  })(Oda);

}).call(this);
