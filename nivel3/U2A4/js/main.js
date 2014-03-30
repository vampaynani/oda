/*

NEW ODA
*/


(function() {
  var U2A4,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A4 = (function(_super) {
    __extends(U2A4, _super);

    function U2A4() {
      this.manifest = [
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
          id: 'imageBacon',
          src: 'image_bacon.png'
        }, {
          id: 'imageButter',
          src: 'image_butter.png'
        }, {
          id: 'imageCheese',
          src: 'image_cheese.png'
        }, {
          id: 'imageCream',
          src: 'image_cream.png'
        }, {
          id: 'imageHoney',
          src: 'image_honey.png'
        }, {
          id: 'imageLeather',
          src: 'image_leather.png'
        }, {
          id: 'imageMushrooms',
          src: 'image_mushrooms.png'
        }, {
          id: 'imagePeanutbutter',
          src: 'image_peanutbutter.png'
        }, {
          id: 'imagePumpkins',
          src: 'image_pumpkins.png'
        }, {
          id: 'imageSugar',
          src: 'image_sugar.png'
        }, {
          id: 'imageTomatoes',
          src: 'image_tomatoes.png'
        }, {
          id: 'imageTurbines',
          src: 'image_turbines.png'
        }, {
          id: 'imageWax',
          src: 'image_wax.png'
        }, {
          id: 'imageYarn',
          src: 'image_yarn.png'
        }, {
          id: 'imageYogurt',
          src: 'image_yogurt.png'
        }, {
          id: 's/instructions',
          src: 'TU3_U2_A4_Instructions.mp3'
        }
      ];
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Drag the letters to write a word.',
              sound: 's/instructions',
              played: false
            }
          ]
        },
        score: {
          type: 'points',
          x: 20,
          y: 500,
          init: 0,
          total: 15,
          aimg: 'c1',
          acolor: '#EB2D3C',
          bimg: 'c2',
          bcolor: '#C3DB5B'
        },
        scenes: [
          {
            answers: {
              collection: [
                [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'bacon',
                      target: 'imageBacon'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'butter',
                      target: 'imageButter'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'cheese',
                      target: 'imageCheese'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'cream',
                      target: 'imageCream'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'honey',
                      target: 'imageHoney'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'leather',
                      target: 'imageLeather'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'mushrooms',
                      target: 'imageMushrooms'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'peanut butter',
                      target: 'imagePeanutbutter'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'pumpkins',
                      target: 'imagePumpkins'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'sugar',
                      target: 'imageSugar'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'tomatoes',
                      target: 'imageTomatoes'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'turbines',
                      target: 'imageTurbines'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'wax',
                      target: 'imageWax'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'yarn',
                      target: 'imageYarn'
                    }
                  }
                ], [
                  {
                    name: 'wcpt1',
                    opts: {
                      word: 'yogurt',
                      target: 'imageYogurt'
                    }
                  }
                ]
              ],
              mixed: true,
              type: 'steps'
            },
            containers: [
              {
                type: 'img',
                id: 'imageBacon',
                x: 118,
                y: 415,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageButter',
                x: 95,
                y: 334,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageCheese',
                x: 176,
                y: 524,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageCream',
                x: 569,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageHoney',
                x: 717,
                y: 282,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageLeather',
                x: 684,
                y: 520,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageMushrooms',
                x: 323,
                y: 177,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imagePeanutbutter',
                x: 540,
                y: 498,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imagePumpkins',
                x: 168,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageSugar',
                x: 149,
                y: 266,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageTomatoes',
                x: 460,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageTurbines',
                x: 679,
                y: 163,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageWax',
                x: 402,
                y: 520,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageYarn',
                x: 701,
                y: 422,
                align: 'mc'
              }, {
                type: 'img',
                id: 'imageYogurt',
                x: 279,
                y: 481,
                align: 'mc'
              }, {
                type: 'swct',
                id: 'wcpt1',
                x: 435,
                y: 310,
                margin: 10,
                uwidth: 30,
                font: '40px Quicksand',
                scolor: '#F00',
                align: 'tc',
                "eval": 'drop_03'
              }
            ],
            groups: []
          }
        ]
      };
      U2A4.__super__.constructor.call(this);
    }

    window.U2A4 = U2A4;

    return U2A4;

  })(Oda);

}).call(this);
