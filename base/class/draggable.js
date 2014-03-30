(function() {
  var Draggable,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Draggable = (function() {
    function Draggable(name, image, index, x, y) {
      this.blinkAgain = __bind(this.blinkAgain, this);
      this.handleMouseDown = __bind(this.handleMouseDown, this);
      this.endDragListener = __bind(this.endDragListener, this);
      this.initDragListener = __bind(this.initDragListener, this);
      this.onStopEvaluation = __bind(this.onStopEvaluation, this);
      this.onInitEvaluation = __bind(this.onInitEvaluation, this);
      this.initialize(name, image, index, x, y);
    }

    Draggable.prototype = new createjs.Container();

    Draggable.prototype.Container_initialize = Draggable.prototype.initialize;

    Draggable.prototype.initialize = function(name, image, index, x, y) {
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
      hit = new createjs.Shape();
      hit.graphics.beginFill('rgba(0,0,0,0.5)').drawRect(0, 0, image.width, image.height);
      this.hitArea = hit;
      this.inPlace = false;
      return this.addChild(this.bitmap);
    };

    Draggable.prototype.onInitEvaluation = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    Draggable.prototype.onStopEvaluation = function() {
      return this.removeEventListener('mousedown', this.handleMouseDown);
    };

    Draggable.prototype.initDragListener = function() {
      return this.addEventListener('mousedown', this.handleMouseDown);
    };

    Draggable.prototype.endDragListener = function() {
      return this.removeEventListener('mousedown', this.handleMouseDown);
    };

    Draggable.prototype.handleMouseDown = function(e) {
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
        _this.dispatchEvent('drop');
        return false;
      });
      return false;
    };

    Draggable.prototype.blink = function(state) {
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

    Draggable.prototype.blinkAgain = function() {
      TweenLite.killTweensOf(this);
      return this.blink(true);
    };

    Draggable.prototype.putInPlace = function(position, alpha, scaleX, scaleY) {
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

    Draggable.prototype.returnToPlace = function(alpha, scaleX, scaleY, blink) {
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

    Draggable.prototype.takeMeOut = function() {
      return TweenLite.to(this, 0.5, {
        ease: Linear.easeNone,
        delay: 0.1,
        x: this.pos.x,
        y: this.pos.y,
        alpha: 0,
        onComplete: this.killMe
      });
    };

    window.Draggable = Draggable;

    return Draggable;

  })();

}).call(this);
