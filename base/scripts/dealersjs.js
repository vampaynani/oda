/*

LIBRARY
*/


(function() {
  var ABCContainer, Actions, Behaviors, ButtonContainer, ChooseContainer, CloneCompleterContainer, CloneContainer, Component, ComponentGroup, ComponentObserver, CrossWordsContainer, DragContainer, Evaluator, Game, GameObserver, GridContainer, ImageCompleterContainer, ImageContainer, ImageWordCompleterContainer, Instructions, LabelContainer, LetterContainer, LetterDragContainer, MainContainer, Methods, Mobile, Module, Observer, Oda, PhraseCloneContainer, PhraseCompleterContainer, Preloader, Scene, SceneFactory, SceneObserver, SceneStack, Score, ScrambledWordContainer, SpriteContainer, StepContainer, StepsContainer, TextCloneContainer, TextCompleterContainer, TextContainer, Utilities, WordCompleterContainer, WordSearchContainer, WriteContainer, moduleKeywords, _base, _base1, _base2, _base3, _base4, _base5, _base6, _ref, _ref1, _ref2,
    __slice = [].slice,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  if (window.dealersjs == null) {
    window.dealersjs = {};
  }

  if (window.d2oda == null) {
    window.d2oda = {};
  }

  if (window.lib == null) {
    window.lib = {};
  }

  if ((_base = window.dealersjs).mobile == null) {
    _base.mobile = Mobile = (function() {
      function Mobile() {}

      Mobile.user_agent = navigator.userAgent.toLowerCase();

      Mobile.isIOS = function() {
        if (true === this.isIpad() || true === this.isIphone() || true === this.isIpod()) {
          return true;
        } else {
          return false;
        }
      };

      Mobile.isIpad = function() {
        return this.user_agent.indexOf('ipad') > -1;
      };

      Mobile.isIphone = function() {
        return this.user_agent.indexOf('iphone') > -1;
      };

      Mobile.isIpod = function() {
        return this.user_agent.indexOf('ipod') > -1;
      };

      Mobile.isAndroid = function() {
        return this.user_agent.indexOf('android') > -1;
      };

      Mobile.isMobile = function() {
        return this.user_agent.indexOf('mobile') > -1;
      };

      Mobile;

      return Mobile;

    })();
  }

  if ((_base1 = window.d2oda).utilities == null) {
    _base1.utilities = Utilities = (function() {
      function Utilities() {}

      Utilities.shuffleNoRepeat = function(a, len) {
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

      Utilities.shuffle = function(a) {
        var copy, i, j, _i, _ref, _ref1;
        copy = a.slice(0);
        for (i = _i = _ref = copy.length - 1; _ref <= 0 ? _i <= 0 : _i >= 0; i = _ref <= 0 ? ++_i : --_i) {
          j = Math.floor(Math.random() * (i + 1));
          _ref1 = [copy[j], copy[i]], copy[i] = _ref1[0], copy[j] = _ref1[1];
        }
        return copy;
      };

      Utilities.clone = function(obj) {
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

      Utilities.isArray = function(value) {
        Array.isArray(value || function(value) {});
        return {}.toString.call(value) === '[object Array]';
      };

      Utilities;

      return Utilities;

    })();
  }

  if ((_base2 = window.d2oda).behaviors == null) {
    _base2.behaviors = Behaviors = (function() {
      var _this = this;

      function Behaviors() {}

      Behaviors.initDragListener = function() {
        return Behaviors.addEventListener('mousedown', Behaviors.handleMouseDown);
      };

      Behaviors.endDragListener = function() {
        return Behaviors.removeEventListener('mousedown', Behaviors.handleMouseDown);
      };

      Behaviors;

      return Behaviors;

    }).call(this);
  }

  if ((_base3 = window.d2oda).actions == null) {
    _base3.actions = Actions = (function() {
      function Actions() {}

      Actions.fadeOut = function() {
        TweenMax.killTweensOf(this);
        TweenLite.killTweensOf(this);
        if (this.alpha === 0) {
          this.y -= 20;
          return TweenLite.from(this, 0.5, {
            alpha: 1,
            y: this.y + 20
          });
        } else {
          this.y += 20;
          return TweenLite.to(this, 0.5, {
            alpha: 0,
            y: this.y - 20
          });
        }
      };

      Actions.fadeIn = function() {
        TweenMax.killTweensOf(this);
        TweenLite.killTweensOf(this);
        if (this.alpha === 1) {
          this.y -= 20;
          return TweenLite.from(this, 0.5, {
            alpha: 0,
            y: this.y + 20
          });
        } else {
          this.y += 20;
          return TweenLite.to(this, 0.5, {
            alpha: 1,
            y: this.y - 20
          });
        }
      };

      Actions.pulse = function(state) {
        if (state == null) {
          state = true;
        }
        TweenMax.killTweensOf(this);
        TweenLite.killTweensOf(this);
        this.alpha = 1;
        if (state) {
          return TweenMax.to(this, 0.5, {
            scaleX: 0.8,
            scaleY: 0.8,
            repeat: -1,
            yoyo: true
          });
        }
      };

      Actions.blink = function(state) {
        if (state == null) {
          state = true;
        }
        TweenMax.killTweensOf(this);
        TweenLite.killTweensOf(this);
        this.alpha = 1;
        if (state) {
          return TweenMax.to(this, 0.5, {
            alpha: 0.2,
            repeat: -1,
            yoyo: true
          });
        }
      };

      Actions.hide = function() {
        return this.visible = false;
      };

      Actions.setInOrigin = function() {
        this.x = this.pos.x;
        return this.y = this.pos.y;
      };

      Actions.putInPlace = function(position, alpha, scaleX, scaleY) {
        if (alpha == null) {
          alpha = 1;
        }
        if (scaleX == null) {
          scaleX = 1;
        }
        if (scaleY == null) {
          scaleY = 1;
        }
        TweenMax.killTweensOf(this);
        TweenLite.killTweensOf(this);
        return TweenLite.to(this, 1, {
          ease: Back.easeOut,
          delay: 0.1,
          x: position.x,
          y: position.y,
          alpha: alpha,
          scaleX: scaleX,
          scaleY: scaleY
        });
      };

      Actions.returnToPlace = function(alpha, scaleX, scaleY) {
        if (alpha == null) {
          alpha = 1;
        }
        if (scaleX == null) {
          scaleX = 1;
        }
        if (scaleY == null) {
          scaleY = 1;
        }
        TweenMax.killTweensOf(this);
        TweenLite.killTweensOf(this);
        return TweenLite.to(this, 0.5, {
          ease: Back.easeOut,
          delay: 0.1,
          x: this.pos.x,
          y: this.pos.y,
          alpha: alpha,
          scaleX: scaleX,
          scaleY: scaleY
        });
      };

      Actions;

      return Actions;

    })();
  }

  if ((_base4 = window.d2oda).methods == null) {
    _base4.methods = Methods = (function() {
      function Methods() {}

      Methods.createBitmap = function(name, id, x, y, position) {
        var bmp, img;
        if (position == null) {
          position = 'tl';
        }
        img = lib.preloader.preload.getResult(id);
        bmp = new createjs.Bitmap(img);
        bmp.x = x;
        bmp.y = y;
        bmp.width = img.width;
        bmp.height = img.height;
        bmp.name = name;
        this.setPosition(position, bmp);
        return bmp;
      };

      Methods.insertBitmap = function(name, id, x, y, position) {
        var bmp;
        if (position == null) {
          position = 'tl';
        }
        bmp = this.createBitmap(name, id, x, y, position);
        this.add(bmp);
        return bmp;
      };

      Methods.createText = function(name, t, f, c, x, y, align) {
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

      Methods.insertText = function(name, t, f, c, x, y, align) {
        var text;
        if (align == null) {
          align = 'left';
        }
        text = this.createText(name, t, f, c, x, y, align);
        this.add(text);
        return text;
      };

      Methods.createSprite = function(name, imgs, anim, x, y, position) {
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
            _results.push(lib.preloader.preload.getResult(img));
          }
          return _results;
        })();
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
        animation = new createjs.BitmapAnimation(sprite);
        animation.x = x;
        animation.y = y;
        animation.width = w;
        animation.height = h;
        animation.name = name;
        animation.currentFrame = 0;
        this.setPosition(position, animation);
        return animation;
      };

      Methods.insertSprite = function(name, imgs, anim, x, y, position) {
        var animation;
        if (anim == null) {
          anim = null;
        }
        if (position == null) {
          position = 'tl';
        }
        animation = this.createSprite(name, imgs, anim, x, y, position);
        this.add(animation);
        return animation;
      };

      Methods.setPosition = function(position, obj) {
        if (obj == null) {
          obj = null;
        }
        if (!obj) {
          obj = this;
        }
        switch (position) {
          case 'tc':
            return this.setReg(obj, obj.width / 2, 0);
          case 'tr':
            return this.setReg(obj, obj.width, 0);
          case 'ml':
            return this.setReg(obj, 0, obj.height / 2);
          case 'mc':
            return this.setReg(obj, obj.width / 2, obj.height / 2);
          case 'mr':
            return this.setReg(obj, obj.width, obj.height / 2);
          case 'bl':
            return this.setReg(obj, 0, obj.height);
          case 'bc':
            return this.setReg(obj, obj.width / 2, obj.height);
          case 'br':
            return this.setReg(obj, obj.width, obj.height);
          default:
            return this.setReg(obj, 0, 0);
        }
      };

      Methods.setReg = function(obj, regX, regY) {
        obj.regX = regX;
        obj.regY = regY;
        return obj;
      };

      Methods.add = function(child, toLibrary) {
        if (toLibrary == null) {
          toLibrary = true;
        }
        this.addChild(child);
        if (toLibrary) {
          return lib[child.name] = child;
        }
      };

      Methods.delay = function() {
        var args, fn, time;
        time = arguments[0], fn = arguments[1], args = 3 <= arguments.length ? __slice.call(arguments, 2) : [];
        return setTimeout.apply(null, [fn, time].concat(__slice.call(args)));
      };

      Methods;

      return Methods;

    })();
  }

  if ((_base5 = window.d2oda).stage == null) {
    _base5.stage = {
      w: 800,
      h: 600,
      r: 1
    };
  }

  if ((_base6 = window.d2oda).evaluator == null) {
    _base6.evaluator = Evaluator = (function() {
      function Evaluator() {}

      Evaluator.success = null;

      Evaluator.evaluate = function(type, dispatcher, target) {
        console.log(type, dispatcher, target);
        if (type instanceof Function) {
          type(dispatcher, target);
          return;
        }
        switch (type) {
          case 'repeat':
            return this.evaluateRepeat();
          case 'finish':
            return this.evaluateFinish(target);
          case 'global_01':
            return this.evaluateGlobal01(dispatcher);
          case 'click_O1':
            return this.evaluateClick01(dispatcher, target);
          case 'click_O1_01':
            return this.evaluateClick01_01(dispatcher, target);
          case 'click_02':
            return this.evaluateClick02(dispatcher, target);
          case 'click_03':
            return this.evaluateClick03(dispatcher, target);
          case 'drop_01':
            return this.evaluateDrop01(dispatcher, target);
          case 'drop_02':
            return this.evaluateDrop02(dispatcher, target);
          case 'drop_02_01':
            return this.evaluateDrop02_01(dispatcher, target);
          case 'drop_02_02':
            return this.evaluateDrop02_02(dispatcher, target);
          case 'drop_03':
            return this.evaluateDrop03(dispatcher, target);
          case 'drop_04':
            return this.evaluateDrop04(dispatcher, target);
          case 'clon_01':
            return this.evaluateClon01(dispatcher, target);
          case 'switch_01':
            return this.evaluateSwitch01(dispatcher, target);
          case 'choose_01':
            return this.evaluateChoose01(dispatcher);
          case 'show_choose_01':
            return this.evaluateShowChoose01(dispatcher, target);
          case 'hangman_click_01':
            return this.evaluateHangmanClick01(dispatcher, target);
          case 'show_click_01':
            return this.evaluateShowClick01(dispatcher, target);
          case 'phrase_drop_01':
            return this.evaluatePhraseDrop01(dispatcher, target);
          case 'phrase_drop_02':
            return this.evaluatePhraseDrop02(dispatcher, target);
          case 'phrase_drop_03':
            return this.evaluatePhraseDrop03(dispatcher, target);
          case 'sprite_drop_01':
            return this.evaluateSpriteDrop01(dispatcher, target);
          case 'word_drop_01':
            return this.evaluateWordDrop01(dispatcher, target);
          case 'word_complete_01':
            return this.evaluateWordComplete01(dispatcher, target);
        }
      };

      Evaluator.evaluateRepeat = function() {
        createjs.Sound.stop();
        return createjs.Sound.play(lib.scene.snd);
      };

      Evaluator.evaluateFinish = function(target) {
        var drop, tgt, _i, _j, _len, _len1, _ref, _ref1;
        if (lib[target].droptargets) {
          _ref = lib[target].droptargets;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            drop = _ref[_i];
            drop.showEvaluation();
            if (drop.complete) {
              lib.score.plusOne();
            }
          }
        } else if (lib[target].group) {
          _ref1 = lib[target].group;
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            tgt = _ref1[_j];
            console.log(lib[tgt].complete);
            if (lib[tgt].complete) {
              lib.score.plusOne();
            }
          }
        }
        return lib.scene.success(false);
      };

      Evaluator.evaluateGlobal01 = function(dispatcher) {
        if (lib[dispatcher].index === this.success) {
          return lib.scene.success();
        } else {
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateGlobal02 = function(dispatcher) {
        if (lib[dispatcher].index === this.success) {
          lib.scene.success();
          return lib.scene.nextStep();
        } else {
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateHangmanClick01 = function(dispatcher, target) {
        var complete, droptarget, failed, _i, _j, _len, _len1, _ref, _ref1;
        failed = true;
        lib[dispatcher].visible = false;
        _ref = lib[target].droptargets;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          droptarget = _ref[_i];
          if (lib[dispatcher].index === droptarget.success) {
            droptarget.update({
              complete: true
            });
            failed = false;
          }
          console.log(lib[dispatcher].index, droptarget.success, failed);
        }
        if (failed) {
          lib.scene.fail();
          lib.hangman.current++;
          if (lib.hangman.current >= lib.hangman.group.length) {
            lib.hangman.current = 0;
            lib.scene.nextStep();
          } else {
            lib.hangman.update({
              type: 'fadeIn',
              target: lib.hangman.group[lib.hangman.current]
            });
          }
        } else {
          complete = true;
          _ref1 = lib[target].droptargets;
          for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
            droptarget = _ref1[_j];
            if (!droptarget.complete) {
              complete = false;
            }
          }
        }
        if (complete) {
          return lib.scene.success();
        }
      };

      Evaluator.evaluateShowClick01 = function(dispatcher, target) {
        return lib[target].update({
          type: 'fadeIn',
          target: lib[dispatcher].index
        });
      };

      Evaluator.evaluateWordDrop01 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.complete = true;
          target.update();
          lib[dispatcher].afterSuccess();
          target.parent.currentTarget++;
          if (target.parent.currentTarget === target.parent.droptargets.length) {
            lib[target.parent.target][target.parent.fx]();
            lib.scene.success();
            return target.parent.onComplete();
          }
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateWordComplete01 = function(dispatcher, target) {
        var index;
        index = lib[dispatcher].oncomplete.index;
        return lib[target].words[index].enabled = true;
      };

      Evaluator.evaluateClick01 = function(dispatcher, target) {
        var answer, currentTarget, droptargets;
        answer = lib[dispatcher].index;
        droptargets = lib[target].droptargets;
        currentTarget = lib[target].currentTarget;
        if (answer === droptargets[currentTarget].success) {
          droptargets[currentTarget].complete = true;
          droptargets[currentTarget].update();
          lib[target].currentTarget++;
          if (lib[target].currentTarget === droptargets.length) {
            return lib.scene.success();
          }
        } else {
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateClick01_01 = function(dispatcher, target) {
        var answer, currentTarget, droptargets, next;
        answer = lib[dispatcher].index;
        droptargets = lib[target].droptargets;
        currentTarget = lib[target].currentTarget;
        if (answer === droptargets[currentTarget].success) {
          droptargets[currentTarget].complete = true;
          droptargets[currentTarget].update();
          lib[target].currentTarget++;
          if (lib[target].currentTarget === droptargets.length) {
            next = lib[target].nextGroup;
            lib.score.plusOne();
            createjs.Sound.play('s/good');
            return lib[next].setInvisible(false);
          }
        } else {
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateClick02 = function(dispatcher, target) {
        if (lib[dispatcher].index === lib[target].success) {
          lib[target].complete = true;
          lib[dispatcher].updateState();
          return lib.scene.success();
        } else {
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateClick03 = function(dispatcher, target) {
        var currentTarget, targets;
        targets = lib[target].targets;
        currentTarget = lib[target].currentTarget;
        if (lib[dispatcher].index === lib[target].success) {
          targets[currentTarget].complete = true;
          lib[target].fadeOut(targets[currentTarget]);
          lib.scene.success(false);
          createjs.Sound.play('s/good');
          return lib[target].currentTarget++;
        } else {
          lib[target].warnings++;
          lib.scene.fail();
          if (lib[target].warnings === 3) {
            lib.score.stop();
            return lib.game.nextScene();
          }
        }
      };

      Evaluator.evaluateDrop01 = function(dispatcher, target) {
        lib[dispatcher].afterSuccess({
          x: target.x,
          y: target.y
        });
        if (lib[dispatcher].index === target.success) {
          return target.update();
        } else {
          return target.update(false);
        }
      };

      Evaluator.evaluateDrop02 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.update();
          lib[dispatcher].afterSuccess();
          return lib.scene.success();
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateDrop02_01 = function(dispatcher, target) {
        var complete, drop, _i, _j, _len, _len1, _ref, _ref1;
        complete = true;
        if (lib[dispatcher].index === target.success) {
          target.update(lib[dispatcher].label.text, true);
        } else {
          target.update(lib[dispatcher].label.text, false);
        }
        lib[dispatcher].afterSuccess();
        _ref = lib[dispatcher].droptargets;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          drop = _ref[_i];
          if (drop.text.text === '') {
            complete = false;
          }
        }
        if (!complete) {
          return;
        }
        _ref1 = lib[dispatcher].droptargets;
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          drop = _ref1[_j];
          drop.showEvaluation();
          if (drop.complete) {
            lib.score.plusOne();
          }
        }
        return lib.scene.success(false);
      };

      Evaluator.evaluateDrop02_02 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.update({
            complete: true
          });
          lib[dispatcher].afterSuccess();
          return lib.scene.success();
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateDrop03 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.complete = true;
          target.update();
          lib[dispatcher].afterSuccess();
          target.parent.currentTarget++;
          if (target.parent.currentTarget === target.parent.droptargets.length) {
            lib[target.parent.target].fadeOut();
            return lib.scene.success();
          }
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluatePhraseDrop01 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.complete = true;
          target.update();
          lib[dispatcher].afterSuccess();
          target.parent.currentTarget++;
          lib.score.plusOne();
          createjs.Sound.play('s/good');
          if (target.parent.currentTarget === target.parent.droptargets.length) {
            return lib.scene.success(false);
          }
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluatePhraseDrop02 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.complete = true;
          target.update();
          lib[dispatcher].afterSuccess();
          target.parent.currentTarget++;
          if (target.parent.currentTarget === target.parent.droptargets.length) {
            return lib.scene.success();
          }
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluatePhraseDrop03 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.complete = true;
          target.update();
          lib[dispatcher].afterSuccess();
          target.parent.currentTarget++;
          if (target.parent.currentTarget === target.parent.droptargets.length) {
            target.parent.fadeOut();
            return lib.scene.success();
          }
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateSpriteDrop01 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.parent.success) {
          target.parent.nextStep();
          lib[dispatcher].afterSuccess();
          return lib.scene.success(true, false);
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateDrop04 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.update({
            complete: true
          });
          lib[dispatcher].afterSuccess();
          return target.parent.evaluateWords();
        } else {
          lib[dispatcher].afterFail();
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateClon01 = function(dispatcher, target) {
        if (lib[dispatcher].index === target.success) {
          target.update(true, lib[dispatcher].bmpid);
        } else {
          target.update(false, lib[dispatcher].bmpid);
        }
        return lib[dispatcher].afterSuccess();
      };

      Evaluator.evaluateSwitch01 = function(dispatcher, target) {
        if (lib[dispatcher].index === lib[target].success) {
          lib[target].doSwitch();
          return lib.scene.success();
        } else {
          return lib.scene.fail();
        }
      };

      Evaluator.evaluateShowChoose01 = function(dispatcher, target) {
        var g, i, index, t, _i, _len, _results;
        console.log(dispatcher, target);
        index = lib[dispatcher].index - 1;
        if (d2oda.utilities.isArray(target)) {
          _results = [];
          for (_i = 0, _len = target.length; _i < _len; _i++) {
            t = target[_i];
            i = lib[t].group[index];
            _results.push(g = lib[t].update({
              type: 'fadeIn',
              target: i
            }));
          }
          return _results;
        }
      };

      Evaluator.evaluateChoose01 = function(dispatcher) {
        lib.scene.choose = lib[dispatcher].index;
        return lib.scene.success(false);
      };

      Evaluator;

      return Evaluator;

    })();
  }

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

  Array.prototype.compare = function(array) {
    var i;
    i = this.length;
    if (i !== array.length) {
      return false;
    }
    while (i--) {
      if (this[i] !== array[i]) {
        return false;
      }
    }
    return true;
  };

  Array.prototype.merge = function(other) {
    return Array.prototype.push.apply(this, other);
  };

  /*
  
  BASE CLASSES
  */


  Oda = (function() {
    function Oda() {
      this.playAgain = __bind(this.playAgain, this);
      this.handlePlayAgain = __bind(this.handlePlayAgain, this);
      this.endGame = __bind(this.endGame, this);
      this.initGame = __bind(this.initGame, this);
      this.removeMobileInstructions = __bind(this.removeMobileInstructions, this);
      this.initMobileInstructions = __bind(this.initMobileInstructions, this);
      this.playInstructions = __bind(this.playInstructions, this);
      this.setGame = __bind(this.setGame, this);
      var assetsurl, def_manifest, item;
      lib.preloader = new Preloader();
      lib.mainContainer = new MainContainer();
      assetsurl = 'assets/';
      def_manifest = [
        {
          id: 'sg',
          src: "" + assetsurl + "start_game.png"
        }, {
          id: 'pa',
          src: "" + assetsurl + "play_again.png"
        }, {
          id: 's/boing',
          src: "" + assetsurl + "boing.mp3"
        }, {
          id: 's/good',
          src: "" + assetsurl + "good.mp3"
        }, {
          id: 's/wrong',
          src: "" + assetsurl + "wrong.mp3"
        }
      ];
      this.manifest = (function() {
        var _i, _len, _ref, _results;
        _ref = this.manifest;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          item = _ref[_i];
          _results.push({
            id: "" + item.id,
            src: "" + (assetsurl + item.src)
          });
        }
        return _results;
      }).call(this);
      Array.prototype.push.apply(this.manifest, def_manifest);
      this._setStage().resize();
      lib.preloader.addEventListener('complete', this.setGame);
      lib.preloader.load(this.manifest);
    }

    Oda.prototype.resize = function() {
      var h, w;
      w = window.innerWidth;
      h = window.innerHeight;
      d2oda.stage.r = Math.min(w / d2oda.stage.w, h / d2oda.stage.h);
      lib.mainContainer.scaleX = d2oda.stage.r;
      lib.mainContainer.scaleY = d2oda.stage.r;
      $('#oda').width(w);
      this.stage.canvas.width = w;
      this.stage.canvas.height = h;
      lib.mainContainer.x = this.stage.canvas.width / 2;
      lib.mainContainer.y = this.stage.canvas.height / 2;
      return this;
    };

    Oda.prototype.setGame = function() {
      var gameinstance;
      lib.mainContainer.removeAllChildren();
      gameinstance = d2oda.utilities.clone(this.game);
      lib.game = new Game(gameinstance);
      return this.playInstructions();
    };

    Oda.prototype.playInstructions = function() {
      var inst;
      if (dealersjs.mobile.isIOS() || dealersjs.mobile.isAndroid()) {
        lib.mainContainer.insertBitmap('start', 'sg', d2oda.stage.w / 2, d2oda.stage.h / 2, 'mc');
        lib.start.addEventListener('click', this.initMobileInstructions);
        return TweenLite.from(lib.start, 0.3, {
          alpha: 0,
          y: lib.start + 20
        });
      } else {
        inst = lib.instructions.playSound('s/instructions');
        return inst.addEventListener('complete', this.initGame);
      }
    };

    Oda.prototype.initMobileInstructions = function(e) {
      var inst;
      inst = lib.instructions.playSound('s/instructions');
      e.target.removeEventListener('click', this.initMobileInstructions);
      inst.addEventListener('complete', this.initGame);
      return TweenLite.to(lib.start, 0.3, {
        alpha: 0,
        y: lib.start.y + 20,
        onComplete: this.removeMobileInstructions
      });
    };

    Oda.prototype.removeMobileInstructions = function() {
      return lib.mainContainer.removeChild(lib.start);
    };

    Oda.prototype.initGame = function() {
      return lib.game.start();
    };

    Oda.prototype.endGame = function() {
      createjs.Sound.stop();
      lib.mainContainer.insertBitmap('play_again', 'pa', d2oda.stage.w / 2, d2oda.stage.h / 2, 'mc');
      lib.play_again.addEventListener('click', this.handlePlayAgain);
      return TweenLite.from(lib.play_again, 0.5, {
        alpha: 0,
        y: lib.play_again.y - 20
      });
    };

    Oda.prototype.handlePlayAgain = function(e) {
      lib.play_again.removeEventListener('click', this.handlePlayAgain);
      return TweenLite.to(lib.play_again, 0.5, {
        alpha: 0,
        y: lib.play_again.y - 20,
        onComplete: this.playAgain
      });
    };

    Oda.prototype.playAgain = function() {
      return this.setGame();
    };

    Oda.prototype.tick = function() {
      return this.stage.update();
    };

    Oda.prototype._setStage = function() {
      this.stage = new createjs.Stage('oda');
      createjs.Ticker.addListener(this);
      createjs.Ticker.setFPS(60);
      createjs.Touch.enable(this.stage);
      this.stage.enableMouseOver(50);
      this.stage.addChild(lib.mainContainer);
      lib.preloader.mainContainer = lib.mainContainer;
      return this;
    };

    window.Oda = Oda;

    return Oda;

  })();

  Preloader = (function() {
    function Preloader() {
      this.handleComplete = __bind(this.handleComplete, this);
      this.handleProgress = __bind(this.handleProgress, this);
      this.initialize();
    }

    Preloader.prototype = new createjs.EventDispatcher();

    Preloader.prototype.EventDispatcher_initialize = Preloader.prototype.initialize;

    Preloader.prototype.initialize = function() {
      var bgBar, i, _i, _ref, _results;
      this.EventDispatcher_initialize();
      this.preload = new createjs.LoadQueue(false);
      this.loadStep = 0;
      this.barHeight = 7;
      this.barWidth = 35;
      this.loaderColor = (_ref = $('#oda').data('loadercolor')) != null ? _ref : '#E62922';
      this.loaderBar = new createjs.Container();
      this.loaderBar.x = d2oda.stage.w / 2;
      this.loaderBar.y = d2oda.stage.h / 2;
      _results = [];
      for (i = _i = 1; _i <= 13; i = _i += 1) {
        bgBar = new createjs.Shape();
        bgBar.graphics.setStrokeStyle(1).beginStroke(this.loaderColor).beginFill(this.loaderColor).drawRoundRect(0, 0, this.barWidth, this.barHeight, 5);
        bgBar.regX = -20;
        bgBar.regY = this.barHeight / 2;
        bgBar.rotation = (i - 1) * 30;
        bgBar.alpha = 0.05;
        bgBar.name = 'bar' + i.toString();
        _results.push(this.loaderBar.addChild(bgBar));
      }
      return _results;
    };

    Preloader.prototype.load = function(manifest) {
      this.preload.installPlugin(createjs.Sound);
      this.preload.addEventListener('progress', this.handleProgress);
      this.preload.addEventListener('complete', this.handleComplete);
      this.preload.loadManifest(manifest);
      this.mainContainer.addChild(this.loaderBar);
      TweenLite.from(this.loaderBar, 1, {
        alpha: 0.1,
        ease: Quart.easeOut
      });
      return this;
    };

    Preloader.prototype.handleProgress = function(e) {
      var percent;
      percent = Math.round(this.preload.progress * 100);
      if (e.loaded >= this.loadStep / 12 && this.loadStep < 12) {
        this.showBar("bar" + (this.loadStep + 1));
        return this.loadStep++;
      }
    };

    Preloader.prototype.handleComplete = function() {
      this.preload.removeEventListener('progress', this.handleProgress);
      this.preload.removeEventListener('complete', this.handleComplete);
      this.dispatchEvent({
        type: 'complete'
      });
      return TweenLite.to(this.loaderBar, 1, {
        alpha: 0,
        ease: Quart.easeOut
      });
    };

    Preloader.prototype.showBar = function(name) {
      return TweenLite.to(this.loaderBar.getChildByName(name), 2.5, {
        alpha: 1,
        ease: Quart.easeOut
      });
    };

    window.Preloader = Preloader;

    return Preloader;

  })();

  moduleKeywords = ['extended', 'included'];

  Module = (function() {
    function Module() {}

    Module.extend = function(obj, props) {
      var key, value, _ref;
      for (key in props) {
        value = props[key];
        if (__indexOf.call(moduleKeywords, key) < 0) {
          obj[key] = value;
        }
      }
      if ((_ref = props.extended) != null) {
        _ref.apply(obj);
      }
      return obj;
    };

    Module.include = function(obj, props) {
      var key, value, _ref;
      for (key in props) {
        value = props[key];
        if (__indexOf.call(moduleKeywords, key) < 0) {
          obj.prototype[key] = value;
        }
      }
      if ((_ref = props.included) != null) {
        _ref.apply(obj);
      }
      return obj;
    };

    window.Module = Module;

    return Module;

  })();

  MainContainer = (function() {
    function MainContainer() {
      this.warningComplete = __bind(this.warningComplete, this);
      this.initialize();
    }

    MainContainer.prototype = new createjs.Container();

    MainContainer.prototype.Container_initialize = MainContainer.prototype.initialize;

    MainContainer.prototype.initialize = function() {
      Module.extend(this, d2oda.methods);
      this.Container_initialize();
      this.name = 'mainContainer';
      this.regX = d2oda.stage.w / 2;
      return this.regY = d2oda.stage.h / 2;
    };

    MainContainer.prototype.warning = function() {
      createjs.Sound.play('s/wrong');
      this.prevX = this.x;
      TweenMax.to(this, 0.1, {
        x: this.x + 10,
        repeat: 6,
        yoyo: true,
        onComplete: this.warningComplete
      });
      return this;
    };

    MainContainer.prototype.warningComplete = function() {
      return this.x = this.prevX;
    };

    window.MainContainer = MainContainer;

    return MainContainer;

  })();

  Observer = (function() {
    function Observer() {
      this.subscribers = [];
    }

    Observer.prototype.notify = function(item) {
      var subscriber, _i, _len, _ref, _results;
      _ref = this.subscribers;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        subscriber = _ref[_i];
        if (subscriber.item === item) {
          _results.push(subscriber.callback(item));
        }
      }
      return _results;
    };

    Observer.prototype.subscribe = function(to, onNotify) {
      return this.subscribers.push({
        'item': to,
        'callback': onNotify
      });
    };

    return Observer;

  })();

  GameObserver = (function(_super) {
    __extends(GameObserver, _super);

    function GameObserver() {
      _ref = GameObserver.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    GameObserver.NEXT_SCENE = 'next_scene';

    GameObserver.PREV_SCENE = 'prev_scene';

    GameObserver.START = 'start';

    window.GameObserver = GameObserver;

    return GameObserver;

  })(Observer);

  Game = (function() {
    function Game(game) {
      this.prevScene = __bind(this.prevScene, this);
      this.nextScene = __bind(this.nextScene, this);
      this.initialize(game);
    }

    Game.prototype = new createjs.EventDispatcher();

    Game.prototype.EventDispatcher_initialize = Game.prototype.initialize;

    Game.prototype.initialize = function(game) {
      this.observer = new GameObserver();
      return this.setHeader(game.header).setInstructions(game.instructions).setScore(game.score).setScenes(game.scenes);
    };

    Game.prototype.setHeader = function(header) {
      lib.mainContainer.insertBitmap('header', header, d2oda.stage.w / 2, 0, 'tc');
      TweenLite.from(lib.header, 0.5, {
        alpha: 0,
        y: lib.header.y - 20
      });
      return this;
    };

    Game.prototype.setInstructions = function(instructions) {
      lib.instructions = new Instructions(instructions);
      lib.mainContainer.add(lib.instructions, false);
      if (instructions.states.length > 1) {
        this.observer.subscribe(GameObserver.NEXT_SCENE, lib.instructions.next);
        this.observer.subscribe(GameObserver.PREV_SCENE, lib.instructions.prev);
      }
      return this;
    };

    Game.prototype.setScore = function(score) {
      lib.score = new Score(score);
      lib.mainContainer.add(lib.score);
      return this;
    };

    Game.prototype.setScenes = function(scenes) {
      lib.scenes = new SceneStack(scenes);
      lib.mainContainer.add(lib.scenes, false);
      this.observer.subscribe(GameObserver.NEXT_SCENE, lib.scenes.next);
      this.observer.subscribe(GameObserver.PREV_SCENE, lib.scenes.prev);
      return this;
    };

    Game.prototype.start = function() {
      lib.scene.init();
      return lib.scenes.addEventListener('complete', this.finish);
    };

    Game.prototype.finish = function() {
      return oda.endGame();
    };

    Game.prototype.nextScene = function() {
      return this.observer.notify(GameObserver.NEXT_SCENE);
    };

    Game.prototype.prevScene = function() {
      return this.observer.notify(GameObserver.PREV_SCENE);
    };

    window.Game = Game;

    return Game;

  })();

  /*
  
  COMPONENTS CLASSES
  */


  ComponentGroup = (function() {
    function ComponentGroup(opts) {
      Module.extend(this, d2oda.methods);
      this.name = opts.id;
      this.group = opts.group;
      this.current = 0;
      if (opts.invisible) {
        this.setInvisible(true, false);
      }
    }

    ComponentGroup.prototype.update = function(opts) {
      var item, _i, _j, _k, _l, _len, _len1, _len2, _len3, _ref1, _ref2, _ref3, _ref4, _results, _results1;
      switch (opts.type) {
        case 'blinkAll':
          _ref1 = this.group;
          _results = [];
          for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
            item = _ref1[_i];
            _results.push(lib[item].blink());
          }
          return _results;
          break;
        case 'pulseAll':
          _ref2 = this.group;
          _results1 = [];
          for (_j = 0, _len1 = _ref2.length; _j < _len1; _j++) {
            item = _ref2[_j];
            _results1.push(lib[item].pulse());
          }
          return _results1;
          break;
        case 'fadeIn':
          _ref3 = this.group;
          for (_k = 0, _len2 = _ref3.length; _k < _len2; _k++) {
            item = _ref3[_k];
            TweenMax.killTweensOf(lib[item]);
            TweenLite.killTweensOf(lib[item]);
            lib[item].alpha = 0;
            if (!opts.target) {
              lib[item].fadeOut();
            }
          }
          if (opts.target) {
            return lib[opts.target].fadeIn();
          }
          break;
        case 'fadeOut':
          _ref4 = this.group;
          for (_l = 0, _len3 = _ref4.length; _l < _len3; _l++) {
            item = _ref4[_l];
            TweenMax.killTweensOf(lib[item]);
            TweenLite.killTweensOf(lib[item]);
            lib[item].alpha = 1;
            if (!opts.target) {
              lib[item].fadeOut();
            }
          }
          if (opts.target) {
            return lib[opts.target].fadeOut();
          }
          break;
        case 'success':
          this.target = opts.targetGroup;
          this.next = opts.nextGroup;
          this.success = opts.success;
          lib[this.target].setInvisible();
          lib[this.next].setInvisible();
          return this.setInvisible(false);
        case 'choose':
          return this.setInvisible(false);
        case 'hide':
          return this.setInvisible();
      }
    };

    ComponentGroup.prototype.setInvisible = function(status, fade) {
      var item, _i, _j, _len, _len1, _ref1, _ref2, _results, _results1;
      if (status == null) {
        status = true;
      }
      if (fade == null) {
        fade = true;
      }
      if (status) {
        _ref1 = this.group;
        _results = [];
        for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
          item = _ref1[_i];
          if (fade) {
            _results.push(TweenLite.to(lib[item], 0.5, {
              alpha: 0
            }));
          } else {
            _results.push(lib[item].alpha = 0);
          }
        }
        return _results;
      } else {
        _ref2 = this.group;
        _results1 = [];
        for (_j = 0, _len1 = _ref2.length; _j < _len1; _j++) {
          item = _ref2[_j];
          if (fade) {
            _results1.push(TweenLite.to(lib[item], 0.5, {
              alpha: 1
            }));
          } else {
            _results1.push(lib[item].alpha = 1);
          }
        }
        return _results1;
      }
    };

    ComponentGroup.prototype.doSwitch = function() {
      lib[this.target].update({
        type: 'fadeIn',
        target: this.success
      });
      lib[this.next].setInvisible(false);
      return this.setInvisible();
    };

    ComponentGroup.prototype.doChoose = function(choosenone) {
      return this.choosen = choosenone;
    };

    ComponentGroup.prototype.isComplete = function() {
      return true;
    };

    window.ComponentGroup = ComponentGroup;

    return ComponentGroup;

  })();

  ComponentObserver = (function(_super) {
    __extends(ComponentObserver, _super);

    function ComponentObserver() {
      _ref1 = ComponentObserver.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    ComponentObserver.UPDATED = 'component_update';

    window.ComponentObserver = ComponentObserver;

    return ComponentObserver;

  })(Observer);

  Component = (function() {
    function Component() {}

    Component.prototype.next = function() {};

    Component.prototype.prev = function() {};

    Component.prototype.update = function() {};

    return Component;

  })();

  Score = (function(_super) {
    __extends(Score, _super);

    Score.prototype = new createjs.Container();

    Score.prototype.Container_initialize = Score.prototype.initialize;

    function Score(opts) {
      this.minusOne = __bind(this.minusOne, this);
      this.initialize(opts);
    }

    Score.prototype.initialize = function(opts) {
      var back, front;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = opts.x;
      this.y = opts.y;
      this.counter = opts.init;
      this.type = opts.type;
      switch (opts.type) {
        case 'points':
          this.block = false;
          front = this.createBitmap('front', opts.aimg, 0, 0);
          back = this.createBitmap('back', opts.bimg, 0, 0);
          this.count = this.createText('init', opts.init, '24px Quicksand', opts.acolor, 0, 0, 'center');
          this.total = this.createText('total', opts.total, '24px Quicksand', opts.bcolor, 0, 0, 'center');
          back.x = front.width / 4 * 2;
          back.y = front.height / 4 * 2;
          this.total.x = back.x + back.width / 2;
          this.total.y = back.y + back.height / 2 - this.total.getMeasuredHeight() / 2;
          this.count.x = front.x + front.width / 2;
          this.count.y = front.y + front.height / 2 - this.count.getMeasuredHeight() / 2;
          return this.addChild(back, front, this.count, this.total);
        case 'clock':
          front = this.createBitmap('front', opts.aimg, 0, 0);
          this.count = this.createText('init', opts.init, '24px Quicksand', opts.acolor, 0, 0, 'center');
          this.count.x = front.x + front.width / 2;
          this.count.y = front.y + front.height / 2 - this.count.getMeasuredHeight() / 2;
          return this.addChild(front, this.count);
      }
    };

    Score.prototype.start = function() {
      return this.interval = setInterval(this.minusOne, 1000);
    };

    Score.prototype.stop = function() {
      return clearInterval(this.interval);
    };

    Score.prototype.reset = function() {
      this.counter = 0;
      return this.updateCount(this.counter);
    };

    Score.prototype.minusOne = function() {
      this.counter--;
      this.updateCount(this.counter);
      if (this.counter === 0) {
        this.stop();
        return this.dispatchEvent({
          type: 'count_complete'
        });
      }
    };

    Score.prototype.plusOne = function() {
      createjs.Sound.play('s/good');
      if (this.block === true) {
        this.block = false;
        return;
      }
      this.counter++;
      return this.updateCount(this.counter);
    };

    Score.prototype.enableBlock = function() {
      return this.block = true;
    };

    Score.prototype.updateTotal = function(txt) {
      return this.total.text = txt;
    };

    Score.prototype.updateCount = function(txt) {
      return this.count.text = txt;
    };

    window.Score = Score;

    return Score;

  })(Component);

  Instructions = (function(_super) {
    __extends(Instructions, _super);

    Instructions.prototype = new createjs.Container();

    Instructions.prototype.Container_initialize = Instructions.prototype.initialize;

    function Instructions(opts) {
      this.instructionsComplete = __bind(this.instructionsComplete, this);
      this.prev = __bind(this.prev, this);
      this.next = __bind(this.next, this);
      this.initialize(opts);
    }

    Instructions.prototype.initialize = function(opts) {
      var triangle;
      this.Container_initialize();
      this.x = opts.x;
      this.y = opts.y;
      this.states = opts.states;
      this.playing = false;
      this.currentState = 0;
      triangle = new createjs.Shape();
      triangle.graphics.beginFill('#bcd748').moveTo(0, 0).lineTo(8, 5).lineTo(0, 10);
      triangle.y = 5;
      this.label = new createjs.Text(this.states[this.currentState].text, '16px Roboto', '#000');
      this.label.x = 14;
      this.addChild(triangle, this.label);
      return TweenLite.from(this, 0.5, {
        alpha: 0,
        x: this.x - 20
      });
    };

    Instructions.prototype.playSound = function() {
      var snd;
      if (!this.states[this.currentState].played) {
        this.playing = true;
        this.states[this.currentState].played = true;
        snd = createjs.Sound.play(this.states[this.currentState].sound);
        snd.addEventListener('complete', this.instructionsComplete);
        return snd;
      }
    };

    Instructions.prototype.next = function() {
      this.currentState++;
      if (this.states.length > 1 && this.currentState < this.states.length) {
        this.label.text = this.states[this.currentState].text;
        TweenLite.from(this, 0.5, {
          alpha: 0,
          x: this.x - 20
        });
        return this.playSound();
      }
    };

    Instructions.prototype.prev = function() {
      this.currentState--;
      if (this.currentState >= 0) {
        this.label.text = this.states[this.currentState].text;
        return TweenLite.from(this, 0.5, {
          alpha: 0,
          x: this.x - 20
        });
      } else {
        return this.currentState++;
      }
    };

    Instructions.prototype.instructionsComplete = function() {
      this.playing = false;
      return this.dispatchEvent({
        type: 'complete'
      });
    };

    window.Instructions = Instructions;

    return Instructions;

  })(Component);

  WriteContainer = (function(_super) {
    __extends(WriteContainer, _super);

    WriteContainer.prototype = new createjs.Container();

    WriteContainer.prototype.Container_initialize = WriteContainer.prototype.initialize;

    function WriteContainer(opts) {
      this.openPrompt = __bind(this.openPrompt, this);
      this.initialize(opts);
    }

    WriteContainer.prototype.initialize = function(opts) {
      var align, fcolor, font, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      this.x = opts.x;
      this.y = opts.y;
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      font = (_ref3 = opts.font) != null ? _ref3 : 'Arial 20px';
      fcolor = (_ref4 = opts.color) != null ? _ref4 : '#333';
      this.stroke = (_ref5 = opts.stroke) != null ? _ref5 : 3;
      this.scolor = (_ref6 = opts.scolor) != null ? _ref6 : '#333';
      this.bcolor = (_ref7 = opts.bcolor) != null ? _ref7 : '#FFF';
      align = (_ref8 = opts.align) != null ? _ref8 : '';
      this.mainText = this.createText('#{@name}_main', '', font, fcolor, 0, 0, align);
      this.pastText = this.createText('#{@name}_past', '', font, fcolor, 0, this.mainText.getMeasuredHeight() + opts.margin, align);
      this.pastText.text = '';
      this.back = new createjs.Shape();
      this.back.y = this.mainText.getMeasuredHeight() + opts.margin;
      this.add(this.back, false);
      this.add(this.pastText, false);
      this.add(this.mainText, false);
      return this.addEventListener('click', this.openPrompt);
    };

    WriteContainer.prototype.openPrompt = function() {
      var verb;
      verb = prompt("Enter the past simple form of " + this.mainText.text);
      this.pastText.text = verb;
      if (verb === this.success) {
        return this.complete = true;
      }
    };

    WriteContainer.prototype.update = function(opts) {
      this.pastText.text = opts.success;
      this.mainText.text = opts.text;
      this.success = opts.success;
      this.complete = false;
      this.back.graphics.c().f(this.bcolor).dr(0, 0, this.pastText.getMeasuredWidth(), this.pastText.getMeasuredHeight()).ss(this.stroke).s(this.scolor).mt(0, this.pastText.getMeasuredHeight()).lt(this.pastText.getMeasuredWidth(), this.pastText.getMeasuredHeight());
      this.back.x = -this.pastText.getMeasuredWidth() / 2;
      this.pastText.text = '';
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    WriteContainer.prototype.isComplete = function() {
      return true;
    };

    return WriteContainer;

  })(Component);

  ImageContainer = (function(_super) {
    __extends(ImageContainer, _super);

    ImageContainer.prototype = new createjs.Container();

    ImageContainer.prototype.Container_initialize = ImageContainer.prototype.initialize;

    function ImageContainer(opts) {
      this.initialize(opts);
    }

    ImageContainer.prototype.initialize = function(opts) {
      var align, b, _ref2, _ref3, _ref4, _ref5;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      align = (_ref2 = opts.align) != null ? _ref2 : '';
      this.name = (_ref3 = opts.name) != null ? _ref3 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.scaleX = (_ref4 = opts.scale) != null ? _ref4 : 1;
      this.scaleY = (_ref5 = opts.scale) != null ? _ref5 : 1;
      b = this.createBitmap(this.name, opts.id, 0, 0, align);
      this.width = b.width;
      this.height = b.height;
      this.mouseEnabled = true;
      return this.add(b, false);
    };

    ImageContainer.prototype.isComplete = function() {
      TweenLite.killTweensOf(this);
      TweenMax.killTweensOf(this);
      this.alpha = 1;
      return true;
    };

    return ImageContainer;

  })(Component);

  TextContainer = (function(_super) {
    __extends(TextContainer, _super);

    TextContainer.prototype = new createjs.Container();

    TextContainer.prototype.Container_initialize = TextContainer.prototype.initialize;

    function TextContainer(opts) {
      this.initialize(opts);
    }

    TextContainer.prototype.initialize = function(opts) {
      var align, fcolor, font, t, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      font = (_ref2 = opts.font) != null ? _ref2 : '20px Arial';
      fcolor = (_ref3 = opts.fcolor) != null ? _ref3 : '#333';
      align = (_ref4 = opts.align) != null ? _ref4 : '';
      this.name = (_ref5 = opts.name) != null ? _ref5 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.scaleX = (_ref6 = opts.scale) != null ? _ref6 : 1;
      this.scaleY = (_ref7 = opts.scale) != null ? _ref7 : 1;
      t = this.createText(this.name, opts.text, font, fcolor, 0, 0, align);
      if (opts.lineWidth) {
        t.lineWidth = opts.lineWidth;
      }
      this.width = t.getMeasuredWidth();
      this.height = t.getMeasuredHeight();
      this.mouseEnabled = true;
      return this.add(t, false);
    };

    TextContainer.prototype.isComplete = function() {
      TweenLite.killTweensOf(this);
      TweenMax.killTweensOf(this);
      this.alpha = 1;
      return true;
    };

    return TextContainer;

  })(Component);

  SpriteContainer = (function(_super) {
    __extends(SpriteContainer, _super);

    SpriteContainer.prototype = new createjs.Container();

    SpriteContainer.prototype.Container_initialize = SpriteContainer.prototype.initialize;

    function SpriteContainer(opts) {
      this.initialize(opts);
    }

    SpriteContainer.prototype.initialize = function(opts) {
      var align, _ref2, _ref3, _ref4, _ref5;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      align = (_ref2 = opts.align) != null ? _ref2 : '';
      this.name = (_ref3 = opts.name) != null ? _ref3 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.scaleX = (_ref4 = opts.scale) != null ? _ref4 : 1;
      this.scaleY = (_ref5 = opts.scale) != null ? _ref5 : 1;
      this.sprite = this.createSprite(this.name, opts.imgs, opts.frames, 0, 0, align);
      this.width = this.sprite.width;
      this.height = this.sprite.height;
      this.mouseEnabled = true;
      this.droptargets = new Array();
      this.observer = new ComponentObserver();
      return this.add(this.sprite, false);
    };

    SpriteContainer.prototype.prevFrame = function() {
      return this.sprite.currentFrame--;
    };

    SpriteContainer.prototype.nextFrame = function() {
      return this.sprite.currentFrame++;
    };

    SpriteContainer.prototype.nextStep = function() {
      if (this.storyboard.length > 0) {
        this.sprite.gotoAndStop(this.storyboard[this.sprite.currentFrame]);
        return TweenLite.from(this, 0.3, {
          alpha: 0
        });
      }
    };

    SpriteContainer.prototype.goto = function(frame) {
      return this.sprite.gotoAndStop(frame);
    };

    SpriteContainer.prototype.update = function(opts) {
      this.droptargets = [this.sprite];
      this.success = opts.success;
      this.storyboard = opts.storyboard;
      return this.observer.notify(ComponentObserver.UPDATED);
    };

    SpriteContainer.prototype.isComplete = function() {
      TweenLite.killTweensOf(this);
      TweenMax.killTweensOf(this);
      this.alpha = 1;
      return this.sprite.currentFrame > 0;
    };

    return SpriteContainer;

  })(Component);

  DragContainer = (function(_super) {
    __extends(DragContainer, _super);

    DragContainer.prototype = new createjs.Container();

    DragContainer.prototype.Container_initialize = DragContainer.prototype.initialize;

    function DragContainer(opts) {
      this.evaluateDrop = __bind(this.evaluateDrop, this);
      this.handleMouseDown = __bind(this.handleMouseDown, this);
      this.update = __bind(this.update, this);
      this.initialize(opts);
    }

    DragContainer.prototype.initialize = function(opts) {
      var b, t, _i, _len, _ref2, _ref3;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      Module.extend(this, d2oda.utilities);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.pos = {
        x: this.x,
        y: this.y
      };
      this.index = opts.index;
      this["eval"] = opts["eval"];
      this.droptargets = new Array();
      b = this.createBitmap(this.name, opts.id, 0, 0);
      this.bmpname = opts.name;
      this.bmpid = opts.id;
      this.width = b.width;
      this.height = b.height;
      this.setPosition(opts.align);
      switch (opts.afterSuccess) {
        case 'hide':
          this.afterSuccess = this.hide;
          break;
        case 'inplace':
          this.afterSuccess = this.putInPlace;
          break;
        case 'return':
          this.afterSuccess = this.returnToPlace;
          break;
        case 'origin':
          this.afterSuccess = this.setInOrigin;
      }
      switch (opts.afterFail) {
        case 'hide':
          this.afterFail = this.hide;
          break;
        case 'inplace':
          this.afterSuccess = this.putInPlace;
          break;
        case 'return':
          this.afterFail = this.returnToPlace;
          break;
        case 'origin':
          this.afterFail = this.setInOrigin;
      }
      this.add(b, false);
      if (this.isArray(opts.target)) {
        this.target = opts.target;
      } else {
        this.target = lib[opts.target];
      }
      if (this.target) {
        if (this.isArray(this.target)) {
          _ref3 = this.target;
          for (_i = 0, _len = _ref3.length; _i < _len; _i++) {
            t = _ref3[_i];
            lib[t].observer.subscribe(ComponentObserver.UPDATED, this.update);
          }
        } else {
          this.target.observer.subscribe(ComponentObserver.UPDATED, this.update);
        }
      }
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    DragContainer.prototype.update = function(opts) {
      var alldrops, t, _i, _len, _ref2;
      if (this.isArray(this.target)) {
        alldrops = new Array();
        _ref2 = this.target;
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          t = _ref2[_i];
          alldrops.merge(lib[t].droptargets);
        }
        return this.droptargets = alldrops;
      } else {
        return this.droptargets = this.target.droptargets;
      }
    };

    DragContainer.prototype.handleMouseDown = function(e) {
      var offset, posX, posY,
        _this = this;
      posX = e.stageX / d2oda.stage.r;
      posY = e.stageY / d2oda.stage.r;
      offset = {
        x: posX - this.x,
        y: posY - this.y
      };
      this.x = posX - offset.x;
      this.y = posY - offset.y;
      e.addEventListener('mousemove', function(ev) {
        posX = ev.stageX / d2oda.stage.r;
        posY = ev.stageY / d2oda.stage.r;
        _this.x = posX - offset.x;
        _this.y = posY - offset.y;
        return false;
      });
      e.addEventListener('mouseup', function(ev) {
        if (_this.droptargets && _this.droptargets.length > 0) {
          _this.evaluateDrop(e);
        } else {
          _this.dispatchEvent({
            type: 'drop'
          });
        }
        return false;
      });
      return false;
    };

    DragContainer.prototype.evaluateDrop = function(e) {
      var drop, dropped, pt, target, _i, _len, _ref2;
      target = null;
      dropped = false;
      _ref2 = this.droptargets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        drop = _ref2[_i];
        pt = drop.globalToLocal(oda.stage.mouseX, oda.stage.mouseY);
        if (drop.hitTest(pt.x, pt.y)) {
          target = drop;
          dropped = true;
        }
      }
      if (dropped) {
        d2oda.evaluator.evaluate(this["eval"], this.name, target);
        return this.dispatchEvent({
          type: 'dropped',
          drop: target
        });
      } else {
        return this.returnToPlace(this.alpha, this.scaleX, this.scaleY);
      }
    };

    return DragContainer;

  })(Component);

  ButtonContainer = (function(_super) {
    __extends(ButtonContainer, _super);

    ButtonContainer.prototype = new createjs.Container();

    ButtonContainer.prototype.Container_initialize = ButtonContainer.prototype.initialize;

    function ButtonContainer(opts) {
      this.initialize(opts);
    }

    ButtonContainer.prototype.initialize = function(opts) {
      var _ref2, _ref3,
        _this = this;
      this.Container_initialize();
      Module.extend(this, d2oda.actions);
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.utilities);
      this.x = opts.x;
      this.y = opts.y;
      this.index = opts.index;
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.scale = (_ref3 = opts.scale) != null ? _ref3 : 1;
      this.states = opts.states;
      this.currentState = 0;
      this.setImageText(this.states[this.currentState].img, this.states[this.currentState].txt);
      if (this.isArray(opts.target)) {
        this.target = opts.target;
      } else {
        this.target = lib[opts.target];
      }
      if (opts.target) {
        this.target = lib[opts.target];
      }
      this.addEventListener('mouseover', function() {
        return TweenLite.to(_this, 0.5, {
          scaleX: 1.2,
          scaleY: 1.2
        });
      });
      this.addEventListener('mouseout', function() {
        return TweenLite.to(_this, 0.5, {
          scaleX: _this.scale,
          scaleY: _this.scale
        });
      });
      return this.addEventListener('click', function() {
        if (opts.isRepeat) {
          return d2oda.evaluator.evaluate('repeat');
        } else if (opts.isFinish) {
          return d2oda.evaluator.evaluate('finish', null, opts.target);
        } else {
          return d2oda.evaluator.evaluate(opts["eval"], _this.name, opts.target);
        }
      });
    };

    ButtonContainer.prototype.setImageText = function(img, txt) {
      var align, b, color, font, hit, t, text, x, y, _ref10, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
      this.removeAllChildren();
      this.alpha = 1;
      if (img) {
        x = (_ref2 = img.x) != null ? _ref2 : 0;
        y = (_ref3 = img.y) != null ? _ref3 : 0;
        align = (_ref4 = img.align) != null ? _ref4 : '';
        b = this.createBitmap('img', img.name, x, y, align);
        if (img.scale) {
          b.scaleX = b.scaleY = img.scale;
        }
        this.add(b, false);
      }
      if (txt) {
        text = (_ref5 = txt.text) != null ? _ref5 : '';
        font = (_ref6 = txt.font) != null ? _ref6 : '20px Arial';
        color = (_ref7 = txt.color) != null ? _ref7 : '#333';
        x = (_ref8 = txt.x) != null ? _ref8 : 0;
        y = (_ref9 = txt.y) != null ? _ref9 : 0;
        align = (_ref10 = txt.align) != null ? _ref10 : '';
        t = this.createText('txt', text, font, color, x, y, align);
        if (txt.lineWidth) {
          t.lineWidth = txt.lineWidth;
        }
        hit = new createjs.Shape();
        hit.graphics.beginFill('#000').drawRect(-5, -3, t.getMeasuredWidth() + 10, t.getMeasuredHeight() + 6);
        t.hitArea = hit;
        return this.add(t, false);
      }
    };

    ButtonContainer.prototype.updateState = function() {
      this.currentState++;
      if (this.currentState < this.states.length) {
        TweenLite.killTweensOf(this);
        this.setImageText(this.states[this.currentState].img, this.states[this.currentState].txt);
        this.scaleX = this.scaleY = this.scale;
        if (this.states[this.currentState].removeListeners) {
          this.removeAllEventListeners();
        }
        return TweenLite.from(this, 0.3, {
          alpha: 0
        });
      } else {
        return this.currentState--;
      }
    };

    ButtonContainer.prototype.update = function(opts) {
      TweenLite.killTweensOf(this);
      this.setImageText(opts.img, opts.txt);
      return TweenLite.from(this, 0.5, {
        alpha: 0
      });
    };

    ButtonContainer.prototype.isComplete = function() {
      return true;
    };

    return ButtonContainer;

  })(Component);

  ChooseContainer = (function(_super) {
    __extends(ChooseContainer, _super);

    ChooseContainer.prototype = new createjs.Container();

    ChooseContainer.prototype.Container_initialize = ChooseContainer.prototype.initialize;

    function ChooseContainer(opts) {
      this.initialize(opts);
    }

    ChooseContainer.prototype.initialize = function(opts) {
      var _ref2;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = opts.x;
      this.y = opts.y;
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.target = opts.target;
      this["eval"] = opts["eval"];
      this.label = opts.label;
      this.caption = opts.caption;
      return this.bullets = opts.bullets;
    };

    ChooseContainer.prototype.update = function(opts) {
      var bmp, hito1, hito2, lineWidth, opt1, opt2,
        _this = this;
      this.removeAllChildren();
      switch (opts.type) {
        case 'img':
          opt1 = this.createBitmap("" + this.name + "_opt1", opts.opt1, 0, 100, 'tr');
          opt1.index = 1;
          opt2 = this.createBitmap("" + this.name + "_opt2", opts.opt2, 0, 100);
          opt2.index = 2;
          break;
        case 'txt':
          if (opts.img) {
            bmp = this.insertBitmap("" + this.name + "_img", opts.img.name, opts.img.x, opts.img.y, 'tc');
            if (opts.img.scale) {
              bmp.scaleY = bmp.scaleX = opts.img.scale;
            }
          }
          lineWidth = this.bullets.lineWidth ? this.bullets.lineWidth : 200;
          this.insertText("separator", '/', this.bullets.font, this.bullets.color, 0, 400, 'center');
          opt1 = this.createText("" + this.name + "_opt1", opts.opt1, this.bullets.font, this.bullets.color, -20, 400, 'right');
          if (this.bullets.lineWidth) {
            opt1.lineWidth = this.bullets.lineWidth;
          }
          hito1 = new createjs.Shape();
          hito1.graphics.beginFill('#000').drawRect(-opt1.getMeasuredWidth() - 5, -3, opt1.getMeasuredWidth() + 10, opt1.getMeasuredHeight() + 6);
          opt1.hitArea = hito1;
          opt1.index = 1;
          opt2 = this.createText("" + this.name + "_opt2", opts.opt2, this.bullets.font, this.bullets.color, 20, 400, 'left');
          if (this.bullets.lineWidth) {
            opt2.lineWidth = this.bullets.lineWidth;
          }
          hito2 = new createjs.Shape();
          hito2.graphics.beginFill('#000').drawRect(-5, -3, opt2.getMeasuredWidth() + 10, opt2.getMeasuredHeight() + 6);
          opt2.hitArea = hito2;
          opt2.index = 2;
      }
      this.add(opt1);
      opt1.addEventListener('mouseover', function() {
        return TweenLite.to(opt1, 0.5, {
          alpha: 0.5
        });
      });
      opt1.addEventListener('mouseout', function() {
        return TweenLite.to(opt1, 0.5, {
          alpha: 1
        });
      });
      opt1.addEventListener('click', function() {
        return d2oda.evaluator.evaluate(_this["eval"], "" + _this.name + "_opt1", _this.target);
      });
      this.add(opt2);
      opt2.addEventListener('mouseover', function() {
        return TweenLite.to(opt2, 0.5, {
          alpha: 0.5
        });
      });
      opt2.addEventListener('mouseout', function() {
        return TweenLite.to(opt2, 0.5, {
          alpha: 1
        });
      });
      opt2.addEventListener('click', function() {
        return d2oda.evaluator.evaluate(_this["eval"], "" + _this.name + "_opt2", _this.target);
      });
      if (opts.label) {
        this.insertText("" + this.name + "_label", opts.label, this.label.font, this.label.color, 0, 40, 'center');
      }
      if (opts.caption) {
        this.insertText("" + this.name + "_caption", opts.caption, this.caption.font, this.caption.color, 0, 360, 'center');
      }
      return TweenLite.from(this, 0.5, {
        alpha: 0
      });
    };

    ChooseContainer.prototype.isComplete = function() {
      return true;
    };

    return ChooseContainer;

  })(Component);

  LabelContainer = (function(_super) {
    __extends(LabelContainer, _super);

    LabelContainer.prototype = new createjs.Container();

    LabelContainer.prototype.Container_initialize = LabelContainer.prototype.initialize;

    function LabelContainer(opts) {
      this.initialize(opts);
    }

    LabelContainer.prototype.initialize = function(opts) {
      var align, color, font, _ref2, _ref3, _ref4, _ref5;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = opts.x;
      this.y = opts.y;
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      font = (_ref3 = opts.font) != null ? _ref3 : 'Arial 20px';
      color = (_ref4 = opts.color) != null ? _ref4 : '#333';
      align = (_ref5 = opts.align) != null ? _ref5 : '';
      this.text = this.createText('txt', '', font, color, 0, 0, align);
      return this.add(this.text, false);
    };

    LabelContainer.prototype.update = function(opts) {
      this.text.text = opts.text;
      this.success = opts.success;
      this.complete = false;
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    LabelContainer.prototype.isComplete = function() {
      return this.complete;
    };

    return LabelContainer;

  })(Component);

  CloneCompleterContainer = (function(_super) {
    __extends(CloneCompleterContainer, _super);

    CloneCompleterContainer.prototype = new createjs.Container();

    CloneCompleterContainer.prototype.Container_initialize = CloneCompleterContainer.prototype.initialize;

    function CloneCompleterContainer(opts) {
      this.initialize(opts);
    }

    CloneCompleterContainer.prototype.initialize = function(opts) {
      var _ref2, _ref3, _ref4, _ref5, _ref6;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = (_ref3 = opts.x) != null ? _ref3 : 0;
      this.y = (_ref4 = opts.y) != null ? _ref4 : 0;
      this.uwidth = (_ref5 = opts.uwidth) != null ? _ref5 : 100;
      this.uheight = (_ref6 = opts.uheight) != null ? _ref6 : 100;
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    CloneCompleterContainer.prototype.update = function(opts) {
      var c, child, gropts, i, npos, _i, _len, _ref2;
      this.removeAllChildren();
      i = 0;
      npos = 0;
      _ref2 = opts.containers;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        c = _ref2[_i];
        if (c.opts) {
          gropts = c.opts;
        } else {
          gropts = opts;
        }
        child = new CloneContainer(gropts, c.type, c.success, c.x, c.y, this.uwidth, this.uheight);
        this.droptargets.push(child);
        this.add(child, false);
      }
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    CloneCompleterContainer.prototype.isComplete = function() {
      return true;
    };

    return CloneCompleterContainer;

  })(Component);

  CloneContainer = (function(_super) {
    __extends(CloneContainer, _super);

    CloneContainer.prototype = new createjs.Container();

    CloneContainer.prototype.Container_initialize = CloneContainer.prototype.initialize;

    function CloneContainer(opts, type, success, x, y, width, height) {
      this.initialize(opts, type, success, x, y, width, height);
    }

    CloneContainer.prototype.initialize = function(opts, type, success, x, y, width, height) {
      var child, _ref2;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = x != null ? x : 0;
      this.y = y != null ? y : 0;
      this.width = width;
      this.height = height;
      this.success = success;
      this.complete = this.success !== '#empty' ? false : true;
      this.img = null;
      child = new createjs.Shape();
      child.graphics.beginFill('#FFF').drawRect(0, 0, this.width, this.height);
      child.alpha = 0.1;
      return this.add(child, false);
    };

    CloneContainer.prototype.showEvaluation = function() {
      if (this.complete) {
        return this.insertBitmap('correct', 'correct', this.width, this.height / 2, 'ml');
      } else {
        return this.insertBitmap('wrong', 'wrong', this.width, this.height / 2, 'ml');
      }
    };

    CloneContainer.prototype.update = function(complete, img) {
      if (complete == null) {
        complete = true;
      }
      if (img == null) {
        img = '';
      }
      if (this.img !== null) {
        this.removeChild(this.img);
      }
      this.img = this.createBitmap('img', img, this.width / 2, this.height / 2, 'mc');
      this.img.scaleX = this.img.scaleY = (this.height - 5) / this.img.height;
      this.add(this.img, false);
      return this.complete = complete;
    };

    return CloneContainer;

  })(Component);

  StepsContainer = (function(_super) {
    __extends(StepsContainer, _super);

    StepsContainer.prototype = new createjs.Container();

    StepsContainer.prototype.Container_initialize = StepsContainer.prototype.initialize;

    function StepsContainer(opts) {
      this.initialize(opts);
    }

    StepsContainer.prototype.initialize = function(opts) {
      var _ref2, _ref3, _ref4;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = (_ref3 = opts.x) != null ? _ref3 : 0;
      this.y = (_ref4 = opts.y) != null ? _ref4 : 0;
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    StepsContainer.prototype.update = function(opts) {
      var c, child, gropts, i, npos, _i, _len, _ref2;
      this.removeAllChildren();
      i = 0;
      npos = 0;
      _ref2 = opts.containers;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        c = _ref2[_i];
        if (c.opts) {
          gropts = c.opts;
        } else {
          gropts = opts;
        }
        child = new StepContainer(gropts, c.type, c.success, c.x, c.y);
        this.droptargets.push(child);
        this.add(child, false);
      }
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    StepsContainer.prototype.isComplete = function() {
      return true;
    };

    return StepsContainer;

  })(Component);

  StepContainer = (function(_super) {
    __extends(StepContainer, _super);

    StepContainer.prototype = new createjs.Container();

    StepContainer.prototype.Container_initialize = StepContainer.prototype.initialize;

    function StepContainer(opts, type, success, x, y) {
      this.initialize(opts, type, success, x, y);
    }

    StepContainer.prototype.initialize = function(opts, type, success, x, y) {
      var child, _ref2, _ref3;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = x != null ? x : 0;
      this.y = y != null ? y : 0;
      this.width = (_ref2 = opts.width) != null ? _ref2 : opts.radius;
      this.height = (_ref3 = opts.height) != null ? _ref3 : opts.radius;
      this.success = success;
      this.complete = false;
      switch (type) {
        case 'rshp':
          child = new createjs.Shape();
          child.graphics.beginFill(opts.bcolor).setStrokeStyle(opts.stroke).beginStroke(opts.scolor).drawRoundRect(0, 0, opts.width, opts.height, opts.radius);
      }
      return this.add(child, false);
    };

    StepContainer.prototype.showEvaluation = function() {
      if (this.complete) {
        return this.insertBitmap('correct', 'correct', this.width, this.height / 2, 'ml');
      } else {
        return this.insertBitmap('wrong', 'wrong', this.width, this.height / 2, 'ml');
      }
    };

    StepContainer.prototype.update = function(complete) {
      if (complete == null) {
        complete = true;
      }
      return this.complete = complete;
    };

    return StepContainer;

  })(Component);

  GridContainer = (function(_super) {
    __extends(GridContainer, _super);

    GridContainer.prototype = new createjs.Container();

    GridContainer.prototype.Container_initialize = GridContainer.prototype.initialize;

    function GridContainer(opts) {
      this.initialize(opts);
    }

    GridContainer.prototype.initialize = function(opts) {
      var align, b, cell, color, currentCol, currentRow, font, x, y, _i, _len, _ref10, _ref11, _ref12, _ref13, _ref14, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9, _results;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.utilities);
      this.x = (_ref2 = opts.x) != null ? _ref2 : 0;
      this.y = (_ref3 = opts.y) != null ? _ref3 : 0;
      this.columns = (_ref4 = opts.columns) != null ? _ref4 : 1;
      this.rows = (_ref5 = opts.rows) != null ? _ref5 : 1;
      this.uwidth = (_ref6 = opts.uwidth) != null ? _ref6 : 100;
      this.uheight = (_ref7 = opts.uheight) != null ? _ref7 : 100;
      this.name = (_ref8 = opts.name) != null ? _ref8 : opts.id;
      this.currentTarget = 0;
      this.warnings = 0;
      this.targets = new Array();
      if (opts.label) {
        font = (_ref9 = opts.label.font) != null ? _ref9 : 'Arial 20px';
        color = (_ref10 = opts.label.color) != null ? _ref10 : '#333';
        align = (_ref11 = opts.label.align) != null ? _ref11 : '';
        x = (_ref12 = opts.label.x) != null ? _ref12 : 0;
        y = (_ref13 = opts.label.y) != null ? _ref13 : 0;
        this.text = this.createText('txt', '', font, color, x, y, align);
        this.add(this.text);
      }
      this.cells = opts.mixed ? this.shuffle(opts.cells) : opts.cells;
      switch (opts.align) {
        case 'evenodd':
          currentCol = 0;
          currentRow = 0;
          _ref14 = this.cells;
          _results = [];
          for (_i = 0, _len = _ref14.length; _i < _len; _i++) {
            cell = _ref14[_i];
            if (currentRow % 2 === 0) {
              x = currentCol * this.uwidth;
            } else {
              x = ((this.columns - 1) - currentCol) * this.uwidth;
            }
            b = this.insertBitmap(cell.img, cell.img, x, currentRow * this.uheight, 'mc');
            this.targets.push(b);
            currentCol++;
            if (currentCol === this.columns) {
              currentCol = 0;
              _results.push(currentRow++);
            } else {
              _results.push(void 0);
            }
          }
          return _results;
      }
    };

    GridContainer.prototype.update = function(opts) {
      var cell;
      cell = this.cells[this.currentTarget];
      this.success = cell.success;
      this.text.text = cell.txt;
      this.targets[this.currentTarget].complete = false;
      this.blink(this.targets[this.currentTarget]);
      return TweenLite.from(this.text, 0.3, {
        alpha: 0,
        y: this.text.y - 10
      });
    };

    GridContainer.prototype.fadeOut = function(obj) {
      TweenMax.killTweensOf(obj);
      TweenLite.killTweensOf(obj);
      return TweenLite.to(obj, 0.5, {
        alpha: 0,
        y: obj.y - 20
      });
    };

    GridContainer.prototype.blink = function(obj, state) {
      var objalpha;
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      objalpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: 0.2,
          repeat: -1,
          yoyo: true
        });
      }
    };

    GridContainer.prototype.isComplete = function() {
      var target, _i, _len, _ref2;
      _ref2 = this.targets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        target = _ref2[_i];
        if (target.complete === false) {
          return false;
        }
      }
      return true;
    };

    return GridContainer;

  })(Component);

  PhraseCompleterContainer = (function(_super) {
    __extends(PhraseCompleterContainer, _super);

    PhraseCompleterContainer.prototype = new createjs.Container();

    PhraseCompleterContainer.prototype.Container_initialize = PhraseCompleterContainer.prototype.initialize;

    function PhraseCompleterContainer(opts) {
      this.initialize(opts);
    }

    PhraseCompleterContainer.prototype.initialize = function(opts) {
      var _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
      this.Container_initialize();
      Module.extend(this, d2oda.actions);
      Module.extend(this, d2oda.methods);
      this.x = opts.x;
      this.y = opts.y;
      this.margin = (_ref2 = opts.margin) != null ? _ref2 : 10;
      this.font = (_ref3 = opts.font) != null ? _ref3 : '20px Arial';
      this.fcolor = (_ref4 = opts.fcolor) != null ? _ref4 : '#333';
      this.bcolor = (_ref5 = opts.bcolor) != null ? _ref5 : '#FFF';
      this.scolor = (_ref6 = opts.scolor) != null ? _ref6 : '#333';
      this.stroke = (_ref7 = opts.stroke) != null ? _ref7 : 3;
      this.name = (_ref8 = opts.name) != null ? _ref8 : opts.id;
      this.align = (_ref9 = opts.align) != null ? _ref9 : '';
      this.currentTarget = 0;
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    PhraseCompleterContainer.prototype.update = function(opts) {
      var align, h, h2, i, maxWidth, npos, t, txt, ypos, _i, _len, _ref2, _ref3;
      this.removeAllChildren();
      if (opts.h2) {
        align = (_ref2 = opts.h2.align) != null ? _ref2 : '';
        h2 = this.createText('h2', opts.h2.text, this.font, this.color, opts.h2.x, opts.h2.y, align);
        this.add(h2, false);
      }
      if (opts.nextGroup) {
        this.nextGroup = opts.nextGroup;
      }
      i = 0;
      npos = 0;
      ypos = -5;
      maxWidth = 0;
      _ref3 = opts.pattern;
      for (_i = 0, _len = _ref3.length; _i < _len; _i++) {
        t = _ref3[_i];
        if (t === '#tcpt') {
          txt = opts.targets[i];
          h = new TextCompleterContainer(txt, this.font, this.fcolor, this.bcolor, this.scolor, this.stroke, npos, ypos);
          this.droptargets.push(h);
          this.add(h, false);
          maxWidth = npos += h.width + this.margin;
          i++;
        } else if (t === '#rtn') {
          h = this.createText('txt', 'BLANK', this.font, this.fcolor, npos, 0);
          if (npos > maxWidth) {
            maxWidth = npos;
          }
          npos = 0;
          ypos += h.getMeasuredHeight();
        } else {
          h = this.createText('txt', t, this.font, this.fcolor, npos, ypos);
          this.add(h, false);
          maxWidth = npos += h.getMeasuredWidth() + this.margin;
        }
      }
      this.width = maxWidth;
      this.setPosition(this.align);
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    PhraseCompleterContainer.prototype.isComplete = function() {
      var target, _i, _len, _ref2;
      _ref2 = this.droptargets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        target = _ref2[_i];
        if (target.complete === false) {
          return false;
        }
      }
      return true;
    };

    return PhraseCompleterContainer;

  })(Component);

  PhraseCloneContainer = (function(_super) {
    __extends(PhraseCloneContainer, _super);

    PhraseCloneContainer.prototype = new createjs.Container();

    PhraseCloneContainer.prototype.Container_initialize = PhraseCloneContainer.prototype.initialize;

    function PhraseCloneContainer(opts) {
      this.initialize(opts);
    }

    PhraseCloneContainer.prototype.initialize = function(opts) {
      var _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = opts.x;
      this.y = opts.y;
      this.margin = (_ref2 = opts.margin) != null ? _ref2 : 10;
      this.font = (_ref3 = opts.font) != null ? _ref3 : '20px Arial';
      this.fcolor = (_ref4 = opts.fcolor) != null ? _ref4 : '#333';
      this.bcolor = (_ref5 = opts.bcolor) != null ? _ref5 : '#FFF';
      this.scolor = (_ref6 = opts.scolor) != null ? _ref6 : '#333';
      this.stroke = (_ref7 = opts.stroke) != null ? _ref7 : 3;
      this.name = (_ref8 = opts.name) != null ? _ref8 : opts.id;
      this.align = (_ref9 = opts.align) != null ? _ref9 : '';
      this.currentTarget = 0;
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    PhraseCloneContainer.prototype.update = function(opts) {
      var align, h, h2, i, npos, t, txt, _i, _len, _ref2, _ref3;
      this.removeAllChildren();
      if (opts.h2) {
        align = (_ref2 = opts.h2.align) != null ? _ref2 : '';
        h2 = this.createText('h2', opts.h2.text, this.font, this.color, opts.h2.x, opts.h2.y, align);
        this.add(h2, false);
      }
      i = 0;
      npos = 0;
      _ref3 = opts.pattern;
      for (_i = 0, _len = _ref3.length; _i < _len; _i++) {
        t = _ref3[_i];
        if (t === '#tcpt') {
          txt = opts.targets[i];
          h = new TextCloneContainer(txt, this.font, this.fcolor, this.bcolor, this.scolor, this.stroke, npos, -5);
          this.droptargets.push(h);
          this.add(h, false);
          npos += h.width + this.margin;
          i++;
        } else {
          h = this.createText('txt', t, this.font, this.fcolor, npos, -5);
          this.add(h, false);
          npos += h.getMeasuredWidth() + this.margin;
        }
      }
      this.width = npos;
      this.setPosition(this.align);
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    PhraseCloneContainer.prototype.isComplete = function() {
      return true;
    };

    return PhraseCloneContainer;

  })(Component);

  TextCloneContainer = (function(_super) {
    __extends(TextCloneContainer, _super);

    TextCloneContainer.prototype = new createjs.Container();

    TextCloneContainer.prototype.Container_initialize = TextCloneContainer.prototype.initialize;

    function TextCloneContainer(opts, font, fcolor, bcolor, scolor, stroke, x, y) {
      this.initialize(opts, font, fcolor, bcolor, scolor, stroke, x, y);
    }

    TextCloneContainer.prototype.initialize = function(opts, font, fcolor, bcolor, scolor, stroke, x, y) {
      var _ref2, _ref3, _ref4;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = x;
      this.y = y;
      this.success = (_ref2 = opts.success) != null ? _ref2 : opts.text;
      this.text = this.createText('txt', opts.text, font, fcolor, 0, -5);
      this.width = (_ref3 = opts.width) != null ? _ref3 : this.text.getMeasuredWidth();
      this.height = (_ref4 = opts.height) != null ? _ref4 : this.text.getMeasuredHeight();
      this.complete = false;
      this.back = new createjs.Shape();
      this.back.graphics.f(bcolor).dr(0, 0, this.width, this.height).ss(stroke).s(scolor).mt(0, this.height).lt(this.width, this.height);
      this.add(this.back, false);
      this.add(this.text, false);
      return this.text.text = '';
    };

    TextCloneContainer.prototype.setRectOutline = function(bcolor, stroke, scolor) {
      return this.back.graphics.f(bcolor).ss(stroke).s(scolor).dr(0, 0, this.width, this.height);
    };

    TextCloneContainer.prototype.showEvaluation = function() {
      if (this.complete) {
        return this.insertBitmap('correct', 'correct', this.width, this.height / 2, 'ml');
      } else {
        return this.insertBitmap('wrong', 'wrong', this.width, this.height / 2, 'ml');
      }
    };

    TextCloneContainer.prototype.update = function(text, complete) {
      if (complete == null) {
        complete = true;
      }
      this.complete = complete;
      this.text.text = text;
      this.text.textAlign = 'center';
      this.text.x = this.width / 2;
      return TweenLite.from(this, 0.3, {
        alpha: 0
      });
    };

    return TextCloneContainer;

  })(Component);

  WordSearchContainer = (function(_super) {
    __extends(WordSearchContainer, _super);

    WordSearchContainer.prototype = new createjs.Container();

    WordSearchContainer.prototype.Container_initialize = WordSearchContainer.prototype.initialize;

    function WordSearchContainer(opts) {
      this.initialize(opts);
    }

    WordSearchContainer.prototype.initialize = function(opts) {
      var _ref10, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9,
        _this = this;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.font = (_ref3 = opts.font) != null ? _ref3 : '20px Arial';
      this.fcolor = (_ref4 = opts.fcolor) != null ? _ref4 : '#333';
      this.bcolor = (_ref5 = opts.bcolor) != null ? _ref5 : '#FFF';
      this.shcolor = (_ref6 = opts.shcolor) != null ? _ref6 : '#F00';
      this.shape = (_ref7 = opts.shape) != null ? _ref7 : 'rect';
      this.uwidth = (_ref8 = opts.uwidth) != null ? _ref8 : 100;
      this.uheight = (_ref9 = opts.uheight) != null ? _ref9 : 100;
      this.radius = (_ref10 = opts.radius) != null ? _ref10 : 0;
      this.allComplete = false;
      this.observer = new ComponentObserver();
      this.droptargets = new Array();
      this.path = new Array();
      return this.addEventListener('mousedown', function(e) {
        _this.path = new Array();
        _this.getLetterContainer();
        e.addEventListener('mousemove', function(ev) {
          return _this.getLetterContainer();
        });
        e.addEventListener('mouseup', function(ev) {
          var coord, found, foundAWord, key, lcoords, ltc, unames, upath, wcoords, word, _i, _j, _k, _len, _len1, _ref11, _ref12;
          found = false;
          upath = _this.path.unique();
          unames = (function() {
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = upath.length; _i < _len; _i++) {
              coord = upath[_i];
              _results.push(coord.name);
            }
            return _results;
          })();
          unames.sort();
          _ref11 = _this.words;
          for (_i = 0, _len = _ref11.length; _i < _len; _i++) {
            word = _ref11[_i];
            if (word.enabled) {
              lcoords = new Array();
              wcoords = word.coords.sort();
              for (key = _j = 0, _ref12 = wcoords.length; 0 <= _ref12 ? _j < _ref12 : _j > _ref12; key = 0 <= _ref12 ? ++_j : --_j) {
                lcoords[key] = "l" + wcoords[key];
              }
              foundAWord = lcoords.compare(unames);
              if (foundAWord) {
                found = true;
                word.complete = true;
                if (word.fx) {
                  lib[word.target][word.fx]();
                } else {
                  lib[word.target].fadeOut();
                }
                lib.scene.success();
              }
            }
          }
          if (!found) {
            for (_k = 0, _len1 = upath.length; _k < _len1; _k++) {
              ltc = upath[_k];
              ltc.showShape(false);
            }
            return lib.scene.fail();
          }
        });
        return false;
      });
    };

    WordSearchContainer.prototype.getLetterContainer = function() {
      var ltc, oup, pt;
      pt = this.globalToLocal(oda.stage.mouseX, oda.stage.mouseY);
      oup = this.getObjectUnderPoint(pt.x, pt.y);
      ltc = oup.parent;
      if (ltc && ltc instanceof LetterContainer) {
        ltc.showShape();
        return this.path.push(ltc);
      }
    };

    WordSearchContainer.prototype.update = function(opts) {
      var column, i, j, olc, row, _i, _j, _len, _len1, _ref2;
      this.removeAllChildren();
      this.words = opts.words;
      i = 0;
      j = 0;
      _ref2 = opts.matrix;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        row = _ref2[_i];
        for (_j = 0, _len1 = row.length; _j < _len1; _j++) {
          column = row[_j];
          olc = new LetterContainer({
            text: column,
            width: this.uwidth,
            height: this.uheight,
            radius: this.radius
          }, this.font, this.fcolor, this.bcolor, this.shcolor, this.shape, j * this.uwidth, i * this.uheight);
          olc.name = "l" + j + "_" + i;
          this.add(olc);
          this.droptargets.push(olc);
          j++;
        }
        j = 0;
        i++;
      }
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    WordSearchContainer.prototype.isComplete = function() {
      var word, _i, _len, _ref2;
      _ref2 = this.words;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        word = _ref2[_i];
        if (word.complete === false) {
          false;
        }
      }
      return true;
    };

    return WordSearchContainer;

  })(Component);

  CrossWordsContainer = (function(_super) {
    __extends(CrossWordsContainer, _super);

    CrossWordsContainer.prototype = new createjs.Container();

    CrossWordsContainer.prototype.Container_initialize = CrossWordsContainer.prototype.initialize;

    function CrossWordsContainer(opts) {
      this.initialize(opts);
    }

    CrossWordsContainer.prototype.initialize = function(opts) {
      var _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.font = (_ref3 = opts.font) != null ? _ref3 : '20px Arial';
      this.fcolor = (_ref4 = opts.fcolor) != null ? _ref4 : '#333';
      this.bcolor = (_ref5 = opts.bcolor) != null ? _ref5 : '#FFF';
      this.stroke = (_ref6 = opts.stroke) != null ? _ref6 : 2;
      this.scolor = (_ref7 = opts.scolor) != null ? _ref7 : '#FFF';
      this.uwidth = (_ref8 = opts.uwidth) != null ? _ref8 : 100;
      this.uheight = (_ref9 = opts.uheight) != null ? _ref9 : 100;
      this.allComplete = false;
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    CrossWordsContainer.prototype.update = function(opts) {
      var column, i, j, k, row, tcc, txt, _i, _j, _k, _len, _len1, _ref2, _ref3,
        _this = this;
      this.removeAllChildren();
      this.words = opts.words;
      for (k = _i = 1, _ref2 = this.words.length; 1 <= _ref2 ? _i <= _ref2 : _i >= _ref2; k = 1 <= _ref2 ? ++_i : --_i) {
        txt = this.insertText("txt" + k, "" + k, this.font, this.fcolor, this.words[k - 1].x, this.words[k - 1].y);
        if (this.words[k - 1]["eval"]) {
          txt["eval"] = this.words[k - 1]["eval"];
          txt.target = this.words[k - 1].target;
          txt.index = this.words[k - 1].index;
          txt.addEventListener('click', function(e) {
            return d2oda.evaluator.evaluate(e.target["eval"], e.target.name, e.target.target);
          });
        }
      }
      i = 0;
      j = 0;
      _ref3 = opts.matrix;
      for (_j = 0, _len = _ref3.length; _j < _len; _j++) {
        row = _ref3[_j];
        for (_k = 0, _len1 = row.length; _k < _len1; _k++) {
          column = row[_k];
          if (column !== '#') {
            if (column === '-') {
              tcc = new createjs.Shape();
              tcc.graphics.f('#999').ss(this.stroke).s(this.scolor).dr(0, 0, this.uwidth, this.uheight);
              tcc.x = j * this.uwidth;
              tcc.y = i * this.uheight;
            } else {
              tcc = new TextCompleterContainer({
                text: column,
                width: this.uwidth,
                height: this.uheight
              }, this.font, this.fcolor, this.bcolor, this.scolor, this.stroke, j * this.uwidth, i * this.uheight);
              tcc.name = "l" + j + i;
              tcc.setRectOutline(this.bcolor, this.stroke, this.scolor);
            }
            this.add(tcc);
            this.droptargets.push(tcc);
          }
          j++;
        }
        j = 0;
        i++;
      }
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    CrossWordsContainer.prototype.fadeOut = function(obj) {
      TweenMax.killTweensOf(obj);
      TweenLite.killTweensOf(obj);
      return TweenLite.to(obj, 0.5, {
        alpha: 0,
        y: obj.y - 20
      });
    };

    CrossWordsContainer.prototype.evaluateWords = function() {
      var coords, obj, word, wordComplete, _i, _j, _len, _len1, _ref2, _results;
      _ref2 = this.words;
      _results = [];
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        word = _ref2[_i];
        coords = word.coords;
        wordComplete = true;
        for (_j = 0, _len1 = coords.length; _j < _len1; _j++) {
          obj = coords[_j];
          if (!lib["l" + obj].complete) {
            wordComplete = false;
          }
        }
        if (!word.complete) {
          if (wordComplete) {
            word.complete = true;
            if (lib[word.target]) {
              this.fadeOut(lib[word.target]);
            }
            if (lib["number" + word.target]) {
              this.fadeOut(lib["number" + word.target]);
            }
            createjs.Sound.play("s/" + word.target);
            _results.push(lib.scene.success());
          } else {
            _results.push(void 0);
          }
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    CrossWordsContainer.prototype.isComplete = function() {
      var word, _i, _len, _ref2;
      this.allComplete = true;
      _ref2 = this.words;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        word = _ref2[_i];
        if (!word.complete) {
          this.allComplete = false;
        }
      }
      return this.allComplete;
    };

    return CrossWordsContainer;

  })(Component);

  ABCContainer = (function(_super) {
    __extends(ABCContainer, _super);

    ABCContainer.prototype = new createjs.Container();

    ABCContainer.prototype.Container_initialize = ABCContainer.prototype.initialize;

    function ABCContainer(opts) {
      this.initialize(opts);
    }

    ABCContainer.prototype.initialize = function(opts) {
      var abc, abcarr, d, i, letter, lopts, _i, _len, _ref2, _x, _y;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this["eval"] = opts["eval"];
      this.target = opts.target;
      abc = 'abcdefghijklmnopqrstuvwxyz';
      abcarr = abc.split('');
      this.abccollection = new Array();
      i = 0;
      for (_i = 0, _len = abcarr.length; _i < _len; _i++) {
        letter = abcarr[_i];
        if (i >= 13) {
          _x = (i - 13) * (opts.uwidth + opts.margin);
          _y = opts.uheight;
        } else {
          _x = i * (opts.uwidth + opts.margin);
          _y = 0;
        }
        if (opts.clickable) {
          lopts = {
            id: "abc_" + i,
            x: _x,
            y: _y,
            index: letter,
            target: this.target,
            "eval": this["eval"],
            states: [
              {
                txt: {
                  text: letter,
                  font: opts.font,
                  color: opts.fcolor
                }
              }
            ]
          };
          d = new ButtonContainer(lopts);
        } else {
          lopts = {
            id: "abc_" + i,
            x: _x,
            y: _y,
            index: letter,
            target: this.target,
            "eval": this["eval"],
            text: letter,
            font: opts.font,
            color: opts.fcolor,
            afterSuccess: 'origin',
            afterFail: 'return'
          };
          d = new LetterDragContainer(lopts);
        }
        this.abccollection.push(d);
        this.add(d);
        i++;
      }
      this.width = _x + opts.uwidth;
      this.height = _y * 2;
      this.setPosition('mc');
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    ABCContainer.prototype.update = function(opts) {
      var letter, _i, _len, _ref2, _results;
      if (opts.reset) {
        _ref2 = this.abccollection;
        _results = [];
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          letter = _ref2[_i];
          _results.push(letter.visible = true);
        }
        return _results;
      }
    };

    ABCContainer.prototype.isComplete = function() {
      return true;
    };

    return ABCContainer;

  })(Component);

  WordCompleterContainer = (function(_super) {
    __extends(WordCompleterContainer, _super);

    WordCompleterContainer.prototype = new createjs.Container();

    WordCompleterContainer.prototype.Container_initialize = WordCompleterContainer.prototype.initialize;

    function WordCompleterContainer(opts) {
      this.initialize(opts);
    }

    WordCompleterContainer.prototype.initialize = function(opts) {
      var _ref10, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.utilities);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.uwidth = (_ref3 = opts.uwidth) != null ? _ref3 : 25;
      this.bcolor = (_ref4 = opts.bcolor) != null ? _ref4 : '#FFF';
      this.scolor = (_ref5 = opts.scolor) != null ? _ref5 : '#333';
      this.fcolor = (_ref6 = opts.fcolor) != null ? _ref6 : '#333';
      this.font = (_ref7 = opts.font) != null ? _ref7 : '20px Arial';
      this.stroke = (_ref8 = opts.stroke) != null ? _ref8 : 3;
      this.align = (_ref9 = opts.align) != null ? _ref9 : '';
      this.margin = (_ref10 = opts.margin) != null ? _ref10 : 5;
      this["eval"] = opts["eval"];
      this.currentTarget = 0;
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    WordCompleterContainer.prototype.update = function(opts) {
      var h, i, letter, npos, word, _i, _len;
      this.removeAllChildren();
      this.droptargets = new Array();
      this.target = opts.target;
      word = opts.word.split('');
      i = 0;
      if (opts.prev) {
        this.prev = this.insertText('prevTxt', opts.prev, this.font, this.fcolor, 0, 0);
        npos = this.prev.getMeasuredWidth() + this.margin;
      } else {
        npos = 0;
      }
      for (_i = 0, _len = word.length; _i < _len; _i++) {
        letter = word[_i];
        if (letter === ' ') {
          npos += this.margin;
        } else {
          opts = {
            text: letter,
            width: this.uwidth
          };
          h = new TextCompleterContainer(opts, this.font, this.fcolor, this.bcolor, this.scolor, this.stroke, npos, 5);
          this.droptargets.push(h);
          this.add(h, false);
          npos += this.uwidth + this.margin;
        }
        i++;
      }
      this.width = npos;
      this.setPosition(this.align);
      i = 0;
      npos = this.prev ? this.prev.getMeasuredWidth() + this.margin : 0;
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    WordCompleterContainer.prototype.isComplete = function() {
      var target, _i, _len, _ref2;
      _ref2 = this.droptargets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        target = _ref2[_i];
        if (target.complete === false) {
          return false;
        }
      }
      return true;
    };

    return WordCompleterContainer;

  })(Component);

  ScrambledWordContainer = (function(_super) {
    __extends(ScrambledWordContainer, _super);

    ScrambledWordContainer.prototype = new createjs.Container();

    ScrambledWordContainer.prototype.Container_initialize = ScrambledWordContainer.prototype.initialize;

    function ScrambledWordContainer(opts) {
      this.initialize(opts);
    }

    ScrambledWordContainer.prototype.initialize = function(opts) {
      var _ref10, _ref11, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      Module.extend(this, d2oda.utilities);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.uwidth = (_ref3 = opts.uwidth) != null ? _ref3 : 25;
      this.bcolor = (_ref4 = opts.bcolor) != null ? _ref4 : '#FFF';
      this.scolor = (_ref5 = opts.scolor) != null ? _ref5 : '#333';
      this.fcolor = (_ref6 = opts.fcolor) != null ? _ref6 : '#333';
      this.font = (_ref7 = opts.font) != null ? _ref7 : '20px Arial';
      this.stroke = (_ref8 = opts.stroke) != null ? _ref8 : 3;
      this.align = (_ref9 = opts.align) != null ? _ref9 : '';
      this.margin = (_ref10 = opts.margin) != null ? _ref10 : 5;
      this.oncomplete = (_ref11 = opts.oncomplete) != null ? _ref11 : null;
      this["eval"] = opts["eval"];
      this.currentTarget = 0;
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    ScrambledWordContainer.prototype.update = function(opts) {
      var d, h, i, letter, npos, scrambledLetter, scrambledWord, word, _i, _j, _len, _len1, _ref2;
      this.removeAllChildren();
      this.target = opts.target;
      this.fx = (_ref2 = opts.fx) != null ? _ref2 : 'fadeOut';
      word = opts.word.split('');
      scrambledWord = this.shuffle(word);
      i = 0;
      if (opts.prev) {
        this.prev = this.insertText('prevTxt', opts.prev, this.font, this.fcolor, 0, 0);
        npos = this.prev.getMeasuredWidth() + this.margin;
      } else {
        npos = 0;
      }
      for (_i = 0, _len = word.length; _i < _len; _i++) {
        letter = word[_i];
        if (letter === ' ') {
          npos += this.margin;
        } else {
          opts = {
            text: letter,
            width: this.uwidth
          };
          h = new TextCompleterContainer(opts, this.font, this.fcolor, this.bcolor, this.scolor, this.stroke, npos, 5);
          this.droptargets.push(h);
          this.add(h, false);
          npos += this.uwidth + this.margin;
        }
        i++;
      }
      this.width = npos;
      this.setPosition(this.align);
      i = 0;
      npos = this.prev ? this.prev.getMeasuredWidth() + this.margin : 0;
      for (_j = 0, _len1 = scrambledWord.length; _j < _len1; _j++) {
        scrambledLetter = scrambledWord[_j];
        if (scrambledLetter !== ' ') {
          opts = {
            id: "l" + this.name + i,
            x: npos,
            y: -h.height,
            index: scrambledLetter,
            target: this.name,
            "eval": this["eval"],
            text: scrambledLetter,
            font: this.font,
            color: this.fcolor,
            afterSuccess: 'hide',
            afterFail: 'return'
          };
          d = new LetterDragContainer(opts);
          this.add(d);
          npos += this.uwidth + this.margin;
          i++;
        }
      }
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    ScrambledWordContainer.prototype.onComplete = function() {
      return d2oda.evaluator.evaluate(this.oncomplete["function"], this.name, this.oncomplete.target);
    };

    ScrambledWordContainer.prototype.isComplete = function() {
      var target, _i, _len, _ref2;
      _ref2 = this.droptargets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        target = _ref2[_i];
        if (target.complete === false) {
          return false;
        }
      }
      return true;
    };

    return ScrambledWordContainer;

  })(Component);

  TextCompleterContainer = (function(_super) {
    __extends(TextCompleterContainer, _super);

    TextCompleterContainer.prototype = new createjs.Container();

    TextCompleterContainer.prototype.Container_initialize = TextCompleterContainer.prototype.initialize;

    function TextCompleterContainer(opts, font, fcolor, bcolor, scolor, stroke, x, y) {
      this.initialize(opts, font, fcolor, bcolor, scolor, stroke, x, y);
    }

    TextCompleterContainer.prototype.initialize = function(opts, font, fcolor, bcolor, scolor, stroke, x, y) {
      var _ref2, _ref3, _ref4;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = x;
      this.y = y;
      this.success = (_ref2 = opts.success) != null ? _ref2 : opts.text;
      this.text = this.createText('txt', opts.text, font, fcolor, 0, -5);
      this.width = (_ref3 = opts.width) != null ? _ref3 : this.text.getMeasuredWidth();
      this.height = (_ref4 = opts.height) != null ? _ref4 : this.text.getMeasuredHeight();
      this.complete = false;
      this.back = new createjs.Shape();
      this.back.graphics.f(bcolor).dr(0, 0, this.width, this.height).ss(stroke).s(scolor).mt(0, this.height).lt(this.width, this.height);
      return this.add(this.back, false);
    };

    TextCompleterContainer.prototype.setRectOutline = function(bcolor, stroke, scolor) {
      return this.back.graphics.f(bcolor).ss(stroke).s(scolor).dr(0, 0, this.width, this.height);
    };

    TextCompleterContainer.prototype.update = function(opts) {
      if (opts && opts.complete) {
        this.complete = opts.complete;
      }
      this.text.textAlign = 'center';
      this.text.x = this.width / 2;
      this.add(this.text, false);
      return TweenLite.from(this, 0.3, {
        alpha: 0
      });
    };

    return TextCompleterContainer;

  })(Component);

  LetterContainer = (function(_super) {
    __extends(LetterContainer, _super);

    LetterContainer.prototype = new createjs.Container();

    LetterContainer.prototype.Container_initialize = LetterContainer.prototype.initialize;

    function LetterContainer(opts, font, fcolor, bcolor, shcolor, shape, x, y) {
      this.initialize(opts, font, fcolor, bcolor, shcolor, shape, x, y);
    }

    LetterContainer.prototype.initialize = function(opts, font, fcolor, bcolor, shcolor, shape, x, y) {
      var _ref2, _ref3, _ref4;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      Module.extend(this, d2oda.utilities);
      this.mouseChildren = false;
      this.x = x;
      this.y = y;
      this.name = (_ref2 = "ltc_" + opts.name) != null ? _ref2 : "ltc_" + opts.text;
      this.success = (_ref3 = opts.success) != null ? _ref3 : opts.text;
      this.text = this.createText('txt', opts.text, font, fcolor, opts.width / 2, opts.height / 2 - 15, 'center');
      this.width = opts.width;
      this.height = opts.height;
      this.radius = (_ref4 = opts.radius) != null ? _ref4 : '20';
      this.complete = false;
      this.selectionEnabled = false;
      this.back = new createjs.Shape();
      this.shape = new createjs.Shape();
      this.back.graphics.f(bcolor).dr(0, 0, this.width, this.height);
      switch (shape) {
        case 'rect':
          this.shape.graphics.f(shcolor).dr(0, 0, this.width, this.height);
          break;
        case 'round':
          this.shape.graphics.f(shcolor).rr(0, 0, this.width, this.height, this.radius);
          break;
        case 'circle':
          this.shape.graphics.f(shcolor).dc(this.width / 2, this.height / 2, this.radius);
      }
      this.add(this.back, false);
      this.add(this.shape, false);
      this.add(this.text, false);
      return this.shape.visible = false;
    };

    LetterContainer.prototype.showShape = function(visible) {
      if (visible == null) {
        visible = true;
      }
      return this.shape.visible = visible;
    };

    LetterContainer.prototype.update = function(opts) {
      return this.complete = true;
    };

    return LetterContainer;

  })(Component);

  LetterDragContainer = (function(_super) {
    __extends(LetterDragContainer, _super);

    LetterDragContainer.prototype = new createjs.Container();

    LetterDragContainer.prototype.Container_initialize = LetterDragContainer.prototype.initialize;

    function LetterDragContainer(opts) {
      this.handleMouseDown = __bind(this.handleMouseDown, this);
      this.update = __bind(this.update, this);
      this.initialize(opts);
    }

    LetterDragContainer.prototype.initialize = function(opts) {
      var hit, t, _i, _len, _ref2, _ref3;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      Module.extend(this, d2oda.actions);
      Module.extend(this, d2oda.utilities);
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.x = opts.x;
      this.y = opts.y;
      this.pos = {
        x: this.x,
        y: this.y
      };
      this.index = opts.index;
      if (this.isArray(opts.target)) {
        this.target = opts.target;
      } else {
        this.target = lib[opts.target];
      }
      this.droptargets = new Array();
      this["eval"] = opts["eval"];
      this.label = this.createText('txt', opts.text, opts.font, opts.color, 0, 0);
      this.width = this.label.getMeasuredWidth();
      this.height = this.label.getMeasuredHeight();
      switch (opts.afterSuccess) {
        case 'hide':
          this.afterSuccess = this.hide;
          break;
        case 'inplace':
          this.afterSuccess = this.putInPlace;
          break;
        case 'return':
          this.afterSuccess = this.returnToPlace;
          break;
        case 'origin':
          this.afterSuccess = this.setInOrigin;
      }
      switch (opts.afterFail) {
        case 'hide':
          this.afterFail = this.hide;
          break;
        case 'inplace':
          this.afterSuccess = this.putInPlace;
          break;
        case 'return':
          this.afterFail = this.returnToPlace;
          break;
        case 'origin':
          this.afterFail = this.setInOrigin;
      }
      hit = new createjs.Shape();
      hit.graphics.beginFill('#000').drawRect(-5, -3, this.label.getMeasuredWidth() + 10, this.label.getMeasuredHeight() + 6);
      this.label.hitArea = hit;
      this.add(this.label, false);
      if (this.target) {
        if (this.isArray(this.target)) {
          _ref3 = this.target;
          for (_i = 0, _len = _ref3.length; _i < _len; _i++) {
            t = _ref3[_i];
            lib[t].observer.subscribe(ComponentObserver.UPDATED, this.update);
          }
        } else {
          this.target.observer.subscribe(ComponentObserver.UPDATED, this.update);
        }
      }
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    LetterDragContainer.prototype.update = function(opts) {
      var alldrops, t, _i, _len, _ref2;
      if (this.isArray(this.target)) {
        alldrops = new Array();
        _ref2 = this.target;
        for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
          t = _ref2[_i];
          alldrops.merge(lib[t].droptargets);
        }
        return this.droptargets = alldrops;
      } else {
        return this.droptargets = this.target.droptargets;
      }
    };

    LetterDragContainer.prototype.handleMouseDown = function(e) {
      var offset, posX, posY,
        _this = this;
      posX = e.stageX / d2oda.stage.r;
      posY = e.stageY / d2oda.stage.r;
      offset = {
        x: posX - this.x,
        y: posY - this.y
      };
      this.x = posX - offset.x;
      this.y = posY - offset.y;
      e.addEventListener('mousemove', function(ev) {
        posX = ev.stageX / d2oda.stage.r;
        posY = ev.stageY / d2oda.stage.r;
        _this.x = posX - offset.x;
        _this.y = posY - offset.y;
        return false;
      });
      e.addEventListener('mouseup', function(ev) {
        if (_this.droptargets && _this.droptargets.length > 0) {
          _this.evaluateDrop(e);
        } else {
          _this.dispatchEvent({
            type: 'drop'
          });
        }
        return false;
      });
      return false;
    };

    LetterDragContainer.prototype.evaluateDrop = function(e) {
      var drop, dropped, pt, target, _i, _len, _ref2;
      target = null;
      dropped = false;
      _ref2 = this.droptargets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        drop = _ref2[_i];
        pt = drop.globalToLocal(oda.stage.mouseX, oda.stage.mouseY);
        if (drop.hitTest(pt.x, pt.y)) {
          target = drop;
          dropped = true;
        }
      }
      if (dropped) {
        d2oda.evaluator.evaluate(this["eval"], this.name, target);
        return this.dispatchEvent({
          type: 'dropped',
          drop: target
        });
      } else {
        return this.returnToPlace(this.alpha, this.scaleX, this.scaleY);
      }
    };

    return LetterDragContainer;

  })(Component);

  ImageWordCompleterContainer = (function(_super) {
    __extends(ImageWordCompleterContainer, _super);

    ImageWordCompleterContainer.prototype = new createjs.Container();

    ImageWordCompleterContainer.prototype.Container_initialize = ImageWordCompleterContainer.prototype.initialize;

    function ImageWordCompleterContainer(opts) {
      this.initialize(opts);
    }

    ImageWordCompleterContainer.prototype.initialize = function(opts) {
      var _ref2, _ref3;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = opts.x;
      this.y = opts.y;
      this.margin = opts.margin;
      this.uwidth = opts.uwidth;
      this.uheight = opts.uheight;
      this.bcolor = opts.bcolor;
      this.scolor = opts.scolor;
      this.stroke = opts.stroke;
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.align = (_ref3 = opts.align) != null ? _ref3 : '';
      this.observer = new ComponentObserver();
      return this.droptargets = new Array();
    };

    ImageWordCompleterContainer.prototype.update = function(opts) {
      var child, container, i, npos, _i, _len, _ref2;
      this.removeAllChildren();
      i = 0;
      _ref2 = opts.containers;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        child = _ref2[_i];
        npos = i * (this.uwidth + this.margin);
        container = new ImageCompleterContainer(child, npos, this.uwidth, this.uheight, this.bcolor, this.scolor, this.stroke);
        this.droptargets.push(container);
        this.add(container, false);
        i++;
      }
      this.width = (this.uwidth + this.margin) * (i - 1);
      switch (this.align) {
        case 'center':
          this.regX = this.width / 2;
      }
      this.observer.notify(ComponentObserver.UPDATED);
      return TweenLite.from(this, 0.3, {
        alpha: 0,
        y: this.y - 10
      });
    };

    ImageWordCompleterContainer.prototype.isComplete = function() {
      var target, _i, _len, _ref2;
      _ref2 = this.droptargets;
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        target = _ref2[_i];
        if (target.complete === false) {
          return false;
        }
      }
      return true;
    };

    return ImageWordCompleterContainer;

  })(Component);

  ImageCompleterContainer = (function(_super) {
    __extends(ImageCompleterContainer, _super);

    ImageCompleterContainer.prototype = new createjs.Container();

    ImageCompleterContainer.prototype.Container_initialize = ImageCompleterContainer.prototype.initialize;

    function ImageCompleterContainer(opts, x, width, height, bgcolor, stcolor, stsize) {
      this.initialize(opts, x, width, height, bgcolor, stcolor, stsize);
    }

    ImageCompleterContainer.prototype.initialize = function(opts, x, width, height, bgcolor, stcolor, stsize) {
      var back, _ref2;
      if (x == null) {
        x = 0;
      }
      if (width == null) {
        width = 100;
      }
      if (height == null) {
        height = 100;
      }
      if (bgcolor == null) {
        bgcolor = '#FFF';
      }
      if (stcolor == null) {
        stcolor = '#333';
      }
      if (stsize == null) {
        stsize = 3;
      }
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.x = x;
      this.success = opts.success;
      this.image = opts.img;
      this.name = (_ref2 = opts.name) != null ? _ref2 : opts.id;
      this.width = width;
      this.height = height;
      this.complete = false;
      back = new createjs.Shape();
      back.graphics.f(bgcolor).dr(0, 0, width, height).ss(stsize).s(stcolor).mt(0, height).lt(width, height);
      return this.add(back, false);
    };

    ImageCompleterContainer.prototype.update = function(opts) {
      var b;
      b = this.createBitmap(this.image, this.image, 0, -5);
      if (b.width > b.height) {
        b.scaleX = b.scaleY = this.width / b.width;
      } else {
        b.scaleX = b.scaleY = this.height / b.height;
      }
      this.add(b, false);
      return TweenLite.from(this, 0.3, {
        alpha: 0
      });
    };

    return ImageCompleterContainer;

  })(Component);

  SceneStack = (function(_super) {
    __extends(SceneStack, _super);

    SceneStack.prototype = new createjs.Container();

    SceneStack.prototype.Container_initialize = SceneStack.prototype.initialize;

    function SceneStack(scenes) {
      this.lastScene = __bind(this.lastScene, this);
      this.prev = __bind(this.prev, this);
      this.next = __bind(this.next, this);
      this.initialize(scenes);
    }

    SceneStack.prototype.initialize = function(scenes) {
      var s, scene, _i, _len;
      this.Container_initialize();
      this.stack = [];
      this.currentScene = 0;
      for (_i = 0, _len = scenes.length; _i < _len; _i++) {
        s = scenes[_i];
        scene = new Scene(s);
        scene.visible = false;
        this.addChild(scene);
        this.stack.push(scene);
      }
      this.setCurrent();
      return TweenLite.from(this, 1, {
        alpha: 0
      });
    };

    SceneStack.prototype.next = function() {
      if (this.stack[this.currentScene].chooseEnabled) {
        this.stack[this.currentScene].visible = false;
        this.currentScene = this.stack[this.currentScene].choose;
      } else {
        this.currentScene++;
      }
      if (this.stack.length > 1 && this.currentScene < this.stack.length) {
        if (!this.stack[this.currentScene].chooseEnabled) {
          this.stack[this.currentScene - 1].visible = false;
        }
        this.setCurrent();
        lib.scene.init();
        return TweenLite.from(this, 1, {
          alpha: 0
        });
      } else {
        return TweenLite.to(this, 1, {
          alpha: 0,
          delay: 1,
          onComplete: this.lastScene
        });
      }
    };

    SceneStack.prototype.prev = function() {
      this.currentScene--;
      if (this.currentScene >= 0) {
        this.stack[this.currentScene + 1].visible = false;
        this.setCurrent();
        lib.scene.init();
        return TweenLite.from(this, 1, {
          alpha: 0
        });
      } else {
        return this.currentScene++;
      }
    };

    SceneStack.prototype.lastScene = function() {
      if (lib.score.type === 'clock') {
        lib.score.stop();
      }
      return this.dispatchEvent({
        type: 'complete'
      });
    };

    SceneStack.prototype.setCurrent = function() {
      lib.scene = this.stack[this.currentScene];
      return lib.scene.visible = true;
    };

    window.SceneStack = SceneStack;

    return SceneStack;

  })(Component);

  SceneFactory = (function() {
    function SceneFactory() {}

    SceneFactory.prototype.makeChild = function(opts) {
      switch (opts.type) {
        case 'abc':
          return new ABCContainer(opts);
        case 'drg':
          return new DragContainer(opts);
        case 'grd':
          return new GridContainer(opts);
        case 'txt':
          return new TextContainer(opts);
        case 'img':
          return new ImageContainer(opts);
        case 'lbl':
          return new LabelContainer(opts);
        case 'cln':
          return new CloneContainer(opts);
        case 'wrt':
          return new WriteContainer(opts);
        case 'spr':
          return new SpriteContainer(opts);
        case 'btn':
          return new ButtonContainer(opts);
        case 'stps':
          return new StepsContainer(opts);
        case 'chs':
          return new ChooseContainer(opts);
        case 'cwd':
          return new CrossWordsContainer(opts);
        case 'wsch':
          return new WordSearchContainer(opts);
        case 'ldrg':
          return new LetterDragContainer(opts);
        case 'pcct':
          return new PhraseCloneContainer(opts);
        case 'wcpt':
          return new WordCompleterContainer(opts);
        case 'swct':
          return new ScrambledWordContainer(opts);
        case 'ccpt':
          return new CloneCompleterContainer(opts);
        case 'pcpt':
          return new PhraseCompleterContainer(opts);
        case 'iwcpt':
          return new ImageWordCompleterContainer(opts);
        case 'grp':
          return new ComponentGroup(opts);
      }
    };

    window.SceneFactory = SceneFactory;

    return SceneFactory;

  })();

  SceneObserver = (function(_super) {
    __extends(SceneObserver, _super);

    function SceneObserver() {
      _ref2 = SceneObserver.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    SceneObserver.NEXT_STEP = 'next_step';

    SceneObserver.COMPLETE = 'scene_complete';

    window.SceneObserver = SceneObserver;

    return SceneObserver;

  })(Observer);

  Scene = (function(_super) {
    __extends(Scene, _super);

    Scene.prototype = new createjs.Container();

    Scene.prototype.Container_initialize = Scene.prototype.initialize;

    function Scene(scene) {
      this.setStep = __bind(this.setStep, this);
      this.next = __bind(this.next, this);
      this.sndsuccess = __bind(this.sndsuccess, this);
      this.initialize(scene);
    }

    Scene.prototype.initialize = function(scene) {
      var answers, c, container, g, group, _i, _j, _len, _len1, _ref3, _ref4, _ref5, _results;
      this.Container_initialize();
      Module.extend(this, d2oda.methods);
      this.factory = new SceneFactory();
      this.observer = new SceneObserver();
      this.currentStep = 0;
      this.choose = (_ref3 = scene.answers.choose) != null ? _ref3 : 0;
      answers = scene.answers.collection.slice(0);
      if (scene.answers.mixed === true) {
        this.answers = d2oda.utilities.shuffle(answers);
      } else {
        this.answers = answers;
      }
      this.chooseEnabled = scene.answers.chooseEnabled;
      switch (scene.answers.type) {
        case 'steps':
          this.observer.subscribe(SceneObserver.NEXT_STEP, this.next);
          break;
        case 'limit':
          this.answers = d2oda.utilities.shuffleNoRepeat(this.answers, scene.answers.limit);
          this.observer.subscribe(SceneObserver.NEXT_STEP, this.next);
      }
      if (scene.containers.length > 0) {
        _ref4 = scene.containers;
        for (_i = 0, _len = _ref4.length; _i < _len; _i++) {
          container = _ref4[_i];
          c = this.factory.makeChild(container);
          this.add(c);
        }
      }
      if (scene.groups.length > 0) {
        _ref5 = scene.groups;
        _results = [];
        for (_j = 0, _len1 = _ref5.length; _j < _len1; _j++) {
          group = _ref5[_j];
          g = this.factory.makeChild(group);
          _results.push(lib[group.id] = g);
        }
        return _results;
      }
    };

    Scene.prototype.init = function() {
      if (lib.score.type === 'clock') {
        lib.score.start();
        lib.score.addEventListener('count_complete', lib.game.nextScene);
      }
      return this.setStep();
    };

    Scene.prototype.success = function(plusOne, stopSound) {
      var step, target, _i, _len;
      if (plusOne == null) {
        plusOne = true;
      }
      if (stopSound == null) {
        stopSound = true;
      }
      if (stopSound) {
        createjs.Sound.stop();
      }
      if (plusOne) {
        lib.score.plusOne();
      }
      step = this.answers[this.currentStep];
      if (step && step.length > 0) {
        for (_i = 0, _len = step.length; _i < _len; _i++) {
          target = step[_i];
          if (target.name !== 'snd' && target.name !== 'global' && lib[target.name].isComplete() === false) {
            return false;
          }
        }
      }
      return this.nextStep();
    };

    Scene.prototype.sndsuccess = function() {
      return this.success(false);
    };

    Scene.prototype.fail = function() {
      lib.score.enableBlock();
      return lib.mainContainer.warning();
    };

    Scene.prototype.next = function() {
      this.currentStep++;
      if (this.currentStep >= this.answers.length) {
        return this.delay(1000, function() {
          return lib.game.observer.notify(GameObserver.NEXT_SCENE);
        });
      } else {
        return this.delay(1000, this.setStep);
      }
    };

    Scene.prototype.setStep = function() {
      var snd, step, target, _i, _len, _results;
      if (lib.instructions.playing) {
        return lib.instructions.addEventListener('complete', this.setStep);
      } else {
        console.log('setStep');
        step = this.answers[this.currentStep];
        if (step && step.length > 0) {
          _results = [];
          for (_i = 0, _len = step.length; _i < _len; _i++) {
            target = step[_i];
            switch (target.name) {
              case 'global':
                d2oda.evaluator.success = target.opts.success;
                _results.push(false);
                break;
              case 'snd':
                this.snd = target.opts.id;
                createjs.Sound.stop();
                snd = createjs.Sound.play(target.opts.id);
                if (target.opts.successoncomplete) {
                  snd.addEventListener('complete', this.sndsuccess);
                }
                _results.push(false);
                break;
              default:
                _results.push(lib[target.name].update(target.opts));
            }
          }
          return _results;
        }
      }
    };

    Scene.prototype.nextStep = function() {
      console.log('next step');
      return this.observer.notify(SceneObserver.NEXT_STEP);
    };

    window.Scene = Scene;

    return Scene;

  })(Component);

}).call(this);
