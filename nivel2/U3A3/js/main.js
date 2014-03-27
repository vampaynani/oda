(function() {
  var U3A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U3A3 = (function(_super) {
    __extends(U3A3, _super);

    function U3A3() {
      this.finish = __bind(this.finish, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.endGame = __bind(this.endGame, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.evaluateTextDrop = __bind(this.evaluateTextDrop, this);
      this.evaluateImageDrop = __bind(this.evaluateImageDrop, this);
      this.startGame = __bind(this.startGame, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      this.setSalad = __bind(this.setSalad, this);
      this.setSandwich = __bind(this.setSandwich, this);
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
          id: 'saladline',
          src: 'salad/line.png'
        }, {
          id: 'sandwichline',
          src: 'sandwich/line.png'
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
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U3_A3_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'swrong'
        }
      ];
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
        texts: [
          {
            t: 'Wash the fruit.',
            x: 330,
            y: 974
          }, {
            t: 'Wash your hands.',
            x: 588,
            y: 912
          }, {
            t: '  Mix the fruit.  ',
            x: 860,
            y: 974
          }, {
            t: '  Serve and eat!  ',
            x: 1106,
            y: 912
          }, {
            t: '  Cut the fruit.  ',
            x: 1392,
            y: 974
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
        texts: [
          {
            t: 'Put slices of turkey on the bread.',
            x: 330,
            y: 974
          }, {
            t: 'Wash your hands.',
            x: 588,
            y: 912
          }, {
            t: 'Spread mayonnaise on the bread.',
            x: 860,
            y: 974
          }, {
            t: 'Eat your sandwich!',
            x: 1106,
            y: 912
          }, {
            t: 'Put the two slices of bread together.',
            x: 1392,
            y: 974
          }
        ]
      };
      this.positions = {
        dragsImg: [
          {
            x: 320,
            y: 390
          }, {
            x: 568,
            y: 390
          }, {
            x: 814,
            y: 390
          }, {
            x: 1062,
            y: 390
          }, {
            x: 1308,
            y: 390
          }
        ],
        steps: [
          {
            x: 154,
            y: 592
          }, {
            x: 438,
            y: 592
          }, {
            x: 720,
            y: 592
          }, {
            x: 1004,
            y: 592
          }, {
            x: 1288,
            y: 592
          }
        ],
        ready: {
          x: 862,
          y: 1078
        },
        start: {
          x: 568,
          y: 1078
        },
        score: {
          x: 172,
          y: 382
        },
        titulo: {
          x: 820,
          y: 262
        }
      };
      this.answers = {
        sandwich: [
          {
            t: 'sandwichstep1',
            d: 'd2'
          }, {
            t: 'sandwichstep2',
            d: 'd5'
          }, {
            t: 'sandwichstep3',
            d: 'd1'
          }, {
            t: 'sandwichstep4',
            d: 'd4'
          }, {
            t: 'sandwichstep5',
            d: 'd3'
          }, {
            t: 'dt2',
            d: 'sandwichline1'
          }, {
            t: 'dt3',
            d: 'sandwichline2'
          }, {
            t: 'dt1',
            d: 'sandwichline3'
          }, {
            t: 'dt5',
            d: 'sandwichline4'
          }, {
            t: 'dt4',
            d: 'sandwichline5'
          }
        ],
        salad: [
          {
            t: 'saladstep1',
            d: 'd3'
          }, {
            t: 'saladstep2',
            d: 'd5'
          }, {
            t: 'saladstep3',
            d: 'd4'
          }, {
            t: 'saladstep4',
            d: 'd2'
          }, {
            t: 'saladstep5',
            d: 'd1'
          }, {
            t: 'dt2',
            d: 'saladline1'
          }, {
            t: 'dt1',
            d: 'saladline2'
          }, {
            t: 'dt5',
            d: 'saladline3'
          }, {
            t: 'dt3',
            d: 'saladline4'
          }, {
            t: 'dt4',
            d: 'saladline5'
          }
        ]
      };
      U3A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U3A3.prototype.setStage = function() {
      U3A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Drag the pictures and instructions in the correct order and click on the Ready to Eat! button.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 10, 0));
      return this.setStart();
    };

    U3A3.prototype.setStart = function() {
      this.insertBitmap('propsalad', 'propsalad', 824, 722, 'tc');
      this.insertBitmap('btnsalad', 'btnsalad', 824, 900, 'tc');
      this.insertBitmap('propsandwich', 'propsandwich', 824, 298, 'tc');
      this.insertBitmap('btnsandwich', 'btnsandwich', 824, 488, 'tc');
      this.library['btnsalad'].addEventListener('click', this.setSalad);
      this.library['btnsandwich'].addEventListener('click', this.setSandwich);
      return this;
    };

    U3A3.prototype.removeStart = function() {
      this.library['btnsalad'].removeEventListener('click', this.setSalad);
      this.library['btnsandwich'].removeEventListener('click', this.setSandwich);
      TweenLite.to(this.library['btnsalad'], 0.5, {
        alpha: 0
      });
      TweenLite.to(this.library['propsalad'], 0.5, {
        alpha: 0
      });
      TweenLite.to(this.library['btnsandwich'], 0.5, {
        alpha: 0
      });
      return TweenLite.to(this.library['propsandwich'], 0.5, {
        alpha: 0
      });
    };

    U3A3.prototype.setSandwich = function(e) {
      var counter, i, l, label, n, ready, s, sandwich, start, v, value, _i, _j, _k, _ref, _ref1;
      this.removeStart();
      sandwich = new createjs.Container();
      this.current = sandwich.name = 'sandwich';
      for (i = _i = 1; _i <= 5; i = _i += 1) {
        s = this.createBitmap('sandwichstep' + i, 'sandwichstep', this.positions.steps[i - 1].x, this.positions.steps[i - 1].y);
        n = this.createBitmap('sandwichnumber' + i, 'sandwichnumber' + i, s.x + 112, s.y + 86, 'mc');
        l = this.createBitmap('sandwichline' + i, 'sandwichline', s.x - 20, s.y + 180);
        s.scaleX = s.scaleY = 0.46;
        this.addToLibrary(s, l);
        sandwich.addChild(s, n, l);
      }
      label = this.createBitmap('label', 'sandwichlabel', this.positions.titulo.x, this.positions.titulo.y, 'tc');
      ready = new Button('btnready', this.preload.getResult('sandwichbtnready'), 'ready', this.positions.ready.x, this.positions.ready.y);
      start = new Button('btnstart', this.preload.getResult('sandwichbtnstart'), 'start', this.positions.start.x, this.positions.start.y);
      counter = new Counter('counter', 60, '#56bb5b', this.positions.score.x, this.positions.score.y);
      sandwich.addChild(label, ready, start, counter);
      this.addToLibrary(counter, ready, start);
      for (i = _j = 1, _ref = this.sandwich.drags.length; _j <= _ref; i = _j += 1) {
        value = this.sandwich.drags[i - 1];
        v = new Draggable("d" + i, this.preload.getResult(value.id), i, this.positions.dragsImg[i - 1].x, this.positions.dragsImg[i - 1].y);
        v.scaleX = v.scaleY = 0.46;
        this.observer.subscribe('init_sandwich', v.initDragListener);
        v.addEventListener('drop', this.evaluateImageDrop);
        sandwich.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _k = 1, _ref1 = this.sandwich.texts.length; _k <= _ref1; i = _k += 1) {
        value = this.sandwich.texts[i - 1];
        v = new DraggableText("dt" + i, value.t, i, value.x, value.y);
        v.text.font = '40px Arial';
        v.text.lineHeight = 80;
        v.text.lineWidth = 400;
        v.text.textAlign = 'center';
        v.scaleX = v.scaleY = 0.46;
        v.setHitArea();
        this.observer.subscribe('init_sandwich', v.initDragListener);
        v.addEventListener('drop', this.evaluateTextDrop);
        sandwich.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(sandwich);
      this.introEvaluation();
      return this;
    };

    U3A3.prototype.setSalad = function(e) {
      var counter, i, l, label, n, ready, s, salad, start, v, value, _i, _j, _k, _ref, _ref1;
      this.removeStart();
      salad = new createjs.Container();
      this.current = salad.name = 'salad';
      for (i = _i = 1; _i <= 5; i = _i += 1) {
        s = this.createBitmap('saladstep' + i, 'saladstep', this.positions.steps[i - 1].x, this.positions.steps[i - 1].y);
        n = this.createBitmap('saladnumber' + i, 'saladnumber' + i, s.x + 112, s.y + 86, 'mc');
        l = this.createBitmap('saladline' + i, 'saladline', s.x - 20, s.y + 180);
        s.scaleX = s.scaleY = 0.46;
        this.addToLibrary(s, l);
        salad.addChild(s, n, l);
      }
      label = this.createBitmap('label', 'saladlabel', this.positions.titulo.x, this.positions.titulo.y, 'tc');
      ready = new Button('btnready', this.preload.getResult('saladbtnready'), 'ready', this.positions.ready.x, this.positions.ready.y);
      start = new Button('btnstart', this.preload.getResult('saladbtnstart'), 'start', this.positions.start.x, this.positions.start.y);
      counter = new Counter('counter', 60, '#eb2d3d', this.positions.score.x, this.positions.score.y);
      salad.addChild(label, ready, start, counter);
      this.addToLibrary(counter, ready, start);
      for (i = _j = 1, _ref = this.salad.drags.length; _j <= _ref; i = _j += 1) {
        value = this.salad.drags[i - 1];
        v = new Draggable("d" + i, this.preload.getResult(value.id), i, this.positions.dragsImg[i - 1].x, this.positions.dragsImg[i - 1].y);
        v.scaleX = v.scaleY = 0.46;
        this.observer.subscribe('init_salad', v.initDragListener);
        v.addEventListener('drop', this.evaluateImageDrop);
        salad.addChild(v);
        this.addToLibrary(v);
      }
      for (i = _k = 1, _ref1 = this.salad.texts.length; _k <= _ref1; i = _k += 1) {
        value = this.salad.texts[i - 1];
        v = new DraggableText("dt" + i, value.t, i, value.x, value.y);
        v.text.font = '40px Arial';
        v.text.lineHeight = 80;
        v.text.lineWidth = 400;
        v.text.textAlign = 'center';
        v.scaleX = v.scaleY = 0.46;
        v.setHitArea();
        this.observer.subscribe('init_salad', v.initDragListener);
        v.addEventListener('drop', this.evaluateTextDrop);
        salad.addChild(v);
        this.addToLibrary(v);
      }
      this.addToMain(salad);
      this.introEvaluation();
      return this;
    };

    U3A3.prototype.introEvaluation = function() {
      U3A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.btnstart, 0.5, {
        alpha: 0
      });
      return this.playInstructions(this);
    };

    U3A3.prototype.initEvaluation = function(e) {
      U3A3.__super__.initEvaluation.apply(this, arguments);
      this.library.btnstart.blink();
      return this.library.btnstart.addEventListener('click', this.startGame);
    };

    U3A3.prototype.startGame = function(e) {
      this.observer.notify("init_" + this.current);
      this.library.btnstart.removeEventListener('click', this.startGame);
      this.library.btnstart.blink(false);
      this.library.btnready.addEventListener('click', this.evaluateAnswer);
      this.library.btnready.blink();
      TweenLite.to(this.library.btnstart, 0.5, {
        alpha: 0
      });
      this.library.counter.addEventListener('timer_complete', this.endGame);
      return this.library.counter.start();
    };

    U3A3.prototype.evaluateImageDrop = function(e) {
      var dropped, hit, i, pt;
      this.answer = e.target;
      dropped = false;
      i = 1;
      while (!(dropped === true || i > 5)) {
        hit = this.library["" + this.current + "step" + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (hit.hitTest(pt.x, pt.y)) {
          this.answer.putInPlace({
            x: hit.x,
            y: hit.y
          }, 1, this.answer.scaleX, this.answer.scaleY);
          dropped = true;
        } else {
          i++;
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace(1, this.answer.scaleX, this.answer.scaleY);
      }
    };

    U3A3.prototype.evaluateTextDrop = function(e) {
      var dropped, hit, i, pt;
      this.answer = e.target;
      dropped = false;
      i = 1;
      while (!(dropped === true || i > 5)) {
        hit = this.library["" + this.current + "line" + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (hit.hitTest(pt.x, pt.y)) {
          if (this.current === 'sandwich') {
            this.answer.putInPlace({
              x: hit.x + hit.width / 2,
              y: hit.y + 20
            }, 1, this.answer.scaleX, this.answer.scaleY);
          }
          if (this.current === 'salad') {
            this.answer.putInPlace({
              x: hit.x + hit.width / 2,
              y: hit.y + 14
            }, 1, this.answer.scaleX, this.answer.scaleY);
          }
          dropped = true;
        } else {
          i++;
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace(1, this.answer.scaleX, this.answer.scaleY);
      }
    };

    U3A3.prototype.evaluateAnswer = function(e) {
      var npt, pt, r, value, _i, _len, _ref;
      this.complete = true;
      this.library.btnready.removeEventListener('click', this.evaluateAnswer);
      this.library.btnready.blink(false);
      this.library.counter.stop();
      _ref = this.answers[this.current];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        pt = this.library[value.t].localToLocal(20, 20, this.library[value.d]);
        if (this.library[value.t].name.length > 3) {
          npt = this.library[value.t].localToLocal(0, 0, this.mainContainer);
        } else {
          npt = this.library[value.d].localToLocal(0, 0, this.mainContainer);
        }
        if (this.library[value.t].hitTest(pt.x, pt.y)) {
          this.library.score.plusOne();
          r = this.createBitmap('correct', 'correct', npt.x, npt.y);
        } else {
          this.complete = false;
          r = this.createBitmap('wrong', 'wrong', npt.x, npt.y);
        }
        if (this.complete) {
          createjs.Sound.play('good');
        } else {
          createjs.Sound.play('swrong');
        }
        this.library[this.current].addChild(r);
      }
      return setTimeout(this.finishEvaluation, 2 * 1000);
    };

    U3A3.prototype.endGame = function(e) {
      this.complete = false;
      return this.finishEvaluation();
    };

    U3A3.prototype.finishEvaluation = function() {
      var chef;
      if (!this.complete) {
        chef = this.insertBitmap('chefAgain', 'chefAgain', 800, 1250, 'bc');
      } else {
        if (this.current === 'salad') {
          chef = this.insertBitmap('chefSalad', 'chefSalad', 800, 1250, 'bc');
        }
        if (this.current === 'sandwich') {
          chef = this.insertBitmap('chefSandwich', 'chefSandwich', 800, 1250, 'bc');
        }
      }
      TweenLite.from(chef, 0.5, {
        alpha: 0,
        y: -400,
        ease: Back.easeOut
      });
      return TweenLite.to(this.library[this.current], 0.5, {
        alpha: 0,
        y: -400,
        ease: Back.easeOut,
        onComplete: this.finish
      });
    };

    U3A3.prototype.finish = function() {
      return U3A3.__super__.finish.apply(this, arguments);
    };

    window.U3A3 = U3A3;

    return U3A3;

  })(Oda);

}).call(this);
