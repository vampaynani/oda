// Generated by CoffeeScript 1.6.3
(function() {
  var U4A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A3 = (function(_super) {
    __extends(U4A3, _super);

    function U4A3() {
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
          id: 'animalsfeathers',
          src: 'animals_feathers.png'
        }, {
          id: 'animalbeak',
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
          id: 'animaltail',
          src: 'animal_tail.png'
        }, {
          id: 'animalwhiskers',
          src: 'animal_whiskers.png'
        }, {
          id: 'animalwings',
          src: 'animal_wings.png'
        }, {
          id: 'bodybeak',
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
          id: 'bodytail',
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
        }
      ];
      this.answers = [];
      this.letra = ['Animals, animals everywhere!', 'Some have wings and fly through the air,', 'Some have feathers. Some have scales.', 'Some have fur, and some have tails!', 'Some have whiskers. Some have claws.', 'Some have fins, and some have paws.', 'Some have beaks, and some can speak!', 'Animals, animals everywhere!'];
      U4A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A3.prototype.setStage = function() {
      U4A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setAnimals().setParts().setText().introEvaluation();
    };

    U4A3.prototype.setParts = function() {
      this.insertBitmap('bodybeak', 'bodybeak', 414, 454);
      this.insertBitmap('bodyclaws', 'bodyclaws', 154, 167);
      this.insertBitmap('bodyfeathers', 'bodyfeathers', 561, 167);
      this.insertBitmap('bodyfins', 'bodyfins', 154, 418);
      this.insertBitmap('bodyfur', 'bodyfur', 560, 418);
      this.insertBitmap('bodypaws', 'bodypaws', 646, 283);
      this.insertBitmap('bodyscales', 'bodyscales', 281, 131);
      this.insertBitmap('bodytail', 'bodytail', 414, 131);
      this.insertBitmap('bodywhiskers', 'bodywhiskers', 280, 454);
      this.insertBitmap('bodywings', 'bodywings', 69, 283);
      return this;
    };

    U4A3.prototype.setAnimals = function() {
      this.insertBitmap('animalbeak', 'animalbeak', 414, 454);
      this.insertBitmap('animalclaws', 'animalclaws', 151, 133);
      this.insertBitmap('animalsfeathers', 'animalsfeathers', 553, 156);
      this.insertBitmap('animalfins', 'animalfins', 87, 398);
      this.insertBitmap('animalfur', 'animalfur', 552, 345);
      this.insertBitmap('animalpaws', 'animalpaws', 646, 283);
      this.insertBitmap('animalscales', 'animalscales', 265, 131);
      this.insertBitmap('animaltail', 'animaltail', 414, 105);
      this.insertBitmap('animalwhiskers', 'animalwhiskers', 280, 450);
      this.insertBitmap('animalwings', 'animalwings', 47, 285);
      return this;
    };

    U4A3.prototype.setText = function() {
      var cancion, i, text, _i;
      cancion = new createjs.Container();
      cancion.x = 290;
      cancion.y = 270;
      for (i = _i = 0; _i <= 9; i = ++_i) {
        text = new createjs.Text(this.letra[i], '13px Arial', '#333');
        text.x = 0;
        text.y = i * 18;
        cancion.addChild(text);
      }
      this.addToMain(cancion);
      return this;
    };

    U4A3.prototype.introEvaluation = function() {
      return U4A3.__super__.introEvaluation.apply(this, arguments);
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

    U4A3.prototype.initEvaluation = function(e) {
      U4A3.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U4A3.prototype.evaluateAnswer = function(e) {
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

    U4A3.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U4A3.prototype.nextEvaluation = function() {
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

    U4A3.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U4A3.prototype.finish = function() {
      var i, _i, _results;
      U4A3.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U4A3 = U4A3;

    return U4A3;

  })(Oda);

}).call(this);