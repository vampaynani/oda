(function() {
  var U1A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A6 = (function(_super) {
    __extends(U1A6, _super);

    function U1A6() {
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
          id: 'game1aquarium1',
          src: 'game1/aquarium1.png'
        }, {
          id: 'game1aquarium2',
          src: 'game1/aquarium2.png'
        }, {
          id: 'game1book1',
          src: 'game1/book1.png'
        }, {
          id: 'game1book2',
          src: 'game1/book2.png'
        }, {
          id: 'game1fair1',
          src: 'game1/fair1.png'
        }, {
          id: 'game1fair2',
          src: 'game1/fair2.png'
        }, {
          id: 'game1gallery1',
          src: 'game1/gallery1.png'
        }, {
          id: 'game1gallery2',
          src: 'game1/gallery2.png'
        }, {
          id: 'game1gift1',
          src: 'game1/gift1.png'
        }, {
          id: 'game1gift2',
          src: 'game1/gift2.png'
        }, {
          id: 'game1planet1',
          src: 'game1/planet1.png'
        }, {
          id: 'game1planet2',
          src: 'game1/planet2.png'
        }, {
          id: 'game1theater1',
          src: 'game1/theater1.png'
        }, {
          id: 'game1theater2',
          src: 'game1/theater2.png'
        }, {
          id: 'game1zoo1',
          src: 'game1/zoo1.png'
        }, {
          id: 'game1zoo2',
          src: 'game1/zoo2.png'
        }, {
          id: 'game2ant1',
          src: 'game2/ant1.png'
        }, {
          id: 'game2ant2',
          src: 'game2/ant2.png'
        }, {
          id: 'game2beetle1',
          src: 'game2/beetle1.png'
        }, {
          id: 'game2beetle2',
          src: 'game2/beetle2.png'
        }, {
          id: 'game2butterfly1',
          src: 'game2/butterfly1.png'
        }, {
          id: 'game2butterfly2',
          src: 'game2/butterfly2.png'
        }, {
          id: 'game2caterpillar1',
          src: 'game2/caterpillar1.png'
        }, {
          id: 'game2caterpillar2',
          src: 'game2/caterpillar2.png'
        }, {
          id: 'game2cricket1',
          src: 'game2/cricket1.png'
        }, {
          id: 'game2cricket2',
          src: 'game2/cricket2.png'
        }, {
          id: 'game2dragonfly1',
          src: 'game2/dragonfly1.png'
        }, {
          id: 'game2dragonfly2',
          src: 'game2/dragonfly2.png'
        }, {
          id: 'game2firefly1',
          src: 'game2/firefly1.png'
        }, {
          id: 'game2firefly2',
          src: 'game2/firefly2.png'
        }, {
          id: 'game2mosquito1',
          src: 'game2/mosquito1.png'
        }, {
          id: 'game2mosquito2',
          src: 'game2/mosquito2.png'
        }, {
          id: 'game3animals1',
          src: 'game3/animals1.png'
        }, {
          id: 'game3animals2',
          src: 'game3/animals2.png'
        }, {
          id: 'game3camer2',
          src: 'game3/camer2.png'
        }, {
          id: 'game3camera1',
          src: 'game3/camera1.png'
        }, {
          id: 'game3cell1',
          src: 'game3/cell1.png'
        }, {
          id: 'game3cell2',
          src: 'game3/cell2.png'
        }, {
          id: 'game3eat1',
          src: 'game3/eat1.png'
        }, {
          id: 'game3eat2',
          src: 'game3/eat2.png'
        }, {
          id: 'game3line1',
          src: 'game3/line1.png'
        }, {
          id: 'game3line2',
          src: 'game3/line2.png'
        }, {
          id: 'game3run1',
          src: 'game3/run1.png'
        }, {
          id: 'game3run2',
          src: 'game3/run2.png'
        }, {
          id: 'game3touch1',
          src: 'game3/touch1.png'
        }, {
          id: 'game3touch2',
          src: 'game3/touch2.png'
        }, {
          id: 'game3trash1',
          src: 'game3/trash1.png'
        }, {
          id: 'game3trash2',
          src: 'game3/trash2.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU3_U1_A6_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = [
        [
          {
            id: 'game1aquarium1',
            i: 1
          }, {
            id: 'game1aquarium2',
            i: 1
          }, {
            id: 'game1book1',
            i: 2
          }, {
            id: 'game1book2',
            i: 2
          }, {
            id: 'game1fair1',
            i: 3
          }, {
            id: 'game1fair2',
            i: 3
          }, {
            id: 'game1gallery1',
            i: 4
          }, {
            id: 'game1gallery2',
            i: 4
          }, {
            id: 'game1gift1',
            i: 5
          }, {
            id: 'game1gift2',
            i: 5
          }, {
            id: 'game1planet1',
            i: 6
          }, {
            id: 'game1planet2',
            i: 6
          }, {
            id: 'game1theater1',
            i: 7
          }, {
            id: 'game1theater2',
            i: 7
          }, {
            id: 'game1zoo1',
            i: 8
          }, {
            id: 'game1zoo2',
            i: 8
          }
        ], [
          {
            id: 'game2ant1',
            i: 1
          }, {
            id: 'game2ant2',
            i: 1
          }, {
            id: 'game2beetle1',
            i: 2
          }, {
            id: 'game2beetle2',
            i: 2
          }, {
            id: 'game2butterfly1',
            i: 3
          }, {
            id: 'game2butterfly2',
            i: 3
          }, {
            id: 'game2caterpillar1',
            i: 4
          }, {
            id: 'game2caterpillar2',
            i: 4
          }, {
            id: 'game2cricket1',
            i: 5
          }, {
            id: 'game2cricket2',
            i: 5
          }, {
            id: 'game2dragonfly1',
            i: 6
          }, {
            id: 'game2dragonfly2',
            i: 6
          }, {
            id: 'game2firefly1',
            i: 7
          }, {
            id: 'game2firefly2',
            i: 7
          }, {
            id: 'game2mosquito1',
            i: 8
          }, {
            id: 'game2mosquito2',
            i: 8
          }
        ], [
          {
            id: 'game3animals1',
            i: 1
          }, {
            id: 'game3animals2',
            i: 1
          }, {
            id: 'game3camer2',
            i: 2
          }, {
            id: 'game3camera1',
            i: 2
          }, {
            id: 'game3cell1',
            i: 3
          }, {
            id: 'game3cell2',
            i: 3
          }, {
            id: 'game3eat1',
            i: 4
          }, {
            id: 'game3eat2',
            i: 4
          }, {
            id: 'game3line1',
            i: 5
          }, {
            id: 'game3line2',
            i: 5
          }, {
            id: 'game3run1',
            i: 6
          }, {
            id: 'game3run2',
            i: 6
          }, {
            id: 'game3touch1',
            i: 7
          }, {
            id: 'game3touch2',
            i: 7
          }, {
            id: 'game3trash1',
            i: 8
          }, {
            id: 'game3trash2',
            i: 8
          }
        ]
      ];
      U1A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A6.prototype.setStage = function() {
      var b1, b2, b3;
      U1A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Click on two cards and see if they match.', 40, 100);
      b1 = new Button('game1btn', this.preload.getResult('game1btn'), 1, 753, 460);
      b2 = new Button('game2btn', this.preload.getResult('game2btn'), 2, 753, 505);
      b3 = new Button('game3btn', this.preload.getResult('game3btn'), 3, 753, 550);
      this.addToMain(b1, b2, b3);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 100, 0));
      this.library.score.txtCount.color = "#bfd951";
      this.library.score.txtTotal.color = "#ff9933";
      return this.introEvaluation();
    };

    U1A6.prototype.setCards = function(e) {
      var b, c, game, h, i, j, juego, _i, _j;
      this.time = 100;
      this.timer = setInterval(this.updateCounter, 1000);
      j = 0;
      game = e.currentTarget.index;
      juego = new createjs.Container();
      juego.x = 200;
      juego.y = 180;
      juego.name = 'juego';
      this.clearButtons();
      this.selected = new Array();
      this.cards = this.shuffle(this.game[game - 1]);
      for (h = _i = 0; _i <= 3; h = ++_i) {
        for (i = _j = 0; _j <= 3; i = ++_j) {
          c = this.createBitmap("carta" + game, "carta" + game, i * 130, h * 110, 'mc');
          b = this.createBitmap("cartab" + game, this.cards[j].id, i * 130, h * 110, 'mc');
          b.scaleX = b.scaleY = 0.9;
          c.scaleX = c.scaleY = 0.9;
          c.index = this.cards[j].i;
          c.addEventListener('click', this.evaluateAnswer);
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

    U1A6.prototype.updateCounter = function() {
      this.time--;
      this.library['score'].updateTotal(this.time);
      if (this.time === 0) {
        return this.finish();
      }
    };

    U1A6.prototype.introEvaluation = function() {
      U1A6.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenLite.from([this.library.game1btn, this.library.game2btn, this.library.game3btn], 1, {
        alpha: 0,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U1A6.prototype.initEvaluation = function(e) {
      U1A6.__super__.initEvaluation.apply(this, arguments);
      this.library.game1btn.blink();
      this.library.game2btn.blink();
      this.library.game3btn.blink();
      this.library.game1btn.addEventListener('click', this.setCards);
      this.library.game2btn.addEventListener('click', this.setCards);
      return this.library.game3btn.addEventListener('click', this.setCards);
    };

    U1A6.prototype.clearButtons = function() {
      this.library.game1btn.blink(false);
      this.library.game2btn.blink(false);
      this.library.game3btn.blink(false);
      this.library.game1btn.removeEventListener('click', this.setCards);
      this.library.game2btn.removeEventListener('click', this.setCards);
      return this.library.game3btn.removeEventListener('click', this.setCards);
    };

    U1A6.prototype.evaluateAnswer = function(e) {
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

    U1A6.prototype.finishEvaluation = function() {
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

    U1A6.prototype.nextEvaluation = function() {
      this.index++;
      this.library.score.plusOne();
      if (this.index < this.cards.length / 2) {
        this.selected = new Array();
        return createjs.Sound.play('good');
      } else {
        return this.finish();
      }
    };

    U1A6.prototype.finish = function() {
      clearInterval(this.timer);
      TweenLite.to([this.library.game1btn, this.library.game2btn, this.library.game3btn], 1, {
        alpha: 0
      });
      TweenLite.to(this.library.juego, 1, {
        alpha: 0,
        y: this.library.juego.y - 20
      });
      return U1A6.__super__.finish.apply(this, arguments);
    };

    window.U1A6 = U1A6;

    return U1A6;

  })(Oda);

}).call(this);
