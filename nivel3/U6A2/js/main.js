/*

NEW ODA
*/


(function() {
  var U6A2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U6A2 = (function(_super) {
    __extends(U6A2, _super);

    function U6A2() {
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
          src: 'btn_repeat.png'
        }, {
          id: 'propimg0',
          src: 'prop_img.png'
        }, {
          id: 'propimg1',
          src: 'prop_img1.png'
        }, {
          id: 'propimg2',
          src: 'prop_img2.png'
        }, {
          id: 'propimg3',
          src: 'prop_img3.png'
        }, {
          id: 'propimg4',
          src: 'prop_img4.png'
        }, {
          id: 'propimg5',
          src: 'prop_img5.png'
        }, {
          id: 'tag1',
          src: 'tag_1.png'
        }, {
          id: 'tag1580',
          src: 'tag_1580.png'
        }, {
          id: 'tag2',
          src: 'tag_2.png'
        }, {
          id: 'tag28',
          src: 'tag_28.png'
        }, {
          id: 'tag280',
          src: 'tag_280.png'
        }, {
          id: 'tag3',
          src: 'tag_3.png'
        }, {
          id: 'tag33',
          src: 'tag_33.png'
        }, {
          id: 'tag35',
          src: 'tag_35.png'
        }, {
          id: 'tag4',
          src: 'tag_4.png'
        }, {
          id: 'tag40000',
          src: 'tag_40000.png'
        }, {
          id: 'tag4500',
          src: 'tag_4500.png'
        }, {
          id: 'tag815',
          src: 'tag_815.png'
        }, {
          id: 'tag590',
          src: 'tag_590.png'
        }, {
          id: 'tag900',
          src: 'tag_900.png'
        }, {
          src: 'TU3_U6_A2_instructions.mp3',
          id: 's/instructions'
        }, {
          src: 'TU3_U6_A2_bisonte.mp3',
          id: 's/bisonte'
        }, {
          src: 'TU3_U6_A2_camello.mp3',
          id: 's/camello'
        }, {
          src: 'TU3_U6_A2_dormilon.mp3',
          id: 's/dormilon'
        }, {
          src: 'TU3_U6_A2_mamut.mp3',
          id: 's/mamut'
        }, {
          src: 'TU3_U6_A2_oso.mp3',
          id: 's/oso'
        }, {
          src: 'TU3_U6_A2_sable.mp3',
          id: 's/sable'
        }
      ];
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Listen and drag the numbers to complete the descriptions.',
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
          total: 16,
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
                    name: 'snd',
                    opts: {
                      id: 's/camello'
                    }
                  }, {
                    name: 'grp1_0',
                    opts: {
                      type: 'fadeIn',
                      target: 'propimg0'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['Can you believe that', '#tcpt', 'years ago there', '#rtn', 'were camels in Los Angeles, California? They were', '#rtn', '#tcpt', 'meters tall. They weighed', '#tcpt', 'kilograms.'],
                      targets: [
                        {
                          text: '40,000'
                        }, {
                          text: '4'
                        }, {
                          text: '590'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'snd',
                    opts: {
                      id: 's/dormilon'
                    }
                  }, {
                    name: 'grp1_0',
                    opts: {
                      type: 'fadeIn',
                      target: 'propimg2'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['This animal was a ground slot.', '#rtn', 'It weighted', '#tcpt', 'kilograms and', '#rtn', 'was', '#tcpt', 'meters tall.'],
                      targets: [
                        {
                          text: '1,580'
                        }, {
                          text: '2'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'snd',
                    opts: {
                      id: 's/sable'
                    }
                  }, {
                    name: 'grp1_0',
                    opts: {
                      type: 'fadeIn',
                      target: 'propimg5'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['This animal was a saber-toothed cat. It wasn\'t', '#rtn', 'very big--it was only', '#tcpt', 'meter tall and it weighed', '#rtn', '#tcpt', 'kilograms. But it had long sharp fangs--they', '#rtn', 'were', '#tcpt', 'centimeters long!'],
                      targets: [
                        {
                          text: '1'
                        }, {
                          text: '280'
                        }, {
                          text: '28'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'snd',
                    opts: {
                      id: 's/mamut'
                    }
                  }, {
                    name: 'grp1_0',
                    opts: {
                      type: 'fadeIn',
                      target: 'propimg3'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['This animal was a Columbian mammoth. It was', '#rtn', 'enormous. It weighted', '#tcpt', 'kilograms and was', '#tcpt', '#rtn', 'meters tall. its tusk were', '#tcpt', 'meters long!'],
                      targets: [
                        {
                          text: '4,500'
                        }, {
                          text: '4'
                        }, {
                          text: '3'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'snd',
                    opts: {
                      id: 's/bisonte'
                    }
                  }, {
                    name: 'grp1_0',
                    opts: {
                      type: 'fadeIn',
                      target: 'propimg1'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['This animal was an ancient bison.', '#rtn', 'It was', '#tcpt', 'meters tall and weighed', '#tcpt', 'kilograms.', '#rtn', 'Its horns were', '#tcpt', 'centimeters long.'],
                      targets: [
                        {
                          text: '2'
                        }, {
                          text: '900'
                        }, {
                          text: '35'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'snd',
                    opts: {
                      id: 's/oso'
                    }
                  }, {
                    name: 'grp1_0',
                    opts: {
                      type: 'fadeIn',
                      target: 'propimg4'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['This animal was a short-faced bear.', '#rtn', 'It was much bigger than the modern grizzly bear.', '#rtn', 'It was', '#tcpt', 'meters tall and weighed', '#tcpt', 'kilograms.'],
                      targets: [
                        {
                          text: '3.3'
                        }, {
                          text: '815'
                        }
                      ]
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
                id: 'tag1',
                x: 741,
                y: 315,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag1580',
                x: 702,
                y: 163,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag2',
                x: 70,
                y: 264,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag28',
                x: 668,
                y: 351,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag280',
                x: 151,
                y: 210,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag3',
                x: 158,
                y: 300,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag33',
                x: 602,
                y: 227,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag35',
                x: 715,
                y: 261,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag4',
                x: 616,
                y: 297,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag40000',
                x: 89,
                y: 352,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag4500',
                x: 89,
                y: 159,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag815',
                x: 554,
                y: 152,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag590',
                x: 257,
                y: 162,
                align: 'tc'
              }, {
                type: 'img',
                id: 'tag900',
                x: 339,
                y: 150,
                align: 'tc'
              }, {
                type: 'img',
                id: 'propimg0',
                x: 400,
                y: 320,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propimg1',
                x: 400,
                y: 320,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propimg2',
                x: 400,
                y: 320,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propimg3',
                x: 400,
                y: 320,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propimg4',
                x: 400,
                y: 320,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propimg5',
                x: 400,
                y: 320,
                align: 'mc'
              }, {
                type: 'pcpt',
                id: 'pcpt1',
                x: 400,
                y: 450,
                font: '24px Quicksand',
                margin: 10,
                align: 'tc',
                scolor: '#F00',
                stroke: 1
              }, {
                type: 'ldrg',
                id: 'ldrg1',
                x: 731,
                y: 325,
                index: '1',
                text: '1',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg2',
                x: 672,
                y: 173,
                index: '1,580',
                text: '1,580',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg3',
                x: 60,
                y: 274,
                index: '2',
                text: '2',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg4',
                x: 648,
                y: 361,
                index: '28',
                text: '28',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg5',
                x: 136,
                y: 220,
                index: '280',
                text: '280',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg6',
                x: 148,
                y: 310,
                index: '3',
                text: '3',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg7',
                x: 577,
                y: 237,
                index: '3.3',
                text: '3.3',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg8',
                x: 695,
                y: 271,
                index: '35',
                text: '35',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg9',
                x: 606,
                y: 307,
                index: '4',
                text: '4',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg10',
                x: 45,
                y: 362,
                index: '40,000',
                text: '40,000',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg11',
                x: 59,
                y: 169,
                index: '4,500',
                text: '4,500',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg12',
                x: 524,
                y: 162,
                index: '815',
                text: '815',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg13',
                x: 227,
                y: 172,
                index: '590',
                text: '590',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg14',
                x: 309,
                y: 160,
                index: '900',
                text: '900',
                font: '24px Quicksand',
                color: '#333',
                target: 'pcpt1',
                "eval": 'phrase_drop_01',
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'btn',
                id: 'repeat',
                x: 400,
                y: 570,
                isRepeat: true,
                states: [
                  {
                    img: {
                      name: 'repeat',
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
                id: 'grp1_0',
                invisible: true,
                group: ['propimg0', 'propimg1', 'propimg2', 'propimg3', 'propimg4', 'propimg5']
              }
            ]
          }
        ]
      };
      U6A2.__super__.constructor.call(this);
    }

    window.U6A2 = U6A2;

    return U6A2;

  })(Oda);

}).call(this);
