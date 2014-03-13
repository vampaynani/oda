(function() {
  var WordContainer;

  WordContainer = (function() {
    function WordContainer(name, text, bgcolor, stcolor, x, y, w, h) {
      if (w == null) {
        w = 100;
      }
      if (h == null) {
        h = 20;
      }
      this.initialize(name, text, bgcolor, stcolor, x, y, w, h);
    }

    WordContainer.prototype = new createjs.Container();

    WordContainer.prototype.Container_initialize = WordContainer.prototype.initialize;

    WordContainer.prototype.initialize = function(name, text, bgcolor, stcolor, x, y, w, h) {
      this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.text = new createjs.Text(text, '48px Quicksand', '#333');
      if (text !== '') {
        w = this.text.getMeasuredWidth() + 20;
      }
      this.width = w;
      this.height = h;
      this.shape = new createjs.Shape(new createjs.Graphics().beginFill(bgcolor).drawRect(0, 0, w, h).setStrokeStyle(3).beginStroke(stcolor).moveTo(0, h).lineTo(w, h));
      this.text.text = '';
      this.text.x = w / 2;
      this.text.y = h - this.text.getMeasuredHeight();
      this.addChild(this.shape, this.text);
      return false;
    };

    WordContainer.prototype.setRectShape = function(bgcolor, stcolor, thin, w, h) {
      return this.shape.graphics = new createjs.Graphics().clear().beginFill(bgcolor).setStrokeStyle(thin).beginStroke(stcolor).drawRect(0, 0, w, h);
    };

    WordContainer.prototype.changeText = function(text) {
      this.text.text = text;
      return this.text.textAlign = 'center';
    };

    WordContainer.prototype.blink = function(state) {
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

    window.WordContainer = WordContainer;

    return WordContainer;

  })();

}).call(this);
