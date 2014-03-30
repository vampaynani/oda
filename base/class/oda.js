(function() {
  var Oda,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __slice = [].slice;

  window.stageSize || (window.stageSize = {
    w: 800,
    h: 600,
    r: 1
  });

  Array.prototype.toDictionary = function(key) {
    var dict, obj, _i, _len;
    dict = {};
    for (_i = 0, _len = this.length; _i < _len; _i++) {
      obj = this[_i];
      if (obj[key] != null) {
        dict[obj[key]] = obj;
      }
    }
    return dict;
  };

  Array.prototype.where = function(query) {
    var hit;
    if (typeof query !== "object") {
      return [];
    }
    hit = Object.keys(query).length;
    return this.filter(function(item) {
      var key, match, val;
      match = 0;
      for (key in query) {
        val = query[key];
        if (item[key] === val) {
          match += 1;
        }
      }
      if (match === hit) {
        return true;
      } else {
        return false;
      }
    });
  };

  Array.prototype.unique = function() {
    var key, output, value, _i, _ref, _results;
    output = {};
    for (key = _i = 0, _ref = this.length; 0 <= _ref ? _i < _ref : _i > _ref; key = 0 <= _ref ? ++_i : --_i) {
      output[this[key]] = this[key];
    }
    _results = [];
    for (key in output) {
      value = output[key];
      _results.push(value);
    }
    return _results;
  };

  Oda = (function() {
    function Oda(imgurl, manifest, sounds) {
      var def_manifest, item;
      this.imgurl = imgurl != null ? imgurl : 'imgs/';
      this.warningComplete = __bind(this.warningComplete, this);
      this.playAgain = __bind(this.playAgain, this);
      this.handlePlayAgain = __bind(this.handlePlayAgain, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      this.initMobileInstructions = __bind(this.initMobileInstructions, this);
      this.handleComplete = __bind(this.handleComplete, this);
      this.handleProgress = __bind(this.handleProgress, this);
      def_manifest = [
        {
          id: 'sg',
          src: "" + this.imgurl + "start_game.png"
        }, {
          id: 'pa',
          src: "" + this.imgurl + "play_again.png"
        }
      ];
      this.assets = new Array();
      this.manifest = (function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = manifest.length; _i < _len; _i++) {
          item = manifest[_i];
          _results.push({
            id: "" + item.id,
            src: "" + (this.imgurl + item.src)
          });
        }
        return _results;
      }).call(this);
      Array.prototype.push.apply(this.manifest, def_manifest);
      Array.prototype.push.apply(this.manifest, sounds);
    }

    Oda.prototype.initialize = function() {
      this.initStage().initContainer().initPreloader().resize();
      return this;
    };

    Oda.prototype.initStage = function() {
      this.stage = new createjs.Stage('oda');
      createjs.Ticker.addEventListener('tick', this.stage);
      createjs.Ticker.setFPS(60);
      createjs.Touch.enable(this.stage);
      this.stage.enableMouseOver();
      return this;
    };

    Oda.prototype.initContainer = function() {
      this.mainContainer = new createjs.Container();
      this.mainContainer.regX = stageSize.w / 2;
      this.mainContainer.regY = stageSize.h / 2;
      this.stage.addChild(this.mainContainer);
      return this;
    };

    Oda.prototype.initPreloader = function() {
      var bgBar, i, _i, _ref;
      this.preload = new createjs.LoadQueue(false);
      this.loadStep = 0;
      this.barHeight = 7;
      this.barWidth = 35;
      this.loaderColor = (_ref = $('#oda').data('loadercolor')) != null ? _ref : '#E62922';
      this.loaderBar = new createjs.Container();
      this.loaderBar.x = stageSize.w / 2;
      this.loaderBar.y = stageSize.h / 2;
      for (i = _i = 1; _i <= 13; i = _i += 1) {
        bgBar = new createjs.Shape();
        bgBar.graphics.setStrokeStyle(1).beginStroke(this.loaderColor).beginFill(this.loaderColor).drawRoundRect(0, 0, this.barWidth, this.barHeight, 5);
        bgBar.regX = -20;
        bgBar.regY = this.barHeight / 2;
        bgBar.rotation = (i - 1) * 30;
        bgBar.alpha = 0.05;
        bgBar.name = 'bar' + i.toString();
        this.loaderBar.addChild(bgBar);
      }
      this.preload.installPlugin(createjs.Sound);
      this.preload.addEventListener('progress', this.handleProgress);
      this.preload.addEventListener('complete', this.handleComplete);
      this.preload.loadManifest(this.manifest);
      this.mainContainer.addChild(this.loaderBar);
      TweenLite.from(this.loaderBar, 1, {
        alpha: 0.1,
        ease: Quart.easeOut
      });
      return this;
    };

    Oda.prototype.handleProgress = function(e) {
      var percent;
      percent = Math.round(this.preload.progress * 100);
      if (e.loaded >= this.loadStep / 12 && this.loadStep < 12) {
        this.showBar("bar" + (this.loadStep + 1));
        return this.loadStep++;
      }
    };

    Oda.prototype.handleComplete = function() {
      this.preload.removeEventListener('progress', this.handleProgress);
      this.preload.removeEventListener('complete', this.handleComplete);
      TweenLite.to(this.loaderBar, 1, {
        alpha: 0,
        ease: Quart.easeOut
      });
      return this.setStage();
    };

    Oda.prototype.showBar = function(name) {
      return TweenLite.to(this.loaderBar.getChildByName(name), 2.5, {
        alpha: 1,
        ease: Quart.easeOut
      });
    };

    Oda.prototype.setStage = function() {
      this.index = 0;
      return this.observer = new Observer();
    };

    Oda.prototype.introEvaluation = function() {
      if (this.library.score) {
        if (this.library['score']) {
          return this.library.score.reset();
        }
      }
    };

    Oda.prototype.playInstructions = function(oda) {
      var inst;
      if (dealersjs.mobile.isIOS() || dealersjs.mobile.isAndroid()) {
        oda.insertBitmap('start', 'sg', stageSize.w / 2, stageSize.h / 2, 'mc');
        oda.library['start'].addEventListener('click', oda.initMobileInstructions);
        return TweenLite.from(oda.library['start'], 0.3, {
          alpha: 0,
          y: oda.library['start'].y + 20
        });
      } else {
        inst = createjs.Sound.play('instructions');
        return inst.addEventListener('complete', oda.initEvaluation);
      }
    };

    Oda.prototype.initMobileInstructions = function(e) {
      var inst;
      e.target.removeEventListener('click', this.initMobileInstructions);
      createjs.Sound.stop();
      inst = createjs.Sound.play('instructions');
      inst.addEventListener('complete', this.initEvaluation);
      return TweenLite.to(this.library['start'], 0.3, {
        alpha: 0,
        y: this.library['start'].y + 20,
        onComplete: this.removeMobileInstructions,
        onCompleteParams: [this]
      });
    };

    Oda.prototype.removeMobileInstructions = function(oda) {
      return oda.mainContainer.removeChild(oda.library['start']);
    };

    Oda.prototype.initEvaluation = function(e) {
      return this.observer.notify('init_evaluation');
    };

    Oda.prototype.finish = function() {
      this.insertBitmap('play_again', 'pa', stageSize.w / 2, stageSize.h / 2, 'mc');
      this.library['play_again'].addEventListener('click', this.handlePlayAgain);
      return TweenLite.from(this.library['play_again'], 0.5, {
        alpha: 0,
        y: this.library['play_again'].y - 20
      });
    };

    Oda.prototype.handlePlayAgain = function(e) {
      this.library['play_again'].removeEventListener('click', this.handlePlayAgain);
      return TweenLite.to(this.library['play_again'], 0.5, {
        alpha: 0,
        y: this.library['play_again'].y - 20,
        onComplete: this.playAgain
      });
    };

    Oda.prototype.playAgain = function() {
      this.mainContainer.removeAllChildren();
      return this.setStage();
    };

    Oda.prototype.warning = function() {
      createjs.Sound.play('wrong');
      TweenMax.to(this.mainContainer, 0.1, {
        x: this.mainContainer.x + 10,
        repeat: 6,
        yoyo: true,
        onComplete: this.warningComplete
      });
      return this;
    };

    Oda.prototype.warningComplete = function() {
      return this.mainContainer.x = this.stage.canvas.width / 2;
    };

    Oda.prototype.resize = function() {
      var h, w;
      w = window.innerWidth;
      h = window.innerHeight;
      stageSize.r = Math.min(w / stageSize.w, h / stageSize.h);
      this.mainContainer.scaleX = stageSize.r;
      this.mainContainer.scaleY = stageSize.r;
      $('#oda').width(w);
      this.stage.canvas.width = w;
      this.stage.canvas.height = h;
      this.mainContainer.x = this.stage.canvas.width / 2;
      this.mainContainer.y = this.stage.canvas.height / 2;
      return this;
    };

    Oda.prototype.tick = function() {
      return this.stage.update();
    };

    Oda.prototype.insertInstructions = function(name, text, x, y) {
      var inst, triangle;
      inst = new createjs.Container();
      inst.name = name;
      inst.x = x;
      inst.y = y;
      triangle = new createjs.Shape();
      triangle.graphics.beginFill('#bcd748').moveTo(0, 0).lineTo(8, 5).lineTo(0, 10);
      triangle.y = 5;
      text = this.createText('insttext', text, '16px Roboto', '#000', 14, 0);
      inst.addChild(triangle, text);
      return this.addToMain(inst);
    };

    Oda.prototype.createBitmap = function(name, id, x, y, position) {
      var bmp, img;
      if (position == null) {
        position = 'tl';
      }
      img = this.preload.getResult(id);
      bmp = new createjs.Bitmap(img);
      bmp.x = x;
      bmp.y = y;
      bmp.width = img.width;
      bmp.height = img.height;
      bmp.name = name;
      switch (position) {
        case 'tc':
          this.setReg(bmp, img.width / 2, 0);
          break;
        case 'tr':
          this.setReg(bmp, img.width, 0);
          break;
        case 'ml':
          this.setReg(bmp, 0, img.height / 2);
          break;
        case 'mc':
          this.setReg(bmp, img.width / 2, img.height / 2);
          break;
        case 'mr':
          this.setReg(bmp, img.width, img.height / 2);
          break;
        case 'bl':
          this.setReg(bmp, 0, img.height);
          break;
        case 'bc':
          this.setReg(bmp, img.width / 2, img.height);
          break;
        case 'br':
          this.setReg(bmp, img.width, img.height);
          break;
        default:
          this.setReg(bmp, 0, 0);
      }
      return bmp;
    };

    Oda.prototype.insertBitmap = function(name, id, x, y, position) {
      var bmp;
      if (position == null) {
        position = 'tl';
      }
      bmp = this.createBitmap(name, id, x, y, position);
      this.addToMain(bmp);
      return bmp;
    };

    Oda.prototype.createSprite = function(name, imgs, anim, x, y, position) {
      var animation, h, img, sprite, spriteImgs, w;
      if (anim == null) {
        anim = null;
      }
      if (position == null) {
        position = 'tl';
      }
      spriteImgs = (function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = imgs.length; _i < _len; _i++) {
          img = imgs[_i];
          _results.push(this.preload.getResult(img));
        }
        return _results;
      }).call(this);
      w = spriteImgs[0].width;
      h = spriteImgs[0].height;
      sprite = new createjs.SpriteSheet({
        images: spriteImgs,
        animations: anim,
        frames: {
          width: w,
          height: h
        }
      });
      animation = new createjs.Sprite(sprite);
      animation.x = x;
      animation.y = y;
      animation.width = w;
      animation.height = h;
      animation.name = name;
      animation.currentFrame = 0;
      switch (position) {
        case 'tc':
          this.setReg(animation, animation.width / 2, 0);
          break;
        case 'tr':
          this.setReg(animation, animation.width, 0);
          break;
        case 'ml':
          this.setReg(animation, 0, animation.height / 2);
          break;
        case 'mc':
          this.setReg(animation, animation.width / 2, animation.height / 2);
          break;
        case 'mr':
          this.setReg(animation, animation.width, animation.height / 2);
          break;
        case 'bl':
          this.setReg(animation, 0, animation.height);
          break;
        case 'bc':
          this.setReg(animation, animation.width / 2, animation.height);
          break;
        case 'br':
          this.setReg(animation, animation.width, animation.height);
          break;
        default:
          this.setReg(animation, 0, 0);
      }
      return animation;
    };

    Oda.prototype.insertSprite = function(name, imgs, anim, x, y, position) {
      var animation;
      if (anim == null) {
        anim = null;
      }
      if (position == null) {
        position = 'tl';
      }
      animation = this.createSprite(name, imgs, anim, x, y, position);
      this.addToMain(animation);
      return animation;
    };

    Oda.prototype.createText = function(name, t, f, c, x, y, align) {
      var text;
      if (align == null) {
        align = 'left';
      }
      text = new createjs.Text(t, f, c);
      text.name = name;
      text.x = x;
      text.y = y;
      text.textAlign = align;
      return text;
    };

    Oda.prototype.insertText = function(name, t, f, c, x, y, align) {
      var text;
      if (align == null) {
        align = 'left';
      }
      text = this.createText(name, t, f, c, x, y, align);
      this.addToMain(text);
      return text;
    };

    Oda.prototype.addToMain = function() {
      var o, objs, _i, _len;
      objs = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      this.addToLibrary(objs);
      for (_i = 0, _len = objs.length; _i < _len; _i++) {
        o = objs[_i];
        this.mainContainer.addChild(o);
      }
      return this.mainContainer;
    };

    Oda.prototype.addToLibrary = function() {
      var o, obj, objs, _i, _j, _len, _len1;
      obj = arguments[0], objs = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      if (this.isArray(obj)) {
        for (_i = 0, _len = obj.length; _i < _len; _i++) {
          o = obj[_i];
          this.assets.push(o);
        }
      } else {
        this.assets.push(obj);
        for (_j = 0, _len1 = objs.length; _j < _len1; _j++) {
          o = objs[_j];
          this.assets.push(o);
        }
      }
      this.library = this.assets.toDictionary('name');
      return this.library;
    };

    Oda.prototype.setReg = function(obj, regX, regY) {
      obj.regX = regX;
      obj.regY = regY;
      return obj;
    };

    Oda.prototype.setPosition = function(obj, x, y) {
      obj.x = x;
      obj.y = y;
      return obj;
    };

    Oda.prototype.shuffleNoRepeat = function(a, len) {
      var copy, i, rand, shuffle, _i;
      copy = a.slice(0);
      shuffle = Array();
      for (i = _i = 1; 1 <= len ? _i <= len : _i >= len; i = 1 <= len ? ++_i : --_i) {
        rand = Math.round(Math.random() * (copy.length - 1));
        shuffle.push(copy[rand]);
        copy.splice(rand, 1);
      }
      return shuffle;
    };

    Oda.prototype.shuffle = function(a) {
      var copy, i, j, _i, _ref, _ref1;
      copy = a.slice(0);
      for (i = _i = _ref = copy.length - 1; _ref <= 0 ? _i <= 0 : _i >= 0; i = _ref <= 0 ? ++_i : --_i) {
        j = Math.floor(Math.random() * (i + 1));
        _ref1 = [copy[j], copy[i]], copy[i] = _ref1[0], copy[j] = _ref1[1];
      }
      return copy;
    };

    Oda.prototype.clone = function(obj) {
      var flags, key, newInstance;
      if ((obj == null) || typeof obj !== 'object') {
        return obj;
      }
      if (obj instanceof Date) {
        return new Date(obj.getTime());
      }
      if (obj instanceof RegExp) {
        flags = '';
        if (obj.global != null) {
          flags += 'g';
        }
        if (obj.ignoreCase != null) {
          flags += 'i';
        }
        if (obj.multiline != null) {
          flags += 'm';
        }
        if (obj.sticky != null) {
          flags += 'y';
        }
        return new RegExp(obj.source, flags);
      }
      newInstance = new obj.constructor();
      for (key in obj) {
        newInstance[key] = this.clone(obj[key]);
      }
      return newInstance;
    };

    Oda.prototype.isArray = function(value) {
      return Array.isArray(value || function(value) {
        return {}.toString.call(value) === '[object Array]';
      });
    };

    Oda.prototype.debuggable = function(obj) {
      var KEYCODE_DOWN, KEYCODE_ENTER, KEYCODE_LEFT, KEYCODE_RIGHT, KEYCODE_SPACE, KEYCODE_UP,
        _this = this;
      KEYCODE_ENTER = 13;
      KEYCODE_SPACE = 32;
      KEYCODE_UP = 38;
      KEYCODE_DOWN = 40;
      KEYCODE_LEFT = 37;
      KEYCODE_RIGHT = 39;
      this.debugged = obj;
      document.addEventListener('keyup', function(e) {
        switch (e.keyCode) {
          case KEYCODE_UP:
            _this.debugged.y -= 10;
            break;
          case KEYCODE_DOWN:
            _this.debugged.y += 10;
            break;
          case KEYCODE_LEFT:
            _this.debugged.x -= 10;
            break;
          case KEYCODE_RIGHT:
            _this.debugged.x += 10;
        }
        return console.log(_this.debugged.x, _this.debugged.y);
      });
      this.debugged.addEventListener('mousedown', function(e) {
        var offset, posX, posY;
        posX = e.stageX / stageSize.r;
        posY = e.stageY / stageSize.r;
        offset = {
          x: posX - _this.debugged.x,
          y: posY - _this.debugged.y
        };
        _this.debugged.x = posX - offset.x;
        _this.debugged.y = posY - offset.y;
        e.addEventListener('mousemove', function(ev) {
          posX = ev.stageX / stageSize.r;
          posY = ev.stageY / stageSize.r;
          _this.debugged.x = posX - offset.x;
          _this.debugged.y = posY - offset.y;
          return false;
        });
        e.addEventListener('mouseup', function(ev) {
          return console.log(_this.debugged);
        });
        return _this.debugged;
      });
      return this.debugged;
    };

    Oda.prototype.blink = function(obj, state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      obj.alpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: .2,
          repeat: -1,
          yoyo: true
        });
      }
    };

    window.Oda = Oda;

    return Oda;

  })();

}).call(this);
