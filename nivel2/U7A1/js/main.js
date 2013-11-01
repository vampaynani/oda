// Generated by CoffeeScript 1.6.3
(function() {
  var U1A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A1 = (function(_super) {
    __extends(U1A1, _super);

    function U1A1() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.clearEvaluation = __bind(this.clearEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer3 = __bind(this.evaluateAnswer3, this);
      this.evaluateAnswer2 = __bind(this.evaluateAnswer2, this);
      this.evaluateAnswer1 = __bind(this.evaluateAnswer1, this);
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
          p1: 'hers',
          x1: '527',
          y1: '389',
          l1: '60',
          p2: 'toothpaste',
          x2: '295',
          y2: '168',
          l2: '104'
        }, {
          id: 'hersWhose',
          p1: 'hers',
          x1: '485',
          y1: '378',
          l1: '57',
          p2: 'Whose',
          x2: '277',
          y2: '168',
          l2: '70'
        }, {
          id: 'hisTowel',
          p1: 'his',
          x1: '582',
          y1: '372',
          l1: '57',
          p2: 'towel',
          x2: '301',
          y2: '168',
          l2: '110'
        }, {
          id: 'hisWhose',
          p1: 'his',
          x1: '529',
          y1: '390',
          l1: '55',
          p2: 'Whose',
          x2: '228',
          y2: '168',
          l2: '70'
        }, {
          id: 'mineBackpack',
          p1: 'mine',
          x1: '580',
          y1: '372',
          l1: '55',
          p2: 'backpack',
          x2: '348',
          y2: '168',
          l2: '110'
        }, {
          id: 'mineSwimsuit',
          p1: 'mine',
          x1: '445',
          y1: '394',
          l1: '55',
          p2: 'swimsuit',
          x2: '298',
          y2: '168',
          l2: '110'
        }, {
          id: 'mineWhose',
          p1: 'mine',
          x1: '421',
          y1: '384',
          l1: '57',
          p2: 'Whose',
          x2: '227',
          y2: '168',
          l2: '70'
        }, {
          id: 'yoursWhose',
          p1: 'yours',
          x1: '535',
          y1: '372',
          l1: '56',
          p2: 'whose',
          x2: '284',
          y2: '168',
          l2: '70'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U1_A1_Instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      U1A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A1.prototype.setStage = function() {
      U1A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 5, 0));
      return this.setEscena().setNube().introEvaluation();
    };

    U1A1.prototype.setEscena = function() {
      var esc, i, im, p1, p2;
      i = 7;
      esc = new createjs.Container();
      esc.x = 0;
      esc.y = 0;
      im = this.createBitmap(this.escenas[i].id, this.escenas[i].id, stageSize.w / 2, stageSize.h / 2, 'mc');
      p1 = new WordContainer('p1', '', '#fef2e7', '#f39234', this.escenas[i].x1, this.escenas[i].y1, this.escenas[i].l1, 30);
      p2 = new WordContainer('p2', '', '#fef2e7', '#f39234', this.escenas[i].x2, this.escenas[i].y2, this.escenas[i].l2, 30);
      esc.addChild(im, p1, p2);
      this.addToLibrary(p1, p2);
      this.addToMain(esc);
      return this;
    };

    U1A1.prototype.setNube = function() {
      var back, container, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n;
      container = new createjs.Container();
      container.x = -20;
      container.y = 25;
      container.name = 'nube1';
      back = this.createBitmap('cloud', 'cloud', 238, 412);
      p1n = new DraggableText('p1n', 'mine', 0, 284, 473);
      p2n = new DraggableText('p2n', 'Whose', 1, 261, 521);
      p3n = new DraggableText('p3n', 'yours', 2, 347, 454);
      p4n = new DraggableText('p4n', 'backpack', 3, 347, 506);
      p5n = new DraggableText('p5n', 'towel', 4, 418, 431);
      p6n = new DraggableText('p6n', 'his', 5, 500, 441);
      p7n = new DraggableText('p7n', 'swimsuit', 6, 452, 473);
      p8n = new DraggableText('p8n', 'toothpaste', 7, 451, 527);
      p9n = new DraggableText('p9n', 'hers', 8, 542, 498);
      container.addChild(back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n);
      this.addToLibrary(back, p1n, p2n, p3n, p4n, p5n, p6n, p7n, p8n, p9n);
      this.addToMain(container);
      return this;
    };

    U1A1.prototype.introEvaluation = function() {
      U1A1.__super__.introEvaluation.apply(this, arguments);
      return this;
    };

    U1A1.prototype.initEvaluation = function(e) {
      var i, _i;
      U1A1.__super__.initEvaluation.apply(this, arguments);
      this.library['h1'].blink();
      this.blink(this.library['backNube1']);
      for (i = _i = 1; _i <= 2; i = _i += 1) {
        this.library['p' + i + 'n1'].addEventListener('drop', this.evaluateAnswer1);
      }
      return false;
    };

    U1A1.prototype.evaluateAnswer1 = function(e) {
      var i, pt, _i;
      this.answer = e.target;
      pt = this.library['h1'].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library['h1'].hitTest(pt.x, pt.y)) {
        if (this.answer.index === this.answers[this.index].w1) {
          this.answer.visible = false;
          this.library['h1'].changeText(this.answer.text.text);
          this.library['h1'].blink(false);
          this.blink(this.library['backNube1'], false);
          this.library['h2'].blink();
          this.blink(this.library['backNube2']);
          for (i = _i = 1; _i <= 4; i = _i += 1) {
            this.library['p' + i + 'n2'].addEventListener('drop', this.evaluateAnswer2);
          }
          return false;
        } else {
          this.warning();
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U1A1.prototype.evaluateAnswer2 = function(e) {
      var i, pt, _i, _results;
      this.answer = e.target;
      pt = this.library['h2'].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library['h2'].hitTest(pt.x, pt.y)) {
        if (this.answer.index === this.answers[this.index].w2) {
          this.answer.visible = false;
          this.library['h2'].changeText(this.answer.text.text);
          this.library['h2'].blink(false);
          this.blink(this.library['backNube2'], false);
          this.library['h3'].blink();
          this.blink(this.library['backNube3']);
          _results = [];
          for (i = _i = 1; _i <= 5; i = _i += 1) {
            _results.push(this.library['p' + i + 'n3'].addEventListener('drop', this.evaluateAnswer3));
          }
          return _results;
        } else {
          this.warning();
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U1A1.prototype.evaluateAnswer3 = function(e) {
      var pt;
      this.answer = e.target;
      pt = this.library['h3'].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library['h3'].hitTest(pt.x, pt.y)) {
        if (this.answer.index === this.answers[this.index].w3) {
          this.answer.visible = false;
          this.library['h3'].changeText(this.answer.text.text);
          this.library['h3'].blink(false);
          this.blink(this.library['backNube3'], false);
          return setTimeout(this.finishEvaluation, 1 * 1000);
        } else {
          this.warning();
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U1A1.prototype.finishEvaluation = function() {
      var song;
      this.library['score'].plusOne();
      song = createjs.Sound.play(this.answers[this.index].sound);
      return song.addEventListener('complete', this.clearEvaluation);
    };

    U1A1.prototype.clearEvaluation = function(e) {
      var i, _i, _j, _k, _l;
      for (i = _i = 1; _i <= 2; i = _i += 1) {
        this.library['p' + i + 'n1'].visible = true;
        this.library['p' + i + 'n1'].returnToPlace();
      }
      for (i = _j = 1; _j <= 4; i = _j += 1) {
        this.library['p' + i + 'n2'].visible = true;
        this.library['p' + i + 'n2'].returnToPlace();
      }
      for (i = _k = 1; _k <= 5; i = _k += 1) {
        this.library['p' + i + 'n3'].visible = true;
        this.library['p' + i + 'n3'].returnToPlace();
      }
      for (i = _l = 1; _l <= 3; i = _l += 1) {
        this.library['h' + i].changeText('');
      }
      return TweenLite.to(this.library['characters'], 0.5, {
        scaleX: 1.5,
        scaleY: 1.5,
        alpha: 0,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U1A1.prototype.nextEvaluation = function() {
      var i, _i, _results;
      this.index++;
      if (this.index < this.answers.length) {
        this.library['characters'].currentFrame = this.index;
        this.library['h1'].blink();
        this.blink(this.library['backNube1']);
        TweenLite.to(this.library['characters'], 0.5, {
          scaleX: 1,
          scaleY: 1,
          alpha: 1,
          ease: Back.easeOut
        });
        _results = [];
        for (i = _i = 1; _i <= 2; i = _i += 1) {
          _results.push(this.library['p' + i + 'n1'].addEventListener('drop', this.evaluateAnswer1));
        }
        return _results;
      } else {
        return this.finish();
      }
    };

    U1A1.prototype.blink = function(obj, state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      obj.alpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: .5,
          repeat: -1,
          yoyo: true
        });
      }
    };

    U1A1.prototype.finish = function() {
      TweenLite.to(this.library['dropper'], 1, {
        alpha: 0,
        y: this.library['dropper'].y + 20,
        delay: 0.2
      });
      TweenLite.to(this.library['nube1'], 1, {
        alpha: 0,
        y: this.library['nube1'].y + 20,
        delay: 0.1
      });
      TweenLite.to(this.library['nube2'], 1, {
        alpha: 0,
        y: this.library['nube2'].y + 20,
        delay: 0.1
      });
      TweenLite.to(this.library['nube3'], 1, {
        alpha: 0,
        y: this.library['nube3'].y + 20,
        delay: 0.1
      });
      return U1A1.__super__.finish.apply(this, arguments);
    };

    window.U1A1 = U1A1;

    return U1A1;

  })(Oda);

}).call(this);
