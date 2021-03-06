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
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'n1',
          src: 'nube1.png'
        }, {
          id: 'n2',
          src: 'nube2.png'
        }, {
          id: 'n3',
          src: 'nube3.png'
        }, {
          id: 'gg',
          src: 'cuadro_naranja.png'
        }, {
          id: 'p1',
          src: 'ninos_cantando.png'
        }, {
          id: 'p2',
          src: 'ninos_jugando.png'
        }, {
          id: 'p3',
          src: 'nina_jugando.png'
        }, {
          id: 'p4',
          src: 'ninos_leyendo.png'
        }, {
          id: 'p5',
          src: 'nino_flauta.png'
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
          src: 'sounds/TU2_U1_A1_Im_painting_picture.mp3',
          id: 'picture'
        }, {
          src: 'sounds/TU2_U1_A1_Im_playing_flute.mp3',
          id: 'flute'
        }, {
          src: 'sounds/TU2_U1_A1_Were_playing_outside.mp3',
          id: 'outside'
        }, {
          src: 'sounds/TU2_U1_A1_Were_singing_song.mp3',
          id: 'song'
        }, {
          src: 'sounds/TU2_U1_A1_Were_studying_english.mp3',
          id: 'english'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }
      ];
      this.answers = [
        {
          w1: 1,
          w2: 2,
          w3: 2,
          sound: 'song'
        }, {
          w1: 1,
          w2: 1,
          w3: 4,
          sound: 'outside'
        }, {
          w1: 0,
          w2: 0,
          w3: 0,
          sound: 'picture'
        }, {
          w1: 1,
          w2: 3,
          w3: 1,
          sound: 'english'
        }, {
          w1: 0,
          w2: 1,
          w3: 3,
          sound: 'flute'
        }
      ];
      U1A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A1.prototype.setStage = function() {
      U1A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look and drag the parts of the sentences to the speech bubbles.', 80, 200);
      this.insertSprite('characters', ['p1', 'p2', 'p3', 'p4', 'p5'], null, stageSize.w / 2, 470, 'mc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 5, 0));
      this.intento = 0;
      return this.setDropper().setNube1().setNube2().setNube3().introEvaluation();
    };

    U1A1.prototype.setDropper = function() {
      var back, dropper, h1, h2, h3;
      dropper = new createjs.Container();
      dropper.x = stageSize.w / 2 - 410;
      dropper.y = this.library['characters'].y + 120;
      dropper.name = 'dropper';
      back = this.createBitmap('backDropper', 'gg', 0, 0);
      h1 = new WordContainer('h1', '', '#fef2e7', '#f39234', 28, 124, 180, 44);
      h2 = new WordContainer('h2', '', '#fef2e7', '#f39234', 237, 124, 244, 44);
      h3 = new WordContainer('h3', '', '#fef2e7', '#f39234', 508, 124, 274, 44);
      dropper.addChild(back, h1, h2, h3);
      this.addToLibrary(h1, h2, h3);
      this.addToMain(dropper);
      return this;
    };

    U1A1.prototype.setNube1 = function() {
      var back, container, p1n1, p2n1;
      container = new createjs.Container();
      container.x = 200;
      container.y = this.library['dropper'].y + 240;
      container.name = 'nube1';
      back = this.createBitmap('backNube1', 'n1', 0, 0);
      p1n1 = new DraggableText('p1n1', "I'm", 0, 80, 20);
      p2n1 = new DraggableText('p2n1', "We're", 1, 60, 80);
      container.addChild(back, p1n1, p2n1);
      this.addToLibrary(back, p1n1, p2n1);
      this.addToMain(container);
      return this;
    };

    U1A1.prototype.setNube2 = function() {
      var back, container, p1n2, p2n2, p3n2, p4n2;
      container = new createjs.Container();
      container.x = 500;
      container.y = this.library['dropper'].y + 240;
      container.name = 'nube2';
      back = this.createBitmap('backNube2', 'n2', 0, 0);
      p1n2 = new DraggableText('p1n2', "painting", 0, 80, 60);
      p2n2 = new DraggableText('p2n2', "playing", 1, 280, 120);
      p3n2 = new DraggableText('p3n2', "singing", 2, 80, 160);
      p4n2 = new DraggableText('p4n2', "studying", 3, 240, 240);
      container.addChild(back, p1n2, p2n2, p3n2, p4n2);
      this.addToLibrary(back, p1n2, p2n2, p3n2, p4n2);
      this.addToMain(container);
      return this;
    };

    U1A1.prototype.setNube3 = function() {
      var back, container, p1n3, p2n3, p3n3, p4n3, p5n3;
      container = new createjs.Container();
      container.x = 1080;
      container.y = this.library['dropper'].y + 240;
      container.name = 'nube3';
      back = this.createBitmap('backNube3', 'n3', 0, 0);
      p1n3 = new DraggableText('p1n3', "a picture.", 0, 220, 80);
      p2n3 = new DraggableText('p2n3', "English.", 1, 40, 100);
      p3n3 = new DraggableText('p3n3', "a song.", 2, 280, 160);
      p4n3 = new DraggableText('p4n3', "the flute.", 3, 60, 200);
      p5n3 = new DraggableText('p5n3', "outside.", 4, 200, 280);
      container.addChild(back, p1n3, p2n3, p3n3, p4n3, p5n3);
      this.addToLibrary(back, p1n3, p2n3, p3n3, p4n3, p5n3);
      this.addToMain(container);
      return this;
    };

    U1A1.prototype.introEvaluation = function() {
      var i, _i;
      U1A1.__super__.introEvaluation.apply(this, arguments);
      for (i = _i = 1; _i <= 2; i = _i += 1) {
        this.library['p' + i + 'n1'].initDragListener();
      }
      this.library['characters'].currentFrame = this.index;
      this.library['characters'].scaleX = 1;
      this.library['characters'].scaleY = 1;
      this.library['characters'].alpha = 1;
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['characters'], 1, {
        alpha: 0,
        y: this.library['characters'].y + 50,
        delay: 1
      });
      TweenLite.from(this.library['dropper'], 1, {
        alpha: 0,
        y: this.library['dropper'].y + 20,
        delay: 1.2
      });
      TweenLite.from(this.library['nube1'], 1, {
        alpha: 0,
        y: this.library['nube1'].y + 20,
        delay: 1.4
      });
      TweenLite.from(this.library['nube2'], 1, {
        alpha: 0,
        y: this.library['nube2'].y + 20,
        delay: 1.5
      });
      return TweenLite.from(this.library['nube3'], 1, {
        alpha: 0,
        y: this.library['nube3'].y + 20,
        delay: 1.6,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
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
      var i, pt, _i, _j;
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
          createjs.Sound.play('good');
          for (i = _i = 1; _i <= 4; i = _i += 1) {
            this.library['p' + i + 'n2'].initDragListener();
          }
          for (i = _j = 1; _j <= 4; i = _j += 1) {
            this.library['p' + i + 'n2'].addEventListener('drop', this.evaluateAnswer2);
          }
          return false;
        } else {
          this.warning();
          this.intento = 1;
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U1A1.prototype.evaluateAnswer2 = function(e) {
      var i, pt, _i, _j, _results;
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
          createjs.Sound.play('good');
          for (i = _i = 1; _i <= 5; i = _i += 1) {
            this.library['p' + i + 'n3'].initDragListener();
          }
          _results = [];
          for (i = _j = 1; _j <= 5; i = _j += 1) {
            _results.push(this.library['p' + i + 'n3'].addEventListener('drop', this.evaluateAnswer3));
          }
          return _results;
        } else {
          this.warning();
          this.intento = 1;
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U1A1.prototype.evaluateAnswer3 = function(e) {
      var i, pt, _i, _j, _results;
      this.answer = e.target;
      pt = this.library['h3'].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library['h3'].hitTest(pt.x, pt.y)) {
        if (this.answer.index === this.answers[this.index].w3) {
          this.answer.visible = false;
          this.library['h3'].changeText(this.answer.text.text);
          this.library['h3'].blink(false);
          this.blink(this.library['backNube3'], false);
          setTimeout(this.finishEvaluation, 1 * 1000);
          createjs.Sound.play('good');
          for (i = _i = 1; _i <= 4; i = _i += 1) {
            this.library['p' + i + 'n2'].removeEventListener('drop', this.evaluateAnswer2);
            this.library['p' + i + 'n2'].endDragListener();
          }
          _results = [];
          for (i = _j = 1; _j <= 5; i = _j += 1) {
            this.library['p' + i + 'n3'].removeEventListener('drop', this.evaluateAnswer3);
            _results.push(this.library['p' + i + 'n3'].endDragListener());
          }
          return _results;
        } else {
          this.warning();
          this.intento = 1;
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U1A1.prototype.finishEvaluation = function() {
      var song;
      if (this.intento === 0) {
        this.library['score'].plusOne();
      }
      song = createjs.Sound.play(this.answers[this.index].sound);
      song.addEventListener('complete', this.clearEvaluation);
      return this.intento = 0;
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
        this.library['characters'].gotoAndStop(this.index);
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
