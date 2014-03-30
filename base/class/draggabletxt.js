(function() {
  var DraggableText,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  DraggableText = (function() {
    function DraggableText(name, text, index, x, y) {
      this.blinkAgain = __bind(this.blinkAgain, this);
      this.handleMouseDown = __bind(this.handleMouseDown, this);
      this.onInitEvaluation = __bind(this.onInitEvaluation, this);
      this.endDragListener = __bind(this.endDragListener, this);
      this.initDragListener = __bind(this.initDragListener, this);
      this.initialize(name, text, index, x, y);
    }

    DraggableText.prototype = new createjs.Container();

    DraggableText.prototype.Container_initialize = DraggableText.prototype.initialize;

    DraggableText.prototype.initialize = function(name, text, index, x, y) {
      this.Container_initialize();
      this.name = name;
      this.index = index;
      this.x = x;
      this.y = y;
      this.pos = {
        x: x,
        y: y
      };
      this.text = new createjs.Text(text, '16px Quicksand', '#333333');
      this.hit = new createjs.Shape();
      this.hit.graphics.beginFill('#000').drawRect(-5, -5, this.text.getMeasuredWidth() + 10, this.text.getMeasuredHeight() + 10);
      this.text.hitArea = this.hit;
      this.inPlace = false;
      this.addChild(this.text);
      return false;
    };

    DraggableText.prototype.createHitArea = function(w, h) {
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

    DraggableText.prototype.setHitArea = function() {
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

    DraggableText.prototype.initDragListener = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    DraggableText.prototype.endDragListener = function() {
      return this.removeEventListener('mousedown', this.handleMouseDown);
    };

    DraggableText.prototype.onInitEvaluation = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    DraggableText.prototype.handleMouseDown = function(e) {
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
        _this.dispatchEvent('drop');
        return false;
      });
      return false;
    };

    DraggableText.prototype.blink = function(state) {
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

    DraggableText.prototype.blinkAgain = function() {
      TweenLite.killTweensOf(this);
      return this.blink(true);
    };

    DraggableText.prototype.putInPlace = function(position, alpha, scaleX, scaleY) {
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

    DraggableText.prototype.returnToPlace = function(alpha, scaleX, scaleY) {
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

    window.DraggableText = DraggableText;

    return DraggableText;

  })();

}).call(this);
