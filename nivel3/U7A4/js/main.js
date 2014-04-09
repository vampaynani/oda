/*

NEW ODA
*/


(function() {
  var U7A4,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U7A4 = (function(_super) {
    __extends(U7A4, _super);

    function U7A4() {
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
          id: 'bg',
          src: 'bg.png'
        }, {
          id: 'scene',
          src: 'scene.png'
        }, {
          id: 'finished',
          src: 'btn_finished.png'
        }, {
          id: '1',
          src: '1.png'
        }, {
          id: '2',
          src: '2.png'
        }, {
          id: '3',
          src: '3.png'
        }, {
          id: '4',
          src: '4.png'
        }, {
          id: '5',
          src: '5.png'
        }, {
          id: '6',
          src: '6.png'
        }, {
          id: '7',
          src: '7.png'
        }, {
          id: '8',
          src: '8.png'
        }, {
          id: '9',
          src: '9.png'
        }, {
          id: '10',
          src: '10.png'
        }, {
          id: '1b',
          src: '1b.png'
        }, {
          id: '2b',
          src: '2b.png'
        }, {
          id: '3b',
          src: '3b.png'
        }, {
          id: '4b',
          src: '4b.png'
        }, {
          id: '5b',
          src: '5b.png'
        }, {
          id: '6b',
          src: '6b.png'
        }, {
          id: '7b',
          src: '7b.png'
        }, {
          id: '8b',
          src: '8b.png'
        }, {
          id: '9b',
          src: '9b.png'
        }, {
          id: '10b',
          src: '10b.png'
        }, {
          src: 'TU3_U7_A4_instructions.mp3',
          id: 's/instructions'
        }, {
          src: 'TU3_U7_A4_Instructions2.mp3',
          id: 's/instructions2'
        }
      ];
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Write the past simple form of the verbs.',
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
          acolor: '#0096DB',
          bimg: 'c2',
          bcolor: '#BFD951'
        },
        scenes: [
          {
            answers: {
              collection: [
                [
                  {
                    name: 'wrt1',
                    opts: {
                      text: 'land',
                      success: 'landed'
                    }
                  }, {
                    name: 'wrt2',
                    opts: {
                      text: 'believe',
                      success: 'believed'
                    }
                  }, {
                    name: 'wrt3',
                    opts: {
                      text: 'find',
                      success: 'found'
                    }
                  }, {
                    name: 'wrt4',
                    opts: {
                      text: 'explode',
                      success: 'exploded'
                    }
                  }, {
                    name: 'wrt5',
                    opts: {
                      text: 'invent',
                      success: 'invented'
                    }
                  }
                ], [
                  {
                    name: 'wrt1',
                    opts: {
                      text: 'make',
                      success: 'made'
                    }
                  }, {
                    name: 'wrt2',
                    opts: {
                      text: 'use',
                      success: 'used'
                    }
                  }, {
                    name: 'wrt3',
                    opts: {
                      text: 'kill',
                      success: 'killed'
                    }
                  }, {
                    name: 'wrt4',
                    opts: {
                      text: 'carry',
                      success: 'carried'
                    }
                  }, {
                    name: 'wrt5',
                    opts: {
                      text: 'cause',
                      success: 'caused'
                    }
                  }
                ]
              ],
              type: 'steps'
            },
            containers: [
              {
                type: 'img',
                id: 'scene',
                x: 400,
                y: 340,
                align: 'mc'
              }, {
                type: 'wrt',
                id: 'wrt1',
                x: 260,
                y: 195,
                margin: 5,
                font: '24px Quicksand',
                bcolor: 'rgba(255,255,255,0.1)',
                scolor: '#F00',
                align: 'center'
              }, {
                type: 'wrt',
                id: 'wrt2',
                x: 540,
                y: 195,
                margin: 5,
                font: '24px Quicksand',
                bcolor: 'rgba(255,255,255,0.1)',
                scolor: '#F00',
                align: 'center'
              }, {
                type: 'wrt',
                id: 'wrt3',
                x: 260,
                y: 305,
                margin: 5,
                font: '24px Quicksand',
                bcolor: 'rgba(255,255,255,0.1)',
                scolor: '#F00',
                align: 'center'
              }, {
                type: 'wrt',
                id: 'wrt4',
                x: 540,
                y: 305,
                margin: 5,
                font: '24px Quicksand',
                bcolor: 'rgba(255,255,255,0.1)',
                scolor: '#F00',
                align: 'center'
              }, {
                type: 'wrt',
                id: 'wrt5',
                x: 400,
                y: 425,
                margin: 5,
                font: '24px Quicksand',
                bcolor: 'rgba(255,255,255,0.1)',
                scolor: '#F00',
                align: 'center'
              }, {
                type: 'btn',
                id: 'finish',
                x: 400,
                y: 530,
                target: 'grp1',
                isFinish: true,
                states: [
                  {
                    img: {
                      name: 'finished',
                      x: 0,
                      y: 0,
                      align: 'mc'
                    }
                  }
                ]
              }
            ],
            groups: [
              {
                type: 'grp',
                id: 'grp1',
                group: ['wrt1', 'wrt2', 'wrt3', 'wrt4', 'wrt5']
              }
            ]
          }
        ]
      };
      U7A4.__super__.constructor.call(this);
    }

    window.U7A4 = U7A4;

    return U7A4;

  })(Oda);

}).call(this);
