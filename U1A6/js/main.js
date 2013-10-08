// Generated by CoffeeScript 1.6.3
(function() {
  var U1A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A6 = (function(_super) {
    __extends(U1A6, _super);

    function U1A6() {
      this.finish = __bind(this.finish, this);
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
          id: 'crossWords',
          src: 'cross_words.png'
        }, {
          id: 'bass',
          src: 'bass.png'
        }, {
          id: 'drum',
          src: 'drum.png'
        }, {
          id: 'guitar',
          src: 'guitar.png'
        }, {
          id: 'flute',
          src: 'flute.png'
        }, {
          id: 'piano',
          src: 'piano.png'
        }, {
          id: 'sax',
          src: 'sax.png'
        }, {
          id: 'tambourine',
          src: 'tambourine.png'
        }, {
          id: 'trumpet',
          src: 'trumpet.png'
        }, {
          id: 'drum_number',
          src: 'drum_number.png'
        }, {
          id: 'guitar_number',
          src: 'guitar_number.png'
        }, {
          id: 'flute_number',
          src: 'flute_number.png'
        }, {
          id: 'piano_number',
          src: 'piano_number.png'
        }, {
          id: 'sax_number',
          src: 'sax_number.png'
        }, {
          id: 'tambourine_number',
          src: 'tambourine_number.png'
        }, {
          id: 'trumpet_number',
          src: 'trumpet_number.png'
        }, {
          id: 'bass_number',
          src: 'bass_number.png'
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
        }
      ];
      sounds = [
        {
          src: 'sounds/TU2_U1_A6_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U1_A6_bass.mp3',
          id: 'bass'
        }, {
          src: 'sounds/TU2_U1_A6_drum.mp3',
          id: 'drum'
        }, {
          src: 'sounds/TU2_U1_A6_flute.mp3',
          id: 'flute'
        }, {
          src: 'sounds/TU2_U1_A6_guitar.mp3',
          id: 'guitar'
        }, {
          src: 'sounds/TU2_U1_A6_piano.mp3',
          id: 'piano'
        }, {
          src: 'sounds/TU2_U1_A6_saxophone.mp3',
          id: 'saxophone'
        }, {
          src: 'sounds/TU2_U1_A6_tambourine.mp3',
          id: 'tambourine'
        }, {
          src: 'sounds/TU2_U1_A6_trumpet.mp3',
          id: 'trumpet'
        }, {
          src: 'sounds/TU2_U1_A6_violin.mp3',
          id: 'violin'
        }
      ];
      this.abc = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
      this.containers = [
        {
          id: 'd',
          x: 5,
          y: 0,
          a: true
        }, {
          id: 'r',
          x: 5,
          y: 1
        }, {
          id: 'u',
          x: 5,
          y: 2
        }, {
          id: 'm',
          x: 5,
          y: 3
        }, {
          id: 'g',
          x: 7,
          y: 0,
          a: true
        }, {
          id: 'u',
          x: 7,
          y: 1
        }, {
          id: 'i',
          x: 7,
          y: 2
        }, {
          id: 't',
          x: 7,
          y: 3
        }, {
          id: 'a',
          x: 7,
          y: 4
        }, {
          id: 'r',
          x: 7,
          y: 5
        }, {
          id: 't',
          x: 0,
          y: 2,
          a: true
        }, {
          id: 'a',
          x: 1,
          y: 2
        }, {
          id: 'm',
          x: 2,
          y: 2
        }, {
          id: 'b',
          x: 3,
          y: 2
        }, {
          id: 'o',
          x: 4,
          y: 2
        }, {
          id: 'r',
          x: 6,
          y: 2
        }, {
          id: 'n',
          x: 8,
          y: 2
        }, {
          id: 'e',
          x: 9,
          y: 2
        }, {
          id: 'r',
          x: 0,
          y: 3
        }, {
          id: 'u',
          x: 0,
          y: 4
        }, {
          id: 'm',
          x: 0,
          y: 5
        }, {
          id: 'p',
          x: 0,
          y: 6,
          a: true
        }, {
          id: 'e',
          x: 0,
          y: 7
        }, {
          id: 't',
          x: 0,
          y: 8
        }, {
          id: 'f',
          x: 10,
          y: 4,
          a: true
        }, {
          id: 'l',
          x: 10,
          y: 5
        }, {
          id: 'u',
          x: 10,
          y: 6
        }, {
          id: 't',
          x: 10,
          y: 7
        }, {
          id: 'e',
          x: 10,
          y: 8
        }, {
          id: 'b',
          x: 2,
          y: 5,
          a: true
        }, {
          id: 'a',
          x: 2,
          y: 6
        }, {
          id: 's',
          x: 2,
          y: 7
        }, {
          id: 's',
          x: 2,
          y: 8,
          a: true
        }, {
          id: 'i',
          x: 1,
          y: 6
        }, {
          id: 'n',
          x: 3,
          y: 6
        }, {
          id: 'o',
          x: 4,
          y: 6
        }, {
          id: 'a',
          x: 3,
          y: 8
        }, {
          id: 'x',
          x: 4,
          y: 8
        }, {
          id: 'o',
          x: 5,
          y: 8
        }, {
          id: 'p',
          x: 6,
          y: 8
        }, {
          id: 'h',
          x: 7,
          y: 8
        }, {
          id: 'o',
          x: 8,
          y: 8
        }, {
          id: 'n',
          x: 9,
          y: 8
        }
      ];
      this.answers = {
        drum: {
          r: false,
          c: [0, 1, 2, 3]
        },
        guitar: {
          r: false,
          c: [4, 5, 6, 7, 8, 9]
        },
        tambourine: {
          r: false,
          c: [10, 11, 12, 13, 14, 2, 15, 6, 16, 17]
        },
        trumpet: {
          r: false,
          c: [10, 18, 19, 20, 21, 22, 23]
        },
        flute: {
          r: false,
          c: [24, 25, 26, 27, 28]
        },
        bass: {
          r: false,
          c: [29, 30, 31, 32]
        },
        piano: {
          r: false,
          c: [21, 33, 30, 34, 35]
        },
        saxophone: {
          r: false,
          c: [32, 36, 37, 38, 39, 40, 41, 42, 28]
        }
      };
      U1A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A6.prototype.setStage = function() {
      U1A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('saxophone', 'sax', 341, 118);
      this.insertBitmap('saxophoneNo', 'sax_number', 346, 130);
      this.insertBitmap('drum', 'drum', 99, 125);
      this.insertBitmap('drumNo', 'drum_number', 69, 125);
      this.insertBitmap('guitar', 'guitar', 99, 228);
      this.insertBitmap('guitarNo', 'guitar_number', 163, 252);
      this.insertBitmap('tambourine', 'tambourine', 192, 412);
      this.insertBitmap('tambourineNo', 'tambourine_number', 197, 390);
      this.insertBitmap('trumpet', 'trumpet', 353, 446);
      this.insertBitmap('trumpetNo', 'trumpet_number', 322, 444);
      this.insertBitmap('flute', 'flute', 546, 448);
      this.insertBitmap('fluteNo', 'flute_number', 521, 443);
      this.insertBitmap('bass', 'bass', 639, 249);
      this.insertBitmap('bassNo', 'bass_number', 621, 279);
      this.insertBitmap('piano', 'piano', 567, 77);
      this.insertBitmap('pianoNo', 'piano_number', 567, 138);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 8, 0));
      this.createDroppers();
      this.createAlphabet();
      return this.introEvaluation();
    };

    U1A6.prototype.createAlphabet = function() {
      var alphabet, i, letter, letterObj, _i, _ref;
      alphabet = new createjs.Container();
      alphabet.x = 135;
      alphabet.y = 510;
      alphabet.name = 'alphabet';
      for (i = _i = 0, _ref = this.abc.length - 1; _i <= _ref; i = _i += 1) {
        letter = this.abc[i];
        if (i <= 13) {
          letterObj = new Draggable(letter, this.preload.getResult(letter + 'Letra'), letter, 41.5 * i, 0);
        } else {
          letterObj = new Draggable(letter, this.preload.getResult(letter + 'Letra'), letter, 41.5 * i - 540, 34);
        }
        letterObj.onInitEvaluation();
        alphabet.addChild(letterObj);
        this.addToLibrary(letterObj);
      }
      return this.addToMain(alphabet);
    };

    U1A6.prototype.createDroppers = function() {
      var crosswords, drop, i, _i, _ref;
      crosswords = new createjs.Container();
      crosswords.x = 305;
      crosswords.y = 216;
      crosswords.name = 'crosswords';
      for (i = _i = 0, _ref = this.containers.length - 1; _i <= _ref; i = _i += 1) {
        drop = new WordContainer('h' + i, '', '#FFF', '#999', this.containers[i].x * 23, this.containers[i].y * 23, 23, 23);
        drop.id = this.containers[i].id;
        this.addToLibrary(drop);
        crosswords.addChild(drop);
      }
      return this.addToMain(crosswords);
    };

    U1A6.prototype.introEvaluation = function() {
      var i, _i, _ref;
      U1A6.__super__.introEvaluation.apply(this, arguments);
      this.library['crosswords'].y = 216;
      this.library['crosswords'].alpha = 1;
      this.library['alphabet'].y = 510;
      this.library['alphabet'].alpha = 1;
      this.library['saxophone'].alpha = 1;
      this.library['saxophoneNo'].alpha = 1;
      this.library['drum'].alpha = 1;
      this.library['drumNo'].alpha = 1;
      this.library['guitar'].alpha = 1;
      this.library['guitarNo'].alpha = 1;
      this.library['tambourine'].alpha = 1;
      this.library['tambourineNo'].alpha = 1;
      this.library['trumpet'].alpha = 1;
      this.library['trumpetNo'].alpha = 1;
      this.library['flute'].alpha = 1;
      this.library['fluteNo'].alpha = 1;
      this.library['bass'].alpha = 1;
      this.library['bassNo'].alpha = 1;
      this.library['piano'].alpha = 1;
      this.library['pianoNo'].alpha = 1;
      for (i = _i = 0, _ref = this.containers.length - 1; _i <= _ref; i = _i += 1) {
        if (this.containers[i].a) {
          this.library['h' + i].changeText(this.containers[i].id);
        } else {
          this.library['h' + i].changeText('');
        }
      }
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenMax.allFrom([this.library['saxophone'], this.library['drum'], this.library['guitar'], this.library['tambourine'], this.library['trumpet'], this.library['flute'], this.library['bass'], this.library['piano']], 1, {
        alpha: 0,
        delay: 1.5
      }, 0.2);
      TweenMax.allFrom([this.library['saxophoneNo'], this.library['drumNo'], this.library['guitarNo'], this.library['tambourineNo'], this.library['trumpetNo'], this.library['fluteNo'], this.library['bassNo'], this.library['pianoNo']], 1, {
        alpha: 0,
        delay: 1.5
      }, 0.2);
      TweenLite.from(this.library['alphabet'], 1, {
        alpha: 0,
        y: this.library['alphabet'].y + 50,
        delay: 1.5
      });
      return TweenLite.from(this.library['crosswords'], 1, {
        alpha: 0,
        y: this.library['crosswords'].y + 50,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U1A6.prototype.initEvaluation = function(e) {
      var letter, _i, _len, _ref, _results;
      U1A6.__super__.initEvaluation.apply(this, arguments);
      _ref = this.abc;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        letter = _ref[_i];
        _results.push(this.library[letter].addEventListener('drop', this.evaluateAnswer));
      }
      return _results;
    };

    U1A6.prototype.evaluateAnswer = function(e) {
      var hit, i, pt, _i, _ref, _results;
      this.answer = e.target;
      _results = [];
      for (i = _i = 0, _ref = this.containers.length - 1; _i <= _ref; i = _i += 1) {
        hit = this.library['h' + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (hit.hitTest(pt.x, pt.y)) {
          if (hit.id === this.answer.index) {
            hit.changeText(hit.id);
            this.answer.x = this.answer.pos.x;
            this.answer.y = this.answer.pos.y;
            this.evaluate('drum');
            this.evaluate('guitar');
            this.evaluate('tambourine');
            this.evaluate('trumpet');
            this.evaluate('flute');
            this.evaluate('bass');
            this.evaluate('piano');
            _results.push(this.evaluate('saxophone'));
          } else {
            _results.push(this.warning());
          }
        } else {
          _results.push(this.answer.returnToPlace());
        }
      }
      return _results;
    };

    U1A6.prototype.evaluate = function(instrument) {
      var box, ready, snd, _i, _len, _ref;
      ready = true;
      if (!this.answers[instrument].r) {
        _ref = this.answers[instrument].c;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          box = _ref[_i];
          if (this.library['h' + box].text.text === '') {
            ready = false;
          }
        }
        if (ready) {
          this.instrument = instrument;
          snd = createjs.Sound.play(instrument);
          snd.addEventListener('complete', this.finishEvaluation);
          this.answers[instrument].r = true;
          return this.library['score'].plusOne();
        }
      }
    };

    U1A6.prototype.finishEvaluation = function() {
      return TweenMax.allTo([this.library[this.instrument], this.library[this.instrument + 'No']], 1, {
        alpha: 0,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U1A6.prototype.nextEvaluation = function() {
      var complete, instrument;
      complete = true;
      for (instrument in this.answers) {
        if (this.answers[instrument].r === false) {
          complete = false;
        }
      }
      if (complete) {
        TweenLite.to(this.library['alphabet'], 0.5, {
          alpha: 0,
          y: this.library['alphabet'].y - 100,
          ease: Quart.easeOut
        });
      }
      if (complete) {
        return TweenLite.to(this.library['crosswords'], 0.5, {
          alpha: 0,
          y: this.library['crosswords'].y - 100,
          ease: Quart.easeOut,
          onComplete: this.finish
        });
      }
    };

    U1A6.prototype.blink = function(obj, state) {
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

    U1A6.prototype.finish = function() {
      return U1A6.__super__.finish.apply(this, arguments);
    };

    window.U1A6 = U1A6;

    return U1A6;

  })(Oda);

}).call(this);
