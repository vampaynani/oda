// Generated by CoffeeScript 1.6.3
(function() {
  var U8A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A1 = (function(_super) {
    __extends(U8A1, _super);

    function U8A1() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.clearEvaluation = __bind(this.clearEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
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
          id: 'imgballon',
          src: 'img_ballon.png'
        }, {
          id: 'imgbus',
          src: 'img_bus.png'
        }, {
          id: 'imgicecream',
          src: 'img_icecream.png'
        }, {
          id: 'imgmovies',
          src: 'img_movies.png'
        }, {
          id: 'imgocean',
          src: 'img_ocean.png'
        }, {
          id: 'imgpizza',
          src: 'img_pizza.png'
        }, {
          id: 'imgsandcastle',
          src: 'img_sandcastle.png'
        }, {
          id: 'imgscuba',
          src: 'img_scuba.png'
        }, {
          id: 'imgshopping',
          src: 'img_shopping.png'
        }, {
          id: 'imgvolleyball',
          src: 'img_volleyball.png'
        }, {
          id: 'bg',
          src: 'prop_bg.png'
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
          src: 'sounds/TU3_U8_A1_Instructions.mp3',
          id: 'instructions'
        }
      ];
      this.game = {
        steps: [
          {
            img: 'imgballon',
            frase: 'What are they going to buy?',
            targets: ['they', 'are', 'going', 'to', 'buy', 'a', 'balloon'],
            x: 473,
            y: 317
          }, {
            img: 'imgbus',
            frase: 'What is she going to do?',
            targets: ['She', 'is', 'going', 'to', 'catch', 'the', 'bus'],
            x: 390,
            y: 462
          }, {
            img: 'imgicecream',
            frase: 'What is she going to do?',
            targets: ['She', 'is', 'going', 'to', 'buy', 'an', 'ice cream'],
            x: 188,
            y: 259
          }, {
            img: 'imgmovies',
            frase: 'Where is going to go?',
            targets: ['He', 'is', 'going', 'to', 'go', 'to', 'the', 'movies'],
            x: 697,
            y: 421
          }, {
            img: 'imgocean',
            frase: 'What are they going to do?',
            targets: ['They', 'are', 'going', 'to', 'swim', 'in', 'the', 'ocean'],
            x: 314,
            y: 264
          }, {
            img: 'imgpizza',
            frase: 'What are they going to do?',
            targets: ['They', 'are', 'going', 'to', 'eat', 'pizza'],
            x: 229,
            y: 412
          }, {
            img: 'imgsandcastle',
            frase: 'What is he going to do?',
            targets: ['He', 'is', 'going', 'to', 'build', 'a', 'sandcastle'],
            x: 552,
            y: 305
          }, {
            img: 'imgscuba',
            frase: 'what are they going to do?',
            targets: ['They', 'are', 'going', 'to', 'go', 'scuba diving'],
            x: 693,
            y: 235
          }, {
            img: 'imgshopping',
            frase: 'What is he going to do?',
            targets: ['He', 'is', 'going', 'to', 'go', 'shopping'],
            x: 557,
            y: 422
          }, {
            img: 'imgvolleyball',
            frase: 'What is going to do?',
            targets: ['She', 'is', 'going', 'to', 'hit', 'the', 'ball'],
            x: 445,
            y: 351
          }
        ],
        opt1: [
          {
            i: 1,
            t: 'swim',
            x: 0,
            y: 0
          }, {
            i: 2,
            t: 'ball',
            x: 0,
            y: 0
          }, {
            i: 3,
            t: 'he',
            x: 0,
            y: 0
          }, {
            i: 4,
            t: 'is',
            x: 0,
            y: 0
          }, {
            i: 5,
            t: 'movies',
            x: 0,
            y: 0
          }, {
            i: 6,
            t: 'an',
            x: 0,
            y: 0
          }, {
            i: 7,
            t: 'balloon',
            x: 0,
            y: 0
          }, {
            i: 8,
            t: 'ice cream',
            x: 0,
            y: 0
          }, {
            i: 9,
            t: 'how',
            x: 0,
            y: 0
          }, {
            i: 10,
            t: 'scuba diving',
            x: 0,
            y: 0
          }, {
            i: 11,
            t: 'she',
            x: 0,
            y: 0
          }, {
            i: 12,
            t: 'jump',
            x: 0,
            y: 0
          }, {
            i: 13,
            t: 'a',
            x: 0,
            y: 0
          }, {
            i: 14,
            t: 'eat',
            x: 0,
            y: 0
          }, {
            i: 15,
            t: 'going',
            x: 0,
            y: 0
          }, {
            i: 16,
            t: 'what',
            x: 0,
            y: 0
          }, {
            i: 17,
            t: 'to',
            x: 0,
            y: 0
          }, {
            i: 18,
            t: 'shooping',
            x: 0,
            y: 0
          }, {
            i: 19,
            t: 'are',
            x: 0,
            y: 0
          }, {
            i: 20,
            t: 'do',
            x: 0,
            y: 0
          }, {
            i: 21,
            t: 'they',
            x: 0,
            y: 0
          }, {
            i: 22,
            t: 'in ',
            x: 0,
            y: 0
          }, {
            i: 23,
            t: 'build',
            x: 0,
            y: 0
          }, {
            i: 24,
            t: 'ocean',
            x: 0,
            y: 0
          }, {
            i: 25,
            t: 'buy',
            x: 0,
            y: 0
          }, {
            i: 26,
            t: 'sandcastle',
            x: 0,
            y: 0
          }, {
            i: 27,
            t: 'bus',
            x: 0,
            y: 0
          }, {
            i: 28,
            t: 'go',
            x: 0,
            y: 0
          }, {
            i: 29,
            t: 'the',
            x: 0,
            y: 0
          }, {
            i: 30,
            t: 'hit',
            x: 0,
            y: 0
          }, {
            i: 31,
            t: 'pizza',
            x: 0,
            y: 0
          }, {
            i: 32,
            t: 'catch',
            x: 0,
            y: 0
          }
        ]
      };
      U8A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A1.prototype.setStage = function() {
      var imgs, step, stepsimg;
      U8A1.__super__.setStage.apply(this, arguments);
      this.steps = this.game.steps;
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
      this.insertInstructions('instructions', 'Read and drag the words to make questions.', 40, 100);
      imgs = this.createSprite('images', stepsimg, null, stageSize.w / 2, 235, 'mc');
      imgs.scaleX = imgs.scaleY = 0.3;
      this.addToMain(imgs);
      this.insertBitmap('bg', 'bg', 132, 187);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 10, 0));
      this.setCharacters();
      return this.setDropper(1).setNube1().introEvaluation();
    };

    U8A1.prototype.setCharacters = function() {
      var i, p, _i, _ref, _results;
      _results = [];
      for (i = _i = 1, _ref = this.steps.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        p = this.createBitmap("img" + i, this.steps[i - 1].img, this.steps[i - 1].x, this.steps[i - 1].y, 'mr');
        this.addToLibrary(p);
        p.scaleY = p.scaleX = 0.5;
        _results.push(this.addToMain(p));
      }
      return _results;
    };

    U8A1.prototype.setDropper = function(step) {
      var dropper, frase, h, i, _i, _ref;
      this.step = step;
      if (this.library.dropper) {
        dropper = this.library.dropper;
      } else {
        dropper = new createjs.Container();
        dropper.y = 400;
        dropper.name = 'dropper';
        this.addToMain(dropper);
      }
      dropper.removeAllChildren();
      frase = this.createText('frase', this.steps[step - 1].frase, '24px Quicksand', '#333', 0, 120, 'center');
      frase.x = stageSize.w / 2 - frase.getMeasuredWidth() / 2 + 50;
      this.addToLibrary(frase);
      dropper.addChild(frase);
      for (i = _i = 0, _ref = this.steps[step - 1].targets.length - 1; _i <= _ref; i = _i += 1) {
        h = new WordContainer("h" + i, '', '#FFF', '#F00', 90 * i + 10, 155, 80, 22);
        h.index = i;
        dropper.addChild(h);
        this.addToLibrary(h);
      }
      dropper.x = stageSize.w / 2 - this.steps[step - 1].targets.length * 95 / 2 + 50;
      return this;
    };

    U8A1.prototype.setNube1 = function() {
      var container, d, equis, opt, ye, _i, _len, _ref;
      container = new createjs.Container();
      container.x = 110;
      container.y = 126;
      container.name = 'nube1';
      ye = 20;
      equis = 0;
      _ref = this.game.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        if (opt.i <= 10) {
          ye = 0;
        } else if (opt.i >= 23) {
          ye = 40;
        } else {
          ye = 20;
        }
        d = new DroppableText("n1d" + opt.i, opt.t, opt.t, equis, ye, this.stage);
        equis = equis + d.text.getMeasuredWidth() + 30;
        container.addChild(d);
        this.addToLibrary(d);
        if (opt.i === 10) {
          equis = 15;
        }
        if (opt.i === 22) {
          equis = 40;
        }
      }
      this.addToMain(container);
      return this;
    };

    U8A1.prototype.introEvaluation = function() {
      var opt, _i, _len, _ref, _results,
        _this = this;
      U8A1.__super__.introEvaluation.apply(this, arguments);
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
        y: this.library.dropper.y + 20,
        delay: 0.7
      });
      TweenLite.from(this.library.images, 1, {
        alpha: 0,
        y: this.library.images.y + 20,
        delay: 0.7
      });
      TweenLite.from(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y + 20,
        delay: 0.9
      });
      ({
        initEvaluation: function(e) {}
      });
      U8A1.__super__.introEvaluation.apply(this, arguments);
      _ref = this.game.opt1;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        this.library["n1d" + opt.i].updateDrops(this.library.h0);
        this.library["n1d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        _results.push(this.library["n1d" + opt.i].initDragListener());
      }
      return _results;
    };

    U8A1.prototype.evaluateAnswer = function(e) {
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

    U8A1.prototype.finishEvaluation = function() {
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

    U8A1.prototype.clearEvaluation = function(e) {
      var opt, _i, _len, _ref;
      _ref = this.game.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        this.library["n1d" + opt.i].visible = true;
        this.library["n1d" + opt.i].returnToPlace();
      }
      TweenLite.to(this.library.dropper, 0.5, {
        alpha: 0,
        y: this.library.dropper.y + 20
      });
      return TweenLite.to(this.library.images, 0.5, {
        scaleX: 1,
        scaleY: 1,
        alpha: 0,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U8A1.prototype.nextEvaluation = function() {
      var opt, _i, _len, _ref, _results;
      this.index++;
      if (this.index < this.steps.length) {
        this.library.images.currentFrame = this.index;
        this.setDropper(this.index + 1);
        TweenLite.to(this.library.dropper, 0.5, {
          alpha: 1,
          y: this.library.images.y + 10
        });
        TweenLite.to(this.library.images, 0.5, {
          scaleX: 0.3,
          scaleY: 0.3,
          alpha: 1,
          ease: Back.easeOut
        });
        _ref = this.game.opt1;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          opt = _ref[_i];
          _results.push(this.library["n1d" + opt.i].updateDrops(this.library.h0));
        }
        return _results;
      } else {
        return this.finish();
      }
    };

    U8A1.prototype.finish = function() {
      TweenLite.to(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y + 20
      });
      TweenLite.to(this.library.nube2, 1, {
        alpha: 0,
        y: this.library.nube2.y + 20
      });
      return U8A1.__super__.finish.apply(this, arguments);
    };

    window.U8A1 = U8A1;

    return U8A1;

  })(Oda);

}).call(this);
