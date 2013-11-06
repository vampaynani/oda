// Generated by CoffeeScript 1.6.3
(function() {
  var U5A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A6 = (function(_super) {
    __extends(U5A6, _super);

    function U5A6() {
      this.repeatSound = __bind(this.repeatSound, this);
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
          id: 'carta1',
          src: 'carta1.png'
        }, {
          id: 'carta2',
          src: 'carta2.png'
        }, {
          id: 'carta3',
          src: 'carta3.png'
        }, {
          id: 'game1btn',
          src: 'game1_btn.png'
        }, {
          id: 'game2btn',
          src: 'game2_btn.png'
        }, {
          id: 'game3btn',
          src: 'game3_btn.png'
        }, {
          id: 'game1cloudy',
          src: 'game1/cloudy.PNG'
        }, {
          id: 'game1cold',
          src: 'game1/cold.PNG'
        }, {
          id: 'game1hot',
          src: 'game1/hot.PNG'
        }, {
          id: 'game1itscloudy',
          src: 'game1/its_cloudy.PNG'
        }, {
          id: 'game1itscold',
          src: 'game1/its_cold.PNG'
        }, {
          id: 'game1itshot',
          src: 'game1/its_hot.png'
        }, {
          id: 'game1itsraining',
          src: 'game1/its_raining.PNG'
        }, {
          id: 'game1itssunny',
          src: 'game1/its_sunny.PNG'
        }, {
          id: 'game1itsswing',
          src: 'game1/its_swing.PNG'
        }, {
          id: 'game1itswindy',
          src: 'game1/its_windy.PNG'
        }, {
          id: 'game1lookitsarainbow',
          src: 'game1/look_its_a_rainbow.png'
        }, {
          id: 'game1rainbow',
          src: 'game1/rainbow.PNG'
        }, {
          id: 'game1raining',
          src: 'game1/raining.PNG'
        }, {
          id: 'game1snowing',
          src: 'game1/snowing.PNG'
        }, {
          id: 'game1sunny',
          src: 'game1/sunny.PNG'
        }, {
          id: 'game1windy',
          src: 'game1/windy.PNG'
        }, {
          id: 'game2butterflies',
          src: 'game2/butterflies.png'
        }, {
          id: 'game2easter',
          src: 'game2/easter.png'
        }, {
          id: 'game2flowers',
          src: 'game2/flowers.png'
        }, {
          id: 'game2ibuildasnowman',
          src: 'game2/i_build_a_snowman.png'
        }, {
          id: 'game2icelebrateeaster',
          src: 'game2/i_celebrate_easter.png'
        }, {
          id: 'game2ichasebutterflies',
          src: 'game2/i_chase_butterflies.png'
        }, {
          id: 'game2igosledding',
          src: 'game2/i_go_sledding.png'
        }, {
          id: 'game2igoswimming',
          src: 'game2/i_go_swimming.png'
        }, {
          id: 'game2ipickflowers',
          src: 'game2/i_pick_flowers.png'
        }, {
          id: 'game2Iraketheleaves',
          src: 'game2/I_rake_the_leaves.png'
        }, {
          id: 'game2irideascooter',
          src: 'game2/i_ride_a_scooter.png'
        }, {
          id: 'game2leaves',
          src: 'game2/leaves.png'
        }, {
          id: 'game2scooter',
          src: 'game2/scooter.png'
        }, {
          id: 'game2sledding',
          src: 'game2/sledding.png'
        }, {
          id: 'game2snowman',
          src: 'game2/snowman.png'
        }, {
          id: 'game2swimming',
          src: 'game2/swimming.png'
        }, {
          id: 'game3cold',
          src: 'game3/cold.png'
        }, {
          id: 'game3hot',
          src: 'game3/hot.png'
        }, {
          id: 'game3hungry',
          src: 'game3/hungry.png'
        }, {
          id: 'game3mourn',
          src: 'game3/mourn.png'
        }, {
          id: 'game3nap',
          src: 'game3/nap.png'
        }, {
          id: 'game3shehungry',
          src: 'game3/she_hungry.png'
        }, {
          id: 'game3shescold',
          src: 'game3/shes_cold.png'
        }, {
          id: 'game3sheshot',
          src: 'game3/shes_hot.png'
        }, {
          id: 'game3shessad',
          src: 'game3/shes_sad.png'
        }, {
          id: 'game3shessick',
          src: 'game3/shes_sick.png'
        }, {
          id: 'game3shestakinganap',
          src: 'game3/shes_taking_a_nap.png'
        }, {
          id: 'game3shesthirsty',
          src: 'game3/shes_thirsty.png'
        }, {
          id: 'game3shestired',
          src: 'game3/shes_tired.png'
        }, {
          id: 'game3sick',
          src: 'game3/sick.png'
        }, {
          id: 'game3thirsty',
          src: 'game3/thirsty.png'
        }, {
          id: 'game3tired',
          src: 'game3/tired.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A6_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.answers = [];
      U5A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A6.prototype.setStage = function() {
      U5A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('game1btn', 'game1btn', 753, 460);
      this.insertBitmap('game2btn', 'game2btn', 753, 505);
      this.insertBitmap('game3btn', 'game3btn', 753, 550);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setCards().introEvaluation();
    };

    U5A6.prototype.setCards = function() {
      var c, game, h, i, juego, _i, _j;
      juego = new createjs.Container();
      juego.x = 200;
      juego.y = 180;
      game = 1;
      for (h = _i = 0; _i <= 3; h = ++_i) {
        for (i = _j = 0; _j <= 3; i = ++_j) {
          c = this.createBitmap('carta' + game, 'carta' + game, i * 130, h * 110, 'mc');
          juego.addChild(c);
          this.addToLibrary(c);
        }
      }
      this.addToMain(juego);
      return this;
    };

    U5A6.prototype.introEvaluation = function() {
      return U5A6.__super__.introEvaluation.apply(this, arguments);
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

    U5A6.prototype.initEvaluation = function(e) {
      U5A6.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U5A6.prototype.evaluateAnswer = function(e) {
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

    U5A6.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U5A6.prototype.nextEvaluation = function() {
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

    U5A6.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U5A6.prototype.finish = function() {
      var i, _i, _results;
      U5A6.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U5A6 = U5A6;

    return U5A6;

  })(Oda);

}).call(this);
