// Generated by CoffeeScript 1.6.3
(function() {
  var U4A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A2 = (function(_super) {
    __extends(U4A2, _super);

    function U4A2() {
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
          id: 'bluewhale',
          src: 'bluewhale_img.png'
        }, {
          id: 'dolphin',
          src: 'dolphin_img.png'
        }, {
          id: 'eagle',
          src: 'eagle_img.png'
        }, {
          id: 'giantpanda',
          src: 'giantpanda_img.png'
        }, {
          id: 'polarbear',
          src: 'polarbear_img.png'
        }, {
          id: 'gorilla',
          src: 'gorilla_img.png'
        }, {
          id: 'jaguar',
          src: 'jaguar_img.png'
        }, {
          id: 'lion',
          src: 'lion_img.png'
        }, {
          id: 'seaturttle',
          src: 'seaturttle_img.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A2_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.answers = [];
      this.linea1 = ['g', 'i', 'a', 'n', 't', 'p', 'a', 'n', 'd', 'a'];
      this.linea2 = ['p', 's', 'e', 'a', 't', 'u', 'r', 't', 'l', 'e'];
      this.linea3 = ['o', 'u', 's', 'q', 'f', 'a', 't', 'y', 'i', 'j'];
      this.linea4 = ['l', 'g', 'e', 'x', 'k', 'e', 'j', 'd', 'o', 'a'];
      this.linea5 = ['a', 'e', 'd', 'o', 'l', 'p', 'h', 'i', 'n', 'g'];
      this.linea6 = ['r', 'a', 'n', 'h', 'y', 'j', 'i', 'n', 'b', 'u'];
      this.linea7 = ['b', 'g', 'o', 'r', 'i', 'l', 'l', 'a', 't', 'a'];
      this.linea8 = ['e', 'l', 'k', 'd', 'o', 'z', 'p', 'l', 'n', 'r'];
      this.linea9 = ['a', 'e', 'o', 'f', 'e', 'a', 'd', 'o', 'f', 'l'];
      this.linea10 = ['r', 'b', 'l', 'u', 'e', 'w', 'h', 'a', 'l', 'e'];
      U4A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A2.prototype.setStage = function() {
      U4A2.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setAnimals().setSopa().introEvaluation();
    };

    U4A2.prototype.setAnimals = function() {
      this.insertBitmap('bluewhale', 'bluewhale', 509, 465);
      this.insertBitmap('dolphin', 'dolphin', 227, 460);
      this.insertBitmap('eagle', 'eagle', 43, 131);
      this.insertBitmap('giantpanda', 'giantpanda', 661, 249);
      this.insertBitmap('gorilla', 'gorilla', 122, 361);
      this.insertBitmap('jaguar', 'jaguar', 142, 132);
      this.insertBitmap('lion', 'lion', 586, 130);
      this.insertBitmap('seaturttle', 'seaturttle', 590, 372);
      this.insertBitmap('polarbear', 'polarbear', 368, 424);
      return this;
    };

    U4A2.prototype.setSopa = function() {
      var h, i, letra, sopa, _i, _j;
      sopa = new createjs.Container();
      sopa.x = 297;
      sopa.y = 148;
      for (h = _i = 0; _i <= 9; h = ++_i) {
        for (i = _j = 0; _j <= 9; i = ++_j) {
          letra = new createjs.Text(this['linea' + (h + 1)][i], '20px Arial', '#333');
          letra.x = i * 26;
          letra.y = h * 26;
          sopa.addChild(letra);
        }
      }
      this.addToMain(sopa);
      return this;
    };

    U4A2.prototype.introEvaluation = function() {
      return U4A2.__super__.introEvaluation.apply(this, arguments);
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

    U4A2.prototype.initEvaluation = function(e) {
      U4A2.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U4A2.prototype.evaluateAnswer = function(e) {
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

    U4A2.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U4A2.prototype.nextEvaluation = function() {
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

    U4A2.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U4A2.prototype.finish = function() {
      var i, _i, _results;
      U4A2.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U4A2 = U4A2;

    return U4A2;

  })(Oda);

}).call(this);
