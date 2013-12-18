// Generated by CoffeeScript 1.6.3
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
          id: 'prof',
          src: 'prop_teacher.png'
        }, {
          id: 'repeat',
          src: 'btn_repeat.png'
        }, {
          id: 'electricity1',
          src: 'electricity_1.png'
        }, {
          id: 'electricity2',
          src: 'electricity_2.png'
        }, {
          id: 'gasoline1',
          src: 'gasoline_1.png'
        }, {
          id: 'gasoline2',
          src: 'gasoline_2.png'
        }, {
          id: 'lights1',
          src: 'lights_1.png'
        }, {
          id: 'lights2',
          src: 'lights_2.png'
        }, {
          id: 'plasticbags1',
          src: 'plasticbags_1.png'
        }, {
          id: 'plasticbags2',
          src: 'plasticbags_2.png'
        }, {
          id: 'pollair1',
          src: 'pollair_1.png'
        }, {
          id: 'pollair2',
          src: 'pollair_2.png'
        }, {
          id: 'pollwater1',
          src: 'pollwater_1.png'
        }, {
          id: 'pollwater2',
          src: 'pollwater_2.png'
        }, {
          id: 'recycle1',
          src: 'recycle_1.png'
        }, {
          id: 'recycle2',
          src: 'recycle_2.png'
        }, {
          id: 'species1',
          src: 'species_1.png'
        }, {
          id: 'species2',
          src: 'species_2.png'
        }, {
          id: 'teeth1',
          src: 'teeth_1.png'
        }, {
          id: 'teeth2',
          src: 'teeth_2.png'
        }, {
          id: 'transport1',
          src: 'transport_1.png'
        }, {
          id: 'transport2',
          src: 'transport_2.png'
        }, {
          id: 'trash1',
          src: 'trash_1.png'
        }, {
          id: 'trash2',
          src: 'trash_2.png'
        }, {
          id: 'water1',
          src: 'water_1.png'
        }, {
          id: 'water2',
          src: 'water_2.png'
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
          id: 'selectricity1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'sgasoline1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'slights1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'splasticbags1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'spollair1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'spollwater1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'srecycle1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'sspecies1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'steeth1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'stransport1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'strash1'
        }, {
          src: 'sounds/TU2_U2_A2_cleanUpTheKitchen.mp3',
          id: 'swater1'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        answers: [
          {
            id: 'electricity1',
            a: false
          }, {
            id: 'gasoline1',
            a: false
          }, {
            id: 'lights1',
            a: false
          }, {
            id: 'plasticbags1',
            a: false
          }, {
            id: 'pollair1',
            a: false
          }, {
            id: 'pollwater1',
            a: false
          }, {
            id: 'recycle1',
            a: false
          }, {
            id: 'species1',
            a: false
          }, {
            id: 'teeth1',
            a: false
          }, {
            id: 'transport1',
            a: false
          }, {
            id: 'trash1',
            a: false
          }, {
            id: 'water1',
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
      this.insertInstructions('instructions', 'Listen and click on the correct picture.', 40, 100);
      this.insertBitmap('teacher', 'prof', 550, stageSize.h / 2, 'mc');
      this.insertBitmap('repeat', 'repeat', 610, stageSize.h / 2 + 140, 'mc');
      this.insertSprite('choose1', ['electricity1', 'gasoline1', 'lights1', 'plasticbags1', 'pollair1', 'pollwater1', 'recycle1', 'species1', 'teeth1', 'transport1', 'trash1', 'water1'], {
        'electricity1': 0,
        'gasoline1': 1,
        'lights1': 2,
        'plasticbags1': 3,
        'pollair1': 4,
        'pollwater1': 5,
        'recycle1': 6,
        'species1': 7,
        'teeth1': 8,
        'transport1': 9,
        'trash1': 10,
        'water1': 11
      }, 240, 222, 'mc');
      this.insertSprite('choose2', ['electricity2', 'gasoline2', 'lights2', 'plasticbags2', 'pollair2', 'pollwater2', 'recycle2', 'species2', 'teeth2', 'transport2', 'trash2', 'water2'], {
        'electricity2': 0,
        'gasoline2': 1,
        'lights2': 2,
        'plasticbags2': 3,
        'pollair2': 4,
        'pollwater2': 5,
        'recycle2': 6,
        'species2': 7,
        'teeth2': 8,
        'transport2': 9,
        'trash2': 10,
        'water2': 11
      }, 240, 432, 'mc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 14, 0));
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
      if (this.phrase.id === this.answer.currentAnimation) {
        selection = this.answers.where({
          id: this.phrase.id
        });
        selection[0].a = true;
        createjs.Sound.play('good');
        return setTimeout(this.finishEvaluation, 1 * 1000);
      } else {
        TweenMax.to([this.library['choose1'], this.library['choose2']], 1, {
          alpha: 0,
          scaleX: 0.3,
          scaleY: 0.3,
          ease: Elastic.easeOut,
          onComplete: this.showPhrase
        });
        return this.warning();
      }
    };

    U2A2.prototype.finishEvaluation = function() {
      this.library['score'].plusOne();
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