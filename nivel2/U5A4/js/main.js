(function() {
  var U5A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A4 = (function(_super) {
    __extends(U5A4, _super);

    function U5A4() {
      this.repeatSound = __bind(this.repeatSound, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.selectKid = __bind(this.selectKid, this);
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
          id: 'bg',
          src: 'prop_piso.png'
        }, {
          id: 'summerJenifferdressclothdrag',
          src: 'summer/jeniffer_dress_cloth_drag_summer.png'
        }, {
          id: 'summerJenifferhatclothdrag',
          src: 'summer/jeniffer_hat_cloth_drag_summer.png'
        }, {
          id: 'summerJeniffersandalsclothdrag',
          src: 'summer/jeniffer_sandals_cloth_drag_summer.png'
        }, {
          id: 'summerJeniffersunglassesclothdrag',
          src: 'summer/jeniffer_sunglasses_cloth_drag_summer.png'
        }, {
          id: 'summerMIkecapclothdrag',
          src: 'summer/mIke_cap_cloth_drag_summer.png'
        }, {
          id: 'summerMIkeshirtclothdrag',
          src: 'summer/mIke_shirt_cloth_drag_summer.png'
        }, {
          id: 'summerMIkesunglassesclothdrag',
          src: 'summer/mIke_sunglasses_cloth_drag_summer.png'
        }, {
          id: 'summerMIkeswimsuitclothdrag',
          src: 'summer/mIke_swimsuit_cloth_drag_summer.png'
        }, {
          id: 'summerMIketennisclothdrag',
          src: 'summer/mIke_tennis_cloth_drag_summer.png'
        }, {
          id: 'summerRachelhatclothdrag',
          src: 'summer/rachel_hat_cloth_drag_summer.png'
        }, {
          id: 'summerRachelsandalsclothdrag',
          src: 'summer/rachel_sandals_cloth_drag_summer.png'
        }, {
          id: 'summerRachelswimsuitclothdrag',
          src: 'summer/rachel_swimsuit_cloth_drag_summer.png'
        }, {
          id: 'summerTylercapclothdrag',
          src: 'summer/tyler_cap_cloth_drag_summer.png'
        }, {
          id: 'summerTylersandalsclothdrag',
          src: 'summer/tyler_sandals_cloth_drag_summer.png'
        }, {
          id: 'summerTylerswimsuitclothdrag',
          src: 'summer/tyler_swimsuit_cloth_drag_summer.png'
        }, {
          id: 'winterJenniferbootsclothdrag',
          src: 'winter/jennifer_boots_cloth_drag_winter.png'
        }, {
          id: 'winterJenniferhatclothdrag',
          src: 'winter/jennifer_hat_cloth_drag_winter.png'
        }, {
          id: 'winterJenniferraincoatclothdrag',
          src: 'winter/jennifer_raincoat_cloth_drag_winter.png'
        }, {
          id: 'winterMikebootsclothdrag',
          src: 'winter/mike_boots_cloth_drag_winter.png'
        }, {
          id: 'winterMikecoatclothdrag',
          src: 'winter/mike_coat_cloth_drag_winter.png'
        }, {
          id: 'winterMikeglovesclothdrag',
          src: 'winter/mike_gloves_cloth_drag_winter.png'
        }, {
          id: 'winterMikehatclothdragwinter',
          src: 'winter/mike_hat_cloth_drag_winter.png'
        }, {
          id: 'winterMikejeansclothdrag',
          src: 'winter/mike_jeans_cloth_drag_winter.png'
        }, {
          id: 'winterRacheljacketclothdrag',
          src: 'winter/rachel_jacket_cloth_drag_winter.png'
        }, {
          id: 'winterRachelscarfclothdrag',
          src: 'winter/rachel_scarf_cloth_drag_winter.png'
        }, {
          id: 'winterRachelshoesclothdrag',
          src: 'winter/rachel_shoes_cloth_drag_winter.png'
        }, {
          id: 'winterRachelskirtclothdrag',
          src: 'winter/rachel_skirt_cloth_drag_winter.png'
        }, {
          id: 'winterTylerhatclothdrag',
          src: 'winter/tyler_hat_cloth_drag_winter.png'
        }, {
          id: 'winterTylerpantsclothdrag',
          src: 'winter/tyler_pants_cloth_drag_winter.png'
        }, {
          id: 'winterTylersweaterclothdrag',
          src: 'winter/tyler_sweater_cloth_drag_winter.png'
        }, {
          id: 'winterTylertennisclothdrag',
          src: 'winter/tyler_tennis_cloth_drag_winter.png'
        }, {
          id: 'summerchildjennifer',
          src: 'summer_child_jennifer.png'
        }, {
          id: 'summerchildjenniferdress',
          src: 'summer_child_jennifer_dress.png'
        }, {
          id: 'summerchildjenniferglasses',
          src: 'summer_child_jennifer_glasses.png'
        }, {
          id: 'summerchildjenniferhat',
          src: 'summer_child_jennifer_hat.png'
        }, {
          id: 'summerchildjennifershoes',
          src: 'summer_child_jennifer_shoes.png'
        }, {
          id: 'summerchildmike',
          src: 'summer_child_mike.png'
        }, {
          id: 'summerchildmikeglasses',
          src: 'summer_child_mike_glasses.png'
        }, {
          id: 'summerchildmikehat',
          src: 'summer_child_mike_hat.png'
        }, {
          id: 'summerchildmikeshirt',
          src: 'summer_child_mike_shirt.png'
        }, {
          id: 'summerchildmikeshoes',
          src: 'summer_child_mike_shoes.png'
        }, {
          id: 'summerchildmikeshort',
          src: 'summer_child_mike_short.png'
        }, {
          id: 'summerchildrachel',
          src: 'summer_child_rachel.png'
        }, {
          id: 'summerchildrachelhat',
          src: 'summer_child_rachel_hat.png'
        }, {
          id: 'summerchildrachelshoes',
          src: 'summer_child_rachel_shoes.png'
        }, {
          id: 'summerchildrachelsuit',
          src: 'summer_child_rachel_suit.png'
        }, {
          id: 'summerchildtyler',
          src: 'summer_child_tyler.png'
        }, {
          id: 'summerchildtylerhat',
          src: 'summer_child_tyler_hat.png'
        }, {
          id: 'summerchildtylershoes',
          src: 'summer_child_tyler_shoes.png'
        }, {
          id: 'summerchildtylershort',
          src: 'summer_child_tyler_short.png'
        }, {
          id: 'winterchildrachelbufanda',
          src: 'winter_child_bufanda.png'
        }, {
          id: 'winterchildjennifer',
          src: 'winter_child_jennifer.png'
        }, {
          id: 'winterchildjenniferboots',
          src: 'winter_child_jennifer_boots.png'
        }, {
          id: 'winterchildjennifercoat',
          src: 'winter_child_jennifer_coat.png'
        }, {
          id: 'winterchildjenniferhat',
          src: 'winter_child_jennifer_hat.png'
        }, {
          id: 'winterchildmike',
          src: 'winter_child_mike.png'
        }, {
          id: 'winterchildmikeboats',
          src: 'winter_child_mike_boats.png'
        }, {
          id: 'winterchildmikecoat',
          src: 'winter_child_mike_coat.png'
        }, {
          id: 'winterchildmikegloves',
          src: 'winter_child_mike_gloves.png'
        }, {
          id: 'winterchildmikehat',
          src: 'winter_child_mike_hat.png'
        }, {
          id: 'winterchildmikejeans',
          src: 'winter_child_mike_jeans.png'
        }, {
          id: 'winterchildrachel',
          src: 'winter_child_rachel.png'
        }, {
          id: 'winterchildrachelcoat',
          src: 'winter_child_rachel_coat.png'
        }, {
          id: 'winterchildrachelshoes',
          src: 'winter_child_rachel_shoes.png'
        }, {
          id: 'winterchildrachelskirt',
          src: 'winter_child_rachel_skirt.png'
        }, {
          id: 'winterchildtyler',
          src: 'winter_child_tyler.png'
        }, {
          id: 'winterchildtylerhat',
          src: 'winter_child_tyler_hat.png'
        }, {
          id: 'winterchildtylerpants',
          src: 'winter_child_tyler_pants.png'
        }, {
          id: 'winterchildtylersweater',
          src: 'winter_child_tyler_sweater.png'
        }, {
          id: 'winterchildtylertennis',
          src: 'winter_child_tyler_tennis.png'
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
          src: 'sounds/TU2_U5_A4_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U5_A4_summer_jennifer.mp3',
          id: 'ssummerchildjennifer'
        }, {
          src: 'sounds/TU2_U5_A4_summer_mike.mp3',
          id: 'ssummerchildmike'
        }, {
          src: 'sounds/TU2_U5_A4_summer_rachel.mp3',
          id: 'ssummerchildrachel'
        }, {
          src: 'sounds/TU2_U5_A4_summer_tyler.mp3',
          id: 'ssummerchildtyler'
        }, {
          src: 'sounds/TU2_U5_A4_winter_jennifer.mp3',
          id: 'swinterchildjennifer'
        }, {
          src: 'sounds/TU2_U5_A4_winter_mike.mp3',
          id: 'swinterchildmike'
        }, {
          src: 'sounds/TU2_U5_A4_winter_rachel.mp3',
          id: 'swinterchildrachel'
        }, {
          src: 'sounds/TU2_U5_A4_winter_tyler.mp3',
          id: 'swinterchildtyler'
        }
      ];
      this.game = {
        summer: {
          kids: [['summerchildjennifer', 'summerchildjenniferdress', 'summerchildjenniferglasses', 'summerchildjenniferhat', 'summerchildjennifershoes'], ['summerchildtyler', 'summerchildtylershort', 'summerchildtylerhat', 'summerchildtylershoes'], ['summerchildrachel', 'summerchildrachelhat', 'summerchildrachelshoes', 'summerchildrachelsuit'], ['summerchildmike', 'summerchildmikeglasses', 'summerchildmikehat', 'summerchildmikeshort', 'summerchildmikeshirt', 'summerchildmikeshoes']],
          drops: [
            {
              summerJenifferdressclothdrag: 'summerchildjenniferdress',
              summerJenifferhatclothdrag: 'summerchildjenniferhat',
              summerJeniffersandalsclothdrag: 'summerchildjennifershoes',
              summerJeniffersunglassesclothdrag: 'summerchildjenniferglasses'
            }, {
              summerTylercapclothdrag: 'summerchildtylerhat',
              summerTylersandalsclothdrag: 'summerchildtylershoes',
              summerTylerswimsuitclothdrag: 'summerchildtylershort'
            }, {
              summerRachelhatclothdrag: 'summerchildrachelhat',
              summerRachelsandalsclothdrag: 'summerchildrachelshoes',
              summerRachelswimsuitclothdrag: 'summerchildrachelsuit'
            }, {
              summerMIkecapclothdrag: 'summerchildmikehat',
              summerMIkeshirtclothdrag: 'summerchildmikeshirt',
              summerMIkesunglassesclothdrag: 'summerchildmikeglasses',
              summerMIkeswimsuitclothdrag: 'summerchildmikeshort',
              summerMIketennisclothdrag: 'summerchildmikeshoes'
            }
          ],
          positions: [
            {
              id: 'summerJenifferdressclothdrag',
              x: 1466,
              y: 920
            }, {
              id: 'summerJenifferhatclothdrag',
              x: 292,
              y: 864
            }, {
              id: 'summerJeniffersandalsclothdrag',
              x: 1434,
              y: 810
            }, {
              id: 'summerJeniffersunglassesclothdrag',
              x: 494,
              y: 864
            }, {
              id: 'summerMIkecapclothdrag',
              x: 1264,
              y: 878
            }, {
              id: 'summerMIkeshirtclothdrag',
              x: 1008,
              y: 900
            }, {
              id: 'summerMIkesunglassesclothdrag',
              x: 1390,
              y: 1110
            }, {
              id: 'summerMIkeswimsuitclothdrag',
              x: 1230,
              y: 1000
            }, {
              id: 'summerMIketennisclothdrag',
              x: 844,
              y: 1036
            }, {
              id: 'summerRachelhatclothdrag',
              x: 696,
              y: 854
            }, {
              id: 'summerRachelsandalsclothdrag',
              x: 1006,
              y: 1088
            }, {
              id: 'summerRachelswimsuitclothdrag',
              x: 922,
              y: 882
            }, {
              id: 'summerTylercapclothdrag',
              x: 606,
              y: 960
            }, {
              id: 'summerTylersandalsclothdrag',
              x: 582,
              y: 1070
            }, {
              id: 'summerTylerswimsuitclothdrag',
              x: 374,
              y: 1032
            }
          ]
        },
        winter: {
          kids: [['winterchildjennifer', 'winterchildjenniferboots', 'winterchildjennifercoat', 'winterchildjenniferhat'], ['winterchildtyler', 'winterchildtylerhat', 'winterchildtylerpants', 'winterchildtylersweater', 'winterchildtylertennis'], ['winterchildrachel', 'winterchildrachelcoat', 'winterchildrachelshoes', 'winterchildrachelskirt', 'winterchildrachelbufanda'], ['winterchildmike', 'winterchildmikejeans', 'winterchildmikeboats', 'winterchildmikecoat', 'winterchildmikegloves', 'winterchildmikehat']],
          drops: [],
          positions: [
            {
              id: 'winterJenniferbootsclothdrag',
              x: 1260,
              y: 818
            }, {
              id: 'winterJenniferhatclothdrag',
              x: 1082,
              y: 856
            }, {
              id: 'winterJenniferraincoatclothdrag',
              x: 1426,
              y: 1030
            }, {
              id: 'winterMikebootsclothdrag',
              x: 608,
              y: 1072
            }, {
              id: 'winterMikecoatclothdrag',
              x: 820,
              y: 994
            }, {
              id: 'winterMikeglovesclothdrag',
              x: 960,
              y: 980
            }, {
              id: 'winterMikehatclothdragwinter',
              x: 442,
              y: 858
            }, {
              id: 'winterMikejeansclothdrag',
              x: 264,
              y: 888
            }, {
              id: 'winterRacheljacketclothdrag',
              x: 294,
              y: 1046
            }, {
              id: 'winterRachelscarfclothdrag',
              x: 1464,
              y: 814
            }, {
              id: 'winterRachelshoesclothdrag',
              x: 854,
              y: 830
            }, {
              id: 'winterRachelskirtclothdrag',
              x: 422,
              y: 990
            }, {
              id: 'winterTylerhatclothdrag',
              x: 1356,
              y: 906
            }, {
              id: 'winterTylerpantsclothdrag',
              x: 632,
              y: 894
            }, {
              id: 'winterTylersweaterclothdrag',
              x: 1132,
              y: 988
            }, {
              id: 'winterTylertennisclothdrag',
              x: 1264,
              y: 1066
            }
          ]
        }
      };
      U5A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A4.prototype.setStage = function() {
      U5A4.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Click on the models, listen and dress them up.', 80, 200);
      this.insertBitmap('bg', 'bg', 170, 600);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 15, 0));
      return this.setKids('summer').setRopa().introEvaluation();
    };

    U5A4.prototype.setKids = function(station) {
      var asset, boton, current, hit, i, j, kids, _i, _j, _k, _ref;
      kids = new createjs.Container();
      kids.name = 'kids';
      kids.x = 320;
      kids.y = 300;
      this.station = station;
      current = this.game[this.station].kids;
      for (i = _i = 0; _i <= 3; i = _i += 1) {
        boton = this.createBitmap("repeat" + current[i][0], 'repeatbtn', i * 290, 400);
        boton.visible = false;
        this.addToLibrary(boton);
        kids.addChild(boton);
      }
      for (i = _j = 0; _j <= 3; i = _j += 1) {
        for (j = _k = 0, _ref = current[i].length - 1; _k <= _ref; j = _k += 1) {
          asset = this.createBitmap(current[i][j], current[i][j], i * 320 + 40, 170, 'mc');
          asset.scaleX = asset.scaleY = 0.45;
          if (j > 0) {
            asset.visible = false;
          } else {
            hit = new createjs.Shape();
            hit.graphics.beginFill('#000').drawRect(-5, -3, asset.width + 40, asset.height + 20);
            asset.index = i;
            asset.hitArea = hit;
          }
          this.addToLibrary(asset);
          kids.addChild(asset);
        }
      }
      this.addToMain(kids);
      return this;
    };

    U5A4.prototype.setRopa = function() {
      var current, i, ropa, ropas, _i, _ref;
      ropas = new createjs.Container();
      ropas.name = 'ropas';
      ropas.x = 0;
      ropas.y = 0;
      current = this.game[this.station].positions;
      for (i = _i = 0, _ref = current.length - 1; _i <= _ref; i = _i += 1) {
        ropa = new Draggable("r" + i, this.preload.getResult(current[i].id), current[i].id, current[i].x, current[i].y, 'mc');
        this.addToLibrary(ropa);
        ropas.addChild(ropa);
      }
      this.addToMain(ropas);
      return this;
    };

    U5A4.prototype.introEvaluation = function() {
      var i, kid, _i, _j, _len, _ref, _ref1;
      U5A4.__super__.introEvaluation.apply(this, arguments);
      for (i = _i = 0, _ref = this.game[this.station].positions.length - 1; _i <= _ref; i = _i += 1) {
        this.observer.subscribe('init_kid_evaluation', this.library["r" + i].onInitEvaluation);
      }
      _ref1 = this.game[this.station].kids;
      for (_j = 0, _len = _ref1.length; _j < _len; _j++) {
        kid = _ref1[_j];
        this.blink(this.library[kid[0]]);
      }
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library.bg, 1, {
        alpha: 0,
        y: this.library.bg.y + 40,
        delay: 1
      });
      TweenLite.from(this.library.kids, 1, {
        alpha: 0,
        y: this.library.kids.y + 40,
        delay: 1
      });
      return TweenLite.from(this.library.ropas, 1, {
        alpha: 0,
        y: this.library.ropas.y + 40,
        delay: 1.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U5A4.prototype.initEvaluation = function(e) {
      var kid, _i, _len, _ref, _results;
      U5A4.__super__.initEvaluation.apply(this, arguments);
      _ref = this.game[this.station].kids;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        kid = _ref[_i];
        _results.push(this.library[kid[0]].addEventListener('click', this.selectKid));
      }
      return _results;
    };

    U5A4.prototype.selectKid = function(e) {
      var i, kid, _i, _j, _len, _ref, _ref1;
      this.selected = e.target;
      this.blink(this.selected, false);
      _ref = this.game[this.station].kids;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        kid = _ref[_i];
        this.library[kid[0]].removeEventListener('click', this.selectKid);
      }
      for (i = _j = 0, _ref1 = this.game[this.station].positions.length - 1; _j <= _ref1; i = _j += 1) {
        this.library["r" + i].removeAllEventListeners();
        this.library["r" + i].addEventListener('drop', this.evaluateAnswer);
      }
      this.intento = 0;
      createjs.Sound.play("s" + this.selected.name);
      this.library["repeat" + this.selected.name].visible = true;
      this.library["repeat" + this.selected.name].addEventListener('click', this.repeatSound);
      return this.observer.notify('init_kid_evaluation');
    };

    U5A4.prototype.evaluateAnswer = function(e) {
      var drops, pt;
      this.answer = e.target;
      pt = this.selected.globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.selected.hitTest(pt.x, pt.y)) {
        drops = this.game[this.station].drops[this.selected.index];
        if (drops[this.answer.index]) {
          if (this.intento === 0) {
            this.library.score.plusOne();
          }
          this.library[drops[this.answer.index]].visible = true;
          this.answer.visible = false;
          this.finishEvaluation();
          this.intento = 0;
          return createjs.Sound.play('good');
        } else {
          this.intento = 1;
          this.answer.returnToPlace();
          return this.warning();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U5A4.prototype.finishEvaluation = function() {
      var asset, _i, _len, _ref;
      _ref = this.game[this.station].kids[this.selected.index];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        asset = _ref[_i];
        if (this.library[asset].visible === false) {
          return;
        }
      }
      this.library["repeat" + this.selected.name].removeEventListener('click', this.repeatSound);
      return TweenLite.to(this.library["repeat" + this.selected.name], 1, {
        y: this.library["repeat" + this.selected.name] + 100,
        alpha: 0,
        onComplete: this.nextEvaluation
      });
    };

    U5A4.prototype.nextEvaluation = function() {
      var kid, _i, _len, _ref, _results;
      this.index++;
      if (this.index < this.game[this.station].kids.length) {
        _ref = this.game[this.station].kids;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          kid = _ref[_i];
          _results.push(this.library[kid[0]].addEventListener('click', this.selectKid));
        }
        return _results;
      } else {
        return this.finish();
      }
    };

    U5A4.prototype.blink = function(obj, state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      obj.alpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: .2,
          repeat: -1,
          yoyo: true
        });
      }
    };

    U5A4.prototype.repeatSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play("s" + this.selected.name);
    };

    U5A4.prototype.finish = function() {
      TweenLite.to(this.library.bg, 1, {
        alpha: 0,
        y: this.library.bg.y + 40
      });
      TweenLite.to(this.library.kids, 1, {
        alpha: 0,
        y: this.library.kids.y + 40
      });
      return U5A4.__super__.finish.apply(this, arguments);
    };

    window.U5A4 = U5A4;

    return U5A4;

  })(Oda);

}).call(this);
