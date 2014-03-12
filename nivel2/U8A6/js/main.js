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
          id: 'Asiangirl',
          src: 'Asian-girl.png'
        }, {
          id: 'boyhair',
          src: 'boy-hair.png'
        }, {
          id: 'brushtowelsoap',
          src: 'brush-towel-soap.png'
        }, {
          id: 'brushinghisteeth',
          src: 'brushing-his-teeth.png'
        }, {
          id: 'busfullpeople',
          src: 'bus-full-people.png'
        }, {
          id: 'chef',
          src: 'chef.png'
        }, {
          id: 'chopsticks',
          src: 'chopsticks.png'
        }, {
          id: 'cloudyday',
          src: 'cloudy-day.png'
        }, {
          id: 'familyChristmas',
          src: 'family-Christmas.png'
        }, {
          id: 'fullmoon',
          src: 'full-moon.png'
        }, {
          id: 'girlcanoeing',
          src: 'girl-canoeing.png'
        }, {
          id: 'girlhair',
          src: 'girl-hair.png'
        }, {
          id: 'hotday',
          src: 'hot-day.png'
        }, {
          id: 'leaves',
          src: 'leaves.png'
        }, {
          id: 'librarian',
          src: 'librarian.png'
        }, {
          id: 'mapaSB',
          src: 'mapa-SB.png'
        }, {
          id: 'motherchild',
          src: 'mother-child.png'
        }, {
          id: 'necklace',
          src: 'necklace.png'
        }, {
          id: 'USmoney',
          src: 'US-money.png'
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
          src: 'sounds/TU2_U8_A6_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        preguntas: [
          {
            tipo: 'texto',
            imagen: 'Asiangirl',
            pregunta: "Where's she from?",
            opcionUno: 'China.',
            opcionDos: 'Japan.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'boyhair',
            pregunta: 'Does he have curly hair?',
            opcionUno: 'Yes, he does.',
            opcionDos: "No, he doesn't.",
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'brushtowelsoap',
            pregunta: 'What are you packing?',
            opcionUno: 'Soap, a toothbrush, a comb and a towel.',
            opcionDos: 'Soap, a brush, toothpaste and a towel.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'brushinghisteeth',
            pregunta: "What's she doing?",
            opcionUno: "She's brushing her teeth.",
            opcionDos: "She's floshing her teeth.",
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'busfullpeople',
            pregunta: '',
            opcionUno: "It's full.",
            opcionDos: "It's empty.",
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'chef',
            pregunta: 'She makes food.',
            opcionUno: 'A waitress.',
            opcionDos: 'A chef.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'chopsticks',
            pregunta: 'What are these?',
            opcionUno: "They're chopsticks.",
            opcionDos: "They're fans.",
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'cloudyday',
            pregunta: "What's the weather like?",
            opcionUno: "It's cloudy.",
            opcionDos: "It's snowy.",
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'familyChristmas',
            pregunta: 'They visit their friends and family.',
            opcionUno: 'What do they visit on Christmas?',
            opcionDos: 'Who do they visit on Christmas?',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'fullmoon',
            pregunta: 'Where do they celebrate the Moon Festival?',
            opcionUno: 'In India.',
            opcionDos: 'In China.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'girlcanoeing',
            pregunta: 'What are they doing?',
            opcionUno: "They're fishing.",
            opcionDos: "They're canoeing.",
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'girlhair',
            pregunta: 'She has long blonde hair.',
            opcionUno: 'True.',
            opcionDos: 'False.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'hotday',
            pregunta: "What's the weather like?",
            opcionUno: "It's stormy.",
            opcionDos: "It's sunny.",
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'leaves',
            pregunta: 'When do we play in the leaves?',
            opcionUno: 'in the fall.',
            opcionDos: 'In the winter.',
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'librarian',
            pregunta: 'Where does a librarian works?',
            opcionUno: 'At a bookstore.',
            opcionDos: 'At a library.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'mapaSB',
            pregunta: "Where's the internet café?",
            opcionUno: "Go straight. Turn right on Pine Street. It's next to the grocery store.",
            opcionDos: "Go straight. Turn left on Pine Street. It's across from the police station.",
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'mapaSB',
            pregunta: "Go straight. Turn right on Pine Street. It's across from the fire station.",
            opcionUno: "Where's the art museum?",
            opcionDos: "Where's the movie theater?",
            respuesta: 'opcionUno'
          }, {
            tipo: 'texto',
            imagen: 'motherchild',
            pregunta: "When do we celebrate Mother's Day?",
            opcionUno: 'In June.',
            opcionDos: 'In May.',
            respuesta: 'opcionDos'
          }, {
            tipo: 'texto',
            imagen: 'necklace',
            pregunta: '',
            opcionUno: "It's nineteen dollars and fifteen cents.",
            opcionDos: "It's nineteen dollars and fifty cents.",
            respuesta: "opcionDos"
          }, {
            tipo: 'texto',
            imagen: 'USmoney',
            pregunta: 'Three dollars and twenty-five cents.',
            opcionUno: '$25.30',
            opcionDos: '$3.25',
            respuesta: 'opcionDos'
          }
        ]
      };
      U8A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A6.prototype.setStage = function() {
      U8A6.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.preguntas = this.shuffleNoRepeat(this.game.preguntas, 10);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Take the review quiz! Look and click on the correct option.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 10, 0));
      return this.setQuestion(0).introEvaluation();
    };

    U8A6.prototype.setQuestion = function(i) {
      var diagonal, dos, opciones, question, text, total, uno, v;
      question = new createjs.Container();
      question.x = 0;
      question.y = 0;
      question.name = 'question';
      if (this.preguntas[i].tipo === 'texto') {
        v = this.createBitmap(this.preguntas[i].imagen, this.preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2 + 60, 'mc');
        v.scaleX = v.scaleY = 1;
        question.addChild(v);
        this.addToLibrary(v);
        text = new createjs.Text(this.preguntas[i].pregunta, '48px Quicksand', '#333');
        text.name = 'titulo';
        text.x = stageSize.w / 2;
        text.y = 280;
        text.textAlign = 'center';
        text.lineWidth = 900;
        question.addChild(text);
        this.addToLibrary(text);
        opciones = new createjs.Container();
        uno = new ClickableText(this.preguntas[i].opcionUno, this.preguntas[i].opcionUno, i, 0, 0);
        uno.text.textAlign = 'center';
        uno.setLineWidth(600);
        uno.x = stageSize.w / 2 - uno.width / 2 - 20;
        opciones.addChild(uno);
        this.addToLibrary(uno);
        diagonal = new createjs.Text('/', '32px Quicksand', '#333');
        diagonal.name = 'diagonal';
        diagonal.textAlign = 'center';
        diagonal.x = stageSize.w / 2;
        diagonal.y = 0;
        opciones.addChild(diagonal);
        this.addToLibrary(diagonal);
        dos = new ClickableText(this.preguntas[i].opcionDos, this.preguntas[i].opcionDos, i, 0, 0);
        dos.text.textAlign = 'center';
        dos.setLineWidth(600);
        dos.x = stageSize.w / 2 + dos.width / 2 + 20;
        opciones.addChild(dos);
        this.addToLibrary(dos);
        total = uno.width + dos.width + 40;
        opciones.y = 980;
        question.addChild(opciones);
      }
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
        y: this.library['question'].y - 40,
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
      this.library[this.preguntas[i].opcionUno].addEventListener('click', this.evaluateAnswer);
      this.library[this.preguntas[i].opcionDos].addEventListener('click', this.evaluateAnswer);
      return this;
    };

    U8A6.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
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
      if (this.preguntas[this.index].tipo === 'texto') {
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
        TweenLite.to(this.library['titulo'], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut
        });
        TweenLite.to(this.library['diagonal'], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut
        });
        return TweenLite.to(this.library[this.preguntas[this.index].imagen], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut,
          onComplete: this.nextEvaluation
        });
      } else if (this.preguntas[this.index].tipo === 'imagen') {
        TweenLite.to(this.library['titulo'], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut,
          onComplete: this.nextEvaluation
        });
        TweenLite.to(this.library[this.preguntas[this.index].opcionDos], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut
        });
        return TweenLite.to(this.library[this.preguntas[this.index].opcionUno], 0.5, {
          alpha: 0,
          y: stageSize.h,
          ease: Back.easeOut
        });
      }
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
