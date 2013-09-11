(function() {
  var Dragtxt = function(name, text, value, x, y) {
    this.initialize(name, text, x, y);
  }
  var p = Dragtxt.prototype = new createjs.Container(); // inherit from Container
  
  p.pos;
  p.dragObj;
  p.text;
  p.value;
  p.side;
  p.selection = 0;
  
  p.Container_initialize = p.initialize;
  p.initialize = function(name, text, value, x, y) {
    this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.text = new createjs.Text(text);
      this.value = value;
      this.addChild(this.text);
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
          draggable.returnToPlace(draggable);
          //TweenLite.to(draggable, 0.5, {ease: Back.easeIn, scaleX: 0.2, scaleY: 0.2, alpha: 0, onComplete: draggable.returnToPlace, onCompleteParams:[draggable]});
      });
  }
  p.returnToPlace = function ( dragObj ){
      //dragObj.text.filters = [];
      //dragObj.y = dragObj.pos.y;
      //dragObj.x = sideOut;
      //dragObj.scaleX = 1;
      //dragObj.scaleY = 1;
      //dragObj.cache(0,0,100,100);
      TweenLite.to(dragObj, 0.5, {ease: Back.easeOut, x: dragObj.pos.x, y: dragObj.pos.y, alpha: 1, textShadow:"0px 0px 15px white"});
      dragObj.dispatchEvent('dropped');
  }
  window.Dragtxt = Dragtxt;
}());