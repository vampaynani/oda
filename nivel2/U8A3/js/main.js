// Generated by CoffeeScript 1.6.3
(function() {
  var U8A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A3 = (function(_super) {
    __extends(U8A3, _super);

    function U8A3() {
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
          id: 'repeatbtn',
          src: 'repeat-btn.png'
        }, {
          id: 'playagain',
          src: 'play_again.png'
        }, {
          id: 'startgame',
          src: 'start_game.png'
        }, {
          id: 'pas1',
          src: 'pas1.png'
        }, {
          id: 'pas2',
          src: 'pas2.png'
        }, {
          id: 'pas3',
          src: 'pas3.png'
        }, {
          id: 'pas4',
          src: 'pas4.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U8_A3_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        passports: [
          {
            x: 130,
            y: 130,
            values: ['Eric Schmidt', 'Germany', 'blue', 'brown', '1m 10cm']
          }, {
            x: 430,
            y: 135,
            values: ['Melanie Murphy', 'Ireland', 'green', 'red', '1m 7cm']
          }, {
            x: 130,
            y: 304,
            values: ['Cassandra Wang', 'China', 'dark brown', 'black', '1m 15cm']
          }, {
            x: 434,
            y: 304,
            values: ['Saul Peterson', 'Canada', 'light brown', 'blonde', '1m 14cm']
          }
        ],
        steps: [
          {
            pattern: ["I have", "#wc", "eyes. I have straight", "#wc", "hair. I'm", "#wc", "tall.", "#br", "My name's", "#wc", "I'm from Germany."],
            targets: ['blue', 'brown', '1m 10cm', 'Eric Schmidt']
          }, {
            pattern: ["I'm", "#wc", ". I'm from", "#wc", ". I have", "#wc", "eyes.", "#br", "I have curly", "#wc", "hair. I'm 1m 7cm tall."],
            targets: ['Melanie Murphy', 'Ireland', 'green', 'red']
          }, {
            pattern: ["I have", "#wc", "eyes. I have curly blonde hair.", "#br", "I'm", "#wc", ". I'm from", "#wc", ". I'm", "#wc", "tall."],
            targets: ['light brown', 'Saul Peterson', 'Canada', '1m 14cm']
          }, {
            pattern: ["I'm from", "#wc", ". I have dark brown eyes. I have long", "#wc", "hair.", "#br", "I'm", "#wc", "tall. My name's", "#wc"],
            targets: ['China', 'black', '1m 15cm', 'Cassandra Wang']
          }
        ],
        positions: [
          {
            x: '65',
            y: '22'
          }, {
            x: '77',
            y: '50'
          }, {
            x: '84',
            y: '78'
          }, {
            x: '90',
            y: '106'
          }, {
            x: '68',
            y: '134'
          }
        ]
      };
      U8A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A3.prototype.setStage = function() {
      U8A3.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.steps = this.shuffle(this.game.steps);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 16, 0));
      return this.setDropper(1).setPassports().introEvaluation();
    };

    U8A3.prototype.setPassports = function() {
      var f, i, j, n, p, passport, _i, _j, _len, _ref, _ref1;
      i = 1;
      _ref = this.game.passports;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        passport = _ref[_i];
        p = new createjs.Container();
        p.x = passport.x;
        p.y = passport.y;
        p.name = "pass" + i;
        f = this.createBitmap("p" + i, "pas" + i, 0, 0);
        p.addChild(f);
        this.addToMain(p);
        for (j = _j = 0, _ref1 = passport.values.length - 1; _j <= _ref1; j = _j += 1) {
          n = new DroppableText("p" + i + "v" + j, passport.values[j], passport.values[j], this.game.positions[j].x, this.game.positions[j].y, this.stage);
          this.addToLibrary(n);
          p.addChild(n);
        }
        i++;
      }
      return this;
    };

    U8A3.prototype.setDropper = function(step) {
      var dropper, h, i, j, npos, ny, t, txt, _i, _len, _ref;
      this.step = step;
      if (this.library.dropper && this.mainContainer.contains(this.library.dropper)) {
        dropper = this.library.dropper;
      } else {
        dropper = new createjs.Container();
        dropper.x = 120;
        dropper.y = 500;
        dropper.name = 'dropper';
        this.addToMain(dropper);
      }
      dropper.removeAllChildren();
      i = 0;
      j = 0;
      npos = 0;
      this.targets = new Array();
      _ref = this.steps[step - 1].pattern;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        t = _ref[_i];
        ny = j * 30 + 7;
        if (t === '#br') {
          npos = 0;
          j++;
        } else if (t === '#wc') {
          txt = this.steps[step - 1].targets[i];
          h = new WordContainer("h" + i, "" + txt, '#FFF', '#F00', npos, ny);
          h.text.font = '20px Quicksand';
          h.index = i;
          dropper.addChild(h);
          this.addToLibrary(h);
          this.targets.push(h);
          npos += h.width + 7;
          i++;
        } else {
          h = this.createText('', t, '20px Quicksand', '#333', npos, ny);
          dropper.addChild(h);
          npos += h.getMeasuredWidth() + 12;
        }
      }
      return this;
    };

    U8A3.prototype.introEvaluation = function() {
      U8A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from([this.library.pass1, this.library.pass2, this.library.pass3, this.library.pass4], 1, {
        alpha: 0,
        delay: 1
      });
      return TweenLite.from(this.library.dropper, 1, {
        alpha: 0,
        y: this.library.dropper.y + 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U8A3.prototype.initEvaluation = function(e) {
      var i, j, _i, _ref, _results;
      U8A3.__super__.initEvaluation.apply(this, arguments);
      _results = [];
      for (i = _i = 1, _ref = this.game.passports.length; _i <= _ref; i = _i += 1) {
        _results.push((function() {
          var _j, _ref1, _results1;
          _results1 = [];
          for (j = _j = 0, _ref1 = this.game.passports[i - 1].values.length - 1; _j <= _ref1; j = _j += 1) {
            this.library["p" + i + "v" + j].updateDrops(this.targets);
            this.library["p" + i + "v" + j].addEventListener('dropped', this.evaluateAnswer);
            _results1.push(this.library["p" + i + "v" + j].initDragListener());
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    U8A3.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      this.drop = e.drop;
      if (this.answer.index === this.steps[this.step - 1].targets[this.drop.index]) {
        this.answer.visible = false;
        this.drop.changeText(this.answer.index);
        this.finishEvaluation();
        if (this.intento === 0) {
          this.library['score'].plusOne();
        }
        return this.intento = 0;
      } else {
        this.warning();
        this.intento = 1;
        return this.answer.returnToPlace();
      }
    };

    U8A3.prototype.finishEvaluation = function() {
      var target, _i, _len, _ref;
      createjs.Sound.play('good');
      _ref = this.targets;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        target = _ref[_i];
        if (target.text.text === '') {
          return;
        }
      }
      return setTimeout(this.clearEvaluation, 1 * 1000);
    };

    U8A3.prototype.clearEvaluation = function(e) {
      var i, j, _i, _j, _ref, _ref1;
      for (i = _i = 1, _ref = this.game.passports.length; _i <= _ref; i = _i += 1) {
        for (j = _j = 0, _ref1 = this.game.passports[i - 1].values.length - 1; _j <= _ref1; j = _j += 1) {
          this.library["p" + i + "v" + j].visible = true;
          this.library["p" + i + "v" + j].returnToPlace();
        }
      }
      return TweenLite.to(this.library.dropper, 0.5, {
        alpha: 0,
        y: this.library.dropper.y + 20,
        onComplete: this.nextEvaluation
      });
    };

    U8A3.prototype.nextEvaluation = function() {
      var i, j, _i, _j, _ref, _ref1;
      this.index++;
      if (this.index < this.steps.length) {
        this.setDropper(this.index + 1);
        for (i = _i = 1, _ref = this.game.passports.length; _i <= _ref; i = _i += 1) {
          for (j = _j = 0, _ref1 = this.game.passports[i - 1].values.length - 1; _j <= _ref1; j = _j += 1) {
            this.library["p" + i + "v" + j].updateDrops(this.targets);
          }
        }
        return TweenLite.to(this.library.dropper, 0.5, {
          alpha: 1,
          y: 500
        });
      } else {
        return this.finish();
      }
    };

    U8A3.prototype.finish = function() {
      TweenLite.to([this.library.pass1, this.library.pass2, this.library.pass3, this.library.pass4], 1, {
        alpha: 0
      });
      return U8A3.__super__.finish.apply(this, arguments);
    };

    window.U8A3 = U8A3;

    return U8A3;

  })(Oda);

}).call(this);
