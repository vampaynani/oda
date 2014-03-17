(function() {
  var U5A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A3 = (function(_super) {
    __extends(U5A3, _super);

    function U5A3() {
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
          id: 'imageApril',
          src: 'image_april.png'
        }, {
          id: 'imageAugust',
          src: 'image_august.png'
        }, {
          id: 'imageChristmas',
          src: 'image_christmas.png'
        }, {
          id: 'imageDecember',
          src: 'image_december.png'
        }, {
          id: 'imageEaster',
          src: 'image_easter.png'
        }, {
          id: 'imageFall',
          src: 'image_fall.png'
        }, {
          id: 'imageFebruary',
          src: 'image_february.png'
        }, {
          id: 'imageJanuary',
          src: 'image_january.png'
        }, {
          id: 'imageJuly',
          src: 'image_july.png'
        }, {
          id: 'imageJune',
          src: 'image_june.png'
        }, {
          id: 'imageMarch',
          src: 'image_march.png'
        }, {
          id: 'imageMay',
          src: 'image_may.png'
        }, {
          id: 'imageNovember',
          src: 'image_november.png'
        }, {
          id: 'imageOctober',
          src: 'image_october.png'
        }, {
          id: 'imageSeptember',
          src: 'image_september.png'
        }, {
          id: 'imageSpring',
          src: 'image_spring.png'
        }, {
          id: 'imageSummer',
          src: 'image_summer.png'
        }, {
          id: 'imageThanksgiving',
          src: 'image_thanksgiving.png'
        }, {
          id: 'imageValentine',
          src: 'image_valentine.png'
        }, {
          id: 'imageWinter',
          src: 'image_winter.png'
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
          src: 'sounds/TU2_U5_A3_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.imagenes = [
        {
          id: 'imageApril',
          x: 1184,
          y: 350
        }, {
          id: 'imageAugust',
          x: 990,
          y: 1044
        }, {
          id: 'imageChristmas',
          x: 1430,
          y: 1040
        }, {
          id: 'imageDecember',
          x: 198,
          y: 596
        }, {
          id: 'imageEaster',
          x: 1206,
          y: 862
        }, {
          id: 'imageFall',
          x: 182,
          y: 404
        }, {
          id: 'imageFebruary',
          x: 656,
          y: 368
        }, {
          id: 'imageJanuary',
          x: 380,
          y: 344
        }, {
          id: 'imageJuly',
          x: 1234,
          y: 1058
        }, {
          id: 'imageJune',
          x: 1448,
          y: 804
        }, {
          id: 'imageMarch',
          x: 918,
          y: 342
        }, {
          id: 'imageMay',
          x: 1438,
          y: 580
        }, {
          id: 'imageNovember',
          x: 214,
          y: 810
        }, {
          id: 'imageOctober',
          x: 472,
          y: 1030
        }, {
          id: 'imageSeptember',
          x: 718,
          y: 1058
        }, {
          id: 'imageSpring',
          x: 1274,
          y: 568
        }, {
          id: 'imageSummer',
          x: 274,
          y: 586
        }, {
          id: 'imageThanksgiving',
          x: 552,
          y: 874
        }, {
          id: 'imageValentine',
          x: 410,
          y: 502
        }, {
          id: 'imageWinter',
          x: 608,
          y: 368
        }
      ];
      this.answers = [
        {
          txt: 'January',
          img: 'imageJanuary'
        }, {
          txt: 'February',
          img: 'imageFebruary'
        }, {
          txt: 'March',
          img: 'imageMarch'
        }, {
          txt: 'April',
          img: 'imageApril'
        }, {
          txt: 'May',
          img: 'imageMay'
        }, {
          txt: 'June',
          img: 'imageJune'
        }, {
          txt: 'July',
          img: 'imageJuly'
        }, {
          txt: 'August',
          img: 'imageAugust'
        }, {
          txt: 'September',
          img: 'imageSeptember'
        }, {
          txt: 'October',
          img: 'imageOctober'
        }, {
          txt: 'November',
          img: 'imageNovember'
        }, {
          txt: 'December',
          img: 'imageDecember'
        }, {
          txt: 'Spring',
          img: 'imageSpring'
        }, {
          txt: 'Summer',
          img: 'imageSummer'
        }, {
          txt: 'Fall',
          img: 'imageFall'
        }, {
          txt: 'Winter',
          img: 'imageWinter'
        }, {
          txt: 'Easter',
          img: 'imageEaster'
        }, {
          txt: "Valentine's Day",
          img: 'imageValentine'
        }, {
          txt: 'Christmas',
          img: 'imageChristmas'
        }, {
          txt: 'Thanksgiving',
          img: 'imageThanksgiving'
        }
      ];
      U5A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A3.prototype.setStage = function() {
      U5A3.__super__.setStage.apply(this, arguments);
      this.success = 1;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Unscramble the seasons, months of the year and holidays.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 20, 0));
      return this.setSeasons().introEvaluation();
    };

    U5A3.prototype.setSeasons = function() {
      var i, img, seasons, _i;
      seasons = new createjs.Container();
      seasons.name = 'seasons';
      for (i = _i = 0; _i <= 19; i = ++_i) {
        img = this.createBitmap(this.imagenes[i].id, this.imagenes[i].id, this.imagenes[i].x, this.imagenes[i].y, 'mc');
        img.scaleX = img.scaleY = 0.5;
        this.addToLibrary(img);
        seasons.addChild(img);
      }
      this.addToMain(seasons);
      return this;
    };

    U5A3.prototype.introEvaluation = function() {
      U5A3.__super__.introEvaluation.apply(this, arguments);
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
        y: this.library['seasons'].y + 40,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U5A3.prototype.initEvaluation = function(e) {
      U5A3.__super__.initEvaluation.apply(this, arguments);
      this.answers = this.shuffle(this.answers);
      return this.setQuestion(this.index);
    };

    U5A3.prototype.setQuestion = function(question) {
      var col, i, letra, letras, palabra, wc, _i, _ref;
      letras = new createjs.Container();
      palabra = new createjs.Container();
      col = this.answers[this.index].txt.split('');
      this.scrambled = this.shuffle(col);
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.scrambled[i - 1] !== ' ') {
          letra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 60, 0);
          letra.text.font = '40px Quicksand';
          letra.createHitArea(56, 60);
          letra.addEventListener('drop', this.evaluateAnswer);
          letra.onInitEvaluation();
          this.addToLibrary(letra);
          letras.addChild(letra);
        }
        if (col[i - 1] !== ' ') {
          wc = new WordContainer("l" + i, '', 'rgba(238,238,238,0.3)', '#f39234', i * 84, 100, 80, 60);
          wc.index = col[i - 1];
          wc.hitter = null;
          wc.addEventListener('mousedown', function(e) {
            var cwc;
            cwc = e.currentTarget;
            return cwc.addEventListener('pressmove', function(ev) {
              if (cwc.hitter) {
                cwc.changeText('');
                cwc.hitter.visible = true;
                return cwc.hitter.returnToPlace();
              }
            });
          });
          this.addToLibrary(wc);
          palabra.addChild(wc);
        }
      }
      palabra.name = 'palabra';
      palabra.y = 600;
      palabra.x = stageSize.w / 2 - this.scrambled.length * 84 / 2 - 100;
      this.addToMain(palabra);
      letras.name = 'letras';
      letras.y = 600;
      letras.x = stageSize.w / 2 - this.scrambled.length * 60 / 2 - 60;
      return this.addToMain(letras);
    };

    U5A3.prototype.evaluateAnswer = function(e) {
      var dropped, i, pt, _i, _ref;
      this.answer = e.target;
      dropped = false;
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.library["l" + i]) {
          pt = this.library["l" + i].globalToLocal(this.stage.mouseX, this.stage.mouseY);
          if (this.library["l" + i].hitTest(pt.x, pt.y)) {
            if (this.library["l" + i].text.text === '') {
              this.answer.visible = false;
              this.library["l" + i].hitter = this.answer;
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

    U5A3.prototype.finishEvaluation = function() {
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

    U5A3.prototype.nextEvaluation = function() {
      TweenLite.to(this.library[this.answers[this.index].img], 1, {
        alpha: 0,
        y: this.library[this.answers[this.index].img].y - 40,
        ease: Back.easeOut
      });
      TweenLite.to(this.library.letras, 1, {
        alpha: 0,
        y: this.library['letras'].y - 40,
        ease: Back.easeOut
      });
      TweenLite.to(this.library.palabra, 1, {
        alpha: 0,
        y: this.library['palabra'].y - 40,
        ease: Back.easeOut
      });
      this.index++;
      if (this.index < this.answers.length) {
        return this.setQuestion(this.index);
      } else {
        return this.finish();
      }
    };

    U5A3.prototype.finish = function() {
      return U5A3.__super__.finish.apply(this, arguments);
    };

    window.U5A3 = U5A3;

    return U5A3;

  })(Oda);

}).call(this);
