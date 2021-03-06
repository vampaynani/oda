(function() {
  var U8A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A1 = (function(_super) {
    __extends(U8A1, _super);

    function U8A1() {
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
          id: 'game1Box',
          src: 'game1/box.png'
        }, {
          id: 'game1Chopsticks',
          src: 'game1/chopsticks.png'
        }, {
          id: 'game1Chopsticks2',
          src: 'game1/chopsticks2.png'
        }, {
          id: 'game1Cookie',
          src: 'game1/cookie.png'
        }, {
          id: 'game1Doll',
          src: 'game1/doll.png'
        }, {
          id: 'game1Doll2',
          src: 'game1/doll2.png'
        }, {
          id: 'game1Fan',
          src: 'game1/fan.png'
        }, {
          id: 'game1Fan2',
          src: 'game1/fan2.png'
        }, {
          id: 'game1Fourtunecookie',
          src: 'game1/cookie2.png'
        }, {
          id: 'game1Mask',
          src: 'game1/mask.png'
        }, {
          id: 'game1Mask2',
          src: 'game1/mask2.png'
        }, {
          id: 'game1Necklace2',
          src: 'game1/necklace2.png'
        }, {
          id: 'game1Puppet',
          src: 'game1/puppet.png'
        }, {
          id: 'game1Box2',
          src: 'game1/treasure-box.png'
        }, {
          id: 'game1Puppet2',
          src: 'game1/wooden-puppet.png'
        }, {
          id: 'game1Necklace',
          src: 'game1/Necklace.png'
        }, {
          id: 'game2Australia2',
          src: 'game2/australia2.png'
        }, {
          id: 'game2Australia',
          src: 'game2/australia.png'
        }, {
          id: 'game2Brazil',
          src: 'game2/brazil.png'
        }, {
          id: 'game2Brazil2',
          src: 'game2/brazil2.png'
        }, {
          id: 'game2Canada2',
          src: 'game2/canada2.png'
        }, {
          id: 'game2Canada',
          src: 'game2/canada.png'
        }, {
          id: 'game2China2',
          src: 'game2/china2.png'
        }, {
          id: 'game2China',
          src: 'game2/china.png'
        }, {
          id: 'game2France2',
          src: 'game2/france2.png'
        }, {
          id: 'game2France',
          src: 'game2/france.png'
        }, {
          id: 'game2Germany2',
          src: 'game2/germany2.png'
        }, {
          id: 'game2Germany',
          src: 'game2/germany.png'
        }, {
          id: 'game2India2',
          src: 'game2/india2.png'
        }, {
          id: 'game2India',
          src: 'game2/india.png'
        }, {
          id: 'game2Mexico',
          src: 'game2/mexico.png'
        }, {
          id: 'game2Mexico2',
          src: 'game2/mexico2.png'
        }, {
          id: 'game3035',
          src: 'game3/0-35.png'
        }, {
          id: 'game3050',
          src: 'game3/0-50.png'
        }, {
          id: 'game3n1160',
          src: 'game3/11-60.png'
        }, {
          id: 'game3n1340',
          src: 'game3/13-40.png'
        }, {
          id: 'game3n1600',
          src: 'game3/16-00.png'
        }, {
          id: 'game3n2150',
          src: 'game3/21-50.png'
        }, {
          id: 'game3n2510',
          src: 'game3/25-10.png'
        }, {
          id: 'game3n3210',
          src: 'game3/32-10.png'
        }, {
          id: 'game3Evelendollarsandsixtycents',
          src: 'game3/evelen-dollars-and-sixty-cents.png'
        }, {
          id: 'game3Fidtycents',
          src: 'game3/fidty-cents.png'
        }, {
          id: 'game3Sixteendollars',
          src: 'game3/sixteen-dollars.png'
        }, {
          id: 'game3Thirteendollarsandfortycents',
          src: 'game3/thirteen-dollars-and-forty-cents.png'
        }, {
          id: 'game3Thirtyfivecents',
          src: 'game3/thirty-five-cents.png'
        }, {
          id: 'game3Thirtytwodollarsandten',
          src: 'game3/thirty-two-dollars-and-ten-cents.png'
        }, {
          id: 'game3Twentyfivedollarsandtencent',
          src: 'game3/twenty-five-dollars-and-ten-cent.png'
        }, {
          id: 'game3Twentyonedollarsandfiftycents',
          src: 'game3/twenty-one-dollars-and-fifty-cents.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U8_A1_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = [
        [
          {
            id: 'game1Box',
            i: 1
          }, {
            id: 'game1Chopsticks',
            i: 2
          }, {
            id: 'game1Cookie',
            i: 3
          }, {
            id: 'game1Doll',
            i: 4
          }, {
            id: 'game1Fan',
            i: 5
          }, {
            id: 'game1Mask',
            i: 6
          }, {
            id: 'game1Puppet',
            i: 7
          }, {
            id: 'game1Necklace',
            i: 8
          }, {
            id: 'game1Box2',
            i: 1
          }, {
            id: 'game1Chopsticks2',
            i: 2
          }, {
            id: 'game1Fourtunecookie',
            i: 3
          }, {
            id: 'game1Doll2',
            i: 4
          }, {
            id: 'game1Fan2',
            i: 5
          }, {
            id: 'game1Mask2',
            i: 6
          }, {
            id: 'game1Puppet2',
            i: 7
          }, {
            id: 'game1Necklace2',
            i: 8
          }
        ], [
          {
            id: 'game2Australia',
            i: 1
          }, {
            id: 'game2Brazil',
            i: 2
          }, {
            id: 'game2Canada',
            i: 3
          }, {
            id: 'game2China',
            i: 4
          }, {
            id: 'game2France',
            i: 5
          }, {
            id: 'game2Germany',
            i: 6
          }, {
            id: 'game2India',
            i: 7
          }, {
            id: 'game2Mexico',
            i: 8
          }, {
            id: 'game2Australia2',
            i: 1
          }, {
            id: 'game2Brazil2',
            i: 2
          }, {
            id: 'game2Canada2',
            i: 3
          }, {
            id: 'game2China2',
            i: 4
          }, {
            id: 'game2France2',
            i: 5
          }, {
            id: 'game2Germany2',
            i: 6
          }, {
            id: 'game2India2',
            i: 7
          }, {
            id: 'game2Mexico2',
            i: 8
          }
        ], [
          {
            id: 'game3035',
            i: 1
          }, {
            id: 'game3050',
            i: 2
          }, {
            id: 'game3n1160',
            i: 3
          }, {
            id: 'game3n1340',
            i: 4
          }, {
            id: 'game3n1600',
            i: 5
          }, {
            id: 'game3n2150',
            i: 6
          }, {
            id: 'game3n2510',
            i: 7
          }, {
            id: 'game3n3210',
            i: 8
          }, {
            id: 'game3Evelendollarsandsixtycents',
            i: 3
          }, {
            id: 'game3Fidtycents',
            i: 2
          }, {
            id: 'game3Sixteendollars',
            i: 5
          }, {
            id: 'game3Thirteendollarsandfortycents',
            i: 4
          }, {
            id: 'game3Thirtyfivecents',
            i: 1
          }, {
            id: 'game3Thirtytwodollarsandten',
            i: 8
          }, {
            id: 'game3Twentyfivedollarsandtencent',
            i: 7
          }, {
            id: 'game3Twentyonedollarsandfiftycents',
            i: 6
          }
        ]
      ];
      U8A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A1.prototype.setStage = function() {
      var b1, b2, b3;
      U8A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Click on two cards and see if they match.', 80, 200);
      b1 = new Button('game1btn', this.preload.getResult('game1btn'), 1, 1506, 920);
      b2 = new Button('game2btn', this.preload.getResult('game2btn'), 2, 1506, 1010);
      b3 = new Button('game3btn', this.preload.getResult('game3btn'), 3, 1506, 1100);
      this.addToMain(b1, b2, b3);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 100, 0));
      this.clicked = 0;
      return this.introEvaluation();
    };

    U8A1.prototype.setCards = function(e) {
      var b, c, game, h, i, j, juego, _i, _j;
      this.time = 100;
      this.timer = setInterval(this.updateCounter, 1000);
      j = 0;
      game = e.currentTarget.index;
      juego = new createjs.Container();
      juego.x = 400;
      juego.y = 360;
      juego.name = 'juego';
      this.clearButtons();
      this.selected = new Array();
      this.cards = this.shuffle(this.game[game - 1]);
      for (h = _i = 0; _i <= 3; h = ++_i) {
        for (i = _j = 0; _j <= 3; i = ++_j) {
          c = this.createBitmap("carta" + game, "carta" + game, i * 260, h * 220, 'mc');
          b = this.createBitmap("cartab" + game, this.cards[j].id, i * 260, h * 220, 'mc');
          b.scaleX = b.scaleY = 1;
          c.scaleX = c.scaleY = 1;
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
        y: juego.y - 40
      });
      return this;
    };

    U8A1.prototype.updateCounter = function() {
      if (this.clicked === 1) {
        this.time--;
        this.library['score'].updateTotal(this.time);
        if (this.time === 0) {
          return this.finish();
        }
      }
    };

    U8A1.prototype.introEvaluation = function() {
      U8A1.__super__.introEvaluation.apply(this, arguments);
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

    U8A1.prototype.initEvaluation = function(e) {
      U8A1.__super__.initEvaluation.apply(this, arguments);
      this.library.game1btn.blink();
      this.library.game2btn.blink();
      this.library.game3btn.blink();
      this.library.game1btn.addEventListener('click', this.setCards);
      this.library.game2btn.addEventListener('click', this.setCards);
      return this.library.game3btn.addEventListener('click', this.setCards);
    };

    U8A1.prototype.clearButtons = function() {
      this.library.game1btn.blink(false);
      this.library.game2btn.blink(false);
      this.library.game3btn.blink(false);
      this.library.game1btn.removeEventListener('click', this.setCards);
      this.library.game2btn.removeEventListener('click', this.setCards);
      return this.library.game3btn.removeEventListener('click', this.setCards);
    };

    U8A1.prototype.evaluateAnswer = function(e) {
      this.clicked = 1;
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

    U8A1.prototype.finishEvaluation = function() {
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

    U8A1.prototype.nextEvaluation = function() {
      this.index++;
      this.library.score.plusOne();
      if (this.index < this.cards.length / 2) {
        this.selected = new Array();
        return createjs.Sound.play('good');
      } else {
        return this.finish();
      }
    };

    U8A1.prototype.finish = function() {
      clearInterval(this.timer);
      TweenLite.to([this.library.game1btn, this.library.game2btn, this.library.game3btn], 1, {
        alpha: 0
      });
      TweenLite.to(this.library.juego, 1, {
        alpha: 0,
        y: this.library.juego.y - 40
      });
      return U8A1.__super__.finish.apply(this, arguments);
    };

    window.U8A1 = U8A1;

    return U8A1;

  })(Oda);

}).call(this);
