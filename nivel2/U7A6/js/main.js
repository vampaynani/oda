// Generated by CoffeeScript 1.6.3
(function() {
  var U3A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U3A6 = (function(_super) {
    __extends(U3A6, _super);

    function U3A6() {
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
          id: 'ch01',
          src: 'chango0001.png'
        }, {
          id: 'ch02',
          src: 'chango0002.png'
        }, {
          id: 'ch03',
          src: 'chango0003.png'
        }, {
          id: 'ch04',
          src: 'chango0004.png'
        }, {
          id: 'ch05',
          src: 'chango0005.png'
        }, {
          id: 'ch06',
          src: 'chango0006.png'
        }, {
          id: 'ch07',
          src: 'chango0007.png'
        }, {
          id: 'ch08',
          src: 'chango0008.png'
        }, {
          id: 'ch09',
          src: 'chango0009.png'
        }, {
          id: 'ch10',
          src: 'chango0010.png'
        }, {
          id: 'ch11',
          src: 'chango0011.png'
        }, {
          id: 'ch12',
          src: 'chango0012.png'
        }, {
          id: 'ch13',
          src: 'chango0013.png'
        }, {
          id: 'ch14',
          src: 'chango0014.png'
        }, {
          id: 'ch15',
          src: 'chango0015.png'
        }, {
          id: 'ch16',
          src: 'chango0016.png'
        }, {
          id: 'aLetra',
          src: 'a.png'
        }, {
          id: 'bLetra',
          src: 'b.png'
        }, {
          id: 'cLetra',
          src: 'c.png'
        }, {
          id: 'dLetra',
          src: 'd.png'
        }, {
          id: 'eLetra',
          src: 'e.png'
        }, {
          id: 'fLetra',
          src: 'f.png'
        }, {
          id: 'gLetra',
          src: 'g.png'
        }, {
          id: 'hLetra',
          src: 'h.png'
        }, {
          id: 'iLetra',
          src: 'i.png'
        }, {
          id: 'jLetra',
          src: 'j.png'
        }, {
          id: 'kLetra',
          src: 'k.png'
        }, {
          id: 'lLetra',
          src: 'l.png'
        }, {
          id: 'mLetra',
          src: 'm.png'
        }, {
          id: 'nLetra',
          src: 'n.png'
        }, {
          id: 'oLetra',
          src: 'o.png'
        }, {
          id: 'pLetra',
          src: 'p.png'
        }, {
          id: 'qLetra',
          src: 'q.png'
        }, {
          id: 'rLetra',
          src: 'r.png'
        }, {
          id: 'sLetra',
          src: 's.png'
        }, {
          id: 'tLetra',
          src: 't.png'
        }, {
          id: 'uLetra',
          src: 'u.png'
        }, {
          id: 'vLetra',
          src: 'v.png'
        }, {
          id: 'wLetra',
          src: 'w.png'
        }, {
          id: 'xLetra',
          src: 'x.png'
        }, {
          id: 'yLetra',
          src: 'y.png'
        }, {
          id: 'zLetra',
          src: 'z.png'
        }, {
          id: 'backpack',
          src: 'backpack.png'
        }, {
          id: 'baseball',
          src: 'baseball.png'
        }, {
          id: 'brushmyhair',
          src: 'brush-my-hair.png'
        }, {
          id: 'cabin',
          src: 'cabin.png'
        }, {
          id: 'canoeing',
          src: 'canoeing.png'
        }, {
          id: 'comb',
          src: 'comb.png'
        }, {
          id: 'field',
          src: 'field.png'
        }, {
          id: 'fishing',
          src: 'fishing.png'
        }, {
          id: 'flashlight',
          src: 'flashlight.png'
        }, {
          id: 'flossmyteeth',
          src: 'floss-my-teeth.png'
        }, {
          id: 'forest',
          src: 'forest.png'
        }, {
          id: 'hiking',
          src: 'hiking.png'
        }, {
          id: 'horseback-riding',
          src: 'horseback-riding.png'
        }, {
          id: 'lake',
          src: 'lake.png'
        }, {
          id: 'mountainbiking',
          src: 'mountain-biking.png'
        }, {
          id: 'mountains',
          src: 'mountains.png'
        }, {
          id: 'planttrees',
          src: 'plant-trees.png'
        }, {
          id: 'pool',
          src: 'pool.png'
        }, {
          id: 'recyclebottles',
          src: 'recycle-bottles.png'
        }, {
          id: 'soap',
          src: 'soap.png'
        }, {
          id: 'sunscreen',
          src: 'sunscreen.png'
        }, {
          id: 'swimming',
          src: 'swimming.png'
        }, {
          id: 'swimsuit',
          src: 'swimsuit.png'
        }, {
          id: 'toothbrush',
          src: 'toothbrush.png'
        }, {
          id: 'toothpaste',
          src: 'toothpaste.png'
        }, {
          id: 'towels',
          src: 'towels.png'
        }, {
          id: 'volleyball',
          src: 'volleyball.png'
        }, {
          id: 'washmyface',
          src: 'wash-my-face.png'
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
          src: 'sounds/TU2_U7_A6_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.abc = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
      this.answers = ['backpack', 'baseball', 'brush my hair', 'cabin', 'canoeing', 'comb', 'field', 'fishing', 'flashlight', 'floss my teeth', 'forest', 'hiking', 'horseback riding', 'lake', 'mountain biking', 'mountains', 'plant trees', 'pool', 'recycle bottles', 'soap', 'sunscreen', 'swimming', 'swimsuit', 'toothbrush', 'toothpaste', 'towels', 'volleyball', 'wash my face'];
      this.imagenes = ['backpack', 'baseball', 'brush-my-hair', 'cabin', 'canoeing', 'comb', 'field', 'fishing', 'flashlight', 'floss-my-teeth', 'forest', 'hiking', 'horseback-riding', 'lake', 'mountain-biking', 'mountains', 'plant-trees', 'pool', 'recycle-bottles', 'soap', 'sunscreen', 'swimming', 'swimsuit', 'toothbrush', 'toothpaste', 'towels', 'volleyball', 'wash-my-face'];
      U3A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U3A6.prototype.setStage = function() {
      U3A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 12, 0));
      return this.setChango().createAlphabet().introEvaluation();
    };

    U3A6.prototype.setChango = function() {
      this.insertSprite('chango', ['ch01', 'ch02', 'ch03', 'ch04', 'ch05', 'ch06', 'ch07', 'ch08', 'ch09', 'ch10', 'ch11', 'ch12', 'ch13', 'ch14', 'ch15', 'ch16'], null, 549, 150, 'tl');
      return this;
    };

    U3A6.prototype.createAlphabet = function() {
      var alphabet, i, letter, letterObj, _i, _ref;
      alphabet = new createjs.Container();
      alphabet.x = 125;
      alphabet.y = 440;
      alphabet.name = 'alphabet';
      for (i = _i = 0, _ref = this.abc.length - 1; _i <= _ref; i = _i += 1) {
        letter = this.abc[i];
        if (i <= 9) {
          letterObj = new ClickableText("l" + i, letter, letter, 41.5 * i, 0);
        } else if (i <= 18) {
          letterObj = new ClickableText("l" + i, letter, letter, 41.5 * i - 395, 34);
        } else {
          letterObj = new ClickableText("l" + i, letter, letter, 41.5 * i - 750, 68);
        }
        letterObj.text.font = '20px Quicksand';
        this.addToLibrary(letterObj);
        alphabet.addChild(letterObj);
      }
      this.addToMain(alphabet);
      return this;
    };

    U3A6.prototype.introEvaluation = function() {
      U3A6.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['chango'], 1, {
        alpha: 0,
        x: this.library['chango'].x + 50,
        ease: Quart.easeOut,
        delay: 1.5
      });
      return TweenMax.from(this.library['alphabet'], 1, {
        alpha: 0,
        y: stageSize.h,
        delay: 2,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U3A6.prototype.initEvaluation = function(e) {
      var i, wc, word, wordContainers, _i, _j, _ref, _ref1;
      U3A6.__super__.initEvaluation.apply(this, arguments);
      word = this.answers[this.index];
      this.col = word.split('');
      wordContainers = new createjs.Container();
      wordContainers.name = 'wordContainers';
      wordContainers.y = 400;
      wordContainers.x = (this.library['alphabet'].x + 177) - this.col.length * 30 / 2;
      for (i = _i = 0, _ref = this.abc.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        this.library["l" + i].addEventListener('click', this.evaluateAnswer);
      }
      for (i = _j = 1, _ref1 = this.col.length; 1 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 1 <= _ref1 ? ++_j : --_j) {
        if (this.col[i - 1] !== ' ') {
          wc = new WordContainer("w" + i, '', '#fff', '#0098d7', 30 * i, 0, 26, 26);
          wc.index = this.col[i - 1];
          this.addToLibrary(wc);
          wordContainers.addChild(wc);
        }
      }
      return this.addToMain(wordContainers);
    };

    U3A6.prototype.evaluateAnswer = function(e) {
      var check, complete, current, i, wc, _i, _j, _ref, _ref1;
      this.answer = e.target;
      this.answer.visible = false;
      check = false;
      complete = true;
      for (i = _i = 1, _ref = this.col.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.col[i - 1] !== ' ') {
          if (this.answer.index === this.library["w" + i].index) {
            this.library["w" + i].changeText(this.answer.index);
            check = true;
          }
        }
      }
      if (!check) {
        current = this.library.chango.currentFrame;
        current++;
        this.library.chango.gotoAndStop(current);
      }
      if (this.library.chango.currentFrame === this.library.chango.spriteSheet._numFrames) {
        this.finish();
      }
      for (i = _j = 1, _ref1 = this.col.length; 1 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 1 <= _ref1 ? ++_j : --_j) {
        if (this.col[i - 1] !== ' ') {
          wc = this.library["w" + i];
          if (wc.text.text !== wc.index) {
            complete = false;
          }
        }
      }
      if (complete) {
        return setTimeout(this.finishEvaluation, 1 * 1000);
      }
    };

    U3A6.prototype.finishEvaluation = function() {
      var i, _i, _ref, _results;
      this.library['score'].plusOne();
      createjs.Sound.play('good');
      _results = [];
      for (i = _i = 1, _ref = this.col.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.col[i] !== ' ') {
          _results.push(TweenLite.to(this.library['wordContainers'], 0.5, {
            alpha: 0,
            ease: Back.easeOut,
            onComplete: this.nextEvaluation
          }));
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    U3A6.prototype.nextEvaluation = function() {
      var i, wc, word, _i, _j, _ref, _ref1;
      this.index++;
      if (this.index < this.answers.length) {
        word = this.answers[this.index];
        this.col = word.split('');
        this.library.chango.currentFrame = 0;
        this.library.wordContainers.removeAllChildren();
        this.library.wordContainers.x = (this.library['alphabet'].x + 177) - this.col.length * 30 / 2;
        for (i = _i = 0, _ref = this.abc.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.library["l" + i].visible = true;
        }
        for (i = _j = 1, _ref1 = this.col.length; 1 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 1 <= _ref1 ? ++_j : --_j) {
          if (this.col[i - 1] !== ' ') {
            wc = new WordContainer("w" + i, '', '#fff', '#0098d7', 30 * i, 0, 26, 26);
            wc.index = this.col[i - 1];
            this.addToLibrary(wc);
            this.library.wordContainers.addChild(wc);
          }
        }
        return TweenLite.to(this.library.wordContainers, 0.5, {
          alpha: 1,
          ease: Quart.easeOut
        });
      } else {
        return this.finish();
      }
    };

    U3A6.prototype.finish = function() {
      TweenLite.to(this.library.wordContainers, 0.5, {
        alpha: 0,
        ease: Quart.easeOut
      });
      TweenLite.to(this.library.alphabet, 1, {
        alpha: 0,
        ease: Quart.easeOut
      });
      TweenLite.to(this.library.chango, 1, {
        alpha: 0,
        ease: Quart.easeOut
      });
      return U3A6.__super__.finish.apply(this, arguments);
    };

    window.U3A6 = U3A6;

    return U3A6;

  })(Oda);

}).call(this);
