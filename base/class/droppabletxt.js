(function() {
  var DroppableText,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __slice = [].slice;

  DroppableText = (function() {
    function DroppableText(name, text, index, x, y, stage, drops) {
      if (drops == null) {
        drops = [];
      }
      this.blinkAgain = __bind(this.blinkAgain, this);
      this.handleMouseDown = __bind(this.handleMouseDown, this);
      this.onInitEvaluation = __bind(this.onInitEvaluation, this);
      this.endDragListener = __bind(this.endDragListener, this);
      this.initDragListener = __bind(this.initDragListener, this);
      this.initialize(name, text, index, x, y, stage, drops);
    }

    DroppableText.prototype = new createjs.Container();

    DroppableText.prototype.Container_initialize = DroppableText.prototype.initialize;

    DroppableText.prototype.initialize = function(name, text, index, x, y, stage, drops) {
      this.Container_initialize();
      this.name = name;
      this.index = index;
      this.x = x;
      this.y = y;
      this.pos = {
        x: x,
        y: y
      };
      this.stage = stage;
      this.drops = drops;
      this.text = new createjs.Text(text, '16px Quicksand', '#333333');
      this.hit = new createjs.Shape();
      this.hit.graphics.beginFill('#000').drawRect(-5, -5, this.text.getMeasuredWidth() + 10, this.text.getMeasuredHeight() + 10);
      this.text.hitArea = this.hit;
      this.inPlace = false;
      this.addChild(this.text);
      return false;
    };

    DroppableText.prototype.createHitArea = function(w, h) {
      switch (this.text.textAlign) {
        case 'left':
          this.hit.graphics.c().beginFill('#000').drawRect(0, 0, w, h);
          break;
        case 'center':
          this.hit.graphics.c().beginFill('#000').drawRect(-w / 2, 0, w, h);
          break;
        case 'right':
          this.hit.graphics.c().beginFill('#000').drawRect(-w, 0, w, h);
      }
      return this.text.hitArea = this.hit;
    };

    DroppableText.prototype.setHitArea = function() {
      var h, w;
      w = this.text.getMeasuredWidth();
      h = this.text.getMeasuredHeight();
      switch (this.text.textAlign) {
        case 'left':
          this.hit.graphics.c().beginFill('#000').drawRect(0, 0, w, h);
          break;
        case 'center':
          this.hit.graphics.c().beginFill('#000').drawRect(-w / 2, 0, w, h);
          break;
        case 'right':
          this.hit.graphics.c().beginFill('#000').drawRect(-w, 0, w, h);
      }
      return this.text.hitArea = this.hit;
    };

    DroppableText.prototype.updateDrops = function() {
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

    DroppableText.prototype.isArray = function(value) {
      return Array.isArray(value || function(value) {
        return {}.toString.call(value) === '[object Array]';
      });
    };

    DroppableText.prototype.initDragListener = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    DroppableText.prototype.endDragListener = function() {
      return this.removeEventListener('mousedown', this.handleMouseDown);
    };

    DroppableText.prototype.onInitEvaluation = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    DroppableText.prototype.handleMouseDown = function(e) {
      var offset, posX, posY,
        _this = this;
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

    DroppableText.prototype.evaluateDrop = function(e) {
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
        return this.returnToPlace();
      }
    };

    DroppableText.prototype.blink = function(state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(this);
      this.alpha = 1;
      if (state) {
        return TweenMax.to(this, 0.2, {
          alpha: .2,
          repeat: -1,
          yoyo: true
        });
      }
    };

    DroppableText.prototype.blinkAgain = function() {
      TweenLite.killTweensOf(this);
      return this.blink(true);
    };

    DroppableText.prototype.putInPlace = function(position, alpha, scaleX, scaleY) {
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

    DroppableText.prototype.returnToPlace = function(alpha, scaleX, scaleY) {
      if (alpha == null) {
        alpha = 1;
      }
      if (scaleX == null) {
        scaleX = 1;
      }
      if (scaleY == null) {
        scaleY = 1;
      }
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

    window.DroppableText = DroppableText;

    return DroppableText;

  })();

}).call(this);
