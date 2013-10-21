// Generated by CoffeeScript 1.6.3
(function() {
  var Droppable;

  Droppable = (function() {
    function Droppable(name, color, x, y, w, h) {
      this.initialize(name, color, x, y, w, h);
    }

    Droppable.prototype = new createjs.Container();

    Droppable.prototype.Container_initialize = Droppable.prototype.initialize;

    Droppable.prototype.initialize = function(name, color, x, y, w, h) {
      this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.graphic = new createjs.Graphics().beginFill(color).drawRect(0, 0, w, h);
      this.shape = new createjs.Shape(this.graphic);
      this.addChild(this.shape);
      return false;
    };

    window.Droppable = Droppable;

    return Droppable;

  })();

}).call(this);