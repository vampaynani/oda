// Generated by CoffeeScript 1.6.3
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
          x: '592',
          y: '175'
        }, {
          id: 'imageAugust',
          x: '495',
          y: '522'
        }, {
          id: 'imageChristmas',
          x: '715',
          y: '520'
        }, {
          id: 'imageDecember',
          x: '99',
          y: '298'
        }, {
          id: 'imageEaster',
          x: '603',
          y: '431'
        }, {
          id: 'imageFall',
          x: '91',
          y: '202'
        }, {
          id: 'imageFebruary',
          x: '328',
          y: '184'
        }, {
          id: 'imageJanuary',
          x: '190',
          y: '172'
        }, {
          id: 'imageJuly',
          x: '617',
          y: '529'
        }, {
          id: 'imageJune',
          x: '724',
          y: '402'
        }, {
          id: 'imageMarch',
          x: '459',
          y: '171'
        }, {
          id: 'imageMay',
          x: '719',
          y: '290'
        }, {
          id: 'imageNovember',
          x: '107',
          y: '405'
        }, {
          id: 'imageOctober',
          x: '236',
          y: '515'
        }, {
          id: 'imageSeptember',
          x: '359',
          y: '529'
        }, {
          id: 'imageSpring',
          x: '637',
          y: '284'
        }, {
          id: 'imageSummer',
          x: '137',
          y: '493'
        }, {
          id: 'imageThanksgiving',
          x: '276',
          y: '437'
        }, {
          id: 'imageValentine',
          x: '205',
          y: '251'
        }, {
          id: 'imageWinter',
          x: '304',
          y: '184'
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
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 20, 0));
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
        y: this.library['seasons'].y + 20,
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
          letra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 30, 0);
          letra.text.font = '20px Quicksand';
          letra.createHitArea(28, 30);
          letra.addEventListener('drop', this.evaluateAnswer);
          letra.onInitEvaluation();
          this.addToLibrary(letra);
          letras.addChild(letra);
        }
        if (col[i - 1] !== ' ') {
          wc = new WordContainer("l" + i, '', 'rgba(238,238,238,0.3)', '#f39234', i * 42, 50, 40, 30);
          wc.index = col[i - 1];
          this.addToLibrary(wc);
          palabra.addChild(wc);
        }
      }
      palabra.name = 'palabra';
      palabra.y = 300;
      palabra.x = stageSize.w / 2 - this.scrambled.length * 42 / 2 - 50;
      this.addToMain(palabra);
      letras.name = 'letras';
      letras.y = 300;
      letras.x = stageSize.w / 2 - this.scrambled.length * 30 / 2 - 30;
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
            if (this.answer.index === this.library["l" + i].index) {
              this.answer.visible = false;
              this.library["l" + i].changeText(this.library["l" + i].index);
              dropped = true;
            } else {
              this.warning();
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
      var i, _i, _ref;
      for (i = _i = 1, _ref = this.scrambled.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        if (this.library["l" + i]) {
          if (this.library["l" + i].text.text === '') {
            return;
          }
        }
      }
      createjs.Sound.play('good');
      TweenLite.to(this.library[this.answers[this.index].img], 1, {
        alpha: 0,
        y: this.library[this.answers[this.index].img].y - 20,
        ease: Back.easeOut
      });
      TweenLite.to(this.library.letras, 1, {
        alpha: 0,
        y: this.library['letras'].y - 20,
        ease: Back.easeOut
      });
      return TweenLite.to(this.library.palabra, 1, {
        alpha: 0,
        y: this.library['palabra'].y - 20,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U5A3.prototype.nextEvaluation = function() {
      this.index++;
      this.library.score.plusOne();
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
