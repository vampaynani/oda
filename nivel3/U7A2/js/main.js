(function() {
  var U7A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U7A1 = (function(_super) {
    __extends(U7A1, _super);

    function U7A1() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.clearEvaluation = __bind(this.clearEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'pleca1.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'cloud',
          src: 'tag_verb.png'
        }, {
          id: 'candance',
          src: 'can-dance.png'
        }, {
          id: 'caneat',
          src: 'can-eat.png'
        }, {
          id: 'canfly',
          src: 'can-fly.png'
        }, {
          id: 'cantfind',
          src: 'cant-find.png'
        }, {
          id: 'cantgo',
          src: 'cant-go.png'
        }, {
          id: 'cantplay',
          src: 'cant-play.png'
        }, {
          id: 'couldeat',
          src: 'could-eat.png'
        }, {
          id: 'couldgo',
          src: 'could-go.png'
        }, {
          id: 'couldplay',
          src: 'could-play.png'
        }, {
          id: 'couldntdance',
          src: 'couldnt-dance.png'
        }, {
          id: 'couldnteat',
          src: 'couldnt-eat.png'
        }, {
          id: 'couldntfly',
          src: 'couldnt-fly.png'
        }
      ];
      this.escenas = [
        {
          id: 'couldplay',
          p1: 3,
          x1: 206,
          y1: 400,
          l1: 72,
          p2: 10,
          x2: 282,
          y2: 400,
          l2: 67
        }, {
          id: 'cantplay',
          p1: 2,
          x1: 268,
          y1: 400,
          l1: 67,
          p2: 10,
          x2: 340,
          y2: 400,
          l2: 67
        }, {
          id: 'couldeat',
          p1: 3,
          x1: 270,
          y1: 400,
          l1: 67,
          p2: 9,
          x2: 345,
          y2: 400,
          l2: 50
        }, {
          id: 'couldgo',
          p1: 3,
          x1: 359,
          y1: 368,
          l1: 71,
          p2: 6,
          x2: 435,
          y2: 368,
          l2: 42
        }, {
          id: 'cantgo',
          p1: 2,
          x1: 290,
          y1: 400,
          l1: 67,
          p2: 6,
          x2: 362,
          y2: 400,
          l2: 40
        }, {
          id: 'couldntdance',
          p1: 4,
          x1: 310,
          y1: 400,
          l1: 100,
          p2: 5,
          x2: 413,
          y2: 400,
          l2: 80
        }, {
          id: 'candance',
          p1: 1,
          x1: 225,
          y1: 400,
          l1: 50,
          p2: 5,
          x2: 280,
          y2: 400,
          l2: 80
        }, {
          id: 'couldnteat',
          p1: 4,
          x1: 386,
          y1: 368,
          l1: 100,
          p2: 9,
          x2: 490,
          y2: 368,
          l2: 50
        }, {
          id: 'caneat',
          p1: 1,
          x1: 225,
          y1: 400,
          l1: 50,
          p2: 9,
          x2: 280,
          y2: 400,
          l2: 50
        }, {
          id: 'couldntfly',
          p1: 4,
          x1: 497,
          y1: 400,
          l1: 100,
          p2: 8,
          x2: 605,
          y2: 400,
          l2: 40
        }, {
          id: 'canfly',
          p1: 1,
          x1: 275,
          y1: 400,
          l1: 50,
          p2: 8,
          x2: 330,
          y2: 400,
          l2: 50
        }, {
          id: 'cantfind',
          p1: 2,
          x1: 210,
          y1: 400,
          l1: 67,
          p2: 11,
          x2: 280,
          y2: 400,
          l2: 60
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU3_U7_A2_Instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      U7A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U7A1.prototype.setStage = function() {
      U7A1.__super__.setStage.apply(this, arguments);
      this.intento = 0;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look at the images and drag the missing words.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 24, 0));
      this.library.score.txtCount.color = "#BFD951";
      this.library.score.txtTotal.color = "#0096DB";
      return this.setEscena(1).setNube().introEvaluation();
    };

    U7A1.prototype.setEscena = function(scene) {
      var esc, i, im, p1, p2, _i;
      if (!this.library.scene) {
        esc = new createjs.Container();
        esc.name = 'scene';
        this.addToMain(esc);
      } else {
        this.library.scene.removeAllChildren();
        esc = this.library.scene;
      }
      i = scene - 1;
      im = this.createBitmap(this.escenas[i].id, this.escenas[i].id, stageSize.w / 2, stageSize.h / 2 - 10, 'mc');
      im.scaleX = im.scaleY = 0.75;
      p1 = new WordContainer('p1', '', '#eff9fe', '#0098d7', this.escenas[i].x1, this.escenas[i].y1, this.escenas[i].l1, 30);
      p2 = new WordContainer('p2', '', '#eff9fe', '#0098d7', this.escenas[i].x2, this.escenas[i].y2, this.escenas[i].l2, 30);
      p1.text.font = p2.text.font = '20px Quicksand';
      esc.addChild(im, p1, p2);
      this.addToLibrary(p1, p2);
      for (i = _i = 1; _i <= 11; i = _i += 1) {
        if (this.library["p" + i + "n"]) {
          this.library["p" + i + "n"].updateDrops(this.library.p1, this.library.p2);
        }
      }
      return this;
    };

    U7A1.prototype.setNube = function() {
      var back, back2, container, i, p10n, p11n, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n, _i;
      container = new createjs.Container();
      container.x = 136;
      container.y = 462;
      container.name = 'nube1';
      back = this.createBitmap('cloud', 'cloud', 0, 0);
      back2 = this.createBitmap('cloud', 'cloud', 317, 0);
      p1n = new DroppableText('p1n', "can", 1, 42, 26, this.stage, [this.library.p1, this.library.p2]);
      p2n = new DroppableText('p2n', "can't", 2, 49, 49, this.stage, [this.library.p1, this.library.p2]);
      p3n = new DroppableText('p3n', "could", 3, 119, 26, this.stage, [this.library.p1, this.library.p2]);
      p4n = new DroppableText('p4n', "couldn't", 4, 144, 51, this.stage, [this.library.p1, this.library.p2]);
      p5n = new DroppableText('p5n', "dance", 5, 349, 21, this.stage, [this.library.p1, this.library.p2]);
      p6n = new DroppableText('p6n', "go", 6, 421, 37, this.stage, [this.library.p1, this.library.p2]);
      p7n = new DroppableText('p7n', "catch", 7, 460, 16, this.stage, [this.library.p1, this.library.p2]);
      p8n = new DroppableText('p8n', "fly", 8, 342, 47, this.stage, [this.library.p1, this.library.p2]);
      p9n = new DroppableText('p9n', "eat", 9, 382, 60, this.stage, [this.library.p1, this.library.p2]);
      p10n = new DroppableText('p10n', "play", 10, 460, 62, this.stage, [this.library.p1, this.library.p2]);
      p11n = new DroppableText('p11n', "find", 11, 510, 43, this.stage, [this.library.p1, this.library.p2]);
      container.addChild(back, back2, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n, p10n, p11n);
      this.addToLibrary(back, back2, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n, p10n, p11n);
      this.addToMain(container);
      for (i = _i = 1; _i <= 11; i = _i += 1) {
        this.library["p" + i + "n"].addEventListener('dropped', this.evaluateAnswer);
      }
      return this;
    };

    U7A1.prototype.introEvaluation = function() {
      U7A1.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0
      });
      TweenLite.from(this.library.scene, 1, {
        alpha: 0,
        y: this.library.scene.y - 10
      });
      return TweenLite.from(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y - 10,
        ease: Quart.easeOut,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U7A1.prototype.initEvaluation = function(e) {
      var i, _i, _results;
      U7A1.__super__.initEvaluation.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 11; i = _i += 1) {
        _results.push(this.library["p" + i + "n"].initDragListener());
      }
      return _results;
    };

    U7A1.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      this.drop = e.drop;
      if (this.answer.index === this.escenas[this.index][e.drop.name]) {
        this.answer.visible = false;
        this.drop.changeText(this.answer.text.text);
        this.finishEvaluation();
        createjs.Sound.play('good');
        if (this.intento === 0) {
          this.library['score'].plusOne();
        }
        return this.intento = 0;
      } else {
        this.warning();
        this.intento = 1;
        return this.answer.returnToPlace();
      }
    };

    U7A1.prototype.finishEvaluation = function() {
      if (this.library.p1.text.text === '' || this.library.p2.text.text === '') {

      } else {
        return setTimeout(this.clearEvaluation, 1 * 1000);
      }
    };

    U7A1.prototype.clearEvaluation = function(e) {
      var i, _i;
      for (i = _i = 1; _i <= 11; i = _i += 1) {
        this.library["p" + i + "n"].visible = true;
        this.library["p" + i + "n"].returnToPlace();
      }
      this.library.p1.changeText('');
      this.library.p2.changeText('');
      return TweenLite.to(this.library.scene, 0.5, {
        alpha: 0,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U7A1.prototype.nextEvaluation = function() {
      this.index++;
      this.intento = 0;
      if (this.index < this.escenas.length) {
        this.setEscena(this.index + 1);
        return TweenLite.to(this.library.scene, 0.5, {
          alpha: 1,
          ease: Back.easeOut
        });
      } else {
        return this.finish();
      }
    };

    U7A1.prototype.finish = function() {
      TweenLite.to(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y - 10,
        ease: Quart.easeOut
      });
      return U7A1.__super__.finish.apply(this, arguments);
    };

    window.U7A1 = U7A1;

    return U7A1;

  })(Oda);

}).call(this);
