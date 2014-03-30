(function() {
  var Droppable,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __slice = [].slice;

  Droppable = (function() {
    function Droppable(name, image, index, x, y, stage, drops) {
      if (drops == null) {
        drops = [];
      }
      this.blinkAgain = __bind(this.blinkAgain, this);
      this.handleMouseDown = __bind(this.handleMouseDown, this);
      this.endDragListener = __bind(this.endDragListener, this);
      this.initDragListener = __bind(this.initDragListener, this);
      this.onStopEvaluation = __bind(this.onStopEvaluation, this);
      this.onInitEvaluation = __bind(this.onInitEvaluation, this);
      this.initialize(name, image, index, x, y, stage, drops);
    }

    Droppable.prototype = new createjs.Container();

    Droppable.prototype.Container_initialize = Droppable.prototype.initialize;

    Droppable.prototype.initialize = function(name, image, index, x, y, stage, drops) {
      var hit;
      this.Container_initialize();
      this.name = name;
      this.bitmap = new createjs.Bitmap(image);
      this.index = index;
      this.x = x;
      this.y = y;
      this.width = image.width;
      this.height = image.height;
      this.pos = {
        x: x,
        y: y
      };
      this.stage = stage;
      this.drops = drops;
      hit = new createjs.Shape();
      hit.graphics.beginFill('rgba(0,0,0,0.5)').drawRect(0, 0, image.width, image.height);
      this.hitArea = hit;
      this.inPlace = false;
      return this.addChild(this.bitmap);
    };

    Droppable.prototype.updateDrops = function() {
      var drop, drops, o, _i, _j, _len, _len1;
      drop = arguments[0], drops = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      this.drops = [];
      if (this.isArray(drop)) {
        for (_i = 0, _len = drop.length; _i < _len; _i++) {
          o = drop[_i];
          this.drops.push(o);
        }
      } else {
        this.drops.push(drop);
        for (_j = 0, _len1 = drops.length; _j < _len1; _j++) {
          o = drops[_j];
          this.drops.push(o);
        }
      }
      return this.drops;
    };

    Droppable.prototype.isArray = function(value) {
      return Array.isArray(value || function(value) {
        return {}.toString.call(value) === '[object Array]';
      });
    };

    Droppable.prototype.onInitEvaluation = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    Droppable.prototype.onStopEvaluation = function() {
      return this.removeEventListener('mousedown', this.handleMouseDown);
    };

    Droppable.prototype.initDragListener = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    Droppable.prototype.endDragListener = function() {
      return this.removeEventListener('mousedown', this.handleMouseDown);
    };

    Droppable.prototype.handleMouseDown = function(e) {
      var offset, posX, posY,
        _this = this;
      TweenMax.killTweensOf(this);
      TweenLite.killTweensOf(this);
      this.alpha = 1;
      posX = e.stageX / stageSize.r;
      posY = e.stageY / stageSize.r;
      offset = {
        x: posX - this.x,
        y: posY - this.y
      };
      this.x = posX - offset.x;
      this.y = posY - offset.y;
      this.addEventListener('pressmove', function(ev) {
        posX = ev.stageX / stageSize.r;
        posY = ev.stageY / stageSize.r;
        _this.x = posX - offset.x;
        _this.y = posY - offset.y;
        return false;
      });
      this.addEventListener('pressup', function(ev) {
        _this.removeAllEventListeners('pressmove');
        _this.removeAllEventListeners('pressup');
        if (_this.drops.length > 0) {
          _this.evaluateDrop(e);
        } else {
          _this.dispatchEvent('drop');
        }
        return false;
      });
      return false;
    };

    Droppable.prototype.evaluateDrop = function(e) {
      var drop, dropped, object, pt, _i, _len, _ref;
      object = null;
      dropped = false;
      _ref = this.drops;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        drop = _ref[_i];
        pt = drop.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (drop.hitTest(pt.x, pt.y)) {
          object = drop;
          dropped = true;
        }
      }
      if (dropped) {
        return this.dispatchEvent({
          type: 'dropped',
          drop: object
        });
      } else {
        return this.returnToPlace(this.alpha, this.scaleX, this.scaleY);
      }
    };

    Droppable.prototype.blink = function(state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(this);
      this.alpha = 1;
      if (state) {
        return TweenMax.to(this, 0.5, {
          alpha: .2,
          repeat: -1,
          yoyo: true
        });
      }
    };

    Droppable.prototype.blinkAgain = function() {
      TweenLite.killTweensOf(this);
      return this.blink(true);
    };

    Droppable.prototype.putInPlace = function(position, alpha, scaleX, scaleY) {
      if (alpha == null) {
        alpha = 1;
      }
      if (scaleX == null) {
        scaleX = 1;
      }
      if (scaleY == null) {
        scaleY = 1;
      }
      this.inPlace = true;
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

    Droppable.prototype.returnToPlace = function(alpha, scaleX, scaleY, blink) {
      if (alpha == null) {
        alpha = 1;
      }
      if (scaleX == null) {
        scaleX = 1;
      }
      if (scaleY == null) {
        scaleY = 1;
      }
      if (blink == null) {
        blink = false;
      }
      if (!blink) {
        return TweenLite.to(this, 0.5, {
          ease: Back.easeOut,
          delay: 0.1,
          x: this.pos.x,
          y: this.pos.y,
          alpha: alpha,
          scaleX: scaleX,
          scaleY: scaleY
        });
      } else {
        return TweenLite.to(this, 0.5, {
          ease: Back.easeOut,
          delay: 0.1,
          x: this.pos.x,
          y: this.pos.y,
          alpha: alpha,
          scaleX: scaleX,
          scaleY: scaleY,
          onComplete: this.blinkAgain
        });
      }
    };

    Droppable.prototype.takeMeOut = function() {
      return TweenLite.to(this, 0.5, {
        ease: Linear.easeNone,
        delay: 0.1,
        x: this.pos.x,
        y: this.pos.y,
        alpha: 0,
        onComplete: this.killMe
      });
    };

    window.Droppable = Droppable;

    return Droppable;

  })();

}).call(this);
