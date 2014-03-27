(function() {
  var U4A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A3 = (function(_super) {
    __extends(U4A3, _super);

    function U4A3() {
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
          id: 'animalfeathers',
          src: 'animals_feathers.png'
        }, {
          id: 'animalbeaks',
          src: 'animal_beak.png'
        }, {
          id: 'animalclaws',
          src: 'animal_claws.png'
        }, {
          id: 'animalfins',
          src: 'animal_fins.png'
        }, {
          id: 'animalfur',
          src: 'animal_fur.png'
        }, {
          id: 'animalpaws',
          src: 'animal_paws.png'
        }, {
          id: 'animalscales',
          src: 'animal_scales.png'
        }, {
          id: 'animaltails',
          src: 'animal_tail.png'
        }, {
          id: 'animalwhiskers',
          src: 'animal_whiskers.png'
        }, {
          id: 'animalwings',
          src: 'animal_wings.png'
        }, {
          id: 'bodybeaks',
          src: 'body_beak.png'
        }, {
          id: 'bodyclaws',
          src: 'body_claws.png'
        }, {
          id: 'bodyfeathers',
          src: 'body_feathers.png'
        }, {
          id: 'bodyfins',
          src: 'body_fins.png'
        }, {
          id: 'bodyfur',
          src: 'body_fur.png'
        }, {
          id: 'bodypaws',
          src: 'body_paws.png'
        }, {
          id: 'bodyscales',
          src: 'body_scales.png'
        }, {
          id: 'bodytails',
          src: 'body_tail.png'
        }, {
          id: 'bodywhiskers',
          src: 'body_whiskers.png'
        }, {
          id: 'bodywings',
          src: 'body_wings.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A3_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U4_A3_animals.mp3',
          id: 'animals'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }
      ];
      this.letra = ['Animals, animals everywhere!', 'Some have wings and fly through the air,', 'Some have feathers. Some have scales.', 'Some have fur, and some have tails!', 'Some have whiskers. Some have claws.', 'Some have fins, and some have paws.', 'Some have beaks, and some can speak!', 'Animals, animals everywhere!'];
      this.answers = {
        words: [
          {
            w: 'whiskers',
            x: 154,
            y: 144
          }, {
            w: 'fur',
            x: 154,
            y: 108
          }, {
            w: 'fins',
            x: 154,
            y: 180
          }, {
            w: 'beaks',
            x: 154,
            y: 216
          }, {
            w: 'wings',
            x: 154,
            y: 36
          }, {
            w: 'scales',
            x: 428,
            y: 72
          }, {
            w: 'paws',
            x: 420,
            y: 180
          }, {
            w: 'tails',
            x: 410,
            y: 108
          }, {
            w: 'claws',
            x: 434,
            y: 144
          }, {
            w: 'feathers',
            x: 154,
            y: 72
          }
        ],
        pairs: [
          {
            b: 'bodybeaks',
            a: 'animalbeaks',
            x: 928,
            y: 1008,
            xa: 938,
            ya: 1008,
            s: false
          }, {
            b: 'bodyclaws',
            a: 'animalclaws',
            x: 408,
            y: 434,
            xa: 408,
            ya: 434,
            s: false
          }, {
            b: 'bodyfeathers',
            a: 'animalfeathers',
            x: 1220,
            y: 434,
            xa: 1250,
            ya: 454,
            s: false
          }, {
            b: 'bodyfins',
            a: 'animalfins',
            x: 408,
            y: 936,
            xa: 390,
            ya: 910,
            s: false
          }, {
            b: 'bodyfur',
            a: 'animalfur',
            x: 1220,
            y: 936,
            xa: 1220,
            ya: 866,
            s: false
          }, {
            b: 'bodypaws',
            a: 'animalpaws',
            x: 1392,
            y: 666,
            xa: 1392,
            ya: 666,
            s: false
          }, {
            b: 'bodyscales',
            a: 'animalscales',
            x: 662,
            y: 362,
            xa: 645,
            ya: 362,
            s: false
          }, {
            b: 'bodytails',
            a: 'animaltails',
            x: 928,
            y: 362,
            xa: 928,
            ya: 337,
            s: false
          }, {
            b: 'bodywhiskers',
            a: 'animalwhiskers',
            x: 660,
            y: 1008,
            xa: 660,
            ya: 1008,
            s: false
          }, {
            b: 'bodywings',
            a: 'animalwings',
            x: 238,
            y: 666,
            xa: 209,
            ya: 697,
            s: false
          }
        ]
      };
      U4A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A3.prototype.setStage = function() {
      U4A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look and click on the corresponding picture.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 10, 0));
      return this.setParts().setAnimals().setText().introEvaluation();
    };

    U4A3.prototype.setParts = function() {
      var m, parts, value, _i, _len, _ref;
      parts = new createjs.Container();
      parts.name = 'parts';
      _ref = this.answers.pairs;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        m = this.insertBitmap(value.b, value.b, value.x, value.y, 'mc');
        this.addToLibrary(m);
        parts.addChild(m);
      }
      this.addToMain(parts);
      return this;
    };

    U4A3.prototype.setAnimals = function() {
      var animals, m, value, _i, _len, _ref;
      animals = new createjs.Container();
      animals.name = 'animals';
      _ref = this.answers.pairs;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        m = this.insertBitmap(value.a, value.a, value.xa, value.ya, 'mc');
        m.alpha = 0;
        this.addToLibrary(m);
        animals.addChild(m);
      }
      this.addToMain(animals);
      return this;
    };

    U4A3.prototype.setText = function() {
      var cancion, i, text, _i, _j, _ref, _ref1;
      cancion = new createjs.Container();
      cancion.name = 'cancion';
      cancion.x = 580;
      cancion.y = 540;
      for (i = _i = 0, _ref = this.letra.length - 1; _i <= _ref; i = _i += 1) {
        text = new createjs.Text(this.letra[i], '26px Quicksand', '#666');
        text.x = 0;
        text.y = i * 36;
        cancion.addChild(text);
      }
      for (i = _j = 0, _ref1 = this.answers.words.length - 1; _j <= _ref1; i = _j += 1) {
        text = new createjs.Text(this.answers.words[i].w, '26px Quicksand', '#EB198E');
        text.name = "t" + i;
        text.x = this.answers.words[i].x;
        text.y = this.answers.words[i].y;
        this.addToLibrary(text);
        cancion.addChild(text);
      }
      this.addToMain(cancion);
      return this;
    };

    U4A3.prototype.introEvaluation = function() {
      U4A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['cancion'], 0.5, {
        alpha: 0,
        y: this.library['cancion'].y - 40,
        delay: 1
      });
      return TweenLite.from(this.library['parts'], 0.5, {
        alpha: 0,
        y: this.library['parts'].y + 40,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U4A3.prototype.initEvaluation = function(e) {
      var value, _i, _len, _ref, _results;
      U4A3.__super__.initEvaluation.apply(this, arguments);
      this.blink(this.library["t" + this.index]);
      _ref = this.answers.pairs;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        _results.push(this.library[value.b].addEventListener('click', this.evaluateAnswer));
      }
      return _results;
    };

    U4A3.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      this.animal = this.answers.words[this.index].w;
      if (this.answer.name === ("body" + this.answers.words[this.index].w)) {
        createjs.Sound.play('good');
        return setTimeout(this.finishEvaluation, 0.5 * 1000);
      } else {
        this.warning();
        this.blink(this.library["t" + this.index], false);
        return this.nextEvaluation();
      }
    };

    U4A3.prototype.finishEvaluation = function() {
      this.blink(this.library["t" + this.index], false);
      this.library.score.plusOne();
      TweenLite.to(this.library["body" + this.animal], 1, {
        alpha: 0,
        ease: Quart.easeOut
      });
      return TweenLite.to(this.library["animal" + this.animal], 1, {
        alpha: 1,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U4A3.prototype.nextEvaluation = function() {
      var anim;
      this.index++;
      if (this.index < this.answers.words.length) {
        return this.blink(this.library["t" + this.index]);
      } else {
        anim = createjs.Sound.play('animals');
        return anim.addEventListener('complete', this.finish);
      }
    };

    U4A3.prototype.blink = function(obj, state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      obj.alpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: .2,
          repeat: -1,
          yoyo: true
        });
      }
    };

    U4A3.prototype.finish = function() {
      TweenLite.to(this.library['cancion'], 0.5, {
        alpha: 0,
        y: this.library['cancion'].y - 40
      });
      TweenLite.to(this.library['parts'], 0.5, {
        alpha: 0,
        y: this.library['parts'].y + 40
      });
      TweenLite.to(this.library['animals'], 0.5, {
        alpha: 0,
        y: this.library['animals'].y + 40
      });
      return U4A3.__super__.finish.apply(this, arguments);
    };

    window.U4A3 = U4A3;

    return U4A3;

  })(Oda);

}).call(this);
