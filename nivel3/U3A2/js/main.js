// Generated by CoffeeScript 1.6.3
(function() {
  var U4A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A6 = (function(_super) {
    __extends(U4A6, _super);

    function U4A6() {
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
          id: 'btnrepeat',
          src: 'btn_repeat.png'
        }, {
          id: 'kid0',
          src: 'kid_nate.png'
        }, {
          id: 'kid1',
          src: 'kid_ricky.png'
        }, {
          id: 'kid2',
          src: 'kid_daniel.png'
        }, {
          id: 'kid3',
          src: 'kid_hudson.png'
        }, {
          id: 'girl0',
          src: 'kid_magda.png'
        }, {
          id: 'girl1',
          src: 'kid_keira.png'
        }, {
          id: 'girl2',
          src: 'kid_mia.png'
        }, {
          id: 'girl3',
          src: 'kid_gemma.png'
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
      U4A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A6.prototype.setStage = function() {
      U4A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('btnrepeat', 'btnrepeat', stageSize.w / 2, 550, 'tc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setKids().introEvaluation();
    };

    U4A6.prototype.setKids = function() {
      var i, k, kids, _i, _j;
      kids = new createjs.Container();
      kids.x = 250;
      kids.y = 330;
      for (i = _i = 0; _i <= 3; i = ++_i) {
        k = this.createBitmap('kid' + i, 'kid' + i, i * 320, 0, 'bc');
        kids.addChild(k);
        if (i >= 2) {
          k.x = k.x - 640;
          k.y = 200;
        }
      }
      for (i = _j = 0; _j <= 3; i = ++_j) {
        k = this.createBitmap('girl' + i, 'girl' + i, i * 320, 0, 'bc');
        kids.addChild(k);
        if (i >= 2) {
          k.x = k.x - 640;
          k.y = 200;
        }
      }
      this.addToMain(kids);
      return this;
    };

    U4A6.prototype.introEvaluation = function() {
      return U4A6.__super__.introEvaluation.apply(this, arguments);
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

    U4A6.prototype.initEvaluation = function(e) {
      U4A6.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U4A6.prototype.evaluateAnswer = function(e) {
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

    U4A6.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U4A6.prototype.nextEvaluation = function() {
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

    U4A6.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U4A6.prototype.finish = function() {
      var i, _i, _results;
      U4A6.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U4A6 = U4A6;

    return U4A6;

  })(Oda);

}).call(this);