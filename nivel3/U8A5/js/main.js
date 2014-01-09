// Generated by CoffeeScript 1.6.3
(function() {
  var U8A5,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A5 = (function(_super) {
    var fondo, i, m, _i;

    __extends(U8A5, _super);

    function U8A5() {
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'pleca1.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'playagain',
          src: 'play_again.png'
        }, {
          id: 'startgame',
          src: 'start_game.png'
        }, {
          id: 'propbg',
          src: 'prop_bg.png'
        }, {
          id: 'propwords',
          src: 'prop_words.png'
        }, {
          id: 'img1',
          src: 'img_1.png'
        }, {
          id: 'img2',
          src: 'img_2.png'
        }, {
          id: 'img3',
          src: 'img_3.png'
        }, {
          id: 'img4',
          src: 'img_4.png'
        }, {
          id: 'img5',
          src: 'img_5.png'
        }, {
          id: 'img6',
          src: 'img_6.png'
        }, {
          id: 'img7',
          src: 'img_7.png'
        }, {
          id: 'img8',
          src: 'img_8.png'
        }, {
          id: 'img9',
          src: 'img_9.png'
        }, {
          id: 'img10',
          src: 'img_10.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU3_U8_A5_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        images: [
          {
            id: 'img1',
            x: 660,
            y: 208
          }, {
            id: 'img2',
            x: 642,
            y: 295
          }, {
            id: 'img3',
            x: 594,
            y: 399
          }, {
            id: 'img4',
            x: 487,
            y: 445
          }, {
            id: 'img5',
            x: 275,
            y: 366
          }, {
            id: 'img6',
            x: 407,
            y: 223
          }, {
            id: 'img7',
            x: -8,
            y: 287
          }, {
            id: 'img8',
            x: 430,
            y: 409
          }, {
            id: 'img9',
            x: 490,
            y: 300
          }, {
            id: 'img10',
            x: 658,
            y: 414
          }
        ]
      };
      U8A5.__super__.constructor.call(this, null, manifest, sounds);
    }

    U8A5.prototype.setStage = function() {
      U8A5.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look, read and click on the correct options.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 20, 0));
      return this.setScene();
    };

    U8A5.prototype.setScene = function() {
      var container;
      return container = new createjs.Container();
    };

    fondo = U8A5.createBitmap('propbg', 'propbg', 15, 54);

    container.addChild(fondo);

    for (i = _i = 1; _i <= 10; i = ++_i) {
      m = U8A5.createBitmap(U8A5.game.images[i - 1].id, U8A5.game.images[i - 1].id, U8A5.game.images[i - 1].x, U8A5.game.images[i - 1].y);
      container.addChild(m);
    }

    U8A5.addToMain(container);

    U8A5;

    window.U8A5 = U8A5;

    return U8A5;

  })(Oda);

}).call(this);
