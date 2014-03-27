(function() {
  var U7A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U7A2 = (function(_super) {
    __extends(U7A2, _super);

    function U7A2() {
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
          id: 'pizarra',
          src: 'pizarra.png'
        }, {
          id: 'boydragblebiking',
          src: 'boy/dragble_biking.png'
        }, {
          id: 'boydragblecanoeing',
          src: 'boy/dragble_canoeing.png'
        }, {
          id: 'boydragbleclean',
          src: 'boy/dragble_clean.png'
        }, {
          id: 'boydragblefishing',
          src: 'boy/dragble_fishing.png'
        }, {
          id: 'boydragbleread',
          src: 'boy/dragble_read.png'
        }, {
          id: 'boydragbleriding',
          src: 'boy/dragble_riding.png'
        }, {
          id: 'boypropbaseball',
          src: 'boy/prop_baseball.png'
        }, {
          id: 'boypropbasketball',
          src: 'boy/prop_basketball.png'
        }, {
          id: 'boypropswimming',
          src: 'boy/prop_swimming.png'
        }, {
          id: 'boyproptennis',
          src: 'boy/prop_tennis.png'
        }, {
          id: 'boy',
          src: 'boy/prop_boy.png'
        }, {
          id: 'girldragblecanoeing',
          src: 'girl/dragble_canoeing.png'
        }, {
          id: 'girldragblefishing',
          src: 'girl/dragble_fishing.png'
        }, {
          id: 'girldragblehiking',
          src: 'girl/dragble_hiking.png'
        }, {
          id: 'girldragblesoccer',
          src: 'girl/dragble_soccer.png'
        }, {
          id: 'girldragbleswimming',
          src: 'girl/dragble_swimming.png'
        }, {
          id: 'girldragblevolleyball',
          src: 'girl/dragble_volleyball.png'
        }, {
          id: 'girlpropclean',
          src: 'girl/prop_clean.png'
        }, {
          id: 'girlproprest',
          src: 'girl/prop_rest.png'
        }, {
          id: 'girlpropriding',
          src: 'girl/prop_riding.png'
        }, {
          id: 'girlproptennis',
          src: 'girl/prop_tennis.png'
        }, {
          id: 'girl',
          src: 'girl/prop_girl.png'
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
        actividades: {
          boy: ['boypropbaseball', 'boydragbleclean', 'boydragbleread', 'boypropbasketball', 'boyproptennis', 'boydragblecanoeing', 'boypropswimming', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing'],
          boydrags: ['boydragbleclean', 'boydragbleread', 'boydragblecanoeing', 'boydragbleriding', 'boydragblebiking', 'boydragblefishing'],
          girl: ['girldragbleswimming', 'girldragblehiking', 'girldragblesoccer', 'girlpropclean', 'girldragblecanoeing', 'girlpropriding', 'girlproprest', 'girldragblevolleyball', 'girldragblefishing', 'girlproptennis'],
          girldrags: ['girldragbleswimming', 'girldragblehiking', 'girldragblesoccer', 'girldragblecanoeing', 'girldragblevolleyball', 'girldragblefishing']
        }
      };
      U7A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U7A2.prototype.setStage = function() {
      U7A2.__super__.setStage.apply(this, arguments);
      this.actividades = this.game.actividades;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and drag the icons to the correct place on the schedule.', 80, 200);
      this.insertBitmap('btnRepeat', 'btnrepeat', 1300, 734);
      this.insertBitmap('btnFinished', 'btnfinished', 1300, 828);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 12, 0));
      return this.setPizarra(1).introEvaluation();
    };

    U7A2.prototype.setPizarra = function(schedule) {
      var a, actividades, board, c, child, drops, hit, i, pizarra, _i, _j, _ref, _ref1;
      this.schedule = schedule;
      pizarra = new createjs.Container();
      pizarra.name = 'pizarra';
      pizarra.x = 122;
      pizarra.y = 206;
      board = this.createBitmap('pizarra', 'pizarra', 334, 62);
      if (schedule === 1) {
        child = this.createBitmap('girl', 'girl', 118, 760, 'bl');
        drops = this.actividades.girl;
        this.drags = this.actividades.girldrags;
      } else {
        child = this.createBitmap('boy', 'boy', 118, 760, 'bl');
        drops = this.actividades.boy;
        this.drags = this.actividades.boydrags;
      }
      actividades = new createjs.Container();
      actividades.name = 'actividades';
      actividades.x = 718;
      actividades.y = 226;
      this.addToLibrary(actividades);
      for (i = _i = 0, _ref = drops.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        c = new createjs.Container();
        c.name = "cont" + i;
        if (i < 5) {
          c.y = i * 98;
        } else {
          c.x = 270;
          c.y = (i - 5) * 98;
        }
        if (schedule === 1) {
          if (i === 0 || i === 1 || i === 2 || i === 4 || i === 7 || i === 8) {
            hit = new createjs.Shape();
            hit.graphics.beginFill('rgba(255,255,255,0.01)').drawRect(-50, -50, 180, 110);
            this.setReg(hit, 40, -40);
            c.addChild(hit);
          } else {
            a = this.createBitmap(drops[i], drops[i], 0, 0, 'tc');
            a.scaleX = a.scaleY = 80 / a.image.height;
            c.addChild(a);
          }
        } else {
          if (i === 1 || i === 2 || i === 5 || i === 7 || i === 8 || i === 9) {
            hit = new createjs.Shape();
            hit.graphics.beginFill('rgba(255,255,255,0.01)').drawRect(-50, -50, 180, 110);
            this.setReg(hit, 40, -40);
            c.addChild(hit);
          } else {
            a = this.createBitmap(drops[i], drops[i], 0, 0, 'tc');
            a.scaleX = a.scaleY = 80 / a.image.height;
            c.addChild(a);
          }
        }
        this.addToLibrary(c);
        actividades.addChild(c);
      }
      pizarra.addChild(board, child, actividades);
      for (i = _j = 0, _ref1 = this.drags.length - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 0 <= _ref1 ? ++_j : --_j) {
        if (i % 2 === 0) {
          c = new Droppable("" + this.drags[i], this.preload.getResult(this.drags[i]), i, 200 * i + 100, 880, this.stage, actividades.children);
        } else {
          c = new Droppable("" + this.drags[i], this.preload.getResult(this.drags[i]), i, 200 * i + 100, 800, this.stage, actividades.children);
        }
        c.scaleX = c.scaleY = 0.9;
        this.addToLibrary(c);
        pizarra.addChild(c);
      }
      this.addToMain(pizarra);
      return this;
    };

    U7A2.prototype.introEvaluation = function() {
      U7A2.__super__.introEvaluation.apply(this, arguments);
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
        y: this.library.pizarra.y + 40,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U7A2.prototype.initEvaluation = function(e) {
      var i, _i, _ref;
      U7A2.__super__.initEvaluation.apply(this, arguments);
      for (i = _i = 0, _ref = this.drags.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        this.library["" + this.drags[i]].initDragListener();
        this.library["" + this.drags[i]].addEventListener('dropped', this.evaluateDrop);
      }
      this.library.btnRepeat.addEventListener('click', this.repeatSound);
      this.library.btnFinished.addEventListener('click', this.evaluateAnswer);
      return createjs.Sound.play("sche" + this.schedule);
    };

    U7A2.prototype.evaluateDrop = function(e) {
      var v;
      this.answer = e.target;
      this.drop = e.drop;
      this.answer.visible = false;
      v = this.createBitmap(this.answer.name, this.answer.name, 0, 40);
      v.hitter = this.answer;
      v.addEventListener('mousedown', function(e) {
        var cv;
        cv = e.currentTarget;
        return cv.addEventListener('pressmove', function(ev) {
          var parent;
          if (cv.hitter) {
            cv.removeAllEventListeners();
            parent = cv.parent;
            while (parent.children.length > 1) {
              parent.removeChildAt(parent.children.length - 1);
            }
            cv.hitter.visible = true;
            return cv.hitter.returnToPlace();
          }
        });
      });
      v.scaleX = v.scaleY = 0.6;
      this.setReg(v, v.width / 2, v.height / 2);
      return this.drop.addChild(v);
    };

    U7A2.prototype.evaluateAnswer = function(e) {
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

    U7A2.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library.pizarra, 1, {
        alpha: 0,
        y: this.library.pizarra.y + 40,
        onComplete: this.nextEvaluation
      });
    };

    U7A2.prototype.nextEvaluation = function() {
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

    U7A2.prototype.repeatSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play("sche" + this.schedule);
    };

    U7A2.prototype.finish = function() {
      TweenLite.to(this.library.btnRepeat, 1, {
        alpha: 0,
        y: this.library.btnRepeat.y - 10
      });
      TweenLite.to(this.library.btnFinished, 1, {
        alpha: 0,
        y: this.library.btnFinished.y - 10
      });
      return U7A2.__super__.finish.apply(this, arguments);
    };

    window.U7A2 = U7A2;

    return U7A2;

  })(Oda);

}).call(this);
