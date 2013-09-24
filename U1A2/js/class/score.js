(function() {
  var Score = function(name, x, y, back, front, total, count) {
    this.initialize(name, x, y, back, front, total, count);
  }
  var p = Score.prototype = new createjs.Container(); // inherit from Container
  
  p.back;
  p.front;
  p.txtTotal;
  p.txtCount;
  p.count;

  p.Container_initialize = p.initialize;
  p.initialize = function(name, x, y, back, front, total, count) {
    this.Container_initialize();
    this.name = name;
    this.x = x;
    this.y = y;
    this.back = new createjs.Bitmap( back );
    this.front = new createjs.Bitmap( front )
    this.txtTotal = new createjs.Text( total, '24px Arial', '#666666' );
    this.txtCount = new createjs.Text( count, '24px Arial', '#FFFFFF' );
    
    this.back.x = front.width / 4 * 2;
    this.back.y = front.height / 4 * 2;

    this.txtTotal.text = total;
    this.txtTotal.x = this.back.x + back.width/2 - this.txtTotal.getMeasuredWidth()/2;
    this.txtTotal.y = this.back.y + back.height/2 - this.txtTotal.getMeasuredHeight()/2;

    this.txtCount.text = count;
    this.txtCount.x = this.front.x + front.width/2 - this.txtCount.getMeasuredWidth()/2;
    this.txtCount.y = this.front.y + front.height/2 - this.txtCount.getMeasuredHeight()/2;
    
    this.addChild( this.front, this.txtCount, this.back, this.txtTotal );
  }
  p.updateCount = function ( txt ){
    this.txtCount.text = txt;
  }
  window.Score = Score;
}());