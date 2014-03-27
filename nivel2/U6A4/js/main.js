(function() {
  var U6A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U6A4 = (function(_super) {
    __extends(U6A4, _super);

    function U6A4() {
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
          id: 'library',
          src: 'library.png'
        }, {
          id: 'park',
          src: 'park.png'
        }, {
          id: 'playingpark',
          src: 'playing-park.png'
        }, {
          id: 'policestation',
          src: 'police-station.png'
        }, {
          id: 'restaurant',
          src: 'restaurant.png'
        }, {
          id: 'sendingmails',
          src: 'sending-mails.png'
        }, {
          id: 'shoppinggrocery',
          src: 'shopping-grocery.png'
        }, {
          id: 'shoppingmall',
          src: 'shopping-mall.png'
        }, {
          id: 'waitingbus',
          src: 'waiting-bus.png'
        }, {
          id: 'watchingmovie',
          src: 'watching-movie.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/TU2_U6_A4_Instructions.mp3',
          id: 'instructions'
        }
      ];
      this.game = {
        steps: [
          {
            txt: 'They are waiting at the bus stop',
            img: 'waitingbus'
          }, {
            txt: 'They are watching a movie at the movie theater',
            img: 'watchingmovie'
          }, {
            txt: 'She is shopping at the grocery store',
            img: 'shoppinggrocery'
          }, {
            txt: 'They are reading a book at the park',
            img: 'park'
          }, {
            txt: 'She is checking out books at the library',
            img: 'library'
          }, {
            txt: 'They are asking for help at the police station',
            img: 'policestation'
          }, {
            txt: 'He is eating dinner at a restaurant',
            img: 'restaurant'
          }
        ]
      };
      U6A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U6A4.prototype.setStage = function() {
      U6A4.__super__.setStage.apply(this, arguments);
      this.success = 1;
      this.steps = this.shuffle(this.game.steps);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look at the pictures and unscramble the words to make sentences.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 8, 0));
      return this.setScenario(1).introEvaluation();
    };

    U6A4.prototype.setScenario = function(sce) {
      var scenario, v;
      if (this.library.scenario) {
        scenario = this.library.scenario;
      } else {
        scenario = new createjs.Container();
        scenario.name = 'scenario';
      }
      scenario.removeAllChildren();
      scenario.alpha = 1;
      v = this.createBitmap(this.steps[sce - 1].img, this.steps[sce - 1].img, stageSize.w / 2, stageSize.h / 2 - 100, 'mc');
      v.scaleX = v.scaleY = 0.7;
      scenario.addChild(v);
      this.addToLibrary(scenario);
      this.addToMain(scenario);
      return this;
    };

    U6A4.prototype.introEvaluation = function() {
      U6A4.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenLite.from(this.library.scenario, 0.5, {
        alpha: 0,
        y: this.library.scenario.y + 40,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U6A4.prototype.initEvaluation = function(e) {
      U6A4.__super__.initEvaluation.apply(this, arguments);
      return this.setQuestion(this.index);
    };

    U6A4.prototype.setQuestion = function(question) {
      var col, frase, i, palabra, palabras, wc, _i, _ref;
      palabras = new createjs.Container();
      frase = new createjs.Container();
      col = this.steps[this.index].txt.split(' ');
      this.scrambled = this.shuffle(col);
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.scrambled[i - 1] !== ' ') {
          palabra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 180, 0);
          palabra.text.font = '40px Quicksand';
          palabra.text.textAlign = 'center';
          palabra.createHitArea(160, 60);
          palabra.addEventListener('drop', this.evaluateAnswer);
          palabra.onInitEvaluation();
          this.addToLibrary(palabra);
          palabras.addChild(palabra);
        }
        if (col[i - 1] !== ' ') {
          wc = new WordContainer("l" + i, '', 'rgba(238,238,238,0.3)', '#F00', i * 200, 0, 180, 60);
          wc.index = col[i - 1];
          wc.hitter = null;
          wc.addEventListener('mousedown', function(e) {
            var cwc;
            cwc = e.currentTarget;
            return cwc.addEventListener('pressmove', function(ev) {
              if (cwc.hitter) {
                cwc.changeText('');
                cwc.hitter.visible = true;
                return cwc.hitter.returnToPlace();
              }
            });
          });
          this.addToLibrary(wc);
          frase.addChild(wc);
        }
      }
      frase.name = 'frase';
      frase.y = 840;
      frase.x = stageSize.w / 2 - this.scrambled.length * 200 / 2 - 100;
      this.addToMain(frase);
      palabras.name = 'palabras';
      palabras.y = 740;
      palabras.x = stageSize.w / 2 - this.scrambled.length * 180 / 2;
      this.addToMain(palabras);
      return TweenLite.from([frase, palabras], 1, {
        alpha: 0
      });
    };

    U6A4.prototype.evaluateAnswer = function(e) {
      var dropped, i, pt, _i, _ref;
      this.answer = e.target;
      dropped = false;
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.library["l" + i]) {
          pt = this.library["l" + i].globalToLocal(this.stage.mouseX, this.stage.mouseY);
          if (this.library["l" + i].hitTest(pt.x, pt.y)) {
            if (this.library["l" + i].text.text === '') {
              this.answer.visible = false;
              this.library["l" + i].hitter = this.answer;
              this.library["l" + i].changeText(this.answer.index);
              dropped = true;
            }
          }
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace();
      } else {
        return this.finishEvaluation();
      }
    };

    U6A4.prototype.finishEvaluation = function() {
      var col, i, _i, _j, _k, _ref, _ref1, _ref2;
      col = this.steps[this.index].txt.split(' ');
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.library["l" + i]) {
          if (this.library["l" + i].text.text === '') {
            return;
          }
        }
      }
      for (i = _j = 1, _ref1 = this.scrambled.length; 1 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 1 <= _ref1 ? ++_j : --_j) {
        if (this.library["l" + i]) {
          if (this.library["l" + i].text.text !== col[i - 1]) {
            this.success = 0;
          }
        }
      }
      if (this.success === 1) {
        createjs.Sound.play('good');
        this.library.score.plusOne();
      } else {
        createjs.Sound.play('wrong');
        this.success = 1;
        for (i = _k = 1, _ref2 = this.scrambled.length; 1 <= _ref2 ? _k <= _ref2 : _k >= _ref2; i = 1 <= _ref2 ? ++_k : --_k) {
          this.library["l" + i].text.text = col[i - 1];
        }
      }
      return setTimeout(this.nextEvaluation, 2 * 1000);
    };

    U6A4.prototype.nextEvaluation = function() {
      TweenLite.to(this.library.scenario, 0.5, {
        alpha: 0
      });
      TweenLite.to(this.library.palabras, 1, {
        alpha: 0,
        y: this.library.palabras.y - 40,
        ease: Back.easeOut
      });
      TweenLite.to(this.library.frase, 1, {
        alpha: 0,
        y: this.library.frase.y - 40,
        ease: Back.easeOut
      });
      this.index++;
      if (this.index < this.steps.length) {
        this.setQuestion(this.index);
        this.setScenario(this.index + 1);
        TweenLite.from(this.library.scenario, 0.5, {
          alpha: 1
        });
        TweenLite.to(this.library.palabras, 1, {
          alpha: 1,
          ease: Back.easeOut
        });
        return TweenLite.to(this.library.frase, 1, {
          alpha: 1,
          ease: Back.easeOut
        });
      } else {
        return this.finish();
      }
    };

    U6A4.prototype.finish = function() {
      return U6A4.__super__.finish.apply(this, arguments);
    };

    window.U6A4 = U6A4;

    return U6A4;

  })(Oda);

}).call(this);
