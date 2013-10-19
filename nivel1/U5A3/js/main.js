// Generated by CoffeeScript 1.6.3
(function() {
  var U5A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A3 = (function(_super) {
    __extends(U5A3, _super);

    function U5A3() {
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
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A6_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.answers = [];
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
      U5A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A3.prototype.setStage = function() {
      U5A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setQuestion().introEvaluation();
    };

    U5A3.prototype.setQuestion = function() {
      var guion, i, img, largo, letra, letras, palabra, seasons, _i, _j;
      seasons = new createjs.Container();
      for (i = _i = 0; _i <= 19; i = ++_i) {
        img = this.createBitmap(this.imagenes[i].id, this.imagenes[i].id, this.imagenes[i].x, this.imagenes[i].y, 'mc');
        img.scaleX = img.scaleY = 0.5;
        seasons.addChild(img);
      }
      largo = 7;
      letras = new createjs.Container();
      palabra = new createjs.Container();
      for (i = _j = 1; 1 <= largo ? _j <= largo : _j >= largo; i = 1 <= largo ? ++_j : --_j) {
        letra = new createjs.Text('a', '24px Arial', '#333');
        letra.x = i * 30;
        letra.y = 0;
        letras.addChild(letra);
        guion = new WordContainer('l' + 1, '', '', '#f39234', i * 40, 50, 32, 22);
        palabra.addChild(guion);
        this.addToLibrary(guion);
      }
      letras.y = palabra.y = 300;
      palabra.x = stageSize.w / 2 - (largo * 40) / 2;
      letras.x = stageSize.w / 2 - (largo * 30) / 2;
      seasons.x = 0;
      seasons.y = 0;
      this.addToMain(seasons);
      this.addToMain(palabra);
      this.addToMain(letras);
      return this;
    };

    U5A3.prototype.introEvaluation = function() {
      return U5A3.__super__.introEvaluation.apply(this, arguments);
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

    };

    U5A3.prototype.initEvaluation = function(e) {
      U5A3.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U5A3.prototype.evaluateAnswer = function(e) {
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

    U5A3.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U5A3.prototype.nextEvaluation = function() {
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

    U5A3.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U5A3.prototype.finish = function() {
      var i, _i, _results;
      U5A3.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U5A3 = U5A3;

    return U5A3;

  })(Oda);

}).call(this);
