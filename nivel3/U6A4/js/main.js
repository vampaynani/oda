/*

NEW ODA
*/


(function() {
  var U6A4,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U6A4 = (function(_super) {
    __extends(U6A4, _super);

    function U6A4() {
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
          id: 'image1',
          src: 'image_1.png'
        }, {
          id: 'image2',
          src: 'image_2.png'
        }, {
          id: 'image3',
          src: 'image_3.png'
        }, {
          id: 'image4',
          src: 'image_4.png'
        }, {
          id: 'image5',
          src: 'image_5.png'
        }, {
          id: 'image7',
          src: 'image_7.png'
        }, {
          id: 'image9',
          src: 'image_9.png'
        }, {
          src: 'TU3_U6_A4_instructions.mp3',
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
              text: 'Choose the correct answers to the questions.',
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
          total: 10,
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
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did the sand turtle crawl on four legs?',
                      img: {
                        name: 'image7',
                        x: 20,
                        y: 100,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did T-rex live in the ocean?',
                      img: {
                        name: 'image2',
                        x: 20,
                        y: 40,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did the glyptodont fly?',
                      img: {
                        name: 'image9',
                        x: 20,
                        y: 80,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did the saber-toothed fish have a shell?',
                      img: {
                        name: 'image5',
                        x: 20,
                        y: 80,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did the glyptodont live in swamps?',
                      img: {
                        name: 'image9',
                        x: 20,
                        y: 80,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did T-rex eat meat?',
                      img: {
                        name: 'image3',
                        x: 20,
                        y: 60,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did T-rex swim like a fish?',
                      img: {
                        name: 'image1',
                        x: 20,
                        y: 70,
                        scale: 0.45
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did T-rex have sharp teeth?',
                      img: {
                        name: 'image4',
                        x: 20,
                        y: 60,
                        scale: 0.45
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did the sand turtle climb trees?',
                      img: {
                        name: 'image7',
                        x: 20,
                        y: 100,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      label: 'Did the saber-toothed fish have fangs?',
                      img: {
                        name: 'image5',
                        x: 20,
                        y: 80,
                        scale: 0.5
                      },
                      opt1: 'Yes, it did.',
                      opt2: 'No, it didn\'t.'
                    }
                  }
                ]
              ],
              type: 'steps'
            },
            containers: [
              {
                type: 'chs',
                id: 'chs1',
                x: 400,
                y: 100,
                align: 'tc',
                target: 'global',
                "eval": 'global_01',
                label: {
                  font: '18px Quicksand',
                  color: '#333'
                },
                caption: {
                  font: '20px Quicksand',
                  color: '#333'
                },
                bullets: {
                  font: '24px Quicksand',
                  color: '#000',
                  lineWidth: 300
                }
              }
            ],
            groups: []
          }
        ]
      };
      U6A4.__super__.constructor.call(this);
    }

    window.U6A4 = U6A4;

    return U6A4;

  })(Oda);

}).call(this);
