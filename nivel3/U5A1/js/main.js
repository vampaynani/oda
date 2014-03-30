(function() {
  var U5A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A1 = (function(_super) {
    __extends(U5A1, _super);

    function U5A1() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.setAnim = __bind(this.setAnim, this);
      this.evaluateClick = __bind(this.evaluateClick, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'pleca1.png'
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
          id: 'city1610',
          src: '1610.png'
        }, {
          id: 'city1940',
          src: '1940.png'
        }, {
          id: 'btn1610',
          src: 'btn_1610.png'
        }, {
          id: 'btn1940',
          src: 'btn_1940.png'
        }, {
          id: 'btnstart',
          src: 'btn_start.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/TU3_U5_A1_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU3_U5_A1_instructions2.mp3',
          id: 'instructions2'
        }
      ];
      this.game = {
        btns: [
          {
            t: "There wasn't any air pollution.",
            res: 'btn1610'
          }, {
            t: "There weren't any bridges.",
            res: 'btn1610'
          }, {
            t: "There were trees.",
            res: 'btn1610'
          }, {
            t: "There were bears and deer.",
            res: 'btn1610'
          }, {
            t: "There wasn't a railroad.",
            res: 'btn1610'
          }, {
            t: "There was clean water.",
            res: 'btn1610'
          }, {
            t: "There were wigwams.",
            res: 'btn1610'
          }, {
            t: "There were fish in the river.",
            res: 'btn1610'
          }, {
            t: "There was electricity.",
            res: 'btn1940'
          }, {
            t: "There wasn't any fresh air.",
            res: 'btn1940'
          }, {
            t: "There was garbage in the river.",
            res: 'btn1940'
          }, {
            t: "There were big ships on the river.",
            res: 'btn1940'
          }, {
            t: "There were bridges.",
            res: 'btn1940'
          }, {
            t: "There was traffic.",
            res: 'btn1940'
          }, {
            t: "There were factories.",
            res: 'btn1940'
          }
        ]
      };
      U5A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A1.prototype.setStage = function() {
      U5A1.__super__.setStage.apply(this, arguments);
      this.current = this.shuffle(this.game.btns);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look at the pictures for fifteen seconds.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 15, 0));
      this.library.score.txtCount.color = "#bfd951";
      this.library.score.txtTotal.color = "#ff9933";
      return this.setBtns().setFrase().introEvaluation();
    };

    U5A1.prototype.setBtns = function() {
      var btn, btns, h, r, u;
      if (this.library.btns) {
        btns = this.library.btns;
      } else {
        btns = new createjs.Container();
        btns.name = 'btns';
        btns.x = 132;
        btns.y = 280;
        u = this.createBitmap('btn1610', 'btn1610', 0, 80);
        u.addEventListener('click', this.evaluateClick);
        h = this.createBitmap('btn1940', 'btn1940', 300, 80);
        h.addEventListener('click', this.evaluateClick);
        btns.addChild(u, h);
        this.addToLibrary(u, h);
      }
      btn = new createjs.Container();
      btn.name = 'btn';
      r = this.createBitmap('btnstart', 'btnstart', stageSize.w / 2, 450, 'tc');
      r.addEventListener('click', this.setAnim);
      btn.addChild(r);
      this.addToMain(btns);
      this.addToMain(btn);
      return this;
    };

    U5A1.prototype.setFrase = function() {
      var question, text;
      question = new createjs.Container();
      question.x = stageSize.w / 2;
      question.y = 280;
      question.name = 'question';
      text = new createjs.Text(this.current[this.index].t, '24px Quicksand', '#333');
      text.name = 'titulo';
      text.textAlign = 'center';
      question.addChild(text);
      this.addToLibrary(text);
      this.addToMain(question);
      return this;
    };

    U5A1.prototype.introEvaluation = function() {
      U5A1.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
      TweenLite.to(this.library.question, 0, {
        alpha: 0
      });
      return TweenLite.to(this.library.btns, 0, {
        alpha: 0
      });
    };

    U5A1.prototype.initEvaluation = function(e) {
      return U5A1.__super__.initEvaluation.apply(this, arguments);
    };

    U5A1.prototype.evaluateClick = function(e) {
      if (e.target.name === this.current[this.index].res) {
        createjs.Sound.stop();
        createjs.Sound.play('good');
        this.library.score.plusOne();
      } else {
        this.warning();
      }
      return TweenLite.to(this.library['question'], 0.5, {
        alpha: 0,
        onComplete: this.nextEvaluation
      });
    };

    U5A1.prototype.setAnim = function() {
      TweenLite.to(this.library.btn, 1, {
        alpha: 0
      });
      this.insertBitmap('city1610', 'city1610', stageSize.w / 2, stageSize.h / 2, 'mc');
      this.insertBitmap('city1940', 'city1940', stageSize.w / 2, stageSize.h / 2, 'mc');
      TweenLite.from(this.library.city1610, 1, {
        alpha: 0,
        x: 0,
        delay: 1
      });
      TweenLite.to(this.library.city1610, 1, {
        alpha: 0,
        x: 1000,
        delay: 15
      });
      TweenLite.from(this.library.city1940, 1, {
        alpha: 0,
        x: 0,
        delay: 16
      });
      TweenLite.to(this.library.city1940, 1, {
        alpha: 0,
        x: 1000,
        delay: 31
      });
      TweenLite.to(this.library.question, 1, {
        alpha: 1,
        delay: 32
      });
      return TweenLite.to(this.library.btns, 1, {
        alpha: 1,
        delay: 32
      });
    };

    U5A1.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.current.length) {
        return this.setFrase();
      } else {
        return this.finish();
      }
    };

    U5A1.prototype.finish = function() {
      TweenLite.to(this.library.btns, 0.5, {
        alpha: 0
      });
      return U5A1.__super__.finish.apply(this, arguments);
    };

    window.U5A1 = U5A1;

    return U5A1;

  })(Oda);

}).call(this);
