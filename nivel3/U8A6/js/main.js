(function() {
  var U8A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A6 = (function(_super) {
    __extends(U8A6, _super);

    function U8A6() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.setClick = __bind(this.setClick, this);
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
          id: 'babypanda',
          src: 'baby-panda.png'
        }, {
          id: 'bridge',
          src: 'bridge.png'
        }, {
          id: 'dinosaurlong',
          src: 'dinosaur-long.png'
        }, {
          id: 'dragonfly',
          src: 'dragonfly.png'
        }, {
          id: 'emperorwall',
          src: 'emperor-wall.png'
        }, {
          id: 'fishing',
          src: 'fishing.png'
        }, {
          id: 'garbage1995',
          src: 'garbage-1995.png'
        }, {
          id: 'kidshy',
          src: 'kid-shy.png'
        }, {
          id: 'krakatoa',
          src: 'krakatoa.png'
        }, {
          id: 'lista',
          src: 'lista.txt'
        }, {
          id: 'lunchlucy',
          src: 'lunch-lucy.png'
        }, {
          id: 'paintcaves',
          src: 'paint-caves.png'
        }, {
          id: 'pollution',
          src: 'pollution.png'
        }, {
          id: 'read',
          src: 'read.png'
        }, {
          id: 'shopping',
          src: 'shopping.png'
        }, {
          id: 'stopdriving',
          src: 'stop-driving.png'
        }, {
          id: 'swimbasket',
          src: 'swim-basket.png'
        }, {
          id: 'turtle',
          src: 'turtle.png'
        }, {
          id: 'wastewater',
          src: 'waste-water.png'
        }, {
          id: 'yaks',
          src: 'yaks.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU3_U8_A6_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        preguntas: [
          {
            tipo: 'textolargo',
            imagen: 'babypanda',
            pregunta: "When Iwas a baby...",
            opcionUno: 'I could played whit other pandas.',
            opcionDos: 'I can play with other pandas.',
            opcionTres: 'I could play with other pandas.',
            respuesta: 'opcionTres'
          }, {
            tipo: 'textolargo',
            imagen: 'bridge',
            pregunta: "",
            opcionUno: 'There was a bridge.',
            opcionDos: 'There were some bridges.',
            opcionTres: "There weren't any bridges.",
            respuesta: 'opcionTres'
          }, {
            tipo: 'texto',
            imagen: 'dinosaurlong',
            pregunta: "Twelve meters.",
            opcionUno: 'How long',
            opcionDos: 'How heavy',
            opcionTres: 'How fast was it?',
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'dragonfly',
            pregunta: "It lived in swamps",
            opcionUno: 'When',
            opcionDos: 'Where',
            opcionTres: 'What did the giant dragonfly live?',
            respuesta: 'opcionUno'
          }, {
            tipo: 'textolargo',
            imagen: 'emperorwall',
            pregunta: "The Emperor built the wall because...",
            opcionUno: 'He wanted to attack the nomads.',
            opcionDos: 'He wanted the nomads to attack.',
            opcionTres: "He didn't want the nomads to attack.",
            respuesta: 'opcionTres'
          }, {
            tipo: 'textolargo',
            imagen: 'fishing',
            pregunta: "What are Tyler and his dad going to do this summer?",
            opcionUno: 'There going to go fishing.',
            opcionDos: 'They are going to go fishing.',
            opcionTres: "They're going go fishing.",
            respuesta: 'opcionDos'
          }, {
            tipo: 'textolargo',
            imagen: 'garbage1995',
            pregunta: "",
            opcionUno: "We didn't produce any garbage in Brown Town in 1995.",
            opcionDos: 'We produce a lot of garbage in Brown Town in 1995.',
            opcionTres: 'We produced some garbage in Brown Town in 1995.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'kidshy',
            pregunta: "",
            opcionUno: "He's vain",
            opcionDos: 'shy',
            opcionTres: 'energetic.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'textolargo',
            imagen: 'krakatoa',
            pregunta: "Yes, it was.",
            opcionUno: 'Was there Krakatoa a volcano?',
            opcionDos: 'Was Krakatoa a volcano?',
            opcionTres: 'Krakatoa was a volcano?',
            respuesta: 'opcionDos'
          }, {
            tipo: 'textolargo',
            imagen: 'compass',
            pregunta: "The Chinese",
            opcionUno: 'Who invented the compass?',
            opcionDos: 'Who did invent the compass?',
            opcionTres: 'Who did the compass invent?',
            respuesta: 'opcionUno'
          }, {
            tipo: 'textolargo',
            imagen: 'lunchlucy',
            pregunta: "I had lunch with Lucy.",
            opcionUno: 'What did you have for lunch?',
            opcionDos: 'Where did you have lunch?',
            opcionTres: 'Who did you have lunch with?',
            respuesta: 'opcionTres'
          }, {
            tipo: 'textolargo',
            imagen: 'paintcaves',
            pregunta: "",
            opcionUno: "People didn't paint in caves.",
            opcionDos: 'Peaple paint in caves',
            opcionTres: 'People painted in caves.',
            respuesta: 'opcionTres'
          }, {
            tipo: 'textolargo',
            imagen: 'pollution',
            pregunta: "",
            opcionUno: "There wasn't any pollution.",
            opcionDos: "There weren't any pollution.",
            opcionTres: "There was a lot of pollution.",
            respuesta: 'opcionUno'
          }, {
            tipo: 'textolargo',
            imagen: 'read',
            pregunta: "John is at school. When he gets home...",
            opcionUno: 'he is going to read a book.',
            opcionDos: 'he reads a book.',
            opcionTres: 'he read a book.',
            respuesta: 'opcionUno'
          }, {
            tipo: 'textolargo',
            imagen: 'shopping',
            pregunta: "What is she going to do this summer?",
            opcionUno: 'Is she going to go shopping.',
            opcionDos: 'She going to go shopping.',
            opcionTres: "She's going to go shopping.",
            respuesta: 'opcionTres'
          }, {
            tipo: 'textolargo',
            imagen: 'stopdriving',
            pregunta: "",
            opcionUno: 'We have to stop driving cars all day.',
            opcionDos: "We don't have to stop driving cars all day.",
            opcionTres: 'we have to stop driving red, yellow and white cars.',
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'swimbasket',
            pregunta: "First I went swimming.",
            opcionUno: 'Then',
            opcionDos: 'Finally',
            opcionTres: 'Always I played basketball.',
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'turtle',
            pregunta: "The sand turtle only ate plants.",
            opcionUno: 'It was',
            opcionDos: "wasn't",
            opcionTres: 'were an herbivore.',
            respuesta: 'opcionUno'
          }, {
            tipo: 'textolargo',
            imagen: 'wastewater',
            pregunta: "",
            opcionUno: 'We wasted water.',
            opcionDos: 'We saved water.',
            opcionTres: "We didn't waste water.",
            respuesta: 'opcionUno'
          }, {
            tipo: 'textolargo',
            imagen: 'yaks',
            pregunta: "",
            opcionUno: 'A nomad is an animal with a lot of hair.',
            opcionDos: 'Yaks eat grass in a field.',
            opcionTres: 'A herder takes care of the grass.',
            respuesta: 'opcionDos'
          }
        ]
      };
      U8A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A6.prototype.setStage = function() {
      U8A6.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.preguntas = this.shuffleNoRepeat(this.game.preguntas, 20);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Click on the correct options.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 20, 0));
      this.library.score.txtCount.color = "#0A9BDD";
      this.library.score.txtTotal.color = "#FE008F";
      return this.setQuestion(0).introEvaluation();
    };

    U8A6.prototype.setQuestion = function(i) {
      var diagonal, diagonal2, dos, opciones, question, text, total, tres, uno, v;
      question = new createjs.Container();
      question.x = 0;
      question.y = 0;
      question.name = 'question';
      v = this.createBitmap(this.preguntas[i].imagen, this.preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2 + 30, 'mc');
      question.addChild(v);
      this.addToLibrary(v);
      text = new createjs.Text(this.preguntas[i].pregunta, '24px Quicksand', '#333');
      text.name = 'titulo';
      text.x = stageSize.w / 2;
      text.y = 140;
      text.textAlign = 'center';
      text.lineWidth = 400;
      question.addChild(text);
      this.addToLibrary(text);
      opciones = new createjs.Container();
      uno = new ClickableText(this.preguntas[i].opcionUno, this.preguntas[i].opcionUno, i, 0, 0);
      uno.setLineWidth(300);
      uno.x = 0;
      opciones.addChild(uno);
      this.addToLibrary(uno);
      dos = new ClickableText(this.preguntas[i].opcionDos, this.preguntas[i].opcionDos, i, 0, 0);
      dos.setLineWidth(300);
      dos.x = uno.x + uno.width + 20;
      opciones.addChild(dos);
      this.addToLibrary(dos);
      tres = new ClickableText(this.preguntas[i].opcionTres, this.preguntas[i].opcionTres, i, 0, 0);
      tres.setLineWidth(300);
      tres.x = dos.width + dos.x + 32;
      opciones.addChild(tres);
      this.addToLibrary(tres);
      total = uno.width + dos.width + tres.width + 32;
      opciones.y = 490;
      opciones.x = stageSize.w / 2 - total / 2;
      if (this.preguntas[i].tipo === 'texto') {
        diagonal = new createjs.Text('/', '16px Quicksand', '#333');
        diagonal.name = 'diagonal';
        diagonal.x = uno.width + 12;
        diagonal.y = 0;
        opciones.addChild(diagonal);
        this.addToLibrary(diagonal);
        diagonal2 = new createjs.Text('/', '16px Quicksand', '#333');
        diagonal2.name = 'diagonal2';
        diagonal2.x = dos.x + dos.width + 16;
        diagonal2.y = 0;
        opciones.addChild(diagonal2);
        this.addToLibrary(diagonal2);
      } else if (this.preguntas[i].tipo === 'textolargo') {
        uno.text.textAlign = 'center';
        uno.setLineWidth(400);
        uno.x = stageSize.w / 2;
        uno.y = 0;
        dos.text.textAlign = 'center';
        dos.setLineWidth(400);
        dos.x = stageSize.w / 2;
        dos.y = 30;
        tres.text.textAlign = 'center';
        tres.setLineWidth(400);
        tres.x = stageSize.w / 2;
        tres.y = 60;
        opciones.y = 490;
        opciones.x = 0;
      }
      question.addChild(opciones);
      this.addToMain(question);
      return this;
    };

    U8A6.prototype.introEvaluation = function() {
      U8A6.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenLite.from(this.library['question'], 1, {
        alpha: 0,
        y: this.library['question'].y - 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U8A6.prototype.initEvaluation = function(e) {
      U8A6.__super__.initEvaluation.apply(this, arguments);
      return this.setClick(0);
    };

    U8A6.prototype.setClick = function(i) {
      this.library[this.preguntas[i].opcionUno].index = 'opcionUno';
      this.library[this.preguntas[i].opcionDos].index = 'opcionDos';
      this.library[this.preguntas[i].opcionTres].index = 'opcionTres';
      this.library[this.preguntas[i].opcionUno].addEventListener('click', this.evaluateAnswer);
      this.library[this.preguntas[i].opcionDos].addEventListener('click', this.evaluateAnswer);
      this.library[this.preguntas[i].opcionTres].addEventListener('click', this.evaluateAnswer);
      return this;
    };

    U8A6.prototype.evaluateAnswer = function(e) {
      this.answer = e.currentTarget;
      if (this.answer.index === this.preguntas[this.index].respuesta) {
        createjs.Sound.play('good');
        if (this.intento === 0) {
          this.library['score'].plusOne();
        }
        this.finishEvaluation();
        return this.intento = 0;
      } else {
        this.intento = 1;
        return this.warning();
      }
    };

    U8A6.prototype.finishEvaluation = function() {
      TweenLite.to(this.library[this.preguntas[this.index].opcionUno], 0.5, {
        alpha: 0,
        y: stageSize.h,
        ease: Back.easeOut
      });
      TweenLite.to(this.library[this.preguntas[this.index].opcionDos], 0.5, {
        alpha: 0,
        y: stageSize.h,
        ease: Back.easeOut
      });
      TweenLite.to(this.library[this.preguntas[this.index].opcionTres], 0.5, {
        alpha: 0,
        y: stageSize.h,
        ease: Back.easeOut
      });
      TweenLite.to(this.library['titulo'], 0.5, {
        alpha: 0,
        y: stageSize.h,
        ease: Back.easeOut
      });
      if (this.preguntas[this.index].tipo === 'texto') {
        TweenLite.to(this.library['diagonal'], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut
        });
        TweenLite.to(this.library['diagonal2'], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut
        });
      }
      return TweenLite.to(this.library[this.preguntas[this.index].imagen], 0.5, {
        alpha: 0,
        y: stageSize.h,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U8A6.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.preguntas.length) {
        return this.setQuestion(this.index).setClick(this.index);
      } else {
        return this.finish();
      }
    };

    U8A6.prototype.finish = function() {
      return U8A6.__super__.finish.apply(this, arguments);
    };

    window.U8A6 = U8A6;

    return U8A6;

  })(Oda);

}).call(this);
