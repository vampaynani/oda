// Generated by CoffeeScript 1.6.3
(function() {
  var U5A3,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A3 = (function(_super) {
    __extends(U5A3, _super);

    function U5A3() {
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'pleca1.png'
        }, {
          id: 'inst',
          src: 'inst.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'repeatbtn',
          src: 'repeat-btn.png'
        }, {
          id: 'playagain',
          src: 'play_again.png'
        }, {
          id: 'startgame',
          src: 'start_game.png'
        }, {
          id: 'propclaw',
          src: 'prop_claw.png'
        }, {
          id: 'propfeather',
          src: 'prop_feather.png'
        }, {
          id: 'propfin',
          src: 'prop_fin.png'
        }, {
          id: 'prophair',
          src: 'prop_hair.png'
        }, {
          id: 'prophead',
          src: 'prop_head.png'
        }, {
          id: 'prophorn',
          src: 'prop_horn.png'
        }, {
          id: 'propleg',
          src: 'prop_leg.png'
        }, {
          id: 'propneck',
          src: 'prop_neck.png'
        }, {
          id: 'proptail',
          src: 'prop_tail.png'
        }, {
          id: 'propteeth',
          src: 'prop_teeth.png'
        }, {
          id: 'proptusk',
          src: 'prop_tusk.png'
        }, {
          id: 'propwing',
          src: 'prop_wing.png'
        }, {
          id: 'propwords',
          src: 'prop_words.png'
        }, {
          id: 'scene2bison',
          src: 'scene2_bison.png'
        }, {
          id: 'scene2mamut',
          src: 'scene2_mamut.png'
        }, {
          id: 'scene2mauisaurus',
          src: 'scene2_mauisaurus.png'
        }, {
          id: 'scene2velociraptor',
          src: 'scene2_velociraptor.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU3_U6_A1_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU3_U6_A1_instructions2.mp3',
          id: 'instructions2'
        }
      ];
      this.game = {
        animales: [
          {
            image: 'scene2velociraptor',
            words: [
              {
                txt: 'claw',
                x: 118,
                y: 327
              }, {
                txt: 'feather',
                x: 135,
                y: 167
              }, {
                txt: 'wing',
                x: 610,
                y: 277
              }, {
                txt: 'teeth',
                x: 590,
                y: 148
              }
            ]
          }, {
            image: 'scene2bison',
            words: [
              {
                txt: 'leg',
                x: 57,
                y: 171
              }, {
                txt: 'horn',
                x: 629,
                y: 38
              }
            ]
          }, {
            image: 'scene2mamut',
            words: [
              {
                txt: 'hair',
                x: 57,
                y: 90
              }, {
                txt: 'tail',
                x: 83,
                y: 291
              }, {
                txt: 'tusk',
                x: 563,
                y: 213
              }
            ]
          }, {
            image: 'scene2mauisaurus',
            words: [
              {
                txt: 'fin',
                x: 57,
                y: 215
              }, {
                txt: 'head',
                x: 588,
                y: 100
              }, {
                txt: 'neck',
                x: 591,
                y: 314
              }
            ]
          }
        ],
        letras3: [
          {
            y: 5
          }, {
            y: 0
          }, {
            y: 5
          }
        ],
        letras4: [
          {
            y: 8
          }, {
            y: 0
          }, {
            y: 0
          }, {
            y: 8
          }
        ],
        letras5: [
          {
            y: 22
          }, {
            y: 5
          }, {
            y: 0
          }, {
            y: 5
          }, {
            y: 22
          }
        ],
        letras7: [
          {
            y: 54
          }, {
            y: 22
          }, {
            y: 5
          }, {
            y: 0
          }, {
            y: 5
          }, {
            y: 22
          }, {
            y: 54
          }
        ],
        toScramble: [
          {
            img: [
              {
                txt: 'tusk',
                id: 'proptusk'
              }, {
                txt: 'fin',
                id: 'propfin'
              }, {
                txt: 'claw',
                id: 'propclaw'
              }
            ]
          }, {
            img: [
              {
                txt: 'horn',
                id: 'prophorn'
              }, {
                txt: 'leg',
                id: 'propleg'
              }, {
                txt: 'feather',
                id: 'propfeather'
              }
            ]
          }, {
            img: [
              {
                txt: 'wing',
                id: 'propwing'
              }, {
                txt: 'neck',
                id: 'propneck'
              }, {
                txt: 'hair',
                id: 'prophair'
              }
            ]
          }, {
            img: [
              {
                txt: 'head',
                id: 'prophead'
              }, {
                txt: 'teeth',
                id: 'propteeth'
              }, {
                txt: 'tail',
                id: 'proptail'
              }
            ]
          }
        ],
        positions: [
          {
            x: 204,
            y: 258
          }, {
            x: 598,
            y: 258
          }, {
            x: 405,
            y: 437
          }
        ],
        palabras: [
          {
            w: 'tusk',
            x: 92,
            y: 65
          }, {
            w: 'fin',
            x: 381,
            y: 25
          }, {
            w: 'claw',
            x: 308,
            y: 58
          }, {
            w: 'horn',
            x: 58,
            y: 35
          }, {
            w: 'leg',
            x: 506,
            y: 64
          }, {
            w: 'feather',
            x: 171,
            y: 29
          }, {
            w: 'wing',
            x: 408,
            y: 51
          }, {
            w: 'neck',
            x: 197,
            y: 59
          }, {
            w: 'hair',
            x: 600,
            y: 70
          }, {
            w: 'head',
            x: 472,
            y: 28
          }, {
            w: 'teeth',
            x: 573,
            y: 33
          }, {
            w: 'tail',
            x: 291,
            y: 25
          }
        ]
      };
      U5A3.__super__.constructor.call(this, null, manifest, sounds);
    }

    U5A3.prototype.setStage = function() {
      U5A3.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look and drag the letters to form a word.', 40, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 20, 0));
      return this.setScrambled(1);
    };

    U5A3.prototype.setScrambled = function(step) {
      var col, container, i, img, j, letra, letras, palabra, wc, _i, _j, _ref;
      this.imagenes = this.game.toScramble[step - 1].img;
      container = new createjs.Container();
      container.name = 'container';
      for (j = _i = 0; _i <= 2; j = ++_i) {
        img = this.createBitmap(this.imagenes[j].id, this.imagenes[j].id, this.game.positions[j].x, this.game.positions[j].y, 'mc');
        this.addToLibrary(img);
        container.addChild(img);
        letras = new createjs.Container();
        palabra = new createjs.Container();
        col = this.imagenes[j].txt.split('');
        this.scrambled = this.shuffle(col);
        for (i = _j = 1, _ref = this.scrambled.length; 1 <= _ref ? _j <= _ref : _j >= _ref; i = 1 <= _ref ? ++_j : --_j) {
          if (this.scrambled[i - 1] !== ' ') {
            if (this.scrambled.length === 3) {
              letra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 30, this.game.letras3[i - 1].y);
            }
            if (this.scrambled.length === 4) {
              letra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 30, this.game.letras4[i - 1].y);
            }
            if (this.scrambled.length === 5) {
              letra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 30, this.game.letras5[i - 1].y);
            }
            if (this.scrambled.length === 7) {
              letra = new DraggableText("t" + i, this.scrambled[i - 1], this.scrambled[i - 1], i * 30, this.game.letras7[i - 1].y);
            }
            letra.text.font = '20px Quicksand';
            letra.createHitArea(28, 30);
            letra.addEventListener('drop', this.evaluateAnswer);
            letra.onInitEvaluation();
            this.addToLibrary(letra);
            letras.addChild(letra);
          }
          if (col[i - 1] !== ' ') {
            wc = new WordContainer("l" + i, '', 'rgba(238,238,238,0.3)', '	#f39234', i * 28, 50, 25, 30);
            wc.index = col[i - 1];
            this.addToLibrary(wc);
            palabra.addChild(wc);
          }
        }
        palabra.name = "palabra";
        palabra.y = this.game.positions[j].y + 35;
        palabra.x = this.game.positions[j].x - this.scrambled.length * 28 / 2 - 28;
        letras.name = "letras";
        letras.y = this.game.positions[j].y - 120;
        letras.x = this.game.positions[j].x - this.scrambled.length * 28 / 2 - 28;
        this.addToMain(letras);
        this.addToMain(palabra);
      }
      this.addToMain(container);
      return this;
    };

    U5A3.prototype.setDrags = function(scene) {
      var animal, fondo, i, img, palabras, wc, word, _i, _j, _ref;
      this.imagenes = this.game.animales[scene - 1];
      animal = new createjs.Container();
      animal.name = 'animal';
      animal.x = 80;
      animal.y = 100;
      img = this.createBitmap(this.imagenes.image, this.imagenes.image, 0, 0);
      this.addToLibrary(img);
      animal.addChild(img);
      console.log(this.imagenes.words[1].x);
      for (i = _i = 1, _ref = this.imagenes.words.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        console.log('hola');
        wc = new WordContainer("wc" + i, '', 'rgba(238,238,238,1)', '#f39234', this.imagenes.words[i - 1].x - 50, this.imagenes.words[i - 1].y - 20);
        this.addToLibrary(wc);
      }
      animal.addChild(wc);
      console.log(this.library['wc1']);
      console.log(this.library['wc2']);
      palabras = new createjs.Container();
      palabras.name = 'palabras';
      palabras.x = 100;
      palabras.y = 480;
      fondo = this.createBitmap('propwords', 'propwords', 15, 10);
      palabras.addChild(fondo);
      for (i = _j = 1; _j <= 12; i = ++_j) {
        word = new DraggableText("w" + i, this.game.palabras[i - 1].w, i, this.game.palabras[i - 1].x, this.game.palabras[i - 1].y);
        word.text.font = '20px Quicksand';
        this.addToLibrary(word);
        palabras.addChild(word);
      }
      this.addToMain(palabras);
      this.addToMain(animal);
      return this;
    };

    window.U5A3 = U5A3;

    return U5A3;

  })(Oda);

}).call(this);
