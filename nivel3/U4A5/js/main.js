(function() {
  var U4A5,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A5 = (function(_super) {
    __extends(U4A5, _super);

    function U4A5() {
      this.finish = __bind(this.finish, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
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
          id: 'btn4',
          src: 'btn_Chad.png'
        }, {
          id: 'btn3',
          src: 'btn_Ben.png'
        }, {
          id: 'btn2',
          src: 'btn_Lindsay.png'
        }, {
          id: 'btn1',
          src: 'btn_Matt.png'
        }, {
          id: 'bubbletext',
          src: 'bubble_text.png'
        }, {
          id: 'propback',
          src: 'prop_back.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU3_U4_A5_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        answers: [
          {
            q: 'Oh! There\'s Lindsay and Ben!',
            a: 'matt'
          }, {
            q: 'They look strange!',
            a: 'chad'
          }, {
            q: 'Can we teach them to sign, too?',
            a: 'lindsay'
          }, {
            q: 'Do you think you can teach us?',
            a: 'chad'
          }, {
            q: 'I need to go to the sports store.',
            a: 'lindsay'
          }, {
            q: 'They are not strange.',
            a: 'matt'
          }, {
            q: 'Ben is deaf, so they\'re speaking in sign language.',
            a: 'matt'
          }, {
            q: 'I want to look for books!',
            a: 'ben'
          }, {
            q: 'What are you doing here?',
            a: 'matt'
          }, {
            q: 'It\'s great for talking in loud places.',
            a: 'lindsay'
          }
        ],
        faces: ['matt', 'lindsay', 'ben', 'chad']
      };
      U4A5.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A5.prototype.setStage = function() {
      U4A5.__super__.setStage.apply(this, arguments);
      this.answers = this.shuffle(this.game.answers);
      this.intento = false;
      this.insertBitmap('propback', 'propback', 0, 0);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Read the speech bubbles and click on the corresponding character.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 10, 0));
      this.library.score.txtCount.color = "#0A9BDD";
      this.library.score.txtTotal.color = "#FE008F";
      return this.setFaces().introEvaluation();
    };

    U4A5.prototype.setFaces = function() {
      var b, c, faces, i, t, _i;
      faces = new createjs.Container();
      faces.x = 446;
      faces.y = 443;
      b = this.createBitmap('bubblebmp', 'bubbletext', 0, 0);
      t = this.createText('qtext', this.answers[this.index].q, '12px Roboto', '#000', 140, 9);
      t.textAlign = 'center';
      faces.addChild(b, t);
      this.addToLibrary(b, t);
      for (i = _i = 1; _i <= 4; i = _i += 1) {
        c = this.createBitmap("btn" + i, "btn" + i, (i - 1) * 80, 50);
        c.index = this.game.faces[i - 1];
        this.addToLibrary(c);
        faces.addChild(c);
      }
      this.addToMain(faces);
      return this;
    };

    U4A5.prototype.introEvaluation = function() {
      U4A5.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library['header'].height
      });
      return TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U4A5.prototype.initEvaluation = function(e) {
      var i, _i, _results;
      U4A5.__super__.initEvaluation.apply(this, arguments);
      createjs.Sound.play("scene" + this.scene);
      _results = [];
      for (i = _i = 1; _i <= 4; i = _i += 1) {
        _results.push(this.library["btn" + i].addEventListener('click', this.evaluateAnswer));
      }
      return _results;
    };

    U4A5.prototype.evaluateAnswer = function(e) {
      if (e.currentTarget.index === this.answers[this.index].a) {
        console.log(this.intento);
        if (this.intento === false) {
          this.library['score'].plusOne();
        }
        createjs.Sound.play('good');
        this.intento = false;
        return this.finishEvaluation();
      } else {
        this.intento = true;
        return this.warning();
      }
    };

    U4A5.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library.qtext, 1, {
        alpha: 0,
        onComplete: this.nextEvaluation
      });
    };

    U4A5.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        this.library.qtext.text = this.answers[this.index].q;
        return TweenLite.to(this.library.qtext, 1, {
          alpha: 1
        });
      } else {
        return this.finish();
      }
    };

    U4A5.prototype.finish = function() {
      TweenLite.to([this.library.propback, this.library.bubblebmp, this.library.btn1, this.library.btn2, this.library.btn3, this.library.btn4], 1, {
        alpha: 0,
        y: this + 40
      });
      return U4A5.__super__.finish.apply(this, arguments);
    };

    window.U4A5 = U4A5;

    return U4A5;

  })(Oda);

}).call(this);
