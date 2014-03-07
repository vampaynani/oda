(function() {
  var Counter,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Counter = (function() {
    function Counter(name, count, back, x, y) {
      this.doCount = __bind(this.doCount, this);
      this.initialize(name, count, back, x, y);
    }

    Counter.prototype = new createjs.Container();

    Counter.prototype.Container_initialize = Counter.prototype.initialize;

    Counter.prototype.initialize = function(name, count, back, x, y) {
      var shape;
      this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.count = count;
      this.text = new createjs.Text(this.count, '48px Arial', '#ffffff');
      this.text.textAlign = 'center';
      this.text.x = 60;
      this.text.y = 10;
      shape = new createjs.Shape();
      shape.graphics.beginFill(back).drawRoundRect(0, 0, 120, 72, 10);
      this.addChild(shape, this.text);
      return false;
    };

    Counter.prototype.start = function() {
      return this.time = setInterval(this.doCount, 1000);
    };

    Counter.prototype.doCount = function() {
      if (this.count > 0) {
        this.count--;
        this.text.text = this.count;
        return this.dispatchEvent('timer_event');
      } else {
        clearInterval(this.time);
        return this.dispatchEvent('timer_complete');
      }
    };

    Counter.prototype.stop = function() {
      return clearInterval(this.time);
    };

    window.Counter = Counter;

    return Counter;

  })();

}).call(this);
