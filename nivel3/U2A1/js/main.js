/*

NEW ODA
*/


(function() {
  var U2A1,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U2A1 = (function(_super) {
    __extends(U2A1, _super);

    function U2A1() {
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
          id: 'propblueberries',
          src: 'prop_blueberries.png'
        }, {
          id: 'propcheese',
          src: 'prop_cheese.png'
        }, {
          id: 'propcorn',
          src: 'prop_corn.png'
        }, {
          id: 'propeggs',
          src: 'prop_eggs.png'
        }, {
          id: 'propgreenPeppers',
          src: 'prop_greenPeppers.png'
        }, {
          id: 'prophoney',
          src: 'prop_honey.png'
        }, {
          id: 'propmarket',
          src: 'prop_market.png'
        }, {
          id: 'propmeat',
          src: 'prop_meat.png'
        }, {
          id: 'propmilk',
          src: 'prop_milk.png'
        }, {
          id: 'propmushrooms',
          src: 'prop_mushrooms.png'
        }, {
          id: 'proppeaches',
          src: 'prop_peaches.png'
        }, {
          id: 'propPeanutButter',
          src: 'prop_PeanutButter.png'
        }, {
          id: 'proppumpkins',
          src: 'prop_pumpkins.png'
        }, {
          id: 'propraspberries',
          src: 'prop_raspberries.png'
        }, {
          id: 'propstrawberryJelly',
          src: 'prop_strawberryJelly.png'
        }, {
          id: 'propsugar',
          src: 'prop_sugar.png'
        }, {
          id: 'propyogurt',
          src: 'prop_yogurt.png'
        }, {
          id: 'n3',
          src: 'tag_food.png'
        }, {
          id: 'n2',
          src: 'tag_pronoun.png'
        }, {
          id: 'n1',
          src: 'tag_verb.png'
        }, {
          id: 's/instructions',
          src: 'TU3_U2_A1_instructions.mp3'
        }
      ];
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Look and click on the words to make a sentence.',
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
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'propstrawberryJelly'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'isn\'t',
                          success: 'isnt'
                        }, {
                          text: 'any'
                        }, {
                          text: 'strawberry jelly',
                          success: 'strawberryjelly'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'propPeanutButter'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'peanut butter',
                          success: 'peanutbutter'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'propcorn'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'isn\'t',
                          success: 'isnt'
                        }, {
                          text: 'any'
                        }, {
                          text: 'corn'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'propgreenPeppers'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'green peppers',
                          success: 'greenpeppers'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'propmushrooms'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'mushrooms',
                          success: 'mushrooms'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'propblueberries'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'aren\'t',
                          success: 'arent'
                        }, {
                          text: 'any'
                        }, {
                          text: 'blueberries'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'proppeaches'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'aren\'t',
                          success: 'arent'
                        }, {
                          text: 'any'
                        }, {
                          text: 'peaches'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp1',
                    opts: {
                      type: 'blink',
                      target: 'propsugar'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'is'
                        }, {
                          text: 'some'
                        }, {
                          text: 'sugar'
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
                id: 'propmarket',
                x: 400,
                y: 245,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propstrawberryJelly',
                x: 398,
                y: 172,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propPeanutButter',
                x: 555,
                y: 186,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propcorn',
                x: 311,
                y: 233,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propgreenPeppers',
                x: 382,
                y: 252,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propmushrooms',
                x: 458,
                y: 251,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propblueberries',
                x: 528,
                y: 238,
                align: 'mc'
              }, {
                type: 'img',
                id: 'proppeaches',
                x: 618,
                y: 238,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propsugar',
                x: 410,
                y: 339,
                align: 'mc'
              }, {
                type: 'pcpt',
                id: 'pcpt1',
                x: 400,
                y: 540,
                font: '24px Quicksand',
                margin: 10,
                align: 'tc',
                scolor: '#F00'
              }, {
                type: 'img',
                id: 'n1',
                x: 124,
                y: 412
              }, {
                type: 'btn',
                id: 'btn_n11',
                x: 149,
                y: 432,
                index: 'are',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'are',
                      name: 'are',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n12',
                x: 190,
                y: 437,
                index: 'arent',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'aren\'t',
                      name: 'arent',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n13',
                x: 168,
                y: 459,
                index: 'is',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'is',
                      name: 'is',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n14',
                x: 193,
                y: 474,
                index: 'isnt',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'isn\'t',
                      name: 'isnt',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'n2',
                x: 291,
                y: 432
              }, {
                type: 'btn',
                id: 'btn_n21',
                x: 324,
                y: 442,
                index: 'any',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'any',
                      name: 'any',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n22',
                x: 317,
                y: 467,
                index: 'some',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'some',
                      name: 'some',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'n3',
                x: 421,
                y: 383
              }, {
                type: 'btn',
                id: 'btn_n31',
                x: 434,
                y: 417,
                index: 'sugar',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'sugar',
                      name: 'sugar',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n32',
                x: 446,
                y: 458,
                index: 'mushrooms',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'mushrooms',
                      name: 'mushrooms',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n33',
                x: 513,
                y: 400,
                index: 'peaches',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'peaches',
                      name: 'peaches',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n34',
                x: 488,
                y: 432,
                index: 'peanutbutter',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'peanut butter',
                      name: 'peanutbutter',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n35',
                x: 557,
                y: 457,
                index: 'corn',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'corn',
                      name: 'corn',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n36',
                x: 520,
                y: 483,
                index: 'blueberries',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'blueberries',
                      name: 'blueberries',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n37',
                x: 599,
                y: 395,
                index: 'fish',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'fish',
                      name: 'fish',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n38',
                x: 600,
                y: 414,
                index: 'greenpeppers',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'green peppers',
                      name: 'greenpeppers',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n39',
                x: 600,
                y: 452,
                index: 'strawberryjelly',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'strawberry jelly',
                      name: 'strawberryjelly',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n310',
                x: 633,
                y: 489,
                index: 'apples',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'apples',
                      name: 'apples',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }
            ],
            groups: [
              {
                type: 'grp',
                id: 'grp1',
                group: ['propstrawberryJelly', 'propPeanutButter', 'propcorn', 'propgreenPeppers', 'propmushrooms', 'propblueberries', 'proppeaches', 'propsugar']
              }
            ]
          }, {
            answers: {
              collection: [
                [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'propmilk'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'milk'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'prophoney'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'honey'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'propcheese'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'isn\'t',
                          success: 'isnt'
                        }, {
                          text: 'any'
                        }, {
                          text: 'cheese'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'propmeat'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'isn\'t',
                          success: 'isnt'
                        }, {
                          text: 'any'
                        }, {
                          text: 'meat'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'propyogurt'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'yogurt'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'propeggs'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'eggs'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'propraspberries'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'raspberries'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp2',
                    opts: {
                      type: 'blink',
                      target: 'proppumpkins'
                    }
                  }, {
                    name: 'pcpt2',
                    opts: {
                      pattern: ['There', '#tcpt', '#tcpt', '#tcpt'],
                      targets: [
                        {
                          text: 'are'
                        }, {
                          text: 'some'
                        }, {
                          text: 'pumpkins'
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
                id: 'propmarket',
                x: 400,
                y: 235,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propmilk',
                x: 391,
                y: 171,
                align: 'mc'
              }, {
                type: 'img',
                id: 'prophoney',
                x: 554,
                y: 182,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propcheese',
                x: 311,
                y: 225,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propmeat',
                x: 398,
                y: 226,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propyogurt',
                x: 458,
                y: 247,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propeggs',
                x: 522,
                y: 249,
                align: 'mc'
              }, {
                type: 'img',
                id: 'propraspberries',
                x: 593,
                y: 267,
                align: 'mc'
              }, {
                type: 'img',
                id: 'proppumpkins',
                x: 493,
                y: 336,
                align: 'mc'
              }, {
                type: 'pcpt',
                id: 'pcpt2',
                x: 400,
                y: 540,
                font: '24px Quicksand',
                margin: 10,
                align: 'tc',
                scolor: '#F00'
              }, {
                type: 'img',
                id: 'n1',
                x: 124,
                y: 412
              }, {
                type: 'btn',
                id: 'btn_2n11',
                x: 149,
                y: 432,
                index: 'are',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'are',
                      name: 'are',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n12',
                x: 190,
                y: 437,
                index: 'arent',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'aren\'t',
                      name: 'arent',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n13',
                x: 168,
                y: 459,
                index: 'is',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'is',
                      name: 'is',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n14',
                x: 193,
                y: 474,
                index: 'isnt',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'isn\'t',
                      name: 'isnt',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'n2',
                x: 291,
                y: 432
              }, {
                type: 'btn',
                id: 'btn_2n21',
                x: 324,
                y: 442,
                index: 'any',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'any',
                      name: 'any',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n22',
                x: 317,
                y: 467,
                index: 'some',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'some',
                      name: 'some',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'n3',
                x: 421,
                y: 383
              }, {
                type: 'btn',
                id: 'btn_2n31',
                x: 434,
                y: 417,
                index: 'milk',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'milk',
                      name: 'milk',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n32',
                x: 446,
                y: 458,
                index: 'honey',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'honey',
                      name: 'honey',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n33',
                x: 513,
                y: 400,
                index: 'cheese',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'cheese',
                      name: 'cheese',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n34',
                x: 488,
                y: 432,
                index: 'meat',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'meat',
                      name: 'meat',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n35',
                x: 587,
                y: 467,
                index: 'yogurt',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'yogurt',
                      name: 'yogurt',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n36',
                x: 520,
                y: 483,
                index: 'eggs',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'eggs',
                      name: 'eggs',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n37',
                x: 599,
                y: 405,
                index: 'raspberries',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'raspberries',
                      name: 'raspberries',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n38',
                x: 530,
                y: 450,
                index: 'pumpkins',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'pumpkins',
                      name: 'pumpkins',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n39',
                x: 550,
                y: 427,
                index: 'strawberryjelly',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'strawberry jelly',
                      name: 'strawberryjelly',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_2n310',
                x: 633,
                y: 489,
                index: 'apples',
                target: 'pcpt2',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'apples',
                      name: 'apples',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }
            ],
            groups: [
              {
                type: 'grp',
                id: 'grp2',
                group: ['propmilk', 'prophoney', 'propcheese', 'propmeat', 'propyogurt', 'propeggs', 'propraspberries', 'proppumpkins']
              }
            ]
          }
        ]
      };
      U2A1.__super__.constructor.call(this);
    }

    window.U2A1 = U2A1;

    return U2A1;

  })(Oda);

}).call(this);
