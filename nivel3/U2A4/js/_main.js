// Generated by CoffeeScript 1.6.3
(function() {
  var U2A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A4 = (function(_super) {
    __extends(U2A4, _super);

    function U2A4() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
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
          id: 'imageBacon',
          src: 'image_bacon.png'
        }, {
          id: 'imageButter',
          src: 'image_butter.png'
        }, {
          id: 'imageCheese',
          src: 'image_cheese.png'
        }, {
          id: 'imageCream',
          src: 'image_cream.png'
        }, {
          id: 'imageHoney',
          src: 'image_honey.png'
        }, {
          id: 'imageLeather',
          src: 'image_leather.png'
        }, {
          id: 'imageMushrooms',
          src: 'image_mushrooms.png'
        }, {
          id: 'imagePeanutbutter',
          src: 'image_peanutbutter.png'
        }, {
          id: 'imagePumpkins',
          src: 'image_pumpkins.png'
        }, {
          id: 'imageSugar',
          src: 'image_sugar.png'
        }, {
          id: 'imageTomatoes',
          src: 'image_tomatoes.png'
        }, {
          id: 'imageTurbines',
          src: 'image_turbines.png'
        }, {
          id: 'imageWax',
          src: 'image_wax.png'
        }, {
          id: 'imageYarn',
          src: 'image_yarn.png'
        }, {
          id: 'imageYogurt',
          src: 'image_yogurt.png'
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
          src: 'sounds/TU3_U2_A4_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.game = {
        imagenes: [
          {
            id: 'imageBacon',
            x: '118',
            y: '415',
            txt: 'Bacon'
          }, {
            id: 'imageButter',
            x: '95',
            y: '334',
            txt: 'Butter'
          }, {
            id: 'imageCheese',
            x: '176',
            y: '524',
            txt: 'Cheese'
          }, {
            id: 'imageCream',
            x: '569',
            y: '165',
            txt: 'Cream'
          }, {
            id: 'imageHoney',
            x: '717',
            y: '282',
            txt: 'Honey'
          }, {
            id: 'imageLeather',
            x: '684',
            y: '520',
            txt: 'Leather'
          }, {
            id: 'imageMushrooms',
            x: '323',
            y: '177',
            txt: 'Mushrooms'
          }, {
            id: 'imagePeanutbutter',
            x: '540',
            y: '498',
            txt: 'Peanutbutter'
          }, {
            id: 'imagePumpkins',
            x: '168',
            y: '165',
            txt: 'Pumpkins'
          }, {
            id: 'imageSugar',
            x: '149',
            y: '266',
            txt: 'Sugar'
          }, {
            id: 'imageTomatoes',
            x: '460',
            y: '165',
            txt: 'Tomatoes'
          }, {
            id: 'imageTurbines',
            x: '679',
            y: '163',
            txt: 'Turbines'
          }, {
            id: 'imageWax',
            x: '402',
            y: '520',
            txt: 'Wax'
          }, {
            id: 'imageYarn',
            x: '701',
            y: '422',
            txt: 'Yarn'
          }, {
            id: 'imageYogurt',
            x: '279',
            y: '481',
            txt: 'Yogurt'
          }
        ]
      };
      this.answers = [
        {
          txt: 'Bacon',
          img: 'imageBacon'
        }, {
          txt: 'Butter',
          img: 'imageButter'
        }, {
          txt: 'Cheese',
          img: 'imageCheese'
        }, {
          txt: 'Cream',
          img: 'imageCream'
        }, {
          txt: 'Honey',
          img: 'imageHoney'
        }, {
          txt: 'Leather',
          img: 'imageLeather'
        }, {
          txt: 'Mushrooms',
          img: 'imageMushrooms'
        }, {
          txt: 'Peanutbutter',
          img: 'imagePeanutbutter'
        }, {
          txt: 'Pumpkins',
          img: 'imagePumpkins'
        }, {
          txt: 'Sugar',
          img: 'imageSugar'
        }, {
          txt: 'Tomatoes',
          img: 'imageTomatoes'
        }, {
          txt: 'Turbines',
          img: 'imageTurbines'
        }, {
          txt: 'Wax',
          img: 'imageWax'
        }, {
          txt: 'Yarn',
          img: 'imageYarn'
        }, {
          txt: 'Yogurt',
          img: 'imageYogurt'
        }
      ];
      U2A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U2A4.prototype.setStage = function() {
      U2A4.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Drag the letters to write a word.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 15, 0));
      return this.setSeasons().introEvaluation();
    };

    U2A4.prototype.setSeasons = function() {
      var i, img, seasons, _i, _ref;
      seasons = new createjs.Container();
      this.imagenes = this.game.imagenes;
      seasons.name = 'seasons';
      for (i = _i = 0, _ref = this.imagenes.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        img = this.createBitmap(this.imagenes[i].id, this.imagenes[i].id, this.imagenes[i].x, this.imagenes[i].y, 'mc');
        this.addToLibrary(img);
        seasons.addChild(img);
      }
      this.addToMain(seasons);
      return this;
    };

    U2A4.prototype.introEvaluation = function() {
      U2A4.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      return TweenLite.from(this.library['seasons'], 0.5, {
        alpha: 0,
        y: this.library['seasons'].y + 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U2A4.prototype.initEvaluation = function(e) {
      U2A4.__super__.initEvaluation.apply(this, arguments);
      this.answers = this.shuffle(this.imagenes);
      return this.setQuestion(this.index);
    };

    U2A4.prototype.setQuestion = function(question) {
      var col, i, letra, letras, palabra, wc, _i, _ref;
      letras = new createjs.Container();
      palabra = new createjs.Container();
      col = this.answers[this.index].txt.split('');
      this.scrambled = this.shuffle(col);
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.scrambled[i - 1] !== ' ') {
          letra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 30, 0);
          letra.text.font = '20px Arial';
          letra.addEventListener('drop', this.evaluateAnswer);
          letra.onInitEvaluation();
          this.addToLibrary(letra);
          letras.addChild(letra);
        }
        if (col[i - 1] !== ' ') {
          wc = new WordContainer("l" + i, '', '#FFF', '#f39234', i * 40, 50, 32, 22);
          wc.index = col[i - 1];
          this.addToLibrary(wc);
          palabra.addChild(wc);
        }
      }
      palabra.name = 'palabra';
      palabra.y = 300;
      palabra.x = stageSize.w / 2 - this.scrambled.length * 40 / 2 - 50;
      this.addToMain(palabra);
      letras.name = 'letras';
      letras.y = 300;
      letras.x = stageSize.w / 2 - this.scrambled.length * 30 / 2 - 30;
      return this.addToMain(letras);
    };

    U2A4.prototype.evaluateAnswer = function(e) {
      var dropped, i, pt, _i, _ref;
      this.answer = e.target;
      dropped = false;
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.library["l" + i]) {
          pt = this.library["l" + i].globalToLocal(this.stage.mouseX, this.stage.mouseY);
          if (this.library["l" + i].hitTest(pt.x, pt.y)) {
            if (this.library["l" + i].text.text === '') {
              this.answer.visible = false;
              this.library["l" + i].changeText(this.answer.index);
              dropped = true;
            }
          }
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace();
      } else {
        return this.finishEvaluation();
      }
    };

    U2A4.prototype.finishEvaluation = function() {
      var col, i, _i, _j, _k, _ref, _ref1, _ref2;
      col = this.answers[this.index].txt.split('');
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.library["l" + i]) {
          if (this.library["l" + i].text.text === '') {
            return;
          }
        }
      }
      for (i = _j = 1, _ref1 = this.scrambled.length; 1 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 1 <= _ref1 ? ++_j : --_j) {
        if (this.library["l" + i]) {
          if (this.library["l" + i].text.text !== col[i - 1]) {
            this.success = 0;
          }
        }
      }
      if (this.success === 1) {
        createjs.Sound.play('good');
        this.library.score.plusOne();
      } else {
        createjs.Sound.play('wrong');
        this.success = 1;
        for (i = _k = 1, _ref2 = this.scrambled.length; 1 <= _ref2 ? _k <= _ref2 : _k >= _ref2; i = 1 <= _ref2 ? ++_k : --_k) {
          this.library["l" + i].text.text = col[i - 1];
        }
      }
      return setTimeout(this.nextEvaluation, 2 * 1000);
    };

    U2A4.prototype.nextEvaluation = function() {
      TweenLite.to(this.library[this.imagenes[this.index].id], 1, {
        alpha: 0,
        y: this.library[this.imagenes[this.index].id].y - 20,
        ease: Back.easeOut
      });
      TweenLite.to(this.library.letras, 1, {
        alpha: 0,
        y: this.library['letras'].y - 20,
        ease: Back.easeOut
      });
      TweenLite.to(this.library.palabra, 1, {
        alpha: 0,
        y: this.library['palabra'].y - 20,
        ease: Back.easeOut
      });
      this.index++;
      if (this.index < this.answers.length) {
        return this.setQuestion(this.index);
      } else {
        return this.finish();
      }
    };

    U2A4.prototype.finish = function() {
      return U2A4.__super__.finish.apply(this, arguments);
    };

    window.U2A4 = U2A4;

    return U2A4;

  })(Oda);

}).call(this);