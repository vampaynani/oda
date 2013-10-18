(function() {
  var WordContainer = function(name, text, x, y, w=100, h=20) {
    this.initialize(name, text, x, y, w, h);
  }
  var p = WordContainer.prototype = new createjs.Container(); // inherit from Container
  
  p.txt;
  p.shp;
  p.graphic;

  p.Container_initialize = p.initialize;
  p.initialize = function(name, text, x, y, w, h) {
    this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.txt = new createjs.Text( text, '24px Arial', '#333333' );
      this.graphic = new createjs.Graphics().beginFill( '#f9e5d3' ).drawRect( 0, 0, w, h );
      this.shp = new createjs.Shape( this.graphic );

      this.txt.x = w / 2;

      this.addChild( this.shp, this.txt );
  }
  p.changeText = function ( txt ){
    this.txt.text = txt;
    this.txt.textAlign = 'center';
  }
  p.blink = function(){
    TweenMax.to(this.shp, 0.5, {alpha:.2, repeat:-1, yoyo:true});
  }
  p.noBlink = function(){
    TweenMax.killTweensOf(this.shp);
    this.shp.alpha = 1;
  }
  window.WordContainer = WordContainer;
}());