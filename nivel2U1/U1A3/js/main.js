// Generated by CoffeeScript 1.6.3
(function() {
  var U1A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A3 = (function(_super) {
    __extends(U1A3, _super);

    function U1A3() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer3 = __bind(this.evaluateAnswer3, this);
      this.evaluateAnswer2 = __bind(this.evaluateAnswer2, this);
      this.evaluateAnswer1 = __bind(this.evaluateAnswer1, this);
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
          id: 'cal',
          src: 'calendar.png'
        }, {
          id: 'gym',
          src: 'icon_excercisesGymMM.png'
        }, {
          id: 'lunch',
          src: 'icon_lunchCafeTnF.png'
        }, {
          id: 'art',
          src: 'icon_paintArtRoomMnF.png'
        }, {
          id: 'read',
          src: 'icon_readLibTT.png'
        }, {
          id: 'watch',
          src: 'icon_watchAudTT.png'
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
          src: 'sounds/TU2_U1_A3_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.answers = [
        {
          id: 'iconRead',
          a1: 1,
          a2: 3,
          a3: 4
        }, {
          id: 'iconLunch',
          a1: 4,
          a2: 2,
          a3: 3
        }, {
          id: 'iconGym',
          a1: 2,
          a2: 1,
          a3: 5
        }, {
          id: 'iconArt',
          a1: 3,
          a2: 5,
          a3: 1
        }, {
          id: 'iconWatch',
          a1: 5,
          a2: 4,
          a3: 2
        }
      ];
      U1A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A3.prototype.setStage = function() {
      U1A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('calendar', 'cal', 0, 130);
      this.insertBitmap('iconGym', 'gym', 375, 210);
      this.insertBitmap('iconArt', 'art', 194, 199);
      this.insertBitmap('iconWatch', 'watch', 255, 248);
      this.insertBitmap('iconRead', 'read', 320, 248);
      this.insertBitmap('iconLunch', 'lunch', 455, 328);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setGrupo1().setGrupo2().setGrupo3().setDropper().introEvaluation();
    };

    U1A3.prototype.setGrupo1 = function() {
      var group1, word1, word2, word3, word4, word5;
      group1 = new createjs.Container();
      group1.x = 565;
      group1.y = 132;
      group1.name = 'group1';
      word1 = new ClickableText('w11', 'We read books', 1, 0, 0);
      word2 = new ClickableText('w12', 'We do exercise', 2, 0, 18);
      word3 = new ClickableText('w13', 'We paint', 3, 0, 36);
      word4 = new ClickableText('w14', 'We eat lunch', 4, 0, 54);
      word5 = new ClickableText('w15', 'We watch movies', 5, 0, 72);
      group1.addChild(word1, word2, word3, word4, word5);
      this.addToLibrary(word1, word2, word3, word4, word5);
      this.addToMain(group1);
      return this;
    };

    U1A3.prototype.setGrupo2 = function() {
      var group2, word1, word2, word3, word4, word5;
      group2 = new createjs.Container();
      group2.x = 565;
      group2.y = 247;
      group2.name = 'group2';
      word1 = new ClickableText('w21', 'in the gym', 1, 0, 0);
      word2 = new ClickableText('w22', 'in the cafeteria', 2, 0, 18);
      word3 = new ClickableText('w23', 'in the library', 3, 0, 36);
      word4 = new ClickableText('w24', 'in the auditorium', 4, 0, 54);
      word5 = new ClickableText('w25', 'in the art room', 5, 0, 72);
      group2.addChild(word1, word2, word3, word4, word5);
      this.addToLibrary(word1, word2, word3, word4, word5);
      this.addToMain(group2);
      return this;
    };

    U1A3.prototype.setGrupo3 = function() {
      var group3, word1, word2, word3, word4, word5;
      group3 = new createjs.Container();
      group3.x = 565;
      group3.y = 360;
      group3.name = 'group3';
      word1 = new ClickableText('w31', 'on Monday and Friday.', 1, 0, 0);
      word2 = new ClickableText('w32', 'on Tuesday and Thursday.', 2, 0, 18);
      word3 = new ClickableText('w33', 'on Thursday and Friday.', 3, 0, 36);
      word4 = new ClickableText('w34', 'on Tuesday and Friday.', 4, 0, 54);
      word5 = new ClickableText('w35', 'on Monday and Wednesday.', 5, 0, 72);
      group3.addChild(word1, word2, word3, word4, word5);
      this.addToLibrary(word1, word2, word3, word4, word5);
      this.addToMain(group3);
      return this;
    };

    U1A3.prototype.setDropper = function() {
      var wc1, wc2, wc3, words;
      words = new createjs.Container();
      words.x = 170;
      words.y = stageSize.h - 100;
      words.name = 'words';
      wc1 = new WordContainer('wc1', '', '#FFF', '#ff983a', 0, 0, 275, 30);
      wc2 = new WordContainer('wc2', '', '#FFF', '#ff983a', 290, 0, 275, 30);
      wc3 = new WordContainer('wc3', '', '#FFF', '#ff983a', 100, 37, 355, 30);
      words.addChild(wc1, wc2, wc3);
      this.addToLibrary(wc1, wc2, wc3);
      this.addToMain(words);
      return this;
    };

    U1A3.prototype.introEvaluation = function() {
      U1A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenMax.allFrom([this.library['calendar'], this.library['iconGym'], this.library['iconArt'], this.library['iconWatch'], this.library['iconRead'], this.library['iconLunch']], 1, {
        alpha: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['group1'], 1, {
        alpha: 0,
        y: this.library['group1'].y + 50,
        delay: 1
      });
      TweenLite.from(this.library['group2'], 1, {
        alpha: 0,
        y: this.library['group2'].y + 50,
        delay: 1.1
      });
      TweenLite.from(this.library['group3'], 1, {
        alpha: 0,
        y: this.library['group3'].y + 50,
        delay: 1.2
      });
      return TweenLite.from(this.library['words'], 1, {
        alpha: 0,
        y: this.library['words'].y + 20,
        delay: 1.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U1A3.prototype.initEvaluation = function(e) {
      var i, _i, _results;
      U1A3.__super__.initEvaluation.apply(this, arguments);
      this.blink(this.library[this.answers[this.index].id]);
      this.blink(this.library['group1']);
      _results = [];
      for (i = _i = 1; _i <= 5; i = _i += 1) {
        _results.push(this.library['w1' + i].addEventListener('click', this.evaluateAnswer1));
      }
      return _results;
    };

    U1A3.prototype.evaluateAnswer1 = function(e) {
      var i, _i, _results;
      this.answer = e.target;
      if (this.answer.index === this.answers[this.index].a1) {
        createjs.Sound.play('good');
        this.blink(this.library['group1'], false);
        this.library['wc1'].changeText(this.answer.text.text);
        this.blink(this.library['group2']);
        _results = [];
        for (i = _i = 1; _i <= 5; i = _i += 1) {
          this.library['w1' + i].removeEventListener('click', this.evaluateAnswer1);
          _results.push(this.library['w2' + i].addEventListener('click', this.evaluateAnswer2));
        }
        return _results;
      } else {
        return this.warning();
      }
    };

    U1A3.prototype.evaluateAnswer2 = function(e) {
      var i, _i, _results;
      this.answer = e.target;
      if (this.answer.index === this.answers[this.index].a2) {
        createjs.Sound.play('good');
        this.blink(this.library['group2'], false);
        this.library['wc2'].changeText(this.answer.text.text);
        this.blink(this.library['group3']);
        _results = [];
        for (i = _i = 1; _i <= 5; i = _i += 1) {
          this.library['w2' + i].removeEventListener('click', this.evaluateAnswer2);
          _results.push(this.library['w3' + i].addEventListener('click', this.evaluateAnswer3));
        }
        return _results;
      } else {
        return this.warning();
      }
    };

    U1A3.prototype.evaluateAnswer3 = function(e) {
      var i, _i;
      this.answer = e.target;
      if (this.answer.index === this.answers[this.index].a3) {
        createjs.Sound.play('good');
        this.blink(this.library['group3'], false);
        this.blink(this.library[this.answers[this.index].id], false);
        this.library['wc3'].changeText(this.answer.text.text);
        for (i = _i = 1; _i <= 5; i = _i += 1) {
          this.library['w3' + i].removeEventListener('click', this.evaluateAnswer3);
        }
        return setTimeout(this.finishEvaluation, 1 * 1000);
      } else {
        return this.warning();
      }
    };

    U1A3.prototype.finishEvaluation = function() {
      this.library['score'].plusOne();
      return TweenLite.to(this.library['words'], 0.5, {
        alpha: 0,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U1A3.prototype.nextEvaluation = function() {
      var i, _i;
      this.index++;
      if (this.index < this.answers.length) {
        this.library['wc1'].changeText('');
        this.library['wc2'].changeText('');
        this.library['wc3'].changeText('');
        this.blink(this.library[this.answers[this.index].id]);
        this.blink(this.library['group1']);
        for (i = _i = 1; _i <= 5; i = _i += 1) {
          this.library['w1' + i].addEventListener('click', this.evaluateAnswer1);
        }
        return TweenLite.to(this.library['words'], 0.5, {
          alpha: 1,
          ease: Quart.easeOut
        });
      } else {
        this.library['wc1'].changeText('');
        this.library['wc2'].changeText('');
        this.library['wc3'].changeText('');
        TweenLite.to(this.library['words'], 0.5, {
          alpha: 1,
          ease: Quart.easeOut
        });
        return this.finish();
      }
    };

    U1A3.prototype.blink = function(obj, state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      obj.alpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: .5,
          repeat: -1,
          yoyo: true
        });
      }
    };

    U1A3.prototype.finish = function() {
      return U1A3.__super__.finish.apply(this, arguments);
    };

    window.U1A3 = U1A3;

    return U1A3;

  })(Oda);

}).call(this);