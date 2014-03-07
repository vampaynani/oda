(function() {
  var U2A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A6 = (function(_super) {
    __extends(U2A6, _super);

    function U2A6() {
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.killThis = __bind(this.killThis, this);
      this.makeRaindrop = __bind(this.makeRaindrop, this);
      this.makeRaindropb = __bind(this.makeRaindropb, this);
      this.makeRaindropr = __bind(this.makeRaindropr, this);
      this.updateCounter = __bind(this.updateCounter, this);
      this.selectLevel = __bind(this.selectLevel, this);
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
          id: 'background',
          src: 'background.png'
        }, {
          id: 'bucket',
          src: 'bucket.png'
        }, {
          id: 'raindrop',
          src: 'raindrop.png'
        }, {
          id: 'level1Btn',
          src: 'level1-btn.png'
        }, {
          id: 'level2Btn',
          src: 'level2-btn.png'
        }, {
          id: 'level3Btn',
          src: 'level3-btn.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/TU2_U2_A6_instructions.mp3',
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
      this.counter = {
        0: 'zero',
        1: 'one',
        2: 'two',
        3: 'three',
        4: 'four',
        5: 'five',
        6: 'six',
        7: 'seven',
        8: 'eight',
        9: 'nine',
        10: 'ten',
        11: 'eleven',
        12: 'twelve',
        13: 'thirteen',
        14: 'fourteen',
        15: 'fifteen',
        16: 'sixteen',
        17: 'seventeen',
        18: 'eighteen',
        19: 'nineteen',
        20: 'twenty',
        30: 'thirty',
        40: 'forty',
        50: 'fifty',
        60: 'sixty',
        70: 'seventy',
        80: 'eighty',
        90: 'ninety',
        100: "one\r\nhundred"
      };
      U2A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U2A6.prototype.setStage = function() {
      var b, box, c, count, i, n, rand, t, _i;
      U2A6.__super__.setStage.apply(this, arguments);
      this.buckets = [
        {
          x: 264,
          y: 984,
          a: true
        }, {
          x: 464,
          y: 932,
          a: true
        }, {
          x: 664,
          y: 984,
          a: true
        }, {
          x: 864,
          y: 932,
          a: true
        }, {
          x: 1064,
          y: 984,
          a: true
        }, {
          x: 1264,
          y: 932,
          a: true
        }
      ];
      this.random = [];
      count = 0;
      box = new createjs.Container();
      box.x = 0;
      box.y = 0;
      box.name = 'box';
      while (count < 6) {
        rand = Math.round(Math.random() * 100);
        this.random.push(rand);
        count++;
      }
      this.insertBitmap('background', 'background', 0, 50);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Race the clock! Drag the numerals to the number words.', 80, 200);
      this.insertBitmap('l1', 'level1Btn', 1462, 872);
      this.insertBitmap('l2', 'level2Btn', 1462, 966);
      this.insertBitmap('l3', 'level3Btn', 1462, 1060);
      for (i = _i = 0; _i <= 5; i = _i += 1) {
        c = new createjs.Container();
        n = this.bucketName(this.random[i]);
        t = new createjs.Text("" + n, '32px Quicksand', '#FF0000');
        b = this.createBitmap("b" + i, 'bucket', 0, 0);
        c.name = "b" + i;
        c.index = this.random[i];
        t.textAlign = 'center';
        t.x = b.width / 2;
        t.y = b.height / 2;
        c.x = this.buckets[i].x;
        c.y = this.buckets[i].y;
        c.width = b.width;
        c.height = b.height;
        this.addToLibrary(c);
        c.addChild(b, t);
        box.addChild(c);
      }
      this.addToMain(box);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 90, 0));
      return this.introEvaluation();
    };

    U2A6.prototype.bucketName = function(num) {
      var name, strnum;
      strnum = "" + num;
      return name = (function() {
        switch (strnum.length) {
          case 1:
            return this.counter[strnum];
          case 2:
            return this.buildName(strnum);
          case 3:
            return this.counter[strnum];
        }
      }).call(this);
    };

    U2A6.prototype.buildName = function(strnum) {
      var d, u;
      d = (Math.floor(strnum / 10)) * 10;
      u = strnum % 10;
      if (u === 0) {
        return this.counter[d];
      } else if (strnum < 20) {
        return this.counter[strnum];
      } else {
        return this.counter[d] + "\r\n" + this.counter[u];
      }
    };

    U2A6.prototype.introEvaluation = function() {
      U2A6.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['box'], 1, {
        alpha: 0,
        y: stageSize.h,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
      return TweenMax.from([this.library['l1'], this.library['l2'], this.library['l3']], 1, {
        alpha: 0,
        y: stageSize.h,
        delay: 1
      });
    };

    U2A6.prototype.initEvaluation = function(e) {
      var i, _i, _results;
      U2A6.__super__.initEvaluation.apply(this, arguments);
      _results = [];
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        this.blink(this.library["l" + i]);
        _results.push(this.library["l" + i].addEventListener('click', this.selectLevel));
      }
      return _results;
    };

    U2A6.prototype.selectLevel = function(e) {
      var i, _i;
      for (i = _i = 1; _i <= 3; i = _i += 1) {
        this.blink(this.library["l" + i], false);
        this.library["l" + i].removeEventListener('click', this.selectLevel);
      }
      switch (e.target.name) {
        case 'l1':
          return this.initRaindrops(1, 1500);
        case 'l2':
          return this.initRaindrops(2, 1000);
        case 'l3':
          return this.initRaindrops(3, 500);
      }
    };

    U2A6.prototype.initRaindrops = function(level, interval) {
      this.raindrops = new createjs.Container();
      this.raindrops.name = 'raindrops';
      this.level = level;
      this.rnum = 0;
      this.time = 90;
      this.timer = setInterval(this.updateCounter, 1000);
      this.rinterval = setInterval(this.makeRaindropr, interval);
      this.binterval = setInterval(this.makeRaindropb, 2000);
      return this.addToMain(this.raindrops);
    };

    U2A6.prototype.updateCounter = function() {
      this.time--;
      this.library['score'].updateTotal(this.time);
      if (this.time === 0) {
        return this.finish();
      }
    };

    U2A6.prototype.makeRaindropr = function() {
      var rand;
      rand = Math.round(Math.random() * 100);
      return this.makeRaindrop(rand);
    };

    U2A6.prototype.makeRaindropb = function() {
      var rbase;
      rbase = Math.round(Math.random() * 5);
      return this.makeRaindrop(this.random[rbase]);
    };

    U2A6.prototype.makeRaindrop = function(num) {
      var d, t;
      d = new Draggable('d' + this.rnum, this.preload.getResult('raindrop'), num, Math.random() * (1400 - 200) + 200, this.library['header'].height);
      t = new createjs.Text("" + num, '32px Quicksand', '#000099');
      t.textAlign = 'center';
      t.x = d.width / 2;
      t.y = d.height / 2;
      d.addChild(t);
      this.raindrops.addChild(d);
      d.addEventListener('drop', this.evaluateAnswer);
      d.initDragListener();
      this.rnum++;
      switch (this.level) {
        case 1:
          return TweenLite.to(d, 9, {
            y: 780,
            ease: Linear.easeNone,
            onComplete: this.killThis,
            onCompleteParams: [d]
          });
        case 2:
          return TweenLite.to(d, 7, {
            y: 780,
            ease: Linear.easeNone,
            onComplete: this.killThis,
            onCompleteParams: [d]
          });
        case 3:
          return TweenLite.to(d, 5, {
            y: 780,
            ease: Linear.easeNone,
            onComplete: this.killThis,
            onCompleteParams: [d]
          });
      }
    };

    U2A6.prototype.killThis = function(object) {
      TweenLite.killTweensOf(object);
      return this.raindrops.removeChild(object);
    };

    U2A6.prototype.evaluateAnswer = function(e) {
      var app, dropped, hit, hpp, i, pt, _i;
      this.answer = e.target;
      dropped = false;
      for (i = _i = 0; _i <= 5; i = _i += 1) {
        hit = this.library["b" + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if ((hit.hitTest(pt.x, pt.y)) && hit.index === this.answer.index) {
          hpp = hit.parent.localToGlobal(hit.x + hit.width / 2 - 160, hit.y + hit.height / 2 - 120);
          app = this.answer.parent.globalToLocal(hpp.x, hpp.y);
          this.buckets[i].a = false;
          dropped = true;
          this.answer.putInPlace(app);
          this.library['score'].plusOne();
          createjs.Sound.play('good');
          setTimeout(this.finishEvaluation, 2 * 1000);
        } else {
          createjs.Sound.play('wrong');
        }
      }
      if (!dropped) {
        return this.answer.takeMeOut();
      }
    };

    U2A6.prototype.finishEvaluation = function() {
      return this.nextEvaluation();
    };

    U2A6.prototype.nextEvaluation = function() {
      var complete, i, _i;
      complete = true;
      for (i = _i = 0; _i <= 5; i = _i += 1) {
        if (this.buckets[i].a === true) {
          complete = false;
        }
      }
      console.log(this.buckets);
      if (complete) {
        return this.finish();
      }
    };

    U2A6.prototype.blink = function(obj, state) {
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

    U2A6.prototype.finish = function() {
      clearInterval(this.timer);
      clearInterval(this.rinterval);
      clearInterval(this.binterval);
      TweenLite.to([this.library['background'], this.library['box'], this.library['raindrops']], 0.5, {
        alpha: 0
      });
      TweenMax.to([this.library['l1'], this.library['l2'], this.library['l3']], 1, {
        alpha: 0,
        y: stageSize.h
      });
      return U2A6.__super__.finish.apply(this, arguments);
    };

    window.U2A6 = U2A6;

    return U2A6;

  })(Oda);

}).call(this);
