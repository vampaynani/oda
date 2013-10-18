(function() {
  var Scrollable = function(name, x, y) {
    this.initialize(name, x, y);
  }
  var p = Scrollable.prototype = new createjs.Container(); // inherit from Container
  
  p.pos;
  p.num;
  p.sideBack;
  p.arrUp;
  p.arrDwn;
  p.collection;
  p.omask;
  
  p.Container_initialize = p.initialize;
  p.initialize = function(name, x, y) {
    this.Container_initialize();
    this.sideBack = new createjs.Bitmap(imgSideBack);
      this.arrUp = new createjs.Bitmap(imgFlechitaArriba);
      this.arrDwn = new createjs.Bitmap(imgFlechitaAbajo);
      this.collection = new Array();
      this.container = new createjs.Container();
      this.omask = new createjs.Shape();
      
      this.name = name;
      this.x = x;
      this.y = y;
      this.pos = {x:x, y:y};
      this.num = 0;
      
      this.arrUp.x = 70;     
      this.arrUp.y = 7;
      this.arrDwn.x = 70;     
      this.arrDwn.y = 513;
      
      this.omask.x = imgSideBack.width - stage.canvas.width;
      this.omask.y = 24;
      //this.omask.graphics.beginStroke("#FF0").setStrokeStyle(5).drawRect(0,0,stage.canvas.width,imgSideBack.height - 46);
      this.omask.graphics.drawRect(0,0,stage.canvas.width,imgSideBack.height - 46);
      this.container.mask = this.omask;
      this.arrUp.addEventListener('click', this.goUp);
      this.arrDwn.addEventListener('click', this.goDwn);
      
      this.addChild(this.sideBack, this.container, this.arrUp, this.arrDwn, this.omask);
  }
  p.goUp = function(e){
    var scrollable = e.target.parent;
    
    scrollable.num--;
    
    if(scrollable.num >= 0){
      var newY = scrollable.num * -164;
      TweenLite.to(scrollable.container, 0.5, {ease: Back.easeIn, y: newY});
    }else{
      scrollable.num = 0;
    }
  }
  p.goDwn = function(e){
    var scrollable = e.target.parent;
    var total = scrollable.collection.length - 1;
    var remainder = scrollable.collection.length % 3;
    
    scrollable.num++;
    
    if(scrollable.num < total - remainder){
      var newY = scrollable.num * -170 ;
      TweenLite.to(scrollable.container, 0.5, {ease: Back.easeIn, y: newY});
    }else{
      scrollable.num = total - (3 - remainder);
    }
  }
  p.addCollection = function(){
    this.collection = arguments;
    if(arguments.length <= 3){
      this.arrUp.visible = false;
      this.arrDwn.visible = false;
    }
    for(key in this.collection){
      this.collection[key].addEventListener('dropped', updateStage);
      this.container.addChild(this.collection[key]);
    }
  }
  window.Scrollable = Scrollable;
}());