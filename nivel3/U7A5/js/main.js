(function() {
  var U7A5,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U7A5 = (function(_super) {
    __extends(U7A5, _super);

    function U7A5() {
      this.finish = __bind(this.finish, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
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
          id: 'bg',
          src: 'bg.png'
        }, {
          id: 'btnnext',
          src: 'btn_next.png'
        }, {
          id: 'btnrepeat',
          src: 'btn_repeat.png'
        }, {
          id: 'scene1',
          src: 'scene_1.png'
        }, {
          id: 'scene2',
          src: 'scene_2.png'
        }, {
          id: 'scene3',
          src: 'scene_3.png'
        }, {
          id: 'scene4',
          src: 'scene_4.png'
        }, {
          id: 'scene5',
          src: 'scene_5.png'
        }, {
          id: 'scene6',
          src: 'scene_6.png'
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
          src: 'sounds/TU3_U7_A5_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.game = [
        {
          texts: [
            {
              idx: 10,
              t: 'landed',
              x: 271,
              y: 495
            }, {
              idx: 1,
              t: 'believed',
              x: 187,
              y: 495
            }, {
              idx: 2,
              t: 'found',
              x: 498,
              y: 533
            }, {
              idx: 7,
              t: 'exploded',
              x: 404,
              y: 533
            }, {
              idx: 3,
              t: 'invented',
              x: 314,
              y: 533
            }, {
              idx: 4,
              t: 'made',
              x: 491,
              y: 495
            }, {
              idx: 5,
              t: 'used',
              x: 256,
              y: 533
            }, {
              idx: 9,
              t: 'killed',
              x: 347,
              y: 495
            }, {
              idx: 6,
              t: 'carried',
              x: 179,
              y: 533
            }, {
              idx: 8,
              t: 'caused',
              x: 413,
              y: 495
            }
          ],
          text: [
            {
              questions: [
                {
                  q: '1. What instrument did Aniz play?',
                  a: 'He played the flute.'
                }, {
                  q: '2. Who listened to Aniz?',
                  a: 'Other people and his sheep.'
                }, {
                  q: "3. Who didn't like Aniz music?",
                  a: 'The landlord.'
                }
              ]
            }, {
              questions: [
                {
                  q: '4. How did Aniz fell?',
                  a: 'He was very sad.'
                }, {
                  q: '5. Who made Aniz a new flute?',
                  a: 'A kind old man.'
                }, {
                  q: '6. Where did they find bamboo?',
                  a: 'In a market.'
                }
              ]
            }, {
              questions: [
                {
                  q: '7. What did the landlord dream about?',
                  a: 'A rabbit.'
                }, {
                  q: '8. What was different about the rabbit?',
                  a: 'It had a black spot on its head.'
                }, {
                  q: '9. What did the landlord want his sons to do?',
                  a: 'To catch the rabbit.'
                }
              ]
            }, {
              questions: [
                {
                  q: '10. Who did the oldest son talk to first?',
                  a: 'To the kind old man.'
                }, {
                  q: '11. Why did the rabbit come out of the forest?',
                  a: 'Aniz played a beautiful song.'
                }, {
                  q: '12. How did the rabbit escape?',
                  a: 'It jumped out of the bag.'
                }
              ]
            }, {
              questions: [
                {
                  q: '13. What mistake did the sons make?',
                  a: 'They looked in the bag.'
                }, {
                  q: '14. How many people went looking for the rabbit?',
                  a: 'Four.'
                }, {
                  q: '15. Who did the landlor see in the forest?',
                  a: 'Aniz.'
                }
              ]
            }, {
              questions: [
                {
                  q: '16. What was the shadows?',
                  a: 'Bears, tigers and wolves.'
                }, {
                  q: '17. What were they doing?',
                  a: 'They were listening to Aniz.'
                }, {
                  q: '18. Why did the landlord promise to be kind?',
                  a: 'He was afraid of the animals.'
                }
              ]
            }
          ]
        }
      ];
      this.answers = [];
      U7A5.__super__.constructor.call(this, null, manifest, sounds);
    }

    U7A5.prototype.setStage = function() {
      U7A5.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Complete the text with the verbs.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 8, 0));
      this.library.score.txtCount.color = "#BFD951";
      this.library.score.txtTotal.color = "#0096DB";
      return this.setCuento(1);
    };

    U7A5.prototype.setCuento = function(scene) {
      var answer1, answer2, answer3, btn, btnnext, c, cuento, fondo, palabras, question1, question2, question3;
      cuento = new createjs.Container();
      cuento.name = 'cuento';
      this.scene = scene;
      fondo = this.createBitmap('bg', 'bg', stageSize.w / 2, 0, 'tc');
      c = this.createSprite("cuento", ['scene1', 'scene2', 'scene3', 'scene4', 'scene5', 'scene6'], null, stageSize.w / 2, 170, 'tc');
      btn = this.createBitmap('btnrepeat', 'btnrepeat', stageSize.w / 2, 570, 'mc');
      btnnext = this.createBitmap('btnnext', 'btnnext', stageSize.w / 2 + 100, 570, 'mc');
      this.addToLibrary(cuento);
      cuento.addChild(fondo, c, btn, btnnext);
      palabras = new createjs.Container();
      palabras.x = 180;
      palabras.y = 445;
      question1 = new ClickableText('q1', this.game[0].text[scene - 1].questions[0].q, 0, 0, 0);
      question2 = new ClickableText('q2', this.game[0].text[scene - 1].questions[1].q, 1, 0, 25);
      question3 = new ClickableText('q3', this.game[0].text[scene - 1].questions[2].q, 2, 0, 50);
      answer1 = new ClickableText('a1', this.game[0].text[scene - 1].questions[0].a, 0, 300, 0);
      answer2 = new ClickableText('a2', this.game[0].text[scene - 1].questions[1].a, 1, 300, 25);
      answer3 = new ClickableText('a3', this.game[0].text[scene - 1].questions[2].a, 2, 300, 50);
      question1.text.font = question2.text.font = question3.text.font = '12px Quicksand';
      answer1.text.font = answer2.text.font = answer3.text.font = '12px Quicksand';
      palabras.addChild(question1, question2, question3);
      palabras.addChild(answer1, answer2, answer3);
      cuento.addChild(palabras);
      this.addToMain(cuento);
      return this;
    };

    U7A5.prototype.introEvaluation = function() {
      var i, _i, _ref;
      U7A5.__super__.introEvaluation.apply(this, arguments);
      for (i = _i = 1, _ref = this.game[this.scene - 1].texts.length; _i <= _ref; i = _i += 1) {
        this.observer.subscribe('init_evaluation', this.library["t" + i].onInitEvaluation);
      }
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenLite.from(this.library['cuento'], 1, {
        alpha: 0,
        y: this.library['cuento'].y + 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U7A5.prototype.initEvaluation = function(e) {
      var i, _i, _ref, _results;
      U7A5.__super__.initEvaluation.apply(this, arguments);
      createjs.Sound.play("scene" + this.scene);
      _results = [];
      for (i = _i = 1, _ref = this.game[this.scene - 1].texts.length; _i <= _ref; i = _i += 1) {
        _results.push(this.library["t" + i].addEventListener('click', this.evaluateAnswer));
      }
      return _results;
    };

    U7A5.prototype.evaluateAnswer = function(e) {
      var dropped, i, pt, _i, _ref, _ref1, _results;
      this.answer = e.target;
      dropped = false;
      _results = [];
      for (i = _i = 1, _ref = this.game[this.scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        pt = this.library["hsc" + i].globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (this.library["hsc" + i].hitTest(pt.x, pt.y)) {
          if (this.answer.index === this.library["hsc" + i].index) {
            if (this.answer.p) {
              if ((_ref1 = this.library["sc" + i].currentFrame) === 1 || _ref1 === 2) {
                this.library["sc" + i].currentFrame = 3;
              } else if (this.answer.p === 'p1') {
                this.library["sc" + i].currentFrame = 1;
              } else {
                this.library["sc" + i].currentFrame = 2;
              }
            } else {
              this.library["sc" + i].currentFrame = 1;
            }
            this.answer.visible = false;
            createjs.Sound.play('good');
            if (this.intento === 0) {
              this.library['score'].plusOne();
            }
            this.intento = 0;
            _results.push(this.finishEvaluation());
          } else {
            this.intento = 1;
            this.warning();
            _results.push(this.answer.returnToPlace());
          }
        } else {
          _results.push(this.answer.returnToPlace());
        }
      }
      return _results;
    };

    U7A5.prototype.finishEvaluation = function() {
      var i, _i, _ref;
      for (i = _i = 1, _ref = this.game[this.scene - 1].positions.length; _i <= _ref; i = _i += 1) {
        if (this.library["sc" + i].currentFrame !== this.library["sc" + i].spriteSheet._frames.length - 1) {
          return;
        }
      }
      return this.finish();
    };

    U7A5.prototype.finish = function() {
      createjs.Sound.stop();
      createjs.Sound.play('good');
      TweenLite.to(this.library['cuento'], 1, {
        alpha: 0,
        y: this.library['cuento'].y + 10
      });
      TweenLite.to(this.library['bg'], 1, {
        alpha: 0
      });
      return U7A5.__super__.finish.apply(this, arguments);
    };

    window.U7A5 = U7A5;

    return U7A5;

  })(Oda);

}).call(this);
