(function() {
  var U7A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U7A1 = (function(_super) {
    __extends(U7A1, _super);

    function U7A1() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      this.updateCounter = __bind(this.updateCounter, this);
      this.setCards = __bind(this.setCards, this);
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
          id: 'creative',
          src: 'creative.png'
        }, {
          id: 'creative2',
          src: 'creative2.png'
        }, {
          id: 'hardworking',
          src: 'hardworking.png'
        }, {
          id: 'hardworking2',
          src: 'hardworking2.png'
        }, {
          id: 'intelligent',
          src: 'intelligent.png'
        }, {
          id: 'intelligent2',
          src: 'intelligent2.png'
        }, {
          id: 'lazy',
          src: 'lazy.png'
        }, {
          id: 'lazy2',
          src: 'lazy2.png'
        }, {
          id: 'popular',
          src: 'popular.png'
        }, {
          id: 'popular2',
          src: 'popular2.png'
        }, {
          id: 'shy',
          src: 'shy.png'
        }, {
          id: 'shy2',
          src: 'shy2.png'
        }, {
          id: 'stubborn',
          src: 'stubborn.png'
        }, {
          id: 'stubborn2',
          src: 'stubborn2.png'
        }, {
          id: 'vain',
          src: 'vain.png'
        }, {
          id: 'vain2',
          src: 'vain2.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU3_U7_A1_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = [
        [
          {
            id: 'creative',
            i: 1
          }, {
            id: 'creative2',
            i: 1
          }, {
            id: 'hardworking',
            i: 2
          }, {
            id: 'hardworking2',
            i: 2
          }, {
            id: 'intelligent',
            i: 3
          }, {
            id: 'intelligent2',
            i: 3
          }, {
            id: 'lazy',
            i: 4
          }, {
            id: 'lazy2',
            i: 4
          }, {
            id: 'popular',
            i: 5
          }, {
            id: 'popular2',
            i: 5
          }, {
            id: 'shy',
            i: 6
          }, {
            id: 'shy2',
            i: 6
          }, {
            id: 'stubborn',
            i: 7
          }, {
            id: 'stubborn2',
            i: 7
          }, {
            id: 'vain',
            i: 8
          }, {
            id: 'vain2',
            i: 8
          }
        ]
      ];
      U7A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U7A1.prototype.setStage = function() {
      U7A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Click on the cards and match the pictures and match the pictures with the adjectives.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 100, 0));
      this.library.score.txtCount.color = "#BFD951";
      this.library.score.txtTotal.color = "#0096DB";
      this.setCards();
      return this.introEvaluation();
    };

    U7A1.prototype.setCards = function(e) {
      var b, c, game, h, i, j, juego, _i, _j;
      this.time = 100;
      this.timer = setInterval(this.updateCounter, 1000);
      j = 0;
      game = 1;
      juego = new createjs.Container();
      juego.x = 200;
      juego.y = 180;
      juego.name = 'juego';
      this.clearButtons();
      this.selected = new Array();
      this.cards = this.shuffle(this.game[game - 1]);
      for (h = _i = 0; _i <= 3; h = ++_i) {
        for (i = _j = 0; _j <= 3; i = ++_j) {
          c = this.createBitmap("carta" + h + "_" + i, "carta" + game, i * 130, h * 110, 'mc');
          b = this.createBitmap("cartab" + h + "_" + i, this.cards[j].id, i * 130, h * 110, 'mc');
          c.index = this.cards[j].i;
          juego.addChild(b, c);
          this.addToLibrary(b, c);
          j++;
        }
      }
      this.addToMain(juego);
      TweenLite.from(juego, 0.5, {
        alpha: 0,
        y: juego.y - 20
      });
      return this;
    };

    U7A1.prototype.updateCounter = function() {
      this.time--;
      this.library['score'].updateTotal(this.time);
      if (this.time === 0) {
        return this.finish();
      }
    };

    U7A1.prototype.introEvaluation = function() {
      U7A1.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      return TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U7A1.prototype.initEvaluation = function(e) {
      var c, h, i, _i, _results;
      U7A1.__super__.initEvaluation.apply(this, arguments);
      _results = [];
      for (h = _i = 0; _i <= 3; h = ++_i) {
        _results.push((function() {
          var _j, _results1;
          _results1 = [];
          for (i = _j = 0; _j <= 3; i = ++_j) {
            c = this.library["carta" + h + "_" + i];
            _results1.push(c.addEventListener('click', this.evaluateAnswer));
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    U7A1.prototype.clearButtons = function() {};

    U7A1.prototype.evaluateAnswer = function(e) {
      if (this.selected.length < 2) {
        this.selected.push(e.target);
        TweenLite.to(e.target, 0.5, {
          alpha: 0
        });
      }
      if (this.selected.length === 2) {
        return setTimeout(this.finishEvaluation, 1 * 1000);
      }
    };

    U7A1.prototype.finishEvaluation = function() {
      if (this.selected[0].index === this.selected[1].index) {
        return this.nextEvaluation();
      } else {
        TweenLite.to(this.selected[0], 0.5, {
          alpha: 1
        });
        TweenLite.to(this.selected[1], 0.5, {
          alpha: 1
        });
        return this.selected = new Array();
      }
    };

    U7A1.prototype.nextEvaluation = function() {
      this.index++;
      this.library.score.plusOne();
      if (this.index < this.cards.length / 2) {
        this.selected = new Array();
        return createjs.Sound.play('good');
      } else {
        return this.finish();
      }
    };

    U7A1.prototype.finish = function() {
      clearInterval(this.timer);
      TweenLite.to([this.library.game1btn, this.library.game2btn, this.library.game3btn], 1, {
        alpha: 0
      });
      TweenLite.to(this.library.juego, 1, {
        alpha: 0,
        y: this.library.juego.y - 20
      });
      return U7A1.__super__.finish.apply(this, arguments);
    };

    window.U7A1 = U7A1;

    return U7A1;

  })(Oda);

}).call(this);
