(function() {
  var U2A3,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A3 = (function(_super) {
    __extends(U2A3, _super);

    function U2A3() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateLocation = __bind(this.evaluateLocation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.initDrag = __bind(this.initDrag, this);
      this.selectPuzzle = __bind(this.selectPuzzle, this);
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
          id: 'above',
          src: 'above-btn.png'
        }, {
          id: 'behind',
          src: 'behind-btn.png'
        }, {
          id: 'in',
          src: 'in-btn.png'
        }, {
          id: 'next',
          src: 'next-btn.png'
        }, {
          id: 'on',
          src: 'on-btn.png'
        }, {
          id: 'under',
          src: 'under-btn.png'
        }, {
          id: 'p1',
          src: 'p1-btn.png'
        }, {
          id: 'p2',
          src: 'p2-btn.png'
        }, {
          id: 'p3',
          src: 'p3-btn.png'
        }, {
          id: 'm1',
          src: 'marco-1.png'
        }, {
          id: 'm2',
          src: 'marco-2.png'
        }, {
          id: 'm3',
          src: 'marco-3.png'
        }, {
          id: 'p1p1',
          src: 'puzzle1-1.png'
        }, {
          id: 'p1p1back',
          src: 'puzzle1-1-back.png'
        }, {
          id: 'p1p2',
          src: 'puzzle1-2.png'
        }, {
          id: 'p1p2back',
          src: 'puzzle1-2-back.png'
        }, {
          id: 'p1p3',
          src: 'puzzle1-3.png'
        }, {
          id: 'p1p3back',
          src: 'puzzle1-3-back.png'
        }, {
          id: 'p1p4',
          src: 'puzzle1-4.png'
        }, {
          id: 'p1p4back',
          src: 'puzzle1-4-back.png'
        }, {
          id: 'p1p5',
          src: 'puzzle1-5.png'
        }, {
          id: 'p1p5back',
          src: 'puzzle1-5-back.png'
        }, {
          id: 'p1p6',
          src: 'puzzle1-6.png'
        }, {
          id: 'p1p6back',
          src: 'puzzle1-6-back.png'
        }, {
          id: 'p1p7',
          src: 'puzzle1-7.png'
        }, {
          id: 'p1p7back',
          src: 'puzzle1-7-back.png'
        }, {
          id: 'p1p8',
          src: 'puzzle1-8.png'
        }, {
          id: 'p1p8back',
          src: 'puzzle1-8-back.png'
        }, {
          id: 'p1p9',
          src: 'puzzle1-9.png'
        }, {
          id: 'p1p9back',
          src: 'puzzle1-9-back.png'
        }, {
          id: 'p1p10',
          src: 'puzzle1-10.png'
        }, {
          id: 'p1p10back',
          src: 'puzzle1-10-back.png'
        }, {
          id: 'p1p11',
          src: 'puzzle1-11.png'
        }, {
          id: 'p1p11back',
          src: 'puzzle1-11-back.png'
        }, {
          id: 'p1p12',
          src: 'puzzle1-12.png'
        }, {
          id: 'p1p12back',
          src: 'puzzle1-12-back.png'
        }, {
          id: 'p2p1',
          src: 'puzzle2-1.png'
        }, {
          id: 'p2p1back',
          src: 'puzzle2-1-back.png'
        }, {
          id: 'p2p2',
          src: 'puzzle2-2.png'
        }, {
          id: 'p2p2back',
          src: 'puzzle2-2-back.png'
        }, {
          id: 'p2p3',
          src: 'puzzle2-3.png'
        }, {
          id: 'p2p3back',
          src: 'puzzle2-3-back.png'
        }, {
          id: 'p2p4',
          src: 'puzzle2-4.png'
        }, {
          id: 'p2p4back',
          src: 'puzzle2-4-back.png'
        }, {
          id: 'p2p5',
          src: 'puzzle2-5.png'
        }, {
          id: 'p2p5back',
          src: 'puzzle2-5-back.png'
        }, {
          id: 'p2p6',
          src: 'puzzle2-6.png'
        }, {
          id: 'p2p6back',
          src: 'puzzle2-6-back.png'
        }, {
          id: 'p2p7',
          src: 'puzzle2-7.png'
        }, {
          id: 'p2p7back',
          src: 'puzzle2-7-back.png'
        }, {
          id: 'p2p8',
          src: 'puzzle2-8.png'
        }, {
          id: 'p2p8back',
          src: 'puzzle2-8-back.png'
        }, {
          id: 'p2p9',
          src: 'puzzle2-9.png'
        }, {
          id: 'p2p9back',
          src: 'puzzle2-9-back.png'
        }, {
          id: 'p2p10',
          src: 'puzzle2-10.png'
        }, {
          id: 'p2p10back',
          src: 'puzzle2-10-back.png'
        }, {
          id: 'p2p11',
          src: 'puzzle2-11.png'
        }, {
          id: 'p2p11back',
          src: 'puzzle2-11-back.png'
        }, {
          id: 'p2p12',
          src: 'puzzle2-12.png'
        }, {
          id: 'p2p12back',
          src: 'puzzle2-12-back.png'
        }, {
          id: 'p3p1',
          src: 'puzzle3-1.png'
        }, {
          id: 'p3p1back',
          src: 'puzzle3-1-back.png'
        }, {
          id: 'p3p2',
          src: 'puzzle3-2.png'
        }, {
          id: 'p3p2back',
          src: 'puzzle3-2-back.png'
        }, {
          id: 'p3p3',
          src: 'puzzle3-3.png'
        }, {
          id: 'p3p3back',
          src: 'puzzle3-3-back.png'
        }, {
          id: 'p3p4',
          src: 'puzzle3-4.png'
        }, {
          id: 'p3p4back',
          src: 'puzzle3-4-back.png'
        }, {
          id: 'p3p5',
          src: 'puzzle3-5.png'
        }, {
          id: 'p3p5back',
          src: 'puzzle3-5-back.png'
        }, {
          id: 'p3p6',
          src: 'puzzle3-6.png'
        }, {
          id: 'p3p6back',
          src: 'puzzle3-6-back.png'
        }, {
          id: 'p3p7',
          src: 'puzzle3-7.png'
        }, {
          id: 'p3p7back',
          src: 'puzzle3-7-back.png'
        }, {
          id: 'p3p8',
          src: 'puzzle3-8.png'
        }, {
          id: 'p3p8back',
          src: 'puzzle3-8-back.png'
        }, {
          id: 'p3p9',
          src: 'puzzle3-9.png'
        }, {
          id: 'p3p9back',
          src: 'puzzle3-9-back.png'
        }, {
          id: 'p3p10',
          src: 'puzzle3-10.png'
        }, {
          id: 'p3p10back',
          src: 'puzzle3-10-back.png'
        }, {
          id: 'p3p11',
          src: 'puzzle3-11.png'
        }, {
          id: 'p3p11back',
          src: 'puzzle3-11-back.png'
        }, {
          id: 'p3p12',
          src: 'puzzle3-12.png'
        }, {
          id: 'p3p12back',
          src: 'puzzle3-12-back.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/TU2_U2_A3_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      U2A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U2A3.prototype.setStage = function() {
      U2A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Drag the puzzle pieces, read and click on the correct answers.', 80, 200);
      this.insertBitmap('p1', 'p1', 1462, 872);
      this.insertBitmap('p2', 'p2', 1462, 966);
      this.insertBitmap('p3', 'p3', 1462, 1060);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 8, 0));
      return this.introEvaluation();
    };

    U2A3.prototype.introEvaluation = function() {
      U2A3.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
      return TweenMax.from([this.library['p1'], this.library['p2'], this.library['p3']], 1, {
        alpha: 0,
        y: stageSize.h,
        delay: 1
      });
    };

    U2A3.prototype.initEvaluation = function(e) {
      var i, _i, _results;
      U2A3.__super__.initEvaluation.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        this.blink(this.library['p' + i]);
        _results.push(this.library['p' + i].addEventListener('click', this.selectPuzzle));
      }
      return _results;
    };

    U2A3.prototype.selectPuzzle = function(e) {
      var i, _i;
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        this.blink(this.library["p" + i], false);
        this.library['p' + i].removeEventListener('click', this.selectPuzzle);
      }
      this.insertBitmap('behind', 'behind', 236, 580);
      this.insertBitmap('in', 'in', 236, 694);
      this.insertBitmap('under', 'under', 236, 808);
      this.insertBitmap('next', 'next', 1256, 586);
      this.insertBitmap('on', 'on', 1256, 700);
      this.insertBitmap('above', 'above', 1256, 814);
      switch (e.target.name) {
        case 'p1':
          this.pieces = {
            p1p1: {
              x: 20,
              y: 20,
              texta: 'The picture is',
              textb: 'the fridge.',
              label: 'above',
              back: true
            },
            p1p2: {
              x: 166,
              y: 20
            },
            p1p3: {
              x: 360,
              y: 20,
              texta: 'The cat is',
              textb: 'the flowers.',
              label: 'next to',
              back: true
            },
            p1p4: {
              x: 20,
              y: 136
            },
            p1p5: {
              x: 164,
              y: 160,
              texta: 'The apples are',
              textb: 'the sink.',
              label: 'in',
              back: true
            },
            p1p6: {
              x: 350,
              y: 160
            },
            p1p7: {
              x: 20,
              y: 300,
              texta: 'The broom is',
              textb: 'the fridge.',
              label: 'next to',
              back: true
            },
            p1p8: {
              x: 154,
              y: 266,
              texta: 'The fruit is',
              textb: 'the table.',
              label: 'on',
              back: true
            },
            p1p9: {
              x: 350,
              y: 270,
              texta: 'The cake is',
              textb: 'the oven.',
              label: 'in',
              back: true
            },
            p1p10: {
              x: 20,
              y: 404,
              texta: 'The mouse is',
              textb: 'the chair.',
              label: 'behind',
              back: true
            },
            p1p11: {
              x: 166,
              y: 404,
              texta: 'The puppy is',
              textb: 'the table.',
              label: 'under',
              back: true
            },
            p1p12: {
              x: 360,
              y: 416
            }
          };
          this.answers = 8;
          this.setPuzzle(1);
          break;
        case 'p2':
          this.pieces = {
            p2p1: {
              x: 56,
              y: 20,
              texta: 'The picture is',
              textb: 'the wall.',
              label: 'on',
              back: true
            },
            p2p2: {
              x: 212,
              y: 20,
              texta: 'The clock is',
              textb: 'the window.',
              label: 'above',
              back: true
            },
            p2p3: {
              x: 412,
              y: 20,
              texta: 'The plant is',
              textb: 'the bookcase.',
              label: 'on',
              back: true
            },
            p2p4: {
              x: 56,
              y: 132,
              texta: 'The lamp is',
              textb: 'the sofa.',
              label: 'next to',
              back: true
            },
            p2p5: {
              x: 208,
              y: 160
            },
            p2p6: {
              x: 404,
              y: 160,
              texta: 'The books are',
              textb: 'the bookcase.',
              label: 'in',
              back: true
            },
            p2p7: {
              x: 56,
              y: 294,
              texta: 'The boy is',
              textb: 'the armchair.',
              label: 'behind',
              back: true
            },
            p2p8: {
              x: 196,
              y: 266,
              texta: 'The doll is',
              textb: 'the sofa.',
              label: 'on',
              back: true
            },
            p2p9: {
              x: 404,
              y: 266
            },
            p2p10: {
              x: 56,
              y: 402
            },
            p2p11: {
              x: 210,
              y: 402,
              texta: 'The dog is',
              textb: 'the table.',
              label: 'under',
              back: true
            },
            p2p12: {
              x: 418,
              y: 414
            }
          };
          this.answers = 8;
          this.setPuzzle(2);
          break;
        case 'p3':
          this.pieces = {
            p3p1: {
              x: 30,
              y: 24
            },
            p3p2: {
              x: 208,
              y: 24
            },
            p3p3: {
              x: 348,
              y: 24,
              texta: 'The boots are',
              textb: 'the teddy bear.',
              label: 'next to',
              back: true
            },
            p3p4: {
              x: 536,
              y: 24
            },
            p3p5: {
              x: 30,
              y: 180,
              texta: 'The picture is',
              textb: 'the bed.',
              label: 'above',
              back: true
            },
            p3p6: {
              x: 210,
              y: 180,
              texta: 'The brown cat is',
              textb: 'the bed.',
              label: 'on',
              back: true
            },
            p3p7: {
              x: 344,
              y: 180,
              texta: 'The dress is',
              textb: 'the closet.',
              label: 'in',
              back: true
            },
            p3p8: {
              x: 526,
              y: 180,
              texta: 'The pencil case is',
              textb: 'the dresser.',
              label: 'on',
              back: true
            },
            p3p9: {
              x: 30,
              y: 340,
              texta: 'The mouse is',
              textb: 'the bed.',
              label: 'behind',
              back: true
            },
            p3p10: {
              x: 176,
              y: 340,
              texta: 'The white cat is',
              textb: 'the bed.',
              label: 'under',
              back: true
            },
            p3p11: {
              x: 384,
              y: 340
            },
            p3p12: {
              x: 524,
              y: 340,
              texta: 'The schoolbag is',
              textb: 'the dresser.',
              label: 'next to',
              back: true
            }
          };
          this.answers = 8;
          this.setPuzzle(3);
      }
      TweenLite.from(this.library['behind'], 1, {
        alpha: 0,
        y: this.library['behind'].y - 40
      });
      TweenLite.from(this.library['in'], 1, {
        alpha: 0,
        y: this.library['in'].y - 40,
        delay: 0.2
      });
      TweenLite.from(this.library['under'], 1, {
        alpha: 0,
        y: this.library['under'].y - 40,
        delay: 0.4
      });
      TweenLite.from(this.library['next'], 1, {
        alpha: 0,
        y: this.library['next'].y - 40
      });
      TweenLite.from(this.library['on'], 1, {
        alpha: 0,
        y: this.library['on'].y - 40,
        delay: 0.2
      });
      return TweenLite.from(this.library['above'], 1, {
        alpha: 0,
        y: this.library['above'].y - 40,
        delay: 0.4
      });
    };

    U2A3.prototype.setPuzzle = function(num) {
      var dpp, dragpieces, i, index, m, pp, puzzle, _i, _j;
      this.num = num;
      puzzle = new createjs.Container();
      puzzle.x = (function() {
        switch (num) {
          case 1:
            return 520;
          case 2:
            return 480;
          case 3:
            return 440;
        }
      })();
      puzzle.y = 460;
      puzzle.name = 'puzzle';
      m = this.createBitmap("m" + num, "m" + num, 0, 0);
      puzzle.addChild(m);
      for (i = _i = 1; _i <= 12; i = _i += 1) {
        if (this.pieces["p" + num + "p" + i].back) {
          pp = this.createBitmap("p" + num + "p" + i + "b", "p" + num + "p" + i + "back", this.pieces["p" + num + "p" + i].x, this.pieces["p" + num + "p" + i].y);
        } else {
          pp = this.createBitmap("p" + num + "p" + i, "p" + num + "p" + i, this.pieces["p" + num + "p" + i].x, this.pieces["p" + num + "p" + i].y);
        }
        this.addToLibrary(pp);
        puzzle.addChild(pp);
      }
      dragpieces = new createjs.Container();
      dragpieces.x = stageSize.w / 2;
      dragpieces.y = 300;
      dragpieces.name = 'dragpieces';
      index = 0;
      for (i = _j = 1; _j <= 12; i = _j += 1) {
        if (this.pieces["p" + num + "p" + i].back) {
          dpp = new Draggable("dp" + num + "p" + i, this.preload.getResult("p" + num + "p" + i), "p" + num + "p" + i, index * 176, 0);
          dpp.addEventListener('drop', this.evaluateAnswer);
          this.observer.subscribe('init_drag', dpp.onInitEvaluation);
          this.observer.subscribe('stop_drag', dpp.onStopEvaluation);
          dpp.scaleX = dpp.scaleY = 0.6;
          index++;
          this.addToLibrary(dpp);
          dragpieces.addChild(dpp);
        }
      }
      dragpieces.width = index * 176;
      this.setReg(dragpieces, dragpieces.width / 2, 0);
      this.addToMain(puzzle);
      this.addToMain(dragpieces);
      TweenLite.from(puzzle, 1, {
        alpha: 0,
        y: puzzle.y - 40,
        delay: 0.6
      });
      return TweenLite.from(dragpieces, 1, {
        alpha: 0,
        y: puzzle.y - 40,
        delay: 0.6,
        onComplete: this.initDrag
      });
    };

    U2A3.prototype.initDrag = function() {
      return this.observer.notify('init_drag');
    };

    U2A3.prototype.initListeners = function() {
      this.library['behind'].addEventListener('click', this.evaluateLocation);
      this.library['in'].addEventListener('click', this.evaluateLocation);
      this.library['under'].addEventListener('click', this.evaluateLocation);
      this.library['next'].addEventListener('click', this.evaluateLocation);
      this.library['on'].addEventListener('click', this.evaluateLocation);
      return this.library['above'].addEventListener('click', this.evaluateLocation);
    };

    U2A3.prototype.stopListeners = function() {
      this.library['behind'].removeEventListener('click', this.evaluateLocation);
      this.library['in'].removeEventListener('click', this.evaluateLocation);
      this.library['under'].removeEventListener('click', this.evaluateLocation);
      this.library['next'].removeEventListener('click', this.evaluateLocation);
      this.library['on'].removeEventListener('click', this.evaluateLocation);
      return this.library['above'].removeEventListener('click', this.evaluateLocation);
    };

    U2A3.prototype.evaluateAnswer = function(e) {
      var hit, hpt, htt, pt;
      this.answer = e.target;
      hit = this.library[this.answer.index + 'b'];
      pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (hit.hitTest(pt.x, pt.y)) {
        hpt = hit.parent.localToGlobal(hit.x, hit.y);
        htt = this.answer.parent.globalToLocal(hpt.x, hpt.y);
        this.wordcompleter = new AfterBeforeWord('dropper', this.pieces[this.answer.index].texta, '', this.pieces[this.answer.index].textb, '#FFF', '#E90E2C', 300, 1120, 220, 60);
        this.wordcompleter.x = stageSize.w / 2 - this.wordcompleter.width / 2;
        if (this.library['dropper']) {
          this.mainContainer.removeChild(this.library['dropper']);
        }
        this.addToMain(this.wordcompleter);
        this.observer.notify('stop_drag');
        this.answer.putInPlace(htt);
        return this.initListeners();
      } else {
        return this.answer.returnToPlace(this.answer.alpha, this.answer.scaleX, this.answer.scaleY);
      }
    };

    U2A3.prototype.evaluateLocation = function(e) {
      var name;
      name = e.target.name;
      if (name === 'next') {
        name = 'next to';
      }
      if (name === this.pieces[this.answer.index].label) {
        this.wordcompleter.changeText(this.pieces[this.answer.index].label);
        this.stopListeners();
        createjs.Sound.play('good');
        this.library['score'].plusOne();
        return setTimeout(this.finishEvaluation, 1 * 1000);
      } else {
        setTimeout(this.finishEvaluation, 1 * 1000);
        return this.warning();
      }
    };

    U2A3.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library['dropper'], 0.5, {
        alpha: 0,
        y: stageSize.h,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U2A3.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers) {
        return this.initDrag();
      } else {
        return this.finish();
      }
    };

    U2A3.prototype.blink = function(obj, state) {
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

    U2A3.prototype.finish = function() {
      TweenLite.to(this.library['dragpieces'], 1, {
        alpha: 0,
        y: this.y - 40
      });
      TweenLite.to(this.library['puzzle'], 1, {
        alpha: 0,
        y: this.y - 40
      });
      TweenMax.to([this.library['p1'], this.library['p2'], this.library['p3'], this.library['behind'], this.library['in'], this.library['under'], this.library['next'], this.library['on'], this.library['above']], 1, {
        alpha: 0,
        y: stageSize.h
      });
      return U2A3.__super__.finish.apply(this, arguments);
    };

    window.U2A3 = U2A3;

    return U2A3;

  })(Oda);

}).call(this);
