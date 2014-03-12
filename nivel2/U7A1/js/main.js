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
          id: 'inst',
          src: 'inst.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'cloud',
          src: 'cloud.png'
        }, {
          id: 'hersToothpaste',
          src: 'hers-toothpaste.png'
        }, {
          id: 'hersWhose',
          src: 'hers-whose.png'
        }, {
          id: 'hisTowel',
          src: 'his-towel.png'
        }, {
          id: 'hisWhose',
          src: 'his-whose.png'
        }, {
          id: 'mineBackpack',
          src: 'mine-backpack.png'
        }, {
          id: 'mineSwimsuit',
          src: 'mine-swimsuit.png'
        }, {
          id: 'mineWhose',
          src: 'mine-whose.png'
        }, {
          id: 'yoursWhose',
          src: 'yours-whose.png'
        }
      ];
      this.escenas = [
        {
          id: 'hersToothpaste',
          p1: 8,
          x1: 1053,
          y1: 770,
          l1: 122,
          p2: 7,
          x2: 598,
          y2: 340,
          l2: 208
        }, {
          id: 'hersWhose',
          p1: 8,
          x1: 952,
          y1: 752,
          l1: 116,
          p2: 1,
          x2: 554,
          y2: 342,
          l2: 140
        }, {
          id: 'hisTowel',
          p1: 5,
          x1: 1164,
          y1: 744,
          l1: 104,
          p2: 4,
          x2: 602,
          y2: 336,
          l2: 220
        }, {
          id: 'hisWhose',
          p1: 5,
          x1: 1058,
          y1: 780,
          l1: 110,
          p2: 1,
          x2: 456,
          y2: 336,
          l2: 140
        }, {
          id: 'mineBackpack',
          p1: 0,
          x1: 1160,
          y1: 744,
          l1: 110,
          p2: 3,
          x2: 696,
          y2: 336,
          l2: 220
        }, {
          id: 'mineSwimsuit',
          p1: 0,
          x1: 890,
          y1: 788,
          l1: 110,
          p2: 6,
          x2: 596,
          y2: 336,
          l2: 220
        }, {
          id: 'mineWhose',
          p1: 0,
          x1: 842,
          y1: 768,
          l1: 114,
          p2: 1,
          x2: 454,
          y2: 336,
          l2: 140
        }, {
          id: 'yoursWhose',
          p1: 2,
          x1: 1070,
          y1: 744,
          l1: 112,
          p2: 1,
          x2: 568,
          y2: 336,
          l2: 140
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U7_A1_Instructions.mp3',
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
      this.insertInstructions('instructions', 'Read, look and drag the words to complete the sentences.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 16, 0));
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
      im = this.createBitmap(this.escenas[i].id, this.escenas[i].id, stageSize.w / 2, stageSize.h / 2, 'mc');
      p1 = new WordContainer('p1', '', '#eff9fe', '#0098d7', this.escenas[i].x1, this.escenas[i].y1, this.escenas[i].l1, 60);
      p2 = new WordContainer('p2', '', '#eff9fe', '#0098d7', this.escenas[i].x2, this.escenas[i].y2, this.escenas[i].l2, 60);
      p1.text.font = p2.text.font = '40px Quicksand';
      esc.addChild(im, p1, p2);
      this.addToLibrary(p1, p2);
      for (i = _i = 1; _i <= 9; i = _i += 1) {
        if (this.library["p" + i + "n"]) {
          this.library["p" + i + "n"].updateDrops(this.library.p1, this.library.p2);
        }
      }
      return this;
    };

    U7A1.prototype.setNube = function() {
      var back, container, i, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n, _i;
      container = new createjs.Container();
      container.x = -20;
      container.y = 25;
      container.name = 'nube1';
      back = this.createBitmap('cloud', 'cloud', 476, 824);
      p1n = new DroppableText('p1n', 'mine', 0, 568, 946, this.stage, [this.library.p1, this.library.p2]);
      p2n = new DroppableText('p2n', 'Whose', 1, 522, 1042, this.stage, [this.library.p1, this.library.p2]);
      p3n = new DroppableText('p3n', 'yours', 2, 694, 908, this.stage, [this.library.p1, this.library.p2]);
      p4n = new DroppableText('p4n', 'backpack', 3, 694, 1012, this.stage, [this.library.p1, this.library.p2]);
      p5n = new DroppableText('p5n', 'towel', 4, 836, 862, this.stage, [this.library.p1, this.library.p2]);
      p6n = new DroppableText('p6n', 'his', 5, 1000, 882, this.stage, [this.library.p1, this.library.p2]);
      p7n = new DroppableText('p7n', 'swimsuit', 6, 904, 946, this.stage, [this.library.p1, this.library.p2]);
      p8n = new DroppableText('p8n', 'toothpaste', 7, 902, 1054, this.stage, [this.library.p1, this.library.p2]);
      p9n = new DroppableText('p9n', 'hers', 8, 1084, 996, this.stage, [this.library.p1, this.library.p2]);
      container.addChild(back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n);
      this.addToLibrary(back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n);
      this.addToMain(container);
      for (i = _i = 1; _i <= 9; i = _i += 1) {
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
        y: this.library.scene.y - 20
      });
      return TweenLite.from(this.library.nube1, 1, {
        alpha: 0,
        y: this.library.nube1.y - 20,
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
      for (i = _i = 1; _i <= 9; i = _i += 1) {
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
      for (i = _i = 1; _i <= 9; i = _i += 1) {
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
        y: this.library.nube1.y - 20,
        ease: Quart.easeOut
      });
      return U7A1.__super__.finish.apply(this, arguments);
    };

    window.U7A1 = U7A1;

    return U7A1;

  })(Oda);

}).call(this);
