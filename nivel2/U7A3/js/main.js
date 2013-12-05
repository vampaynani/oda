// Generated by CoffeeScript 1.6.3
(function() {
  var U7A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U7A3 = (function(_super) {
    __extends(U7A3, _super);

    function U7A3() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      this.setFinal = __bind(this.setFinal, this);
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
          id: 'greenbg',
          src: 'green/propbg.png'
        }, {
          id: 'greenscreen',
          src: 'green/screen_begreen.png'
        }, {
          id: 'dropAreagreenB',
          src: 'green/dropArea_B.png'
        }, {
          id: 'dropAreagreenE',
          src: 'green/dropArea_E.png'
        }, {
          id: 'dropAreagreenG',
          src: 'green/dropArea_G.png'
        }, {
          id: 'dropAreagreenR',
          src: 'green/dropArea_R.png'
        }, {
          id: 'dropAreagreenE2',
          src: 'green/dropArea_E2.png'
        }, {
          id: 'dropAreagreenE3',
          src: 'green/dropArea_E3.png'
        }, {
          id: 'dropAreagreenN',
          src: 'green/dropArea_N.png'
        }, {
          id: 'greenB',
          src: 'green/outsite_B.png'
        }, {
          id: 'greenE',
          src: 'green/outside_E.png'
        }, {
          id: 'greenG',
          src: 'green/outside_G.png'
        }, {
          id: 'greenR',
          src: 'green/outside_R.png'
        }, {
          id: 'greenE2',
          src: 'green/outside_E2.png'
        }, {
          id: 'greenE3',
          src: 'green/outside_E3.png'
        }, {
          id: 'greenN',
          src: 'green/outside_N.png'
        }, {
          id: 'summerscreen',
          src: 'summer/screen_summer.png'
        }, {
          id: 'summerbg',
          src: 'summer/prop_bg.png'
        }, {
          id: 'dropAreasummerS',
          src: 'summer/dropArea_S.png'
        }, {
          id: 'dropAreasummerU',
          src: 'summer/dropArea_U.png'
        }, {
          id: 'dropAreasummerM',
          src: 'summer/dropArea_M.png'
        }, {
          id: 'dropAreasummerM2',
          src: 'summer/dropArea_M2.png'
        }, {
          id: 'dropAreasummerE',
          src: 'summer/dropArea_E.png'
        }, {
          id: 'dropAreasummerR',
          src: 'summer/dropArea_R.png'
        }, {
          id: 'summerS',
          src: 'summer/sLetra.png'
        }, {
          id: 'summerU',
          src: 'summer/u.png'
        }, {
          id: 'summerM',
          src: 'summer/m.png'
        }, {
          id: 'summerM2',
          src: 'summer/m2.png'
        }, {
          id: 'summerE',
          src: 'summer/e.png'
        }, {
          id: 'summerR',
          src: 'summer/r.png'
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
          src: 'sounds/TU2_U7_A3_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.positions = {
        summertexts: [
          {
            t: '1. They are horse backriding.',
            l: 'summerS'
          }, {
            t: '2. She is fishing at the lake.',
            l: 'summerU'
          }, {
            t: '3. He is canoeing in the lake.',
            l: 'summerM'
          }, {
            t: '4. She is playing soccer.',
            l: 'summerM2'
          }, {
            t: '5. He is resting in the cabin.',
            l: 'summerE'
          }, {
            t: '6. They are hiking mountains.',
            l: 'summerR'
          }
        ],
        summerletras: [
          {
            letra: 'summerS',
            x: '366',
            y: '185'
          }, {
            letra: 'summerU',
            x: '201',
            y: '172'
          }, {
            letra: 'summerM',
            x: '80',
            y: '175'
          }, {
            letra: 'summerM2',
            x: '423',
            y: '281'
          }, {
            letra: 'summerE',
            x: '162',
            y: '291'
          }, {
            letra: 'summerR',
            x: '211',
            y: '98'
          }
        ],
        greentexts: [
          {
            t: '1. She is planting trees.',
            l: 'greenB'
          }, {
            t: '2. He is protecting endangered animals.',
            l: 'greenE'
          }, {
            t: '3. She is riding her bike.',
            l: 'greenG'
          }, {
            t: '4. He is conserving water.',
            l: 'greenR'
          }, {
            t: '5. She is picking up trash.',
            l: 'greenE2'
          }, {
            t: '6. She is turning off lights.',
            l: 'greenE3'
          }, {
            t: '7. He is recycling bottles and cans.',
            l: 'greenN'
          }
        ],
        greenletras: [
          {
            letra: 'greenB',
            x: '187',
            y: '119'
          }, {
            letra: 'greenE',
            x: '49',
            y: '264'
          }, {
            letra: 'greenG',
            x: '267',
            y: '209'
          }, {
            letra: 'greenR',
            x: '428',
            y: '178'
          }, {
            letra: 'greenE2',
            x: '314',
            y: '220'
          }, {
            letra: 'greenE3',
            x: '470',
            y: '119'
          }, {
            letra: 'greenN',
            x: '413',
            y: '245'
          }
        ]
      };
      U7A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U7A3.prototype.setStage = function() {
      U7A3.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Read, drag the letters and complete the mystery word.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 13, 0));
      return this.setScene(1).introEvaluation();
    };

    U7A3.prototype.setScene = function(scene) {
      var drop, es, fondo, hit, hits, i, letra, letrafinal, word, _i, _j, _ref, _ref1;
      this.escena = new createjs.Container();
      this.escena.x = 116;
      this.escena.y = 160;
      this.escena.name = 'escena';
      if (scene === 1) {
        es = 'summer';
        this.esc = 1;
      } else {
        es = 'green';
        this.esc = 2;
      }
      fondo = this.createBitmap("" + es + "bg", "" + es + "bg", 24, 11);
      this.texts = this.positions["" + es + "texts"];
      this.insertText('label', this.texts[this.index].t, '24px Quicksand', '#333', stageSize.w / 2, 140, 'center');
      this.escena.addChild(fondo);
      this.letras = this.positions["" + es + "letras"];
      hits = new Array();
      for (i = _i = 0, _ref = this.letras.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        word = this.letras[i];
        if (scene === 1) {
          drop = this.createBitmap("darea" + word.letra, "dropArea" + word.letra, i * 75 + 85, 430, 'bc');
        }
        if (scene === 2) {
          drop = this.createBitmap("darea" + word.letra, "dropArea" + word.letra, i * 75 + 55, 430, 'bc');
          if (i >= 2) {
            drop.x = drop.x + 30;
          }
        }
        hit = new createjs.Shape();
        hit.graphics.beginFill('rgba(255,255,255,1)').drawRect(0, 0, drop.width, drop.height);
        hit.x = drop.x - drop.width / 2;
        hit.y = drop.y - drop.height;
        hit.name = "dropArea" + word.letra;
        hits.push(hit);
        this.escena.addChild(hit, drop);
      }
      for (i = _j = 0, _ref1 = this.letras.length - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 0 <= _ref1 ? ++_j : --_j) {
        word = this.letras[i];
        if (scene === 1) {
          drop = this.createBitmap("darea" + word.letra, "dropArea" + word.letra, i * 75 + 85, 430, 'bc');
        }
        if (scene === 2) {
          drop = this.createBitmap("darea" + word.letra, "dropArea" + word.letra, i * 75 + 55, 430, 'bc');
          if (i >= 2) {
            drop.x = drop.x + 30;
          }
        }
        letra = new Droppable(word.letra, this.preload.getResult(word.letra), i, word.x - 10, word.y - 10, this.stage, hits);
        letra.scaleX = letra.scaleY = 0.43;
        letrafinal = this.createBitmap("f" + this.letras[i].letra, this.letras[i].letra, drop.x, drop.y - 7, 'bc');
        letrafinal.visible = false;
        this.addToLibrary(letra, letrafinal);
        this.escena.addChild(letra, letrafinal);
      }
      this.addToMain(this.escena);
      return this;
    };

    U7A3.prototype.setFinal = function() {
      var es, fin, final;
      if (this.esc === 1) {
        es = 'summer';
      } else {
        es = 'green';
      }
      this.index = 0;
      TweenLite.to(this.library.label, 0.5, {
        alpha: 0
      });
      final = new createjs.Container();
      final.name = 'final';
      fin = this.createBitmap(es + 'screen', es + 'screen', stageSize.w / 2, stageSize.h / 2, 'mc');
      final.addChild(fin);
      this.addToLibrary(final);
      this.addToMain(final);
      TweenLite.to(this.library.final, 1, {
        alpha: 1,
        delay: 0
      });
      TweenLite.to(this.library.final, 1, {
        alpha: 0,
        delay: 2
      });
      if (this.esc === 1) {
        this.setScene(2).initEvaluation();
        TweenLite.from(this.library.escena, 2, {
          alpha: 0,
          y: this.library.escena.y + 20,
          delay: 4
        });
        TweenLite.from(this.library.label, 0.5, {
          alpha: 0,
          delay: 4
        });
      } else {
        TweenLite.from(this.library.escena, 2, {
          alpha: 0,
          y: this.library.escena.y + 20,
          delay: 4,
          onComplete: this.finish()
        });
      }
      return this;
    };

    U7A3.prototype.introEvaluation = function() {
      U7A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library.label, 1, {
        alpha: 0,
        y: this.library.label.y + 10,
        delay: 1
      });
      return TweenLite.from(this.library.escena, 1, {
        alpha: 0,
        y: this.library.escena.y + 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U7A3.prototype.initEvaluation = function(e) {
      var i, _i, _ref, _results;
      U7A3.__super__.initEvaluation.apply(this, arguments);
      _results = [];
      for (i = _i = 0, _ref = this.letras.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        this.library["" + this.letras[i].letra].initDragListener();
        _results.push(this.library["" + this.letras[i].letra].addEventListener('dropped', this.evaluateAnswer));
      }
      return _results;
    };

    U7A3.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      this.drop = e.drop;
      if (("dropArea" + this.answer.name) === this.drop.name) {
        if (this.answer.name === this.texts[this.index].l) {
          this.library["f" + this.answer.name].visible = true;
          this.answer.visible = false;
          if (this.intento === 0) {
            this.library['score'].plusOne();
          }
          this.finishEvaluation();
          createjs.Sound.play('good');
          return this.intento = 0;
        } else {
          this.answer.returnToPlace(1, 0.43, 0.43);
          this.intento = 1;
          this.warning();
          return console.log('fail');
        }
      } else {
        this.answer.returnToPlace(1, 0.43, 0.43);
        return this.warning();
      }
    };

    U7A3.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library.label, 0.5, {
        alpha: 0,
        y: this.library.label.y + 10,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U7A3.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.texts.length) {
        this.library.label.text = this.texts[this.index].t;
        return TweenLite.to(this.library.label, 0.5, {
          alpha: 1,
          y: this.library.label.y - 10,
          ease: Quart.easeOut
        });
      } else {
        this.escena.removeAllChildren();
        this.mainContainer.removeChild(this.escena);
        return this.setFinal();
      }
    };

    U7A3.prototype.finish = function() {
      TweenLite.to(this.library.instructions, 1, {
        alpha: 0
      });
      TweenLite.to(this.library.escena, 1, {
        alpha: 0,
        y: this.library.escena.y + 20
      });
      return U7A3.__super__.finish.apply(this, arguments);
    };

    window.U7A3 = U7A3;

    return U7A3;

  })(Oda);

}).call(this);
