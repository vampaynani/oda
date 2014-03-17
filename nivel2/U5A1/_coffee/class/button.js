(function() {
  var Button;

  Button = (function() {
    function Button(name, image, index, x, y) {
      this.initialize(name, image, index, x, y);
    }

    Button.prototype = new createjs.Container();

    Button.prototype.Container_initialize = Button.prototype.initialize;

    Button.prototype.initialize = function(name, image, index, x, y) {
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
      this.addChild(this.bitmap);
      return false;
    };

    Button.prototype.blink = function(state) {
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

    window.Button = Button;

    return Button;

  })();

}).call(this);
