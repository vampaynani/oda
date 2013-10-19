// Generated by CoffeeScript 1.6.3
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
          id: 'summerJeniffersunglassesclothdrag_',
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
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U5_A4_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.answers = [];
      this.positions = {
        summer: [
          {
            id: 'summerJenifferdressclothdrag',
            x: '713',
            y: '490'
          }, {
            id: 'summerJenifferhatclothdrag',
            x: '146',
            y: '432'
          }, {
            id: 'summerJeniffersandalsclothdrag',
            x: '717',
            y: '405'
          }, {
            id: 'summerJeniffersunglassesclothdrag_',
            x: '247',
            y: '432'
          }, {
            id: 'summerMIkecapclothdrag',
            x: '632',
            y: '439'
          }, {
            id: 'summerMIkeshirtclothdrag',
            x: '504',
            y: '450'
          }, {
            id: 'summerMIkesunglassesclothdrag',
            x: '695',
            y: '555'
          }, {
            id: 'summerMIkeswimsuitclothdrag',
            x: '590',
            y: '500'
          }, {
            id: 'summerMIketennisclothdrag',
            x: '422',
            y: '518'
          }, {
            id: 'summerRachelhatclothdrag',
            x: '348',
            y: '427'
          }, {
            id: 'summerRachelsandalsclothdrag',
            x: '503',
            y: '544'
          }, {
            id: 'summerRachelswimsuitclothdrag',
            x: '421',
            y: '461'
          }, {
            id: 'summerTylercapclothdrag',
            x: '303',
            y: '490'
          }, {
            id: 'summerTylersandalsclothdrag',
            x: '291',
            y: '535'
          }, {
            id: 'summerTylerswimsuitclothdrag',
            x: '177',
            y: '516'
          }
        ],
        winter: [
          {
            id: 'winterJenniferbootsclothdrag',
            x: '630',
            y: '409'
          }, {
            id: 'winterJenniferhatclothdrag',
            x: '541',
            y: '428'
          }, {
            id: 'winterJenniferraincoatclothdrag',
            x: '713',
            y: '515'
          }, {
            id: 'winterMikebootsclothdrag',
            x: '304',
            y: '536'
          }, {
            id: 'winterMikecoatclothdrag',
            x: '410',
            y: '497'
          }, {
            id: 'winterMikeglovesclothdrag',
            x: '480',
            y: '490'
          }, {
            id: 'winterMikehatclothdragwinter',
            x: '221',
            y: '429'
          }, {
            id: 'winterMikejeansclothdrag',
            x: '132',
            y: '444'
          }, {
            id: 'winterRacheljacketclothdrag',
            x: '147',
            y: '523'
          }, {
            id: 'winterRachelscarfclothdrag',
            x: '732',
            y: '407'
          }, {
            id: 'winterRachelshoesclothdrag',
            x: '427',
            y: '415'
          }, {
            id: 'winterRachelskirtclothdrag',
            x: '211',
            y: '495'
          }, {
            id: 'winterTylerhatclothdrag',
            x: '678',
            y: '453'
          }, {
            id: 'winterTylerpantsclothdrag',
            x: '316',
            y: '447'
          }, {
            id: 'winterTylersweaterclothdrag',
            x: '566',
            y: '494'
          }, {
            id: 'winterTylertennisclothdrag',
            x: '632',
            y: '533'
          }
        ]
      };
      this.summer = {
        child1: ['summerchildjennifer', 'summerchildjenniferdress', 'summerchildjenniferglasses', 'summerchildjenniferhat', 'summerchildjennifershoes'],
        child2: ['summerchildtyler', 'summerchildtylerhat', 'summerchildtylershoes', 'summerchildtylershort'],
        child3: ['summerchildrachel', 'summerchildrachelhat', 'summerchildrachelshoes', 'summerchildrachelsuit', 'winterchildrachelbufanda'],
        child4: ['summerchildmike', 'summerchildmikeglasses', 'summerchildmikehat', 'summerchildmikeshirt', 'summerchildmikeshoes', 'summerchildmikeshort']
      };
      this.winter = {
        child1: ['winterchildjennifer', 'winterchildjenniferboots', 'winterchildjennifercoat', 'winterchildjenniferhat'],
        child2: ['winterchildtyler', 'winterchildtylerhat', 'winterchildtylerpants', 'winterchildtylersweater', 'winterchildtylertennis'],
        child3: ['winterchildrachel', 'winterchildrachelcoat', 'winterchildrachelshoes', 'winterchildrachelskirt'],
        child4: ['winterchildmike', 'winterchildmikeboats', 'winterchildmikecoat', 'winterchildmikegloves', 'winterchildmikehat', 'winterchildmikejeans']
      };
      U5A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A4.prototype.setStage = function() {
      U5A4.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setKids().introEvaluation();
    };

    U5A4.prototype.setKids = function() {
      var boton, estacion, fondo, i, ropa, ropas, todo, _i, _j, _k;
      todo = new createjs.Container();
      todo.x = 0;
      todo.y = 150;
      ropas = new createjs.Container();
      ropas.x = 0;
      ropas.y = 0;
      fondo = this.createBitmap('bg', 'bg', 85, 150);
      todo.addChild(fondo);
      this.addToLibrary(fondo);
      for (i = _i = 1; _i <= 4; i = ++_i) {
        boton = this.createBitmap('repeatbtn', 'repeatbtn', i * 155, 200);
        todo.addChild(boton);
      }
      this.insertBitmap('summerchildmike', 'summerchildmike', (4 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildmikeglasses', 'summerchildmikeglasses', (4 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildmikehat', 'summerchildmikehat', (4 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildmikeshirt', 'summerchildmikeshirt', (4 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildmikeshoes', 'summerchildmikeshoes', (4 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildmikeshort', 'summerchildmikeshort', (4 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildrachel', 'summerchildrachel', (3 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildrachelhat', 'summerchildrachelhat', (3 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildrachelshoes', 'summerchildrachelshoes', (3 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildrachelsuit', 'summerchildrachelsuit', (3 * 160) + 20, 85, 'mc');
      this.insertBitmap('winterchildrachelbufanda', 'winterchildrachelbufanda', (3 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildtyler', 'summerchildtyler', (2 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildtylerhat', 'summerchildtylerhat', (2 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildtylershoes', 'summerchildtylershoes', (2 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildtylershort', 'summerchildtylershort', (2 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildjennifer', 'summerchildjennifer', (1 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildjenniferdress', 'summerchildjenniferdress', (1 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildjenniferglasses', 'summerchildjenniferglasses', (1 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildjenniferhat', 'summerchildjenniferhat', (1 * 160) + 20, 85, 'mc');
      this.insertBitmap('summerchildjennifershoes', 'summerchildjennifershoes', (1 * 160) + 20, 85, 'mc');
      estacion = 'summer';
      for (i = _j = 0; _j <= 14; i = ++_j) {
        ropa = new Draggable(this.positions.summer[i].id, this.preload.getResult(this.positions.summer[i].id), i, this.positions.summer[i].x, this.positions.summer[i].y, 'mc');
        ropas.addChild(ropa);
        this.addToLibrary(ropa);
      }
      for (i = _k = 0; _k <= 15; i = ++_k) {
        ropa = new Draggable(this.positions.winter[i].id, this.preload.getResult(this.positions.winter[i].id), i, this.positions.winter[i].x, this.positions.winter[i].y, 'mc');
        ropas.addChild(ropa);
        this.addToLibrary(ropa);
      }
      this.addToMain(todo);
      return this.addToMain(ropas);
    };

    U5A4.prototype.introEvaluation = function() {
      return U5A4.__super__.introEvaluation.apply(this, arguments);
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

    U5A4.prototype.initEvaluation = function(e) {
      U5A4.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U5A4.prototype.evaluateAnswer = function(e) {
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

    U5A4.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U5A4.prototype.nextEvaluation = function() {
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

    U5A4.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U5A4.prototype.finish = function() {
      var i, _i, _results;
      U5A4.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U5A4 = U5A4;

    return U5A4;

  })(Oda);

}).call(this);
