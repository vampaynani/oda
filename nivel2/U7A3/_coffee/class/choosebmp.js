(function() {
  var ChooseBitmap,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ChooseBitmap = (function() {
    function ChooseBitmap(name, img1, img2, success, x, y) {
      this._dispatchSelection = __bind(this._dispatchSelection, this);
      this.initialize(name, img1, img2, success, x, y);
    }

    ChooseBitmap.prototype = new createjs.Container();

    ChooseBitmap.prototype.Container_initialize = ChooseBitmap.prototype.initialize;

    ChooseBitmap.prototype.initialize = function(name, img1, img2, success, x, y) {
      this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.pos = {
        x: x,
        y: y
      };
      this.success = success;
      this.rand = Math.random() > 0.5 ? 1 : 2;
      this.firstOption = new createjs.Bitmap(img1);
      this.firstOption.width = img1.width;
      this.firstOption.index = 1;
      this.secondOption = new createjs.Bitmap(img2);
      this.secondOption.width = img2.width;
      this.secondOption.index = 2;
      if (this.rand === 1) {
        this.secondOption.x = this.firstOption.width + 20;
      } else {
        this.firstOption.x = this.firstOption.width + 20;
      }
      this.addChild(this.firstOption, this.secondOption);
      return false;
    };

    ChooseBitmap.prototype.initListeners = function() {
      this.firstOption.addEventListener('click', this._dispatchSelection);
      return this.secondOption.addEventListener('click', this._dispatchSelection);
    };

    ChooseBitmap.prototype.setImages = function(img1, img2, success) {
      this.removeAllChildren();
      this.firstOption = new createjs.Bitmap(img1);
      this.firstOption.width = img1.width;
      this.firstOption.index = 1;
      this.secondOption = new createjs.Bitmap(img2);
      this.secondOption.width = img2.width;
      this.secondOption.x = this.firstOption.width + 20;
      this.secondOption.index = 2;
      return this.addChild(this.firstOption, this.secondOption);
    };

    ChooseBitmap.prototype.setDistance = function(dist, w) {
      var width;
      if (this.rand === 1) {
        width = w != null ? w : this.secondOption.width;
        this.secondOption.x = dist;
        return this.regX = this.secondOption.x + width / 2;
      } else {
        width = w != null ? w : this.firstOption.width;
        this.firstOption.x = dist;
        return this.regX = this.firstOption.x + width / 2;
      }
    };

    ChooseBitmap.prototype._dispatchSelection = function(e) {
      if (e.target.index === this.success) {
        if (e.target === this.firstOption) {
          TweenLite.to(this.firstOption, 1, {
            x: this.regX - this.firstOption.width / 2
          });
          TweenLite.to(this.secondOption, 1, {
            alpha: 0
          });
        } else {
          TweenLite.to(this.firstOption, 1, {
            alpha: 0
          });
          TweenLite.to(this.secondOption, 1, {
            x: this.regX + this.secondOption.width / 2
          });
        }
      }
      return this.dispatchEvent({
        type: 'selection',
        success: e.target.index === this.success
      });
    };

    window.ChooseBitmap = ChooseBitmap;

    return ChooseBitmap;

  })();

}).call(this);
