// Generated by CoffeeScript 1.6.3
(function() {
  var Draggable,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Draggable = (function() {
    function Draggable(name, image, index, x, y) {
      this.blinkAgain = __bind(this.blinkAgain, this);
      this.handleMouseDown = __bind(this.handleMouseDown, this);
      this.onStopEvaluation = __bind(this.onStopEvaluation, this);
      this.onInitEvaluation = __bind(this.onInitEvaluation, this);
      this.initialize(name, image, index, x, y);
    }

    Draggable.prototype = new createjs.Container();

    Draggable.prototype.Container_initialize = Draggable.prototype.initialize;

    Draggable.prototype.initialize = function(name, image, index, x, y) {
      this.Container_initialize();
      this.name = name;
      this.bitmap = new createjs.Bitmap(image);
      this.index = index;
      this.x = x;
      this.y = y;
      this.pos = {
        x: x,
        y: y
      };
      this.inPlace = false;
      return this.addChild(this.bitmap);
    };

    Draggable.prototype.onInitEvaluation = function() {
      if (!this.inPlace) {
        this.blink(true);
        return this.addEventListener('mousedown', this.handleMouseDown);
      }
    };

    Draggable.prototype.onStopEvaluation = function() {
      this.blink(false);
      return this.removeEventListener('mousedown', this.handleMouseDown);
    };

    Draggable.prototype.handleMouseDown = function(e) {
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
      e.addEventListener('mousemove', function(ev) {
        posX = ev.stageX / stageSize.r;
        posY = ev.stageY / stageSize.r;
        _this.x = posX - offset.x;
        _this.y = posY - offset.y;
        return false;
      });
      e.addEventListener('mouseup', function(ev) {
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

    Draggable.prototype.putInPlace = function(position) {
      this.inPlace = true;
      return TweenLite.to(this, 1, {
        ease: Back.easeOut,
        delay: 0.1,
        x: position.x,
        y: position.y,
        scaleX: 1,
        scaleY: 1,
        alpha: 1
      });
    };

    Draggable.prototype.returnToPlace = function() {
      return TweenLite.to(this, 1, {
        ease: Back.easeOut,
        delay: 0.1,
        x: this.pos.x,
        y: this.pos.y,
        alpha: 1,
        onComplete: this.blinkAgain
      });
    };

    window.Draggable = Draggable;

    return Draggable;

  })();

}).call(this);
