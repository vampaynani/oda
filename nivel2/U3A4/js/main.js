(function() {
  var U3A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U3A4 = (function(_super) {
    __extends(U3A4, _super);

    function U3A4() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
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
          id: 'n1',
          src: 'nube1.png'
        }, {
          id: 'n2',
          src: 'nube2.png'
        }, {
          id: 'n3',
          src: 'nube3.png'
        }, {
          id: 'table1food4',
          src: 'food_beans.png'
        }, {
          id: 'table3food3',
          src: 'food_brocoli.png'
        }, {
          id: 'table2food1',
          src: 'food_corn.png'
        }, {
          id: 'table1food3',
          src: 'food_eggs.png'
        }, {
          id: 'table3food2',
          src: 'food_fish.png'
        }, {
          id: 'table2food2',
          src: 'food_icecream.png'
        }, {
          id: 'table3food1',
          src: 'food_lettuce.png'
        }, {
          id: 'table1food1',
          src: 'food_milk.png'
        }, {
          id: 'table1food2',
          src: 'food_pancakes.png'
        }, {
          id: 'table2food3',
          src: 'food_peaches.png'
        }, {
          id: 'table2food4',
          src: 'food_spinach.png'
        }, {
          id: 'table3food4',
          src: 'food_tomato.png'
        }, {
          id: 'imageJack',
          src: 'image_Jack.png'
        }, {
          id: 'imageMeg',
          src: 'image_Meg.png'
        }, {
          id: 'imageTomandSue',
          src: 'image_TomandSue.png'
        }, {
          id: 'labelJack',
          src: 'label_Jack.png'
        }, {
          id: 'labelMeg',
          src: 'label_Meg.png'
        }, {
          id: 'labelTomandSue',
          src: 'label_TomandSue.png'
        }, {
          id: 'lineaJack',
          src: 'linea_Jack.png'
        }, {
          id: 'lineaMeg',
          src: 'linea_Meg.png'
        }, {
          id: 'lineaTomandSue',
          src: 'linea_TomandSue.png'
        }, {
          id: 'Table1num1',
          src: 'Table1_1.png'
        }, {
          id: 'Table1num2',
          src: 'Table1_2.png'
        }, {
          id: 'Table1num3',
          src: 'Table1_3.png'
        }, {
          id: 'Table1num4',
          src: 'Table1_4.png'
        }, {
          id: 'Table1num5',
          src: 'Table1_5.png'
        }, {
          id: 'Table1num6',
          src: 'Table1_6.png'
        }, {
          id: 'Table1num7',
          src: 'Table1_7.png'
        }, {
          id: 'Table1num8',
          src: 'Table1_8.png'
        }, {
          id: 'Table1num9',
          src: 'Table1_9.png'
        }, {
          id: 'Table1num10',
          src: 'Table1_10.png'
        }, {
          id: 'Table1num11',
          src: 'Table1_11.png'
        }, {
          id: 'Table1num12',
          src: 'Table1_12.png'
        }, {
          id: 'Table2num1',
          src: 'Table2_1.png'
        }, {
          id: 'Table2num2',
          src: 'Table2_2.png'
        }, {
          id: 'Table2num3',
          src: 'Table2_3.png'
        }, {
          id: 'Table2num4',
          src: 'Table2_4.png'
        }, {
          id: 'Table2num5',
          src: 'Table2_5.png'
        }, {
          id: 'Table2num6',
          src: 'Table2_6.png'
        }, {
          id: 'Table2num7',
          src: 'Table2_7.png'
        }, {
          id: 'Table2num8',
          src: 'Table2_8.png'
        }, {
          id: 'Table2num9',
          src: 'Table2_9.png'
        }, {
          id: 'Table2num10',
          src: 'Table2_10.png'
        }, {
          id: 'Table2num11',
          src: 'Table2_11.png'
        }, {
          id: 'Table2num12',
          src: 'Table2_12.png'
        }, {
          id: 'Table3num1',
          src: 'Table3_1.png'
        }, {
          id: 'Table3num2',
          src: 'Table3_2.png'
        }, {
          id: 'Table3num3',
          src: 'Table3_3.png'
        }, {
          id: 'Table3num4',
          src: 'Table3_4.png'
        }, {
          id: 'Table3num5',
          src: 'Table3_5.png'
        }, {
          id: 'Table3num6',
          src: 'Table3_6.png'
        }, {
          id: 'Table3num7',
          src: 'Table3_7.png'
        }, {
          id: 'Table3num8',
          src: 'Table3_8.png'
        }, {
          id: 'Table3num9',
          src: 'Table3_9.png'
        }, {
          id: 'Table3num10',
          src: 'Table3_10.png'
        }, {
          id: 'Table3num11',
          src: 'Table3_11.png'
        }, {
          id: 'Table3num12',
          src: 'Table3_12.png'
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
          src: 'sounds/TU2_U3_A4_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.answers = [
        [
          {
            a: 'Table1num2',
            a1: 2,
            a2: 6,
            a3: 10
          }, {
            a: 'Table1num10',
            a1: 0,
            a2: 7,
            a3: 10
          }, {
            a: 'Table1num4',
            a1: 2,
            a2: 6,
            a3: 12
          }, {
            a: 'Table1num9',
            a1: 0,
            a2: 4,
            a3: 9
          }, {
            a: 'Table1num1',
            a1: 2,
            a2: 8,
            a3: 9
          }, {
            a: 'Table1num5',
            a1: 1,
            a2: 8,
            a3: 9
          }
        ], [
          {
            a: 'Table2num4',
            a1: 2,
            a2: 5,
            a3: 12
          }, {
            a: 'Table2num7',
            a1: 1,
            a2: 5,
            a3: 11
          }, {
            a: 'Table2num2',
            a1: 2,
            a2: 8,
            a3: 10
          }, {
            a: 'Table2num10',
            a1: 0,
            a2: 4,
            a3: 10
          }, {
            a: 'Table2num5',
            a1: 1,
            a2: 8,
            a3: 9
          }, {
            a: 'Table2num11',
            a1: 0,
            a2: 7,
            a3: 11
          }
        ]
      ];
      U3A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U3A4.prototype.setStage = function() {
      U3A4.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look at the chart and drag the words to build sentences.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 12, 0));
      this.setDropper().setTable(1).setClouds().introEvaluation();
      return this.intento = 0;
    };

    U3A4.prototype.setDropper = function() {
      var text;
      this.addToMain(new WordContainer('dropper1', '', '#FFF', '#0098d7', 340, 1082, 376, 60));
      this.addToMain(new WordContainer('dropper2', '', '#FFF', '#0098d7', 746, 1082, 316, 60));
      this.addToMain(new WordContainer('dropper3', '', '#FFF', '#0098d7', 1088, 1082, 272, 60));
      text = new createjs.Text('.', '24px Arial', '#000');
      text.x = 1370;
      text.y = 1090;
      this.addToMain(text);
      return this;
    };

    U3A4.prototype.setTable = function(table) {
      var f1, f2, f3, f4, i, i1, i2, i3, l1, l2, l3, n1, n2, n3, smiley, smileys, _i, _j, _k;
      if (!this.library.smileys) {
        smileys = new createjs.Container();
        smileys.x = 492;
        smileys.name = 'smileys';
      } else {
        smileys = this.library.smileys;
      }
      smileys.alpha = 1;
      smileys.y = 368;
      smileys.removeAllChildren();
      this.table = table;
      l1 = this.createBitmap('lineaJack', 'lineaJack', -136, 166);
      l2 = this.createBitmap('lineaMeg', 'lineaMeg', -218, 52);
      l3 = this.createBitmap('lineaTomandSue', 'lineaTomandSue', -216, 278);
      i1 = this.createBitmap('imageJack', 'imageJack', -164, 24);
      i2 = this.createBitmap('imageMeg', 'imageMeg', -352, -100);
      i3 = this.createBitmap('imageTomandSue', 'imageTomandSue', -490, 132);
      n1 = this.createBitmap('labelJack', 'labelJack', -138, 180);
      n2 = this.createBitmap('labelMeg', 'labelMeg', -302, 24);
      n3 = this.createBitmap('labelTomandSue', 'labelTomandSue', -376, 298);
      f1 = this.createBitmap("table" + table + "food1", "table" + table + "food1", 104, -6, 'bc');
      f2 = this.createBitmap("table" + table + "food2", "table" + table + "food2", 366, -6, 'bc');
      f3 = this.createBitmap("table" + table + "food3", "table" + table + "food3", 624, -6, 'bc');
      f4 = this.createBitmap("table" + table + "food4", "table" + table + "food4", 888, -6, 'bc');
      smileys.addChild(l1, l2, l3);
      smileys.addChild(i1, i2, i3);
      smileys.addChild(n1, n2, n3);
      smileys.addChild(f1, f2, f3, f4);
      TweenMax.allFrom([f1, f2, f3, f4], 1, {
        alpha: 0
      });
      for (i = _i = 0; _i <= 3; i = ++_i) {
        smiley = this.createBitmap("Table" + table + "num" + (i + 1), "Table" + table + "num" + (i + 1), i * 260, 0);
        smileys.addChild(smiley);
        this.addToLibrary(smiley);
      }
      for (i = _j = 0; _j <= 3; i = ++_j) {
        smiley = this.createBitmap("Table" + table + "num" + (i + 5), "Table" + table + "num" + (i + 5), i * 260, 116);
        smileys.addChild(smiley);
        this.addToLibrary(smiley);
      }
      for (i = _k = 0; _k <= 3; i = ++_k) {
        smiley = this.createBitmap("Table" + table + "num" + (i + 9), "Table" + table + "num" + (i + 9), i * 260, 232);
        smileys.addChild(smiley);
        this.addToLibrary(smiley);
      }
      this.addToMain(smileys);
      return this;
    };

    U3A4.prototype.setClouds = function() {
      var n1, n2, n3, nube1, nube2, nube3, t1n1, t1n2, t1n3, t2n1, t2n2, t2n3, t3n1, t3n2, t3n3, t4n2, t4n3, t5n2, t6n2;
      if (!this.library.nube1) {
        nube1 = new createjs.Container();
        nube1.x = 154;
        nube1.y = 776;
        nube1.name = 'nube1';
      } else {
        nube1 = this.library.nube1;
      }
      if (!this.library.nube2) {
        nube2 = new createjs.Container();
        nube2.x = 544;
        nube2.y = 738;
        nube2.name = 'nube2';
      } else {
        nube2 = this.library.nube2;
      }
      if (!this.library.nube3) {
        nube3 = new createjs.Container();
        nube3.x = 1162;
        nube3.y = 744;
        nube3.name = 'nube3';
      } else {
        nube3 = this.library.nube3;
      }
      nube1.alpha = 1;
      nube2.alpha = 1;
      nube3.alpha = 1;
      nube1.removeAllChildren();
      nube2.removeAllChildren();
      nube3.removeAllChildren();
      n1 = this.createBitmap('n1', 'n1', 0, 0);
      n2 = this.createBitmap('n2', 'n2', 0, 0);
      n3 = this.createBitmap('n3', 'n3', 0, 0);
      t1n1 = new DraggableText('t1n1', "They", 0, 64, 84);
      t2n1 = new DraggableText('t2n1', "He", 1, 160, 148);
      t3n1 = new DraggableText('t3n1', "She", 2, 180, 42);
      t1n2 = new DraggableText('t1n2', "like", 3, 206, 182);
      t2n2 = new DraggableText('t2n2', "don't like", 4, 238, 48);
      t3n2 = new DraggableText('t3n2', "likes", 5, 110, 76);
      t4n2 = new DraggableText('t4n2', "doesn't like", 6, 268, 124);
      t5n2 = new DraggableText('t5n2', "love", 7, 376, 196);
      t6n2 = new DraggableText('t6n2', "loves", 8, 46, 150);
      switch (this.table) {
        case 1:
          t1n3 = new DraggableText('t1n3', "milk", 9, 64, 46);
          t2n3 = new DraggableText('t2n3', "pancakes", 10, 184, 96);
          t3n3 = new DraggableText('t3n3', "eggs", 11, 46, 134);
          t4n3 = new DraggableText('t4n3', "beans", 12, 170, 174);
          break;
        case 2:
          t1n3 = new DraggableText('t1n3', "corn", 9, 64, 46);
          t2n3 = new DraggableText('t2n3', "ice cream", 10, 184, 96);
          t3n3 = new DraggableText('t3n3', "peaches", 11, 46, 134);
          t4n3 = new DraggableText('t4n3', "spinach", 12, 170, 174);
          break;
        case 3:
          t1n3 = new DraggableText('t1n3', "tomatoes", 9, 64, 46);
          t2n3 = new DraggableText('t2n3', "broccoli", 10, 184, 96);
          t3n3 = new DraggableText('t3n3', "fish", 11, 46, 134);
          t4n3 = new DraggableText('t4n3', "lettuce", 12, 170, 174);
      }
      nube1.addChild(n1, t1n1, t2n1, t3n1);
      nube2.addChild(n2, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2);
      nube3.addChild(n3, t1n3, t2n3, t3n3, t4n3);
      this.addToLibrary(t1n1, t2n1, t3n1, t1n2, t2n2, t3n2, t4n2, t5n2, t6n2, t1n3, t2n3, t3n3, t4n3);
      this.addToMain(nube1, nube2, nube3);
      return this;
    };

    U3A4.prototype.introEvaluation = function() {
      var i, _i;
      U3A4.__super__.introEvaluation.apply(this, arguments);
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        this.library["t" + i + "n1"].initDragListener();
      }
      TweenLite.from(this.library.header, 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
      return TweenMax.allFrom([this.library.nube1, this.library.nube2, this.library.nube3], 1, {
        alpha: 0,
        delay: 1
      });
    };

    U3A4.prototype.initEvaluation = function(e) {
      var i, _i;
      U3A4.__super__.initEvaluation.apply(this, arguments);
      this.aindex = 0;
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        this.library["t" + i + "n1"].addEventListener('drop', this.evaluateAnswer1);
      }
      return this.blink(this.library[this.answers[this.table - 1][this.aindex].a]);
    };

    U3A4.prototype.evaluateAnswer1 = function(e) {
      var dropped, i, pt, success, _i, _j, _k;
      this.answer = e.target;
      success = false;
      dropped = false;
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        pt = this.library.dropper1.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (this.library.dropper1.hitTest(pt.x, pt.y)) {
          dropped = true;
          if (this.answer.index === this.answers[this.table - 1][this.aindex].a1) {
            success = true;
            this.answer.x = this.answer.pos.x;
            this.answer.y = this.answer.pos.y;
            this.library.dropper1.changeText(this.answer.text.text);
            for (i = _j = 1; _j <= 6; i = _j += 1) {
              this.library["t" + i + "n2"].initDragListener();
            }
            for (i = _k = 1; _k <= 6; i = _k += 1) {
              this.library["t" + i + "n2"].addEventListener('drop', this.evaluateAnswer2);
            }
          }
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace();
      } else {
        if (success) {
          if (this.intento === 0) {
            this.library.score.plusOne();
          }
          this.intento = 0;
          createjs.Sound.play('good');
        }
        if (!success) {
          this.answer.returnToPlace();
          this.warning();
          return this.intento = 1;
        }
      }
    };

    U3A4.prototype.evaluateAnswer2 = function(e) {
      var dropped, i, pt, success, _i, _j, _k;
      this.answer = e.target;
      success = false;
      dropped = false;
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        pt = this.library.dropper2.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (this.library.dropper2.hitTest(pt.x, pt.y)) {
          dropped = true;
          if (this.answer.index === this.answers[this.table - 1][this.aindex].a2) {
            this.answer.x = this.answer.pos.x;
            this.answer.y = this.answer.pos.y;
            this.library.dropper2.changeText(this.answer.text.text);
            success = true;
            for (i = _j = 1; _j <= 4; i = _j += 1) {
              this.library["t" + i + "n3"].initDragListener();
            }
            for (i = _k = 1; _k <= 4; i = _k += 1) {
              this.library["t" + i + "n3"].addEventListener('drop', this.evaluateAnswer3);
            }
          }
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace();
      } else {
        if (success) {
          if (this.intento === 0) {
            this.library.score.plusOne();
          }
          this.intento = 0;
          createjs.Sound.play('good');
        }
        if (!success) {
          this.answer.returnToPlace();
          this.warning();
          return this.intento = 1;
        }
      }
    };

    U3A4.prototype.evaluateAnswer3 = function(e) {
      var dropped, i, pt, success, _i, _j, _k;
      this.answer = e.target;
      dropped = false;
      success = false;
      for (i = _i = 1; _i <= 6; i = _i += 1) {
        pt = this.library.dropper3.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (this.library.dropper3.hitTest(pt.x, pt.y)) {
          dropped = true;
          if (this.answer.index === this.answers[this.table - 1][this.aindex].a3) {
            this.answer.x = this.answer.pos.x;
            this.answer.y = this.answer.pos.y;
            this.library.dropper3.changeText(this.answer.text.text);
            success = true;
          }
        }
      }
      if (!dropped) {
        return this.answer.returnToPlace();
      } else {
        if (success) {
          if (this.intento === 0) {
            this.library.score.plusOne();
          }
          this.intento = 0;
          createjs.Sound.play('good');
          for (i = _j = 1; _j <= 6; i = _j += 1) {
            this.library["t" + i + "n2"].endDragListener();
          }
          for (i = _k = 1; _k <= 4; i = _k += 1) {
            this.library["t" + i + "n3"].endDragListener();
          }
          return setTimeout(this.finishEvaluation, 1 * 1000);
        } else {
          this.answer.returnToPlace();
          this.intento = 1;
          return this.warning();
        }
      }
    };

    U3A4.prototype.finishEvaluation = function() {
      this.blink(this.library[this.answers[this.table - 1][this.aindex].a], false);
      this.aindex++;
      if (this.aindex < this.answers[this.table - 1].length) {
        this.blink(this.library[this.answers[this.table - 1][this.aindex].a]);
        this.library.dropper1.changeText('');
        this.library.dropper2.changeText('');
        return this.library.dropper3.changeText('');
      } else {
        this.aindex = 0;
        return this.nextEvaluation();
      }
    };

    U3A4.prototype.nextEvaluation = function() {
      var i, _i, _j, _k, _l, _results;
      this.index++;
      if (this.index < this.answers.length) {
        this.library.dropper1.changeText('');
        this.library.dropper2.changeText('');
        this.library.dropper3.changeText('');
        this.setTable(this.index + 1).setClouds();
        this.blink(this.library[this.answers[this.table - 1][this.aindex].a]);
        for (i = _i = 1; _i <= 3; i = _i += 1) {
          this.library["t" + i + "n1"].onInitEvaluation();
        }
        for (i = _j = 1; _j <= 6; i = _j += 1) {
          this.library["t" + i + "n2"].onInitEvaluation();
        }
        for (i = _k = 1; _k <= 4; i = _k += 1) {
          this.library["t" + i + "n3"].onInitEvaluation();
        }
        _results = [];
        for (i = _l = 1; _l <= 3; i = _l += 1) {
          _results.push(this.library["t" + i + "n1"].addEventListener('drop', this.evaluateAnswer1));
        }
        return _results;
      } else {
        return this.finish();
      }
    };

    U3A4.prototype.finish = function() {
      TweenLite.to(this.library.smileys, 1, {
        alpha: 0,
        y: this.library.smileys - 20
      });
      TweenMax.allTo([this.library.nube1, this.library.nube2, this.library.nube3], 1, {
        alpha: 0
      });
      TweenMax.allTo([this.library.dropper1, this.library.dropper2, this.library.dropper3], 1, {
        alpha: 0
      });
      return U3A4.__super__.finish.apply(this, arguments);
    };

    window.U3A4 = U3A4;

    return U3A4;

  })(Oda);

}).call(this);
