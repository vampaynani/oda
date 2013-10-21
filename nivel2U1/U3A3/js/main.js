// Generated by CoffeeScript 1.6.3
(function() {
  var U3A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U3A3 = (function(_super) {
    __extends(U3A3, _super);

    function U3A3() {
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
          id: 'guia1',
          src: 'guia1.png'
        }, {
          id: 'guia2',
          src: 'guia2.png'
        }, {
          id: 'guia3',
          src: 'guia3.png'
        }, {
          id: 'guia4',
          src: 'guia4.png'
        }, {
          id: 'btnsalad',
          src: 'btn_salad.png'
        }, {
          id: 'btnsandwich',
          src: 'btn_sandwich.png'
        }, {
          id: 'propsalad',
          src: 'prop_salad.png'
        }, {
          id: 'propsandwich',
          src: 'prop_sandwich.png'
        }, {
          id: 'wrong',
          src: 'wrong.png'
        }, {
          id: 'correct',
          src: 'correct.png'
        }, {
          id: 'chefAgain',
          src: 'chef/chef_again.png'
        }, {
          id: 'chefSalad',
          src: 'chef/chef_salad.png'
        }, {
          id: 'chefSandwich',
          src: 'chef/chef_sandwich.png'
        }, {
          id: '1cubierto1',
          src: 'chef/cubierto_10001.png'
        }, {
          id: '1cubierto2',
          src: 'chef/cubierto_10002.png'
        }, {
          id: '2cubierto1',
          src: 'chef/cubierto_20001.png'
        }, {
          id: '2cubierto2',
          src: 'chef/cubierto_20002.png'
        }, {
          id: '3cubierto1',
          src: 'chef/cubierto_30001.png'
        }, {
          id: '3cubierto2',
          src: 'chef/cubierto_30002.png'
        }, {
          id: '4cubierto1',
          src: 'chef/cubierto_40001.png'
        }, {
          id: '4cubierto2',
          src: 'chef/cubierto_40002.png'
        }, {
          id: '5cubierto1',
          src: 'chef/cubierto_50001.png'
        }, {
          id: '5cubierto2',
          src: 'chef/cubierto_50002.png'
        }, {
          id: '6cubierto1',
          src: 'chef/cubierto_60001.png'
        }, {
          id: '6cubierto2',
          src: 'chef/cubierto_60002.png'
        }, {
          id: '7cubierto1',
          src: 'chef/cubierto_70001.png'
        }, {
          id: '7cubierto2',
          src: 'chef/cubierto_70002.png'
        }, {
          id: '8cubierto1',
          src: 'chef/cubierto_80001.png'
        }, {
          id: '8cubierto2',
          src: 'chef/cubierto_80002.png'
        }, {
          id: '9cubierto1',
          src: 'chef/cubierto_90001.png'
        }, {
          id: '9cubierto2',
          src: 'chef/cubierto_90002.png'
        }, {
          id: '10cubierto1',
          src: 'chef/cubierto_100001.png'
        }, {
          id: '10cubierto2',
          src: 'chef/cubierto_100002.png'
        }, {
          id: '11cubierto1',
          src: 'chef/cubierto_110001.png'
        }, {
          id: '11cubierto2',
          src: 'chef/cubierto_110002.png'
        }, {
          id: '12cubierto1',
          src: 'chef/cubierto_120001.png'
        }, {
          id: '12cubierto2',
          src: 'chef/cubierto_120002.png'
        }, {
          id: '13cubierto1',
          src: 'chef/cubierto_130001.png'
        }, {
          id: '13cubierto2',
          src: 'chef/cubierto_130002.png'
        }, {
          id: '14cubierto1',
          src: 'chef/cubierto_140001.png'
        }, {
          id: '14cubierto2',
          src: 'chef/cubierto_140002.png'
        }, {
          id: '15cubierto1',
          src: 'chef/cubierto_150001.png'
        }, {
          id: '15cubierto2',
          src: 'chef/cubierto_150002.png'
        }, {
          id: 'saladbtnready',
          src: 'salad/btn_ready.png'
        }, {
          id: 'saladbtnstart',
          src: 'salad/btn_start.png'
        }, {
          id: 'sandwichbtnready',
          src: 'sandwich/btn_ready.png'
        }, {
          id: 'sandwichbtnstart',
          src: 'sandwich/btn_start.png'
        }, {
          id: 'saladStart4Final3',
          src: 'salad/final_CutFruit.png'
        }, {
          id: 'saladStart1Final5',
          src: 'salad/final_Eat.png'
        }, {
          id: 'saladStart2Final4',
          src: 'salad/final_MixFruit.png'
        }, {
          id: 'saladStart5Final2',
          src: 'salad/final_WashFruit.png'
        }, {
          id: 'saladStart3Final1',
          src: 'salad/final_WashHands.png'
        }, {
          id: 'saladlabel',
          src: 'salad/label_fruit.png'
        }, {
          id: 'sandwichStart4Final4',
          src: 'sandwich/final_Bread.png'
        }, {
          id: 'sandwichStart3Final5',
          src: 'sandwich/final_Eat.png'
        }, {
          id: 'sandwichStart5Final2',
          src: 'sandwich/final_Spread.png'
        }, {
          id: 'sandwichStart1Final3',
          src: 'sandwich/final_Turkey.png'
        }, {
          id: 'sandwichStart2Final1',
          src: 'sandwich/final_Wash.png'
        }, {
          id: 'sandwichlabel',
          src: 'sandwich/label_sandwich.png'
        }, {
          id: 'saladstep',
          src: 'salad/step.png'
        }, {
          id: 'sandwichstep',
          src: 'sandwich/step.png'
        }, {
          id: 'saladnumber1',
          src: 'salad/number_1.png'
        }, {
          id: 'saladnumber2',
          src: 'salad/number_2.png'
        }, {
          id: 'saladnumber3',
          src: 'salad/number_3.png'
        }, {
          id: 'saladnumber4',
          src: 'salad/number_4.png'
        }, {
          id: 'saladnumber5',
          src: 'salad/number_5.png'
        }, {
          id: 'sandwichnumber1',
          src: 'sandwich/number_1.png'
        }, {
          id: 'sandwichnumber2',
          src: 'sandwich/number_2.png'
        }, {
          id: 'sandwichnumber3',
          src: 'sandwich/number_3.png'
        }, {
          id: 'sandwichnumber4',
          src: 'sandwich/number_4.png'
        }, {
          id: 'sandwichnumber5',
          src: 'sandwich/number_5.png'
        }, {
          id: 'saladscore',
          src: 'salad/score.png'
        }, {
          id: 'sandwichscore',
          src: 'sandwich/score.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U3_A1_instructions.mp3',
          id: 'instructions'
        }
      ];
      this.answers = [];
      this.salad = {
        drags: [
          {
            id: 'saladStart1Final5'
          }, {
            id: 'saladStart2Final4'
          }, {
            id: 'saladStart3Final1'
          }, {
            id: 'saladStart4Final3'
          }, {
            id: 'saladStart5Final2'
          }
        ],
        finals: [
          {
            id: 'saladStart3Final1'
          }, {
            id: 'saladStart5Final2'
          }, {
            id: 'saladStart4Final3'
          }, {
            id: 'saladStart2Final4'
          }, {
            id: 'saladStart1Final5'
          }
        ]
      };
      this.sandwich = {
        drags: [
          {
            id: 'sandwichStart1Final3'
          }, {
            id: 'sandwichStart2Final1'
          }, {
            id: 'sandwichStart3Final5'
          }, {
            id: 'sandwichStart4Final4'
          }, {
            id: 'sandwichStart5Final2'
          }
        ],
        finals: [
          {
            id: 'sandwichStart2Final1'
          }, {
            id: 'sandwichStart5Final2'
          }, {
            id: 'sandwichStart1Final3'
          }, {
            id: 'sandwichStart4Final4'
          }, {
            id: 'sandwichStart3Final5'
          }
        ]
      };
      this.positions = {
        dragsImg: [
          {
            x: '160',
            y: '245'
          }, {
            x: '284',
            y: '245'
          }, {
            x: '407',
            y: '245'
          }, {
            x: '531',
            y: '245'
          }, {
            x: '654',
            y: '245'
          }
        ],
        dragsTxt: [
          {
            x: '115',
            y: '487'
          }, {
            x: '244',
            y: '456'
          }, {
            x: '380',
            y: '487'
          }, {
            x: '503',
            y: '456'
          }, {
            x: '646',
            y: '487'
          }
        ],
        steps: [
          {
            x: '77',
            y: '376'
          }, {
            x: '219',
            y: '376'
          }, {
            x: '360',
            y: '376'
          }, {
            x: '502',
            y: '376'
          }, {
            x: '644',
            y: '376'
          }
        ],
        botones: [
          {
            x: '284',
            y: '539'
          }, {
            x: '431',
            y: '539'
          }
        ],
        score: [
          {
            x: '86',
            y: '191'
          }
        ],
        titulo: [
          {
            x: '410',
            y: '131'
          }
        ]
      };
      U3A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U3A3.prototype.setStage = function() {
      U3A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setDropper().setSandwich().setSalad().setFinal().setStart().introEvaluation();
    };

    U3A3.prototype.setStart = function() {
      this.insertBitmap('btnsalad', 'btnsalad', 412, 450, 'tc');
      this.insertBitmap('propsalad', 'propsalad', 412, 361, 'tc');
      this.insertBitmap('btnsandwich', 'btnsandwich', 412, 244, 'tc');
      return this.insertBitmap('propsandwich', 'propsandwich', 412, 149, 'tc');
    };

    U3A3.prototype.setDropper = function() {
      var h1, myname, question;
      myname = new createjs.Container();
      myname.x = 285;
      myname.y = stageSize.h - 70;
      myname.name = 'dropname';
      question = this.createBitmap('question', 'q', 0, 0);
      h1 = new Droppable('h1', '#FFFFFF', 250, 0, 120, 22);
      myname.addChild(question, h1);
      this.addToLibrary(h1);
      this.addToMain(myname);
      return this;
    };

    U3A3.prototype.setSandwich = function() {
      var i, sandwich, v, _i, _j, _k, _l, _m;
      sandwich = new createjs.Container();
      sandwich.x = 0;
      sandwich.y = 0;
      for (i = _i = 1; _i <= 5; i = ++_i) {
        v = new Draggable(this.sandwich.drags[i - 1].id, this.preload.getResult(this.sandwich.drags[i - 1].id), i, this.positions.dragsImg[i - 1].x, this.positions.dragsImg[i - 1].y, 'bl');
        v.scaleX = v.scaleY = 0.46;
        sandwich.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _j = 1; _j <= 5; i = ++_j) {
        v = this.createBitmap('sandwichstep', 'sandwichstep', this.positions.steps[i - 1].x, this.positions.steps[i - 1].y, 'bl');
        v.scaleX = v.scaleY = 0.53;
        sandwich.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _k = 1; _k <= 5; i = ++_k) {
        v = this.createBitmap(this.sandwich.finals[i - 1].id, this.sandwich.finals[i - 1].id, this.positions.steps[i - 1].x, this.positions.steps[i - 1].y, 'bl');
        v.scaleX = v.scaleY = 0.53;
        sandwich.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _l = 1; _l <= 5; i = ++_l) {
        v = this.createBitmap('sandwichnumber' + [i], 'sandwichnumber' + [i], this.positions.steps[i - 1].x - (-56), this.positions.steps[i - 1].y - 43, 'mc');
        sandwich.addChild(v);
        this.addToLibrary(v);
      }
      v = this.createBitmap('sandwichscore', 'sandwichscore', this.positions.score[0].x, this.positions.score[0].y);
      sandwich.addChild(v);
      this.addToLibrary(v);
      v = this.createBitmap('sandwichbtnready', 'sandwichbtnready', this.positions.botones[1].x, this.positions.botones[1].y);
      sandwich.addChild(v);
      this.addToLibrary(v);
      v = this.createBitmap('sandwichbtnstart', 'sandwichbtnstart', this.positions.botones[0].x, this.positions.botones[0].y);
      sandwich.addChild(v);
      this.addToLibrary(v);
      v = this.createBitmap('sandwichlabel', 'sandwichlabel', this.positions.titulo[0].x, this.positions.titulo[0].y, 'tc');
      sandwich.addChild(v);
      this.addToLibrary(v);
      for (i = _m = 1; _m <= 5; i = ++_m) {
        v = new DraggableText('text', "texto", i, this.positions.dragsTxt[i - 1].x, this.positions.dragsTxt[i - 1].y);
        sandwich.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(sandwich);
      return this;
    };

    U3A3.prototype.setSalad = function() {
      var checkimg, i, salad, v, _i, _j, _k;
      salad = new createjs.Container();
      salad.x = 0;
      salad.y = 0;
      for (i = _i = 1; _i <= 5; i = ++_i) {
        v = new Draggable(this.salad.drags[i - 1].id, this.preload.getResult(this.salad.drags[i - 1].id), i, this.positions.dragsImg[i - 1].x, this.positions.dragsImg[i - 1].y, 'bl');
        v.scaleX = v.scaleY = 0.46;
        salad.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _j = 1; _j <= 5; i = ++_j) {
        v = this.createBitmap('saladstep', 'saladstep', this.positions.steps[i - 1].x, this.positions.steps[i - 1].y, 'bl');
        v.scaleX = v.scaleY = 0.53;
        salad.addChild(v);
        this.addToLibrary(v);
        v = this.createBitmap(this.salad.finals[i - 1].id, this.salad.finals[i - 1].id, this.positions.steps[i - 1].x, this.positions.steps[i - 1].y, 'bl');
        v.scaleX = v.scaleY = 0.53;
        salad.addChild(v);
        this.addToLibrary(v);
        v = this.createBitmap('saladnumber' + [i], 'saladnumber' + [i], this.positions.steps[i - 1].x - (-56), this.positions.steps[i - 1].y - 43, 'mc');
        salad.addChild(v);
        this.addToLibrary(v);
        checkimg = this.createSprite('check', ['wrong', 'correct'], null, this.positions.steps[i - 1].x - (-90), this.positions.steps[i - 1].y, 'bl');
        checkimg.scaleX = checkimg.scaleY = 0.53;
        salad.addChild(checkimg);
        this.addToLibrary(checkimg);
      }
      v = this.createBitmap('saladscore', 'saladscore', this.positions.score[0].x, this.positions.score[0].y);
      salad.addChild(v);
      this.addToLibrary(v);
      v = this.createBitmap('saladbtnready', 'saladbtnready', this.positions.botones[1].x, this.positions.botones[1].y);
      salad.addChild(v);
      this.addToLibrary(v);
      v = this.createBitmap('saladbtnstart', 'saladbtnstart', this.positions.botones[0].x, this.positions.botones[0].y);
      salad.addChild(v);
      this.addToLibrary(v);
      v = this.createBitmap('saladlabel', 'saladlabel', this.positions.titulo[0].x, this.positions.titulo[0].y, 'tc');
      salad.addChild(v);
      this.addToLibrary(v);
      for (i = _k = 1; _k <= 5; i = ++_k) {
        v = new DraggableText('text', "texto", i, this.positions.dragsTxt[i - 1].x, this.positions.dragsTxt[i - 1].y);
        salad.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(salad);
      return this;
    };

    U3A3.prototype.setFinal = function() {
      this.insertBitmap('chefAgain', 'chefAgain', 400, 600, 'bc');
      this.insertBitmap('chefSalad', 'chefSalad', 400, 600, 'bc');
      this.insertBitmap('chefSandwich', 'chefSandwich', 400, 600, 'bc');
      return this;
    };

    U3A3.prototype.introEvaluation = function() {
      return U3A3.__super__.introEvaluation.apply(this, arguments);
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

    U3A3.prototype.initEvaluation = function(e) {
      U3A3.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U3A3.prototype.evaluateAnswer = function(e) {
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

    U3A3.prototype.finishEvaluation = function() {
      TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
      return this.answer.returnToPlace();
    };

    U3A3.prototype.nextEvaluation = function() {
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

    U3A3.prototype.repeatSound = function() {
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U3A3.prototype.finish = function() {
      var i, _i, _results;
      U3A3.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U3A3 = U3A3;

    return U3A3;

  })(Oda);

}).call(this);