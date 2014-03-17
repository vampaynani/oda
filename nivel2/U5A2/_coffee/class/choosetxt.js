(function() {
  var ChooseText,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  ChooseText = (function() {
    function ChooseText(name, prev, text1, text2, comp, success, x, y) {
      this._dispatchSelection = __bind(this._dispatchSelection, this);
      this.initialize(name, prev, text1, text2, comp, success, x, y);
    }

    ChooseText.prototype = new createjs.Container();

    ChooseText.prototype.Container_initialize = ChooseText.prototype.initialize;

    ChooseText.prototype.initialize = function(name, prev, text1, text2, comp, success, x, y) {
      var complement;
      this.Container_initialize();
      this.name = name;
      this.x = x;
      this.y = y;
      this.pos = {
        x: x,
        y: y
      };
      this.success = success;
      this.prev = new createjs.Text(prev, '32px Quicksand', '#333333');
      this.firstOption = new ClickableText(text1, text1, 1, this.prev.getMeasuredWidth() + 20, 0);
      this.slash = new createjs.Text('/', '32px Quicksand', '#333333');
      this.slash.x = this.firstOption.x + this.firstOption.width;
      this.secondOption = new ClickableText(text2, text2, 2, this.slash.x + this.slash.getMeasuredWidth() + 20, 0);
      complement = comp != null ? comp : '';
      this.complement = new createjs.Text(complement, '32px Quicksand', '#333333');
      this.complement.x = this.secondOption.x + this.secondOption.width;
      this.width = this.complement.x + this.complement.getMeasuredWidth() + 20;
      this.firstOption.addEventListener('click', this._dispatchSelection);
      this.secondOption.addEventListener('click', this._dispatchSelection);
      this.addChild(this.prev, this.firstOption, this.slash, this.secondOption, this.complement);
      return false;
    };

    ChooseText.prototype._dispatchSelection = function(e) {
      return this.dispatchEvent({
        type: 'selection',
        success: e.currentTarget.index === this.success
      });
    };

    window.ChooseText = ChooseText;

    return ChooseText;

  })();

}).call(this);
