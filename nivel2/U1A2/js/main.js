// Generated by CoffeeScript 1.6.3
(function() {
  var U1A2,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A2 = (function(_super) {
    __extends(U1A2, _super);

    function U1A2() {
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
          id: 'p1',
          src: 'image_april.png'
        }, {
          id: 'p2',
          src: 'image_danielle.png'
        }, {
          id: 'p3',
          src: 'image_holly.png'
        }, {
          id: 'p4',
          src: 'image_jess.png'
        }, {
          id: 'p5',
          src: 'image_lindsey.png'
        }, {
          id: 'p6',
          src: 'image_madison.png'
        }, {
          id: 'n1',
          src: 'kid_april.png'
        }, {
          id: 'n2',
          src: 'kid_danielle.png'
        }, {
          id: 'n3',
          src: 'kid_holly.png'
        }, {
          id: 'n4',
          src: 'kid_jess.png'
        }, {
          id: 'n5',
          src: 'kid_lindsey.png'
        }, {
          id: 'n6',
          src: 'kid_madison.png'
        }, {
          id: 'repeat',
          src: 'repeat_btn.png'
        }, {
          id: 'q',
          src: 'question_name.png'
        }, {
          id: 'faces',
          src: 'faces_stage.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U1_A2_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U1_A2_april.mp3',
          id: 'april'
        }, {
          src: 'sounds/TU2_U1_A2_danielle.mp3',
          id: 'danielle'
        }, {
          src: 'sounds/TU2_U1_A2_holly.mp3',
          id: 'holly'
        }, {
          src: 'sounds/TU2_U1_A2_jess.mp3',
          id: 'jess'
        }, {
          src: 'sounds/TU2_U1_A2_lindsey.mp3',
          id: 'lindsey'
        }, {
          src: 'sounds/TU2_U1_A2_madison.mp3',
          id: 'madison'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.answers = [
        {
          id: 3,
          sound: 'holly'
        }, {
          id: 1,
          sound: 'april'
        }, {
          id: 5,
          sound: 'lindsey'
        }, {
          id: 4,
          sound: 'jess'
        }, {
          id: 6,
          sound: 'madison'
        }, {
          id: 2,
          sound: 'danielle'
        }
      ];
      U1A2.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A2.prototype.setStage = function() {
      U1A2.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.insertSprite('characters', ['p1', 'p2', 'p3', 'p4', 'p5', 'p6'], null, 100, stageSize.h - 180);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 6, 0));
      return this.setDropper().setNames().introEvaluation();
    };

    U1A2.prototype.setDropper = function() {
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

    U1A2.prototype.setNames = function() {
      var faces, name1, name2, name3, name4, name5, name6, names, repeat;
      names = new createjs.Container();
      names.x = 120;
      names.y = 132;
      names.name = 'names';
      faces = this.createBitmap('facesback', 'faces', 69, 0);
      repeat = new Button('btnrepeat', this.preload.getResult('repeat'), 0, 300, 320);
      name1 = new Draggable('name1', this.preload.getResult('n1'), 1, 16, 20);
      name2 = new Draggable('name2', this.preload.getResult('n2'), 2, 4, 260);
      name3 = new Draggable('name3', this.preload.getResult('n3'), 3, 16, 210);
      name4 = new Draggable('name4', this.preload.getResult('n4'), 4, 16, 125);
      name5 = new Draggable('name5', this.preload.getResult('n5'), 5, 4, 78);
      name6 = new Draggable('name6', this.preload.getResult('n6'), 6, 4, 164);
      name1.addEventListener('drop', this.evaluateAnswer);
      name2.addEventListener('drop', this.evaluateAnswer);
      name3.addEventListener('drop', this.evaluateAnswer);
      name4.addEventListener('drop', this.evaluateAnswer);
      name5.addEventListener('drop', this.evaluateAnswer);
      name6.addEventListener('drop', this.evaluateAnswer);
      repeat.addEventListener('click', this.repeatSound);
      this.addToLibrary(name1, name2, name3, name4, name5, name6);
      names.addChild(faces, repeat, name1, name2, name3, name4, name5, name6);
      this.addToMain(names);
      return this;
    };

    U1A2.prototype.introEvaluation = function() {
      var i, _i;
      U1A2.__super__.introEvaluation.apply(this, arguments);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        this.observer.subscribe('init_evaluation', this.library['name' + i].onInitEvaluation);
      }
      this.library['characters'].currentFrame = this.answers[this.index].id;
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['names'], 1, {
        alpha: 0,
        y: this.library['names'].y + 50,
        delay: 1
      });
      TweenLite.from(this.library['dropname'], 1, {
        alpha: 0,
        y: this.library['dropname'].y + 50,
        delay: 1
      });
      return TweenLite.from(this.library['characters'], 1, {
        alpha: 0,
        y: this.library['characters'].y + 20,
        delay: 1.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U1A2.prototype.initEvaluation = function(e) {
      var i, _i;
      U1A2.__super__.initEvaluation.apply(this, arguments);
      this.library['characters'].currentFrame = this.answers[this.index].id;
      createjs.Sound.play(this.answers[this.index].sound);
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        this.library['name' + i].blink();
      }
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 1,
        y: stageSize.h - 180,
        ease: Quart.easeOut
      });
    };

    U1A2.prototype.evaluateAnswer = function(e) {
      var pt;
      this.answer = e.target;
      pt = this.library['dropname'].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library['dropname'].hitTest(pt.x, pt.y)) {
        if (this.answer.index === this.answers[this.index].id) {
          createjs.Sound.play('good');
          this.answer.blink(false);
          return setTimeout(this.finishEvaluation, 1 * 1000);
        } else {
          this.warning();
          return this.answer.returnToPlace(this.answer.alpha, this.answer.scaleX, this.answer.scaleY, true);
        }
      } else {
        return this.answer.returnToPlace(this.answer.alpha, this.answer.scaleX, this.answer.scaleY, true);
      }
    };

    U1A2.prototype.finishEvaluation = function() {
      this.library['score'].plusOne();
      this.answer.returnToPlace();
      return TweenLite.to(this.library['characters'], 0.5, {
        alpha: 0,
        y: -200,
        delay: 0.5,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U1A2.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
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

    U1A2.prototype.repeatSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play(this.answers[this.index].sound);
    };

    U1A2.prototype.finish = function() {
      var i, _i, _results;
      TweenLite.to(this.library['names'], 1, {
        alpha: 0,
        y: this.library['names'].y + 50,
        delay: 0.1
      });
      TweenLite.to(this.library['dropname'], 1, {
        alpha: 0,
        y: this.library['dropname'].y + 50,
        delay: 0.1
      });
      TweenLite.to(this.library['characters'], 1, {
        alpha: 0,
        y: this.library['characters'].y + 20,
        delay: 0.1
      });
      U1A2.__super__.finish.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        _results.push(this.library['name' + i].blink(false));
      }
      return _results;
    };

    window.U1A2 = U1A2;

    return U1A2;

  })(Oda);

}).call(this);
