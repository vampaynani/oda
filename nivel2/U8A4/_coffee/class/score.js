(function() {
  var Score;

  Score = (function() {
    function Score(name, back, front, x, y, total, count) {
      this.initialize(name, back, front, x, y, total, count);
    }

    Score.prototype = new createjs.Container();

    Score.prototype.Container_initialize = Score.prototype.initialize;

    Score.prototype.initialize = function(name, back, front, x, y, total, count) {
      this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.counter = 0;
      this.bmpBack = new createjs.Bitmap(back);
      this.bmpFront = new createjs.Bitmap(front);
      this.txtTotal = new createjs.Text(total, '48px Quicksand', '#666666');
      this.txtCount = new createjs.Text(count, '48px Quicksand', '#FFFFFF');
      this.bmpBack.x = front.width / 4 * 2;
      this.bmpBack.y = front.height / 4 * 2;
      this.txtTotal.text = total;
      this.txtTotal.textAlign = 'center';
      this.txtTotal.x = this.bmpBack.x + back.width / 2;
      this.txtTotal.y = this.bmpBack.y + back.height / 2 - this.txtTotal.getMeasuredHeight() / 2;
      this.txtCount.text = count;
      this.txtCount.textAlign = 'center';
      this.txtCount.x = this.bmpFront.x + front.width / 2;
      this.txtCount.y = this.bmpFront.y + front.height / 2 - this.txtCount.getMeasuredHeight() / 2;
      this.addChild(this.bmpFront, this.txtCount, this.bmpBack, this.txtTotal);
      return false;
    };

    Score.prototype.reset = function() {
      this.counter = 0;
      return this.updateCount(this.counter);
    };

    Score.prototype.plusOne = function() {
      this.counter++;
      return this.updateCount(this.counter);
    };

    Score.prototype.updateTotal = function(txt) {
      return this.txtTotal.text = txt;
    };

    Score.prototype.updateCount = function(txt) {
      return this.txtCount.text = txt;
    };

    window.Score = Score;

    return Score;

  })();

}).call(this);
