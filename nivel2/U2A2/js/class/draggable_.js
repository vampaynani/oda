(function() {
  var Draggable = function(name, img, side, sel, x, y) {
    this.initialize(name, img, side, sel, x, y);
  }
  var p = Draggable.prototype = new createjs.Container(); // inherit from Container
  
  p.pos;
  p.dragObj;
  p.image;
  p.side;
  p.selection = 0;
      
  p.Container_initialize = p.initialize;
  p.initialize = function(name, img, side, sel, x, y) {
    this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.image = new createjs.Bitmap(img);
      this.side = side;
      this.selection = sel;
      this.addChild(this.image);
      this.pos = {x:x, y:y};
      this.addEventListener('mousedown', this.handleMouseDown);
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
          TweenLite.to(draggable, 0.5, {ease: Back.easeIn, scaleX: 0.2, scaleY: 0.2, alpha: 0, onComplete: draggable.returnToPlace, onCompleteParams:[draggable]});
      });
  }
  p.returnToPlace = function ( dragObj ){
      dragObj.y = dragObj.pos.y;
      dragObj.x = sideOut;
      dragObj.scaleX = 1;
      dragObj.scaleY = 1;
      TweenLite.to(dragObj, 0.5, {ease: Back.easeOut, delay:0.1, x: dragObj.pos.x, y: dragObj.pos.y, alpha: 1});
      dragObj.dispatchEvent('dropped');
  }
  window.Draggable = Draggable;
}());