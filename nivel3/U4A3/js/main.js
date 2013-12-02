// Generated by CoffeeScript 1.6.3
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
          id: 'btnConfused',
          src: 'btn_confused.png'
        }, {
          id: 'btnDirty',
          src: 'btn_dirty.png'
        }, {
          id: 'btnEnergetic',
          src: 'btn_energetic.png'
        }, {
          id: 'btnHot',
          src: 'btn_hot.png'
        }, {
          id: 'btnSick',
          src: 'btn_sick.png'
        }, {
          id: 'btnTired',
          src: 'btn_tired.png'
        }, {
          id: 'faceConfused',
          src: 'face_confused.png'
        }, {
          id: 'faceDirty',
          src: 'face_dirty.png'
        }, {
          id: 'faceEnergetic',
          src: 'face_energetic.png'
        }, {
          id: 'faceHot',
          src: 'face_hot.png'
        }, {
          id: 'faceSick',
          src: 'face_sick.png'
        }, {
          id: 'faceTired',
          src: 'face_tired.png'
        }, {
          id: 'n2',
          src: 'tag_answer.png'
        }, {
          id: 'n3',
          src: 'tag_pronoun.png'
        }, {
          id: 'n1',
          src: 'tag_verb.png'
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
            face: 'faceSick',
            img: 'btnSick',
            frase: "When I'm sick, I ",
            targets: ['go', 'to the doctor']
          }, {
            face: 'faceConfused',
            img: 'btnConfused',
            frase: "When I'm confused, I ",
            targets: ['ask', 'my teacher', 'a question']
          }, {
            face: 'faceTired',
            img: 'btnTired',
            frase: "When I'm tired, I ",
            targets: ['go', 'to bed']
          }, {
            face: 'faceHot',
            img: 'btnHot',
            frase: "When I'm hot, I ",
            targets: ['sit', 'in front of', 'a fan']
          }, {
            face: 'faceDirty',
            img: 'btnDirty',
            frase: "When I'm dirty, I ",
            targets: ['take', 'a shower']
          }, {
            face: 'faceEnergetic',
            img: 'btnEnergetic',
            frase: "When I'm energetic, I ",
            targets: ['go', 'roller skating']
          }
        ],
        opt1: [
          {
            i: 1,
            t: 'go',
            x: 31,
            y: 36
          }, {
            i: 2,
            t: 'take',
            x: 69,
            y: 21
          }, {
            i: 3,
            t: 'ask',
            x: 67,
            y: 70
          }, {
            i: 4,
            t: 'sit',
            x: 117,
            y: 47
          }
        ],
        opt2: [
          {
            i: 1,
            t: 'my teacher',
            x: 36,
            y: 36
          }, {
            i: 2,
            t: 'in front of',
            x: 16,
            y: 93
          }, {
            i: 3,
            t: 'to bed',
            x: 67,
            y: 132
          }, {
            i: 4,
            t: 'a shower',
            x: 164,
            y: 25
          }, {
            i: 5,
            t: 'to the doctor',
            x: 116,
            y: 69
          }, {
            i: 6,
            t: 'roller skating',
            x: 134,
            y: 113
          }
        ],
        opt3: [
          {
            i: 1,
            t: 'a question',
            x: 22,
            y: 21
          }, {
            i: 2,
            t: 'a fan',
            x: 43,
            y: 57
          }
        ]
      };
      U6A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U6A3.prototype.setStage = function() {
      var escena, i, step, stepsimg, _i, _ref;
      U6A3.__super__.setStage.apply(this, arguments);
      this.steps = this.shuffleNoRepeat(this.game.steps, 6);
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
      this.insertBitmap('instructions', 'inst', 20, 100);
      for (i = _i = 0, _ref = this.game.steps.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        if (i < 3) {
          escena = this.createSprite('images', stepsimg, null, (215 * i) + 200, 235, 'tc');
        } else {
          escena = this.createSprite('images', stepsimg, null, (215 * i) - 445, 380, 'tc');
        }
        escena.scaleX = escena.scaleY = 0.8;
        escena.currentFrame = i;
        this.addToMain(escena);
      }
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 10, 0));
      return this.setDropper(1).setNube1().setNube2().setNube3().introEvaluation();
    };

    U6A3.prototype.setDropper = function(step) {
      var dropper, face, frase, h, i, question, _i, _ref;
      this.step = step;
      if (this.library.dropper) {
        dropper = this.library.dropper;
      } else {
        dropper = new createjs.Container();
        dropper.x = 70;
        dropper.y = 140;
        dropper.name = 'dropper';
        this.addToMain(dropper);
      }
      dropper.removeAllChildren();
      face = this.createBitmap('face', this.steps[step].face, 0, 0);
      frase = this.createText('frase', this.steps[step - 1].frase, '28px Quicksand', '#333', 100, 20);
      this.addToLibrary(frase);
      dropper.addChild(frase, face);
      for (i = _i = 0, _ref = this.steps[step - 1].targets.length - 1; _i <= _ref; i = _i += 1) {
        h = new WordContainer("h" + i, '', '#FFF', '#F00', (120 * i + 10) + 130 + frase.getMeasuredWidth(), 25, 110, 22);
        h.index = i;
        dropper.addChild(h);
        this.addToLibrary(h);
      }
      question = this.createText('q', '.', '28px Quicksand', '#333', this.steps[step - 1].targets.length * 120 + 140 + frase.getMeasuredWidth(), 20);
      dropper.addChild(question);
      return this;
    };

    U6A3.prototype.setNube1 = function() {
      var back, container, d, opt, _i, _len, _ref;
      container = new createjs.Container();
      container.x = 110;
      container.y = 452;
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
      container.x = 312;
      container.y = 395;
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

    U6A3.prototype.setNube3 = function() {
      var back, container, d, opt, _i, _len, _ref;
      container = new createjs.Container();
      container.x = 626;
      container.y = 459;
      container.name = 'nube3';
      back = this.createBitmap('backNube3', 'n3', 0, 0);
      container.addChild(back);
      _ref = this.game.opt3;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        d = new DroppableText("n3d" + opt.i, opt.t, opt.t, opt.x, opt.y, this.stage);
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
      return TweenLite.from(this.library.nube2, 1, {
        alpha: 0,
        y: this.library.nube2.y + 20,
        delay: 1.1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U6A3.prototype.initEvaluation = function(e) {
      var opt, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2, _results;
      U6A3.__super__.initEvaluation.apply(this, arguments);
      this.library['images'].addEventListener('click', this.evaluateAnswer);
      _ref = this.game.opt1;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        opt = _ref[_i];
        this.library["n1d" + opt.i].updateDrops(this.library.h0);
        this.library["n1d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        this.library["n1d" + opt.i].initDragListener();
      }
      _ref1 = this.game.opt2;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        opt = _ref1[_j];
        this.library["n2d" + opt.i].updateDrops(this.library.h1);
        this.library["n2d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        this.library["n2d" + opt.i].initDragListener();
      }
      _ref2 = this.game.opt3;
      _results = [];
      for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
        opt = _ref2[_k];
        this.library["n3d" + opt.i].updateDrops(this.library.h2);
        this.library["n3d" + opt.i].addEventListener('dropped', this.evaluateAnswer);
        _results.push(this.library["n3d" + opt.i].initDragListener());
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
      var opt, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2;
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
      _ref2 = this.game.opt3;
      for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
        opt = _ref2[_k];
        this.library["n3d" + opt.i].visible = true;
        this.library["n3d" + opt.i].returnToPlace();
      }
      return TweenLite.to(this.library.images, 0.5, {
        scaleX: 1,
        scaleY: 1,
        alpha: 0,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U6A3.prototype.nextEvaluation = function() {
      var opt, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2, _results;
      this.index++;
      if (this.index < this.steps.length) {
        this.library.images.currentFrame = this.index;
        this.setDropper(this.index + 1);
        TweenLite.to(this.library.images, 0.5, {
          scaleX: 0.3,
          scaleY: 0.3,
          alpha: 1,
          ease: Back.easeOut
        });
        _ref = this.game.opt1;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          opt = _ref[_i];
          this.library["n1d" + opt.i].updateDrops(this.library.h0);
        }
        _ref1 = this.game.opt2;
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          opt = _ref1[_j];
          this.library["n2d" + opt.i].updateDrops(this.library.h1);
        }
        _ref2 = this.game.opt3;
        _results = [];
        for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
          opt = _ref2[_k];
          _results.push(this.library["n3d" + opt.i].updateDrops(this.library.h2));
        }
        return _results;
      } else {
        return this.finish();
      }
    };

    U6A3.prototype.finish = function() {
      TweenLite.to(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y + 20
      });
      TweenLite.to(this.library.nube2, 1, {
        alpha: 0,
        y: this.library.nube2.y + 20
      });
      return U6A3.__super__.finish.apply(this, arguments);
    };

    window.U6A3 = U6A3;

    return U6A3;

  })(Oda);

}).call(this);