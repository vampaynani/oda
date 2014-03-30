/*

NEW ODA
*/


(function() {
  var U4A1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A1 = (function(_super) {
    __extends(U4A1, _super);

    function U4A1() {
      this.manifest = [
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
          id: 'repeat',
          src: 'repeat-btn.png'
        }, {
          id: 'imagebugbite',
          src: 'image_bugbite.png'
        }, {
          id: 'imagechickenpox',
          src: 'image_chickenpox.png'
        }, {
          id: 'imagecold',
          src: 'image_cold.png'
        }, {
          id: 'imagecough',
          src: 'image_cough.png'
        }, {
          id: 'imagecutmyfinger',
          src: 'image_cutmyfinger.png'
        }, {
          id: 'imagecutmyknee',
          src: 'image_cutmyknee.png'
        }, {
          id: 'imageearache',
          src: 'image_earache.png'
        }, {
          id: 'imagefever',
          src: 'image_fever.png'
        }, {
          id: 'imageheadache',
          src: 'image_headache.png'
        }, {
          id: 'imagehiccups',
          src: 'image_hiccups.png'
        }, {
          id: 'imagerunnynose',
          src: 'image_runnynose.png'
        }, {
          id: 'imagesorethroat',
          src: 'image_sorethroat.png'
        }, {
          id: 'imagestomachache',
          src: 'image_stomachache.png'
        }, {
          id: 'imagesunburn',
          src: 'image_sunburn.png'
        }, {
          id: 'imagetoothache',
          src: 'image_toothache.png'
        }, {
          src: 'TU3_U4_A1_instructions.mp3',
          id: 's/instructions'
        }
      ];
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Drag the letters to unscramble the words.',
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
          acolor: '#FE008F',
          bimg: 'c2',
          bcolor: '#0A9BDD'
        },
        scenes: [
          {
            answers: {
              collection: [
                [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagebugbite'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'bug bite',
                      target: 'imagebugbite'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagechickenpox'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'chicken pox',
                      target: 'imagechickenpox'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagecold'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'cold',
                      target: 'imagecold'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagecough'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'cough',
                      target: 'imagecough'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagecutmyfinger'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I',
                      word: 'cut my finger',
                      target: 'imagecutmyfinger'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagecutmyknee'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I',
                      word: 'cut my knee',
                      target: 'imagecutmyknee'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imageearache'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have an',
                      word: 'earache',
                      target: 'imageearache'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagefever'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'fever',
                      target: 'imagefever'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imageheadache'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'headache',
                      target: 'imageheadache'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagehiccups'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have the',
                      word: 'hiccups',
                      target: 'imagehiccups'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagerunnynose'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'runny nose',
                      target: 'imagerunnynose'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagesorethroat'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'sore throat',
                      target: 'imagesorethroat'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagestomachache'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'stomachache',
                      target: 'imagestomachache'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagesunburn'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'sunburn',
                      target: 'imagesunburn'
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'imagetoothache'
                    }
                  }, {
                    name: 'wcpt1',
                    opts: {
                      prev: 'I have a',
                      word: 'toothache',
                      target: 'imagetoothache'
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
                id: 'imagebugbite',
                x: 686,
                y: 161,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagechickenpox',
                x: 395,
                y: 136,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagecold',
                x: 474,
                y: 171,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagecough',
                x: 290,
                y: 161,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagecutmyfinger',
                x: 96,
                y: 400,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagecutmyknee',
                x: 29,
                y: 282,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imageearache',
                x: 180,
                y: 458,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagefever',
                x: 60,
                y: 168,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imageheadache',
                x: 650,
                y: 282,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagehiccups',
                x: 284,
                y: 472,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagerunnynose',
                x: 525,
                y: 428,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagesorethroat',
                x: 658,
                y: 427,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagestomachache',
                x: 186,
                y: 131,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagesunburn',
                x: 422,
                y: 466,
                align: 'tl'
              }, {
                type: 'img',
                id: 'imagetoothache',
                x: 585,
                y: 132,
                align: 'tl'
              }, {
                type: 'swct',
                id: 'wcpt1',
                x: 435,
                y: 350,
                margin: 10,
                uwidth: 30,
                font: '30px Quicksand',
                scolor: '#F00',
                align: 'tc',
                "eval": 'drop_03'
              }
            ],
            groups: [
              {
                type: 'grp',
                id: 'grp1',
                group: ['imagebugbite', 'imagechickenpox', 'imagecold', 'imagecough', 'imagecutmyfinger', 'imagecutmyknee', 'imageearache', 'imagefever', 'imageheadache', 'imagehiccups', 'imagerunnynose', 'imagesorethroat', 'imagestomachache', 'imagesunburn', 'imagetoothache']
              }
            ]
          }
        ]
      };
      U4A1.__super__.constructor.call(this);
    }

    window.U4A1 = U4A1;

    return U4A1;

  })(Oda);

}).call(this);
