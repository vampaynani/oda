(function() {
  var Dragtxt = function(name, text, sect, value, x, y) {
    this.initialize(name, text, sect, value, x, y);
  }
  var p = Dragtxt.prototype = new createjs.Container(); // inherit from Container
  
  p.pos;
  p.dragObj;
  p.text;
   p.sect;
  p.value;
  p.side;
  p.selection = 0;
  
  p.Container_initialize = p.initialize;
  p.initialize = function(name, text, sect, value, x, y) {
    this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.text = new createjs.Text(text, "20px Arial", "#333333");
      this.sect = sect;
      this.value = value;
      this.addChild(this.text);
      this.pos = {x:x, y:y};
      $(window).on('initEval', function(){
        p.addEventListener('mousedown', p.handleMouseDown);
      });
  }
  p.handleMouseDown = function (e){
      var draggable = e.target;
      var offset = {x:e.stageX - draggable.x, y:e.stageY - draggable.y};
      draggable.x = e.stageX - offset.x;
      draggable.y = e.stageY - offset.y;
      
      e.addEventListener('mousemove', function(ev){
          draggable.x = ev.stageX - offset.x;
          draggable.y = ev.stageY - offset.y;
          stage.update();
      });
      e.addEventListener('mouseup', function(ev){
          draggable.dispatchEvent('drop');
      });
  }
  p.returnToPlace = function (){
      TweenLite.to(this, 1.5, {ease: Elastic.easeOut, x: this.pos.x, y: this.pos.y, alpha: 1});
      this.dispatchEvent('dropped');
  }
  window.Dragtxt = Dragtxt;
}());