// Generated by CoffeeScript 1.6.3
(function() {
  var U4A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A6 = (function(_super) {
    __extends(U4A6, _super);

    function U4A6() {
      this.repeatSound = __bind(this.repeatSound, this);
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
          id: 'repeatbtn',
          src: 'repeat-btn.png'
        }, {
          id: 'playagain',
          src: 'play_again.png'
        }, {
          id: 'startgame',
          src: 'start_game.png'
        }, {
          id: 'btnAreFew',
          src: 'btn_arefew.png'
        }, {
          id: 'btnAreLot',
          src: 'btn_arelot.png'
        }, {
          id: 'btnAreNone',
          src: 'btn_arenone.png'
        }, {
          id: 'btnIsLittle',
          src: 'btn_islittle.png'
        }, {
          id: 'btnIsLot',
          src: 'btn_islot.png'
        }, {
          id: 'btnIsNone',
          src: 'btn_isnone.png'
        }, {
          id: 'fondo',
          src: 'fondo.png'
        }, {
          id: 'objectBlueberries',
          src: 'object_blueberries_7.png'
        }, {
          id: 'objectButter',
          src: 'object_butter_3.png'
        }, {
          id: 'objectCheese',
          src: 'object_cheese_6.png'
        }, {
          id: 'objectEggs',
          src: 'object_eggs_1.png'
        }, {
          id: 'objectHoney',
          src: 'object_honey_5.png'
        }, {
          id: 'objectMeat1',
          src: 'object_meat_12.png'
        }, {
          id: 'objectMilk',
          src: 'object_milk_2.png'
        }, {
          id: 'objectMushrooms',
          src: 'object_mushrooms_11.png'
        }, {
          id: 'objectPeppers',
          src: 'object_peppers_8.png'
        }, {
          id: 'objectPopcorn',
          src: 'object_popcorn_10.png'
        }, {
          id: 'objectPumpkins',
          src: 'object_pumpkins_9.png'
        }, {
          id: 'objectYarn',
          src: 'object_yarn_4.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A6_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.objetos = ['objectBlueberries', 'objectButter', 'objectCheese', 'objectEggs', 'objectHoney', 'objectMeat1', 'objectMilk', 'objectMushrooms', 'objectPeppers', 'objectPopcorn', 'objectPumpkins', 'objectYarn'];
      U4A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A6.prototype.setStage = function() {
      U4A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertBitmap('fondo', 'fondo', 0, 123);
      this.insertBitmap('btnIsLot', 'btnIsLot', 40, 260);
      this.insertBitmap('btnIsLittle', 'btnIsLittle', 40, 300);
      this.insertBitmap('btnIsNone', 'btnIsNone', 40, 340);
      this.insertBitmap('btnAreLot', 'btnAreLot', 40, 380);
      this.insertBitmap('btnAreFew', 'btnAreFew', 40, 420);
      this.insertBitmap('btnAreNone', 'btnAreNone', 40, 460);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setBoard().introEvaluation();
    };

    U4A6.prototype.setBoard = function() {
      var board, i, v, _i;
      board = new createjs.Container();
      board.x = 290;
      board.y = 240;
      for (i = _i = 0; _i <= 11; i = ++_i) {
        if (i <= 3) {
          v = this.createBitmap(this.objetos[i], this.objetos[i], i * 127, 0, 'mc');
        } else if (i <= 7) {
          v = this.createBitmap(this.objetos[i], this.objetos[i], (i - 4) * 127, 125, 'mc');
        } else {
          v = this.createBitmap(this.objetos[i], this.objetos[i], (i - 8) * 127, 250, 'mc');
        }
        board.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(board);
      return this;
    };

    U4A6.prototype.setQuestion = function() {
      var diagonal, dos, i, opciones, question, text, total, uno, v, _i;
      question = new createjs.Container();
      question.x = 0;
      question.y = 0;
      for (i = _i = 1; _i <= 1; i = ++_i) {
        if (this.preguntas[i].tipo === 'texto') {
          v = this.createBitmap(this.preguntas[i].imagen, this.preguntas[i].imagen, stageSize.w / 2, stageSize.h / 2 + 30, 'mc');
          v.scaleX = v.scaleY = 0.5;
          question.addChild(v);
          this.addToLibrary(v);
          text = new createjs.Text(this.preguntas[i].pregunta, '24px Arial', '#333');
          text.x = stageSize.w / 2;
          text.y = 140;
          text.textAlign = 'center';
          question.addChild(text);
          opciones = new createjs.Container();
          uno = new ClickableText(this.preguntas[i].opcionUno, this.preguntas[i].opcionUno, i, 0, 0);
          opciones.addChild(uno);
          diagonal = new createjs.Text(' / ', '24px Arial', '#333');
          diagonal.x = uno.x + uno.width;
          diagonal.y = 0;
          opciones.addChild(diagonal);
          dos = new ClickableText(this.preguntas[i].opcionDos, this.preguntas[i].opcionDos, i, diagonal.x + 24, 0);
          opciones.addChild(dos);
          total = uno.width + dos.width + 20;
          opciones.x = stageSize.w / 2 - total / 2;
          opciones.y = 490;
          question.addChild(opciones);
        } else if (this.preguntas[i].tipo = 'imagen') {
          text = new createjs.Text(this.preguntas[i].pregunta, '24px Arial', '#333');
          text.x = 0;
          text.y = 140;
          question.addChild(text);
          v = this.createBitmap(this.preguntas[i].opcionUno, this.preguntas[i].opcionUno, stageSize.w / 4, stageSize.h / 2 + 30, 'mc');
          v.scaleX = v.scaleY = 0.3;
          question.addChild(v);
          this.addToLibrary(v);
          v = this.createBitmap(this.preguntas[i].opcionDos, this.preguntas[i].opcionDos, (stageSize.w / 4) * 3, stageSize.h / 2 + 30, 'mc');
          v.scaleX = v.scaleY = 0.3;
          question.addChild(v);
          this.addToLibrary(v);
        }
      }
      this.addToMain(question);
      return this;
    };

    U4A6.prototype.introEvaluation = function() {
      U4A6.__super__.introEvaluation.apply(this, arguments);
      /*
      		for i in [1..6] by 1
      			@observer.subscribe 'init_evaluation', @library['name'+i].onInitEvaluation
      
      		@library['characters'].currentFrame = @answers[@index].id
      
      		TweenLite.from @library['header'], 1, {y:-@library['header'].height}
      		TweenLite.from @library['instructions'], 1, {alpha :0, x: 0, delay: 0.5}
      		TweenLite.from @library['names'], 1, {alpha: 0, y: @library['names'].y + 50, delay: 1}
      		TweenLite.from @library['dropname'], 1, {alpha: 0, y: @library['dropname'].y + 50, delay: 1}
      		TweenLite.from @library['characters'], 1, {alpha: 0, y: @library['characters'].y + 20, delay: 1.5, onComplete: @playInstructions, onCompleteParams: [@]}
      */

      return this;
    };

    U4A6.prototype.initEvaluation = function(e) {
      U4A6.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U4A6.prototype.evaluateAnswer = function(e) {
      var pt;
      this.answer = e.target;
      pt = this.library['dropname'].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library['dropname'].hitTest(pt.x, pt.y)) {
        if (this.answer.index === this.answers[this.index].id) {
          this.answer.blink(false);
          return setTimeout(this.finishEvaluation, 1 * 1000);
        } else {
          this.warning();
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U4A6.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U4A6.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        this.library['score'].updateCount(this.index);
        this.library['characters'].alpha = 1;
        this.library['characters'].y = stageSize.h - 180;
        this.library['characters'].currentFrame = this.answers[this.index].id;
        createjs.Sound.play(this.answers[this.index].sound);
        return TweenLite.from(this.library['characters'], 0.5, {
          alpha: 0,
          y: this.library['characters'].y + 20,
          ease: Quart.easeOut
        });
      } else {
        return this.finish();
      }
    };

    U4A6.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U4A6.prototype.finish = function() {
      var i, _i, _results;
      U4A6.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U4A6 = U4A6;

    return U4A6;

  })(Oda);

}).call(this);