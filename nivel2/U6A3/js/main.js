(function() {
  var U6A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U6A3 = (function(_super) {
    __extends(U6A3, _super);

    function U6A3() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.clearEvaluation = __bind(this.clearEvaluation, this);
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
          id: 'aBank',
          src: 'a-bank.png'
        }, {
          id: 'aBusstop',
          src: 'a-bus-stop.png'
        }, {
          id: 'aCandystore',
          src: 'a-candy-store.png'
        }, {
          id: 'aGasstation',
          src: 'a-gas-station.png'
        }, {
          id: 'aGrocerystore',
          src: 'a-grocery-store.png'
        }, {
          id: 'aHospital',
          src: 'a-hospital.png'
        }, {
          id: 'aLibrary',
          src: 'a-library.png'
        }, {
          id: 'aMovietheater',
          src: 'a-movie-theater.png'
        }, {
          id: 'aPetstore',
          src: 'a-pet-store.png'
        }, {
          id: 'aPolicestation',
          src: 'a-police-station.png'
        }, {
          id: 'aPostoffice',
          src: 'a-post-office.png'
        }, {
          id: 'aRestaurant',
          src: 'a-restaurant.png'
        }, {
          id: 'aShoestore',
          src: 'a-shoe-store.png'
        }, {
          id: 'anAnimalhospital',
          src: 'an-animal-hospital.png'
        }, {
          id: 'anInternetcafe',
          src: 'an-Internet-cafe.png'
        }, {
          id: 'n1',
          src: 'tag_preposition.png'
        }, {
          id: 'n2',
          src: 'tag_words.png'
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
          src: 'sounds/TU2_U6_A3_Instructions.mp3',
          id: 'instructions'
        }
      ];
      this.game = {
        steps: [
          {
            img: 'aBank',
            frase: 'I need some money',
            targets: ['a', 'bank']
          }, {
            img: 'aBusstop',
            frase: 'I need to take a bus.',
            targets: ['a', 'bus', 'stop']
          }, {
            img: 'aCandystore',
            frase: 'I want a box of chocolates.',
            targets: ['a', 'candy', 'store']
          }, {
            img: 'aGasstation',
            frase: 'I need some gas.',
            targets: ['a', 'gas', 'station']
          }, {
            img: 'aGrocerystore',
            frase: 'I need some groceries.',
            targets: ['a', 'grocery', 'store']
          }, {
            img: 'aHospital',
            frase: 'I need a doctor',
            targets: ['a', 'hospital']
          }, {
            img: 'aLibrary',
            frase: 'I need a book',
            targets: ['a', 'library']
          }, {
            img: 'aMovietheater',
            frase: 'I want to watch a movie.',
            targets: ['a', 'movie', 'theater']
          }, {
            img: 'aPetstore',
            frase: 'I need some dog food.',
            targets: ['a', 'pet', 'store']
          }, {
            img: 'aPolicestation',
            frase: 'I have a problem! I need some help!',
            targets: ['a', 'police', 'station']
          }, {
            img: 'aPostoffice',
            frase: 'I need to send a postcard.',
            targets: ['a', 'post', 'office']
          }, {
            img: 'aShoestore',
            frase: 'I need some sandals.',
            targets: ['a', 'shoe', 'store']
          }, {
            img: 'anInternetcafe',
            frase: 'I need to send an e-mail.',
            targets: ['an', 'Internet', 'cafe']
          }
        ],
        opt1: [
          {
            i: 1,
            t: 'a',
            x: 52,
            y: 30
          }, {
            i: 2,
            t: 'an',
            x: 88,
            y: 60
          }
        ],
        opt2: [
          {
            i: 1,
            t: 'cafe',
            x: 40,
            y: 50
          }, {
            i: 2,
            t: 'stop',
            x: 48,
            y: 140
          }, {
            i: 3,
            t: 'library',
            x: 130,
            y: 90
          }, {
            i: 4,
            t: 'grocery',
            x: 148,
            y: 170
          }, {
            i: 5,
            t: 'police',
            x: 112,
            y: 214
          }, {
            i: 6,
            t: 'candy',
            x: 248,
            y: 52
          }, {
            i: 7,
            t: 'post',
            x: 282,
            y: 120
          }, {
            i: 8,
            t: 'animal',
            x: 304,
            y: 210
          }, {
            i: 9,
            t: 'bus',
            x: 400,
            y: 42
          }, {
            i: 10,
            t: 'theater',
            x: 378,
            y: 132
          }, {
            i: 11,
            t: 'pet',
            x: 506,
            y: 66
          }, {
            i: 12,
            t: 'shoe',
            x: 480,
            y: 200
          }, {
            i: 13,
            t: 'gas',
            x: 606,
            y: 50
          }, {
            i: 14,
            t: 'station',
            x: 546,
            y: 142
          }, {
            i: 15,
            t: 'store',
            x: 654,
            y: 92
          }, {
            i: 16,
            t: 'hospital',
            x: 610,
            y: 208
          }, {
            i: 17,
            t: 'bank',
            x: 756,
            y: 50
          }, {
            i: 18,
            t: 'internet',
            x: 726,
            y: 150
          }, {
            i: 19,
            t: 'movie',
            x: 766,
            y: 222
          }, {
            i: 20,
            t: 'office',
            x: 836,
            y: 96
          }
        ]
      };
      U6A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U6A3.prototype.setStage = function() {
      var imgs, step, stepsimg;
      U6A3.__super__.setStage.apply(this, arguments);
      this.steps = this.shuffleNoRepeat(this.game.steps, 11);
      this.intento = 0;
      stepsimg = (function() {
        var _i, _len, _ref, _results;
        _ref = this.steps;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          step = _ref[_i];
          _results.push(step.img);
        }
        return _results;
      }).call(this);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Read and drag the words to make questions.', 80, 200);
      imgs = this.createSprite('images', stepsimg, null, stageSize.w / 2, 470, 'mc');
      imgs.scaleX = imgs.scaleY = 0.7;
      this.addToMain(imgs);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 10, 0));
      return this.setDropper(1).setNube1().setNube2().introEvaluation();
    };

    U6A3.prototype.setDropper = function(step) {
      var dropper, frase, h, i, isThere, question, _i, _ref;
      this.step = step;
      if (this.library.dropper) {
        dropper = this.library.dropper;
      } else {
        dropper = new createjs.Container();
        dropper.y = this.library.images.y + 20;
        dropper.name = 'dropper';
        this.addToMain(dropper);
      }
      dropper.removeAllChildren();
      frase = this.createText('frase', this.steps[step - 1].frase, '48px Quicksand', '#333', 380, 220, 'center');
      this.addToLibrary(frase);
      dropper.addChild(frase);
      isThere = this.createText('isThere', 'Is there', '48px Quicksand', '#333', 0, 300);
      dropper.addChild(isThere);
      for (i = _i = 0, _ref = this.steps[step - 1].targets.length - 1; _i <= _ref; i = _i += 1) {
        h = new WordContainer("h" + i, '', '#FFF', '#F00', 220 * i + isThere.getMeasuredWidth() + 20, 310, 200, 44);
        h.index = i;
        dropper.addChild(h);
        this.addToLibrary(h);
      }
      question = this.createText('q', '?', '48px Quicksand', '#333', this.steps[step - 1].targets.length * 230 + isThere.getMeasuredWidth() - 20, 300);
      dropper.addChild(question);
      dropper.x = stageSize.w / 2 - (question.x + question.getMeasuredWidth()) / 2;
      return this;
    };

    U6A3.prototype.setNube1 = function() {
      var back, container, d, opt, _i, _len, _ref;
      container = new createjs.Container();
      container.x = 300;
      container.y = this.library.dropper.y + 400;
      container.name = 'nube1';
      back = this.createBitmap('backNube1', 'n1', 0, 0);
      container.addChild(back);
      _ref = this.game.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        d = new DroppableText("n1d" + opt.i, opt.t, opt.t, opt.x, opt.y, this.stage);
        container.addChild(d);
        this.addToLibrary(d);
      }
      this.addToMain(container);
      return this;
    };

    U6A3.prototype.setNube2 = function() {
      var back, container, d, opt, _i, _len, _ref;
      container = new createjs.Container();
      container.x = 500;
      container.y = this.library.dropper.y + 400;
      container.name = 'nube2';
      back = this.createBitmap('backNube2', 'n2', 0, 0);
      container.addChild(back);
      _ref = this.game.opt2;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        d = new DroppableText("n2d" + opt.i, opt.t, opt.t, opt.x, opt.y, this.stage);
        container.addChild(d);
        this.addToLibrary(d);
      }
      this.addToMain(container);
      return this;
    };

    U6A3.prototype.introEvaluation = function() {
      U6A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library.dropper, 1, {
        alpha: 0,
        y: this.library.dropper.y + 40,
        delay: 0.7
      });
      TweenLite.from(this.library.images, 1, {
        alpha: 0,
        y: this.library.images.y + 40,
        delay: 0.7
      });
      TweenLite.from(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y + 40,
        delay: 0.9
      });
      return TweenLite.from(this.library.nube2, 1, {
        alpha: 0,
        y: this.library.nube2.y + 40,
        delay: 1.1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U6A3.prototype.initEvaluation = function(e) {
      var opt, _i, _j, _len, _len1, _ref, _ref1, _results;
      U6A3.__super__.initEvaluation.apply(this, arguments);
      _ref = this.game.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        this.library["n1d" + opt.i].updateDrops(this.library.h0);
        this.library["n1d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        this.library["n1d" + opt.i].initDragListener();
      }
      _ref1 = this.game.opt2;
      _results = [];
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        opt = _ref1[_j];
        if (this.steps[this.step - 1].targets.length === 3) {
          this.library["n2d" + opt.i].updateDrops(this.library.h1, this.library.h2);
        } else {
          this.library["n2d" + opt.i].updateDrops(this.library.h1);
        }
        this.library["n2d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        _results.push(this.library["n2d" + opt.i].initDragListener());
      }
      return _results;
    };

    U6A3.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      this.drop = e.drop;
      if (this.answer.index === this.steps[this.step - 1].targets[this.drop.index]) {
        this.answer.visible = false;
        this.drop.changeText(this.answer.index);
        createjs.Sound.play('good');
        return this.finishEvaluation();
      } else {
        this.warning();
        this.intento++;
        console.log(this.intento);
        this.answer.returnToPlace();
        if (this.intento === 2) {
          this.intento = 0;
          return this.clearEvaluation();
        }
      }
    };

    U6A3.prototype.finishEvaluation = function() {
      if (this.steps[this.step - 1].targets.length === 3) {
        if (this.library.h0.text.text === '' || this.library.h1.text.text === '' || this.library.h2.text.text === '') {
          return;
        }
      } else {
        if (this.library.h0.text.text === '' || this.library.h1.text.text === '') {
          return;
        }
      }
      this.library['score'].plusOne();
      this.intento = 0;
      return setTimeout(this.clearEvaluation, 1 * 1000);
    };

    U6A3.prototype.clearEvaluation = function(e) {
      var opt, _i, _j, _len, _len1, _ref, _ref1;
      _ref = this.game.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        this.library["n1d" + opt.i].visible = true;
        this.library["n1d" + opt.i].returnToPlace();
      }
      _ref1 = this.game.opt2;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        opt = _ref1[_j];
        this.library["n2d" + opt.i].visible = true;
        this.library["n2d" + opt.i].returnToPlace();
      }
      TweenLite.to(this.library.dropper, 0.5, {
        alpha: 0,
        y: this.library.dropper.y + 40
      });
      return TweenLite.to(this.library.images, 0.5, {
        scaleX: 1,
        scaleY: 1,
        alpha: 0,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U6A3.prototype.nextEvaluation = function() {
      var opt, _i, _j, _len, _len1, _ref, _ref1, _results;
      this.index++;
      if (this.index < this.steps.length) {
        this.library.images.gotoAndStop(this.index);
        this.setDropper(this.index + 1);
        TweenLite.to(this.library.dropper, 0.5, {
          alpha: 1,
          y: this.library.images.y + 40
        });
        TweenLite.to(this.library.images, 0.5, {
          scaleX: 0.7,
          scaleY: 0.7,
          alpha: 1,
          ease: Back.easeOut
        });
        _ref = this.game.opt1;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          opt = _ref[_i];
          this.library["n1d" + opt.i].updateDrops(this.library.h0);
        }
        _ref1 = this.game.opt2;
        _results = [];
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          opt = _ref1[_j];
          if (this.steps[this.step - 1].targets.length === 3) {
            _results.push(this.library["n2d" + opt.i].updateDrops(this.library.h1, this.library.h2));
          } else {
            _results.push(this.library["n2d" + opt.i].updateDrops(this.library.h1));
          }
        }
        return _results;
      } else {
        return this.finish();
      }
    };

    U6A3.prototype.finish = function() {
      TweenLite.to(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y + 40
      });
      TweenLite.to(this.library.nube2, 1, {
        alpha: 0,
        y: this.library.nube2.y + 40
      });
      return U6A3.__super__.finish.apply(this, arguments);
    };

    window.U6A3 = U6A3;

    return U6A3;

  })(Oda);

}).call(this);
