// Generated by CoffeeScript 1.6.3
(function() {
  var U1A1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U1A1 = (function(_super) {
    __extends(U1A1, _super);

    function U1A1() {
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'head.png'
        }, {
<<<<<<< HEAD
          id: 'yo',
          src: 'nina_jugando.png'
=======
          id: 'borrar',
          src: 'borrar.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
>>>>>>> 7661125581f1a81752bf70f8dce8706a705beb55
        }
      ];
      sounds = [
        {
          id: 'good',
<<<<<<< HEAD
          src: 'boing.mp3'
=======
          src: 'boring.mp3'
>>>>>>> 7661125581f1a81752bf70f8dce8706a705beb55
        }
      ];
      U1A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U1A1.prototype.setStage = function() {
      U1A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', 10, 12);
<<<<<<< HEAD
      this.insertBitmap('pintura', 'yo', 20, 30, 'tr');
      this.addToMain(new Score('score', this.preload.getResult('head'), this.preload.getResult('yo'), 100, 100, 5, 0));
=======
      this.insertBitmap('borrar', 'borrar', 30, 80, 'mc');
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 10, 100, 5, 0));
>>>>>>> 7661125581f1a81752bf70f8dce8706a705beb55
      return this.introEvaluation();
    };

    U1A1.prototype.introEvaluation = function() {
      return TweenLite.from(this.library['header'], 1, {
        alpha: 0,
        y: this.library['header'].y - 20
      });
    };

    window.U1A1 = U1A1;

    return U1A1;

  })(Oda);

}).call(this);
