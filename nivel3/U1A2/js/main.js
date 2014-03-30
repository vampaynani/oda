(function() {
  var U1A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A2 = (function(_super) {
    __extends(U1A2, _super);

    function U1A2() {
      this.repeatSound = __bind(this.repeatSound, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
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
          id: 'ticketArt',
          src: 'ticket_art.png'
        }, {
          id: 'ticketBug',
          src: 'ticket_bug.png'
        }, {
          id: 'ticketDinosaur',
          src: 'ticket_dinosaur.png'
        }, {
          id: 'ticketDolphin',
          src: 'ticket_dolphin.png'
        }, {
          id: 'ticketElephant',
          src: 'ticket_elephant.png'
        }, {
          id: 'ticketPiano',
          src: 'ticket_piano.png'
        }, {
          id: 'ticketPuppet',
          src: 'ticket_puppet.png'
        }, {
          id: 'ticketSpace',
          src: 'ticket_space.png'
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
          src: 'sounds/TU3_U1_A2_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU3_U1_A2_instructions2.mp3',
          id: 'instructions2'
        }, {
          src: 'sounds/TU3_U1_A2_art.mp3',
          id: 'sticketArt'
        }, {
          src: 'sounds/TU3_U1_A2_bug.mp3',
          id: 'sticketBug'
        }, {
          src: 'sounds/TU3_U1_A2_dinosaur.mp3',
          id: 'sticketDinosaur'
        }, {
          src: 'sounds/TU3_U1_A2_dolphin.mp3',
          id: 'sticketDolphin'
        }, {
          src: 'sounds/TU3_U1_A2_elephant.mp3',
          id: 'sticketElephant'
        }, {
          src: 'sounds/TU3_U1_A2_piano.mp3',
          id: 'sticketPiano'
        }, {
          src: 'sounds/TU3_U1_A2_puppet.mp3',
          id: 'sticketPuppet'
        }, {
          src: 'sounds/TU3_U1_A2_space.mp3',
          id: 'sticketSpace'
        }
      ];
      this.game = {
        tickets: [
          {
            id: 'ticketArt',
            x: 315,
            y: 178,
            questions: [
              {
                q: 'Where\'s the event?',
                a1: 'It\'s at the Art Museum.',
                a2: 'It\'s at the Art Gallery.',
                s: 'a2'
              }, {
                q: 'What time does it start?',
                a1: 'It starts at nine o\'clock.',
                a2: 'It starts at one o\'clock.',
                s: 'a1'
              }
            ]
          }, {
            id: 'ticketBug',
            x: 549,
            y: 178,
            questions: [
              {
                q: 'How much does it cost?',
                a1: 'It cost nine dollars.',
                a2: 'It cost nineteen dollars.',
                s: 'a1'
              }, {
                q: 'What time does it open?',
                a1: 'It opens at three thirty.',
                a2: 'It opens at eleven thirty.',
                s: 'a2'
              }
            ]
          }, {
            id: 'ticketDinosaur',
            x: 209,
            y: 284,
            questions: [
              {
                q: 'How much does it cost?',
                a1: 'It costs twenty dollars.',
                a2: 'It costs twelve dollars.',
                s: 'a2'
              }, {
                q: 'What time does it close?',
                a1: 'It closes at six o\'clock.',
                a2: 'It closes at ten o\'clock.',
                s: 'a1'
              }
            ]
          }, {
            id: 'ticketDolphin',
            x: 425,
            y: 319,
            questions: [
              {
                q: 'How much does it cost?',
                a1: 'It costs nine dollars.',
                a2: 'It costs nineteen dollars.',
                s: 'a1'
              }, {
                q: 'What time does it start?',
                a1: 'It starts at three thirty.',
                a2: 'It starts at three o\'clock.',
                s: 'a1'
              }
            ]
          }, {
            id: 'ticketElephant',
            x: 638,
            y: 284,
            questions: [
              {
                q: 'What time does it start?',
                a1: 'The show starts at two o\'clock.',
                a2: 'It starts at twelve o\'clock.',
                s: 'a1'
              }, {
                q: 'How much does it cost?',
                a1: 'It costs sixteen dollars.',
                a2: 'It costs eight dollars.',
                s: 'a2'
              }
            ]
          }, {
            id: 'ticketPiano',
            x: 205,
            y: 414,
            questions: [
              {
                q: 'What time does it start?',
                a1: 'It starts at eleven o\'clock at night.',
                a2: 'It starts at eleven o\'clock in the morning.',
                s: 'a2'
              }, {
                q: 'How much does it cost?',
                a1: 'It costs fifty dollars.',
                a2: 'It costs fifteen dollars.',
                s: 'a2'
              }
            ]
          }, {
            id: 'ticketPuppet',
            x: 423,
            y: 452,
            questions: [
              {
                q: 'Where\'s the event?',
                a1: 'It\'s at the theater.',
                a2: 'It\'s at the children\'s museum.',
                s: 'a1'
              }, {
                q: 'What time does it start?',
                a1: 'It starts at two o\'clock.',
                a2: 'It starts at three o\'clock.',
                s: 'a2'
              }
            ]
          }, {
            id: 'ticketSpace',
            x: 641,
            y: 414,
            questions: [
              {
                q: 'Where\'s the event?',
                a1: 'It\'s at the theater.',
                a2: 'It\'s at the science museum.',
                s: 'a2'
              }, {
                q: 'What time does it cost?',
                a1: 'It costs fourteen dollars.',
                a2: 'It costs forty dollars.',
                s: 'a1'
              }
            ]
          }
        ]
      };
      U1A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A2.prototype.setStage = function() {
      U1A2.__super__.setStage.apply(this, arguments);
      this.current = this.shuffle(this.game.tickets);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and click on the correct ticket.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 16, 0));
      this.library.score.txtCount.color = "#bfd951";
      this.library.score.txtTotal.color = "#ff9933";
      return this.setTickets().introEvaluation();
    };

    U1A2.prototype.setTickets = function() {
      var i, r, tickets, v, _i, _ref;
      if (this.library.tickets) {
        tickets = this.library.tickets;
      } else {
        tickets = new createjs.Container();
      }
      tickets.removeAllChildren();
      tickets.name = 'tickets';
      tickets.alpha = 1;
      for (i = _i = 0, _ref = this.current.length - 1; _i <= _ref; i = _i += 1) {
        v = this.createBitmap(this.current[i].id, this.current[i].id, this.current[i].x, this.current[i].y, 'mc');
        v.scaleX = v.scaleY = 0.25;
        tickets.addChild(v);
        this.addToLibrary(v);
      }
      r = this.createBitmap('repeat', 'repeatbtn', stageSize.w / 2, 530, 'tc');
      r.addEventListener('click', this.repeatSound);
      tickets.addChild(r);
      this.addToMain(tickets);
      return this;
    };

    U1A2.prototype.setTicketQuestion = function() {
      var currentQuestion, diagonal, dos, opciones, question, text, total, uno, v;
      if (this.library.question) {
        question = this.library.question;
        question.alpha = 1;
      } else {
        question = new createjs.Container();
        question.name = 'question';
      }
      question.removeAllChildren();
      v = this.createBitmap('qticket', this.current[this.index].id, stageSize.w / 2, stageSize.h / 2 - 30, 'mc');
      v.scaleX = v.scaleY = 0.5;
      question.addChild(v);
      currentQuestion = this.current[this.index].questions[this.questionIndex];
      text = new createjs.Text(currentQuestion.q, '24px Quicksand', '#333');
      text.x = stageSize.w / 2;
      text.y = 400;
      text.textAlign = 'center';
      question.addChild(text);
      opciones = new createjs.Container();
      opciones.y = 430;
      uno = new ClickableText('a1', currentQuestion.a1, 'a1', 0, 0);
      opciones.addChild(uno);
      diagonal = new createjs.Text('/', '16px Quicksand', '#333');
      diagonal.x = uno.x + uno.width;
      opciones.addChild(diagonal);
      dos = new ClickableText('a2', currentQuestion.a2, 'a2', diagonal.x + 10, 0);
      opciones.addChild(dos);
      total = uno.width + dos.width + 20;
      opciones.x = stageSize.w / 2 - total / 2;
      question.addChild(opciones);
      this.addToLibrary(uno, dos);
      this.addToMain(question);
      TweenLite.from(this.library.question, 0.5, {
        alpha: 0,
        y: -this.library.question.y + 20
      });
      TweenLite.to(this.library.tickets, 0.5, {
        alpha: 0,
        y: -this.library.tickets.y + 20
      });
      return this;
    };

    U1A2.prototype.initOptionListeners = function() {
      this.library.a1.addEventListener('click', this.evaluateAnswer);
      return this.library.a2.addEventListener('click', this.evaluateAnswer);
    };

    U1A2.prototype.introEvaluation = function() {
      U1A2.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenLite.from(this.library.tickets, 1, {
        alpha: 0,
        y: this.library.tickets.y + 20,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U1A2.prototype.initEvaluation = function(e) {
      var i, _i, _ref;
      U1A2.__super__.initEvaluation.apply(this, arguments);
      for (i = _i = 0, _ref = this.current.length - 1; _i <= _ref; i = _i += 1) {
        this.library[this.current[i].id].addEventListener('click', this.evaluateClick);
      }
      return createjs.Sound.play("s" + this.current[this.index].id);
    };

    U1A2.prototype.evaluateClick = function(e) {
      if (e.target.name === this.current[this.index].id) {
        createjs.Sound.stop();
        this.library.instructions.children[1].text = "Read and click on the correct answers.";
        if (this.index < 1) {
          createjs.Sound.play('instructions2');
        } else {
          createjs.Sound.play('good');
        }
        this.questionIndex = 0;
        return this.setTicketQuestion().initOptionListeners();
      } else {
        return this.warning();
      }
    };

    U1A2.prototype.evaluateAnswer = function(e) {
      this.answer = e.currentTarget;
      if (this.answer.index === this.current[this.index].questions[this.questionIndex].s) {
        createjs.Sound.play('good');
        this.library.score.plusOne();
      } else {
        this.warning();
      }
      return setTimeout(this.finishEvaluation, 1 * 1000);
    };

    U1A2.prototype.finishEvaluation = function() {
      this.questionIndex++;
      if (this.questionIndex < this.current[this.index].questions.length) {
        return this.setTicketQuestion().initOptionListeners();
      } else {
        return this.nextEvaluation();
      }
    };

    U1A2.prototype.nextEvaluation = function() {
      var i, _i, _ref;
      this.index++;
      if (this.index < this.current.length) {
        this.library.instructions.children[1].text = "Listen and click on the correct ticket.";
        this.setTickets();
        for (i = _i = 0, _ref = this.current.length - 1; _i <= _ref; i = _i += 1) {
          this.library[this.current[i].id].addEventListener('click', this.evaluateClick);
        }
        TweenLite.to(this.library.question, 0.5, {
          alpha: 0,
          y: -this.library.question.y + 20
        });
        TweenLite.to(this.library.tickets, 0.5, {
          alpha: 1,
          y: 0
        });
        return createjs.Sound.play("s" + this.current[this.index].id);
      } else {
        return this.finish();
      }
    };

    U1A2.prototype.repeatSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play("s" + this.current[this.index].id);
    };

    U1A2.prototype.finish = function() {
      TweenLite.to(this.library.question, 0.5, {
        alpha: 0,
        y: -this.library.question.y + 20
      });
      return U1A2.__super__.finish.apply(this, arguments);
    };

    window.U1A2 = U1A2;

    return U1A2;

  })(Oda);

}).call(this);
