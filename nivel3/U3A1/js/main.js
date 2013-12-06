// Generated by CoffeeScript 1.6.3
(function() {
  var U3A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U3A1 = (function(_super) {
    __extends(U3A1, _super);

    function U3A1() {
      this.repeatSound = __bind(this.repeatSound, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.evaluateDrop = __bind(this.evaluateDrop, this);
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
          id: 'btnfinished',
          src: 'btn_finished.png'
        }, {
          id: 'btnrepeat',
          src: 'btn_repeat.png'
        }, {
          id: 'dragbledontlike',
          src: 'dragble_dontlike.png'
        }, {
          id: 'dragblehate',
          src: 'dragble_hate.png'
        }, {
          id: 'dragblelike',
          src: 'dragble_like.png'
        }, {
          id: 'dragblelove',
          src: 'dragble_love.png'
        }, {
          id: 'fondo',
          src: 'fondo.png'
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
          src: 'sounds/TU2_U7_A2_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U7_A2_schedule1.mp3',
          id: 'sche1'
        }, {
          src: 'sounds/TU2_U7_A2_schedule2.mp3',
          id: 'sche2'
        }
      ];
      this.game = {
        gustos: {
          chic1: ['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove'],
          chic2: ['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove'],
          chic3: ['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove'],
          chic4: ['dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove', 'dragblelove'],
          faces: ['dragblelove', 'dragblelike', 'dragbledontlike', 'dragblehate']
        },
        actividades: {
          boy: ['boypropbaseball', 'boydragbleclean', 'boydragbleread', 'boypropbasketball', 'boyproptennis', 'boydragblecanoeing', 'boypropswimming', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing'],
          boydrags: ['boydragbleclean', 'boydragbleread', 'boydragblecanoeing', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing'],
          girl: ['girldragbleswimming', 'girldragblehiking', 'girldragblesoccer', 'girlpropclean', 'girldragblecanoeing', 'girlpropriding', 'girlproprest', 'girldragblevolleyball', 'girldragblefishing', 'girlproptennis'],
          girldrags: ['girldragbleswimming', 'girldragblehiking', 'girldragblesoccer', 'girldragblecanoeing', 'girldragblevolleyball', 'girldragblefishing']
        }
      };
      U3A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U3A1.prototype.setStage = function() {
      U3A1.__super__.setStage.apply(this, arguments);
      this.actividades = this.game.gustos;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and drag the icons to the correct place on the schedule.', 40, 100);
      this.insertBitmap('btnRepeat', 'btnrepeat', 650, 367);
      this.insertBitmap('btnFinished', 'btnfinished', 650, 414);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 12, 0));
      return this.setPizarra(1).introEvaluation();
    };

    U3A1.prototype.setPizarra = function(schedule) {
      var actividades, c, child, drops, fondo, hit, i, pizarra, _i, _j, _ref, _ref1;
      this.schedule = schedule;
      pizarra = new createjs.Container();
      pizarra.name = 'pizarra';
      pizarra.x = 61;
      pizarra.y = 103;
      fondo = this.createBitmap('fondo', 'fondo', 167, 31);
      if (schedule === 1) {
        drops = this.actividades.chic1;
        this.drags = this.actividades.faces;
      } else {
        child = this.createBitmap('boy', 'boy', 59, 380, 'bl');
        drops = this.actividades.boy;
        this.drags = this.actividades.boydrags;
      }
      actividades = new createjs.Container();
      actividades.name = 'actividades';
      actividades.x = 359;
      actividades.y = 113;
      this.addToLibrary(actividades);
      for (i = _i = 0, _ref = drops.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        c = new createjs.Container();
        c.name = "cont" + i;
        if (i < 5) {
          c.y = i * 49;
        } else {
          c.x = 135;
          c.y = (i - 5) * 49;
        }
        if (schedule === 1) {
          hit = new createjs.Shape();
          hit.graphics.beginFill('rgba(255,255,255,1)').drawRect(-25, -25, 90, 55);
          this.setReg(hit, 20, -20);
          c.addChild(hit);
        }
        this.addToLibrary(c);
        actividades.addChild(c);
      }
      pizarra.addChild(fondo, child, actividades);
      for (i = _j = 0, _ref1 = this.drags.length - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 0 <= _ref1 ? ++_j : --_j) {
        c = new Droppable("" + this.drags[i], this.preload.getResult(this.drags[i]), i, 100 * i + 50, 400, this.stage, actividades.children);
        c.scaleX = c.scaleY = 0.9;
        this.addToLibrary(c);
        pizarra.addChild(c);
      }
      this.addToMain(pizarra);
      return this;
    };

    U3A1.prototype.introEvaluation = function() {
      U3A1.__super__.introEvaluation.apply(this, arguments);
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
        y: this.library.btnRepeat.y - 5,
        delay: 0.5
      });
      TweenLite.from(this.library.btnFinished, 1, {
        alpha: 0,
        y: this.library.btnFinished.y - 5,
        delay: 0.5
      });
      return TweenLite.from(this.library.pizarra, 1, {
        alpha: 0,
        y: this.library.pizarra.y + 20,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U3A1.prototype.initEvaluation = function(e) {
      var i, _i, _ref;
      U3A1.__super__.initEvaluation.apply(this, arguments);
      for (i = _i = 0, _ref = this.drags.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        this.library["" + this.drags[i]].initDragListener();
        this.library["" + this.drags[i]].addEventListener('dropped', this.evaluateDrop);
      }
      this.library.btnRepeat.addEventListener('click', this.repeatSound);
      this.library.btnFinished.addEventListener('click', this.evaluateAnswer);
      return createjs.Sound.play("sche" + this.schedule);
    };

    U3A1.prototype.evaluateDrop = function(e) {
      var v;
      this.answer = e.target;
      this.drop = e.drop;
      this.answer.visible = false;
      v = this.createBitmap(this.answer.name, this.answer.name, 0, 20);
      v.scaleX = v.scaleY = 0.6;
      this.setReg(v, v.width / 2, v.height / 2);
      return this.drop.addChild(v);
    };

    U3A1.prototype.evaluateAnswer = function(e) {
      var answers, i, _i, _ref;
      this.library.btnRepeat.removeEventListener('click', this.repeatSound);
      this.library.btnFinished.removeEventListener('click', this.evaluateAnswer);
      createjs.Sound.stop();
      if (this.schedule === 1) {
        answers = this.actividades.girl;
      } else {
        answers = this.actividades.boy;
      }
      for (i = _i = 0, _ref = answers.length - 1; _i <= _ref; i = _i += 1) {
        if (this.library["cont" + i].children.length > 1) {
          if (this.library["cont" + i].children[1].name === answers[i]) {
            this.blink(this.library["cont" + i]);
            this.library.score.plusOne();
          }
        }
      }
      return setTimeout(this.finishEvaluation, 4 * 1000);
    };

    U3A1.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library.pizarra, 1, {
        alpha: 0,
        y: this.library.pizarra.y + 20,
        onComplete: this.nextEvaluation
      });
    };

    U3A1.prototype.nextEvaluation = function() {
      var i, _i, _ref;
      this.index++;
      if (this.index < 2) {
        this.setPizarra(this.index + 1);
        for (i = _i = 0, _ref = this.drags.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.library["" + this.drags[i]].initDragListener();
          this.library["" + this.drags[i]].addEventListener('dropped', this.evaluateDrop);
        }
        this.library.btnRepeat.addEventListener('click', this.repeatSound);
        this.library.btnFinished.addEventListener('click', this.evaluateAnswer);
        createjs.Sound.stop();
        return createjs.Sound.play("sche" + this.schedule);
      } else {
        return this.finish();
      }
    };

    U3A1.prototype.repeatSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play("sche" + this.schedule);
    };

    U3A1.prototype.finish = function() {
      TweenLite.to(this.library.btnRepeat, 1, {
        alpha: 0,
        y: this.library.btnRepeat.y - 5
      });
      TweenLite.to(this.library.btnFinished, 1, {
        alpha: 0,
        y: this.library.btnFinished.y - 5
      });
      return U3A1.__super__.finish.apply(this, arguments);
    };

    window.U3A1 = U3A1;

    return U3A1;

  })(Oda);

}).call(this);
