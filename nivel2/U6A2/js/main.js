(function() {
  var U6A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U6A2 = (function(_super) {
    __extends(U6A2, _super);

    function U6A2() {
      this.repeatSound = __bind(this.repeatSound, this);
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
          id: 'btnrepeat',
          src: 'btn_repeat.png'
        }, {
          id: 'calles',
          src: 'calles.png'
        }, {
          id: 'map1',
          src: 'map_1.png'
        }, {
          id: 'map2',
          src: 'map_2.png'
        }, {
          id: 'map3',
          src: 'map_3.png'
        }, {
          id: 'bus',
          src: 'place_bus.png'
        }, {
          id: 'cafe',
          src: 'place_cafe.png'
        }, {
          id: 'hospital',
          src: 'place_hospital.png'
        }, {
          id: 'library',
          src: 'place_library.png'
        }, {
          id: 'museum',
          src: 'place_museum2.png'
        }, {
          id: 'pet',
          src: 'place_pet.png'
        }, {
          id: 'restaurant',
          src: 'place_restaurant.png'
        }, {
          id: 'school',
          src: 'place_school.png'
        }, {
          id: 'theater',
          src: 'place_theater.png'
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
          src: 'sounds/TU2_U6_A2_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U6_A2_map1_hospital.mp3',
          id: 'shospital'
        }, {
          src: 'sounds/TU2_U6_A2_map1_restaurant.mp3',
          id: 'srestaurant'
        }, {
          src: 'sounds/TU2_U6_A2_map1_theater.mp3',
          id: 'stheater'
        }, {
          src: 'sounds/TU2_U6_A2_map2_bus.mp3',
          id: 'sbus'
        }, {
          src: 'sounds/TU2_U6_A2_map2_museum.mp3',
          id: 'smuseum'
        }, {
          src: 'sounds/TU2_U6_A2_map2_school.mp3',
          id: 'sschool'
        }, {
          src: 'sounds/TU2_U6_A2_map3_cafe.mp3',
          id: 'scafe'
        }, {
          src: 'sounds/TU2_U6_A2_map3_library.mp3',
          id: 'slibrary'
        }, {
          src: 'sounds/TU2_U6_A2_map3_pet.mp3',
          id: 'spet'
        }
      ];
      this.game = [
        [
          {
            i: 'theater',
            x: 290,
            y: -80,
            w: 190,
            h: 190
          }, {
            i: 'hospital',
            x: 810,
            y: 189,
            w: 190,
            h: 190
          }, {
            i: 'restaurant',
            x: 105,
            y: 460,
            w: 190,
            h: 190
          }
        ], [
          {
            i: 'bus',
            x: 116,
            y: 184,
            w: 190,
            h: 190
          }, {
            i: 'museum',
            x: 618,
            y: 196,
            w: 190,
            h: 190
          }, {
            i: 'school',
            x: 280,
            y: -74,
            w: 190,
            h: 190
          }
        ], [
          {
            i: 'library',
            x: -94,
            y: 210,
            w: 190,
            h: 190
          }, {
            i: 'cafe',
            x: 120,
            y: -74,
            w: 190,
            h: 190
          }, {
            i: 'pet',
            x: 800,
            y: -73,
            w: 190,
            h: 190
          }
        ]
      ];
      U6A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U6A2.prototype.setStage = function() {
      U6A2.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and drag the buildings to the correct place on the map.', 80, 200);
      this.insertBitmap('btnRepeat', 'repeatbtn', stageSize.w / 2, 1140, 'mc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 9, 0));
      this.intento = 0;
      return this.setMap(1).introEvaluation();
    };

    U6A2.prototype.setMap = function(map) {
      var calles, d1, d2, d3, drop, drops, fondo, i, mapa, s, _i, _j, _len, _ref;
      mapa = new createjs.Container();
      mapa.name = 'mapa';
      mapa.x = 300;
      mapa.y = 360;
      fondo = this.createBitmap("map" + map, "map" + map, -100, -80);
      calles = this.createBitmap('calles', 'calles', -100, -60);
      mapa.addChild(calles, fondo);
      this.current = this.game[map - 1];
      drops = new Array();
      _ref = this.current;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        drop = _ref[_i];
        s = new createjs.Shape();
        s.name = "" + drop.i;
        s.graphics.beginFill('rgba(255,255,255,0.1)').drawRect(0, 0, drop.w, drop.h);
        s.x = drop.x;
        s.y = drop.y;
        drops.push(s);
        this.addToLibrary(s);
        mapa.addChild(s);
      }
      d1 = new Droppable('d1', this.preload.getResult(this.current[0].i), this.current[0].i, 1100, 110, this.stage, drops);
      d2 = new Droppable('d2', this.preload.getResult(this.current[1].i), this.current[1].i, 1100, 310, this.stage, drops);
      d3 = new Droppable('d3', this.preload.getResult(this.current[2].i), this.current[2].i, 1100, 510, this.stage, drops);
      d1.scaleX = d1.scaleY = d2.scaleX = d2.scaleY = d3.scaleX = d3.scaleY = 0.7;
      this.addToLibrary(d1, d2, d3);
      mapa.addChild(d1, d2, d3);
      this.addToMain(mapa);
      for (i = _j = 1; _j <= 3; i = _j += 1) {
        this.library["d" + i].addEventListener('dropped', this.evaluateAnswer);
      }
      return this;
    };

    U6A2.prototype.introEvaluation = function() {
      U6A2.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library.btnRepeat, 1, {
        alpha: 0,
        y: this.library.btnRepeat.y + 20,
        delay: 1
      });
      return TweenLite.from(this.library.mapa, 1, {
        alpha: 0,
        y: this.library.mapa.y + 40,
        delay: 1.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U6A2.prototype.initEvaluation = function(e) {
      var i, _i, _results;
      U6A2.__super__.initEvaluation.apply(this, arguments);
      this.mindex = 0;
      createjs.Sound.play("s" + this.current[this.mindex].i);
      this.library.btnRepeat.addEventListener('click', this.repeatSound);
      _results = [];
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        _results.push(this.library["d" + i].initDragListener());
      }
      return _results;
    };

    U6A2.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      this.drop = e.drop;
      if (this.answer.index === this.drop.name) {
        this.answer.endDragListener();
        this.answer.putInPlace({
          x: this.drop.x,
          y: this.drop.y
        });
        this.finishEvaluation();
        return createjs.Sound.play('good');
      } else {
        this.warning();
        this.intento = 1;
        return this.answer.returnToPlace(this.answer.alpha, this.answer.scaleX, this.answer.scaleY);
      }
    };

    U6A2.prototype.finishEvaluation = function() {
      this.mindex++;
      if (this.intento === 0) {
        this.library.score.plusOne();
      }
      this.intento = 0;
      createjs.Sound.stop();
      if (this.mindex < this.current.length) {
        return createjs.Sound.play("s" + this.current[this.mindex].i);
      } else {
        this.mindex = 0;
        setTimeout(this.nextEvaluation, 2 * 1000);
        return this.library.btnRepeat.removeEventListener('click', this.repeatSound);
      }
    };

    U6A2.prototype.nextEvaluation = function() {
      var i, _i, _results;
      this.index++;
      TweenLite.to(this.library.mapa, 1, {
        alpha: 0,
        y: this.library.mapa.y + 40
      });
      if (this.index < this.game.length) {
        this.setMap(this.index + 1);
        createjs.Sound.play("s" + this.current[this.mindex].i);
        this.library.btnRepeat.addEventListener('click', this.repeatSound);
        _results = [];
        for (i = _i = 1; _i <= 3; i = _i += 1) {
          _results.push(this.library["d" + i].initDragListener());
        }
        return _results;
      } else {
        return this.finish();
      }
    };

    U6A2.prototype.repeatSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play("s" + this.current[this.mindex].i);
    };

    U6A2.prototype.finish = function() {
      createjs.Sound.stop();
      TweenLite.to(this.library.btnRepeat, 1, {
        alpha: 0,
        y: this.library.btnRepeat.y + 20
      });
      return U6A2.__super__.finish.apply(this, arguments);
    };

    window.U6A2 = U6A2;

    return U6A2;

  })(Oda);

}).call(this);
