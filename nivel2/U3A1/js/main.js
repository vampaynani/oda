// Generated by CoffeeScript 1.6.3
(function() {
  var U3A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U3A1 = (function(_super) {
    __extends(U3A1, _super);

    function U3A1() {
      this.playSound = __bind(this.playSound, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.evaluateDrop = __bind(this.evaluateDrop, this);
      this.initEvaluation = __bind(this.initEvaluation, this);
      var manifest, sounds;
      manifest = [
        {
          id: 'head',
          src: 'pleca.png'
        }, {
          id: 'inst',
          src: 'texto_look.png'
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
          id: 'guia1',
          src: 'guia1.png'
        }, {
          id: 'guia1b',
          src: 'guia1b.png'
        }, {
          id: 'guia2',
          src: 'guia2.png'
        }, {
          id: 'guia2b',
          src: 'guia2b.png'
        }, {
          id: 'guia3',
          src: 'guia3.png'
        }, {
          id: 'guia3b',
          src: 'guia3b.png'
        }, {
          id: 'hojabreakfast',
          src: 'hoja_breakfast.png'
        }, {
          id: 'hojadinner',
          src: 'hoja_dinner.png'
        }, {
          id: 'hojalunch',
          src: 'hoja_lunch.png'
        }, {
          id: 'labelbreakfast',
          src: 'label_breakfast.png'
        }, {
          id: 'labeldinner',
          src: 'label_dinner.png'
        }, {
          id: 'labellunch',
          src: 'label_lunch.png'
        }, {
          id: 'menuback',
          src: 'menuback.png'
        }, {
          id: 'menubreakfast',
          src: 'menu_breakfast.png'
        }, {
          id: 'menudinner',
          src: 'menu_dinner.png'
        }, {
          id: 'menulunch',
          src: 'menu_lunch.png'
        }, {
          id: 'bigm1c1',
          src: 'bigm1c1.png'
        }, {
          id: 'bigm1c2',
          src: 'bigm1c2.png'
        }, {
          id: 'bigm1c3',
          src: 'bigm1c3.png'
        }, {
          id: 'bigm1c4',
          src: 'bigm1c4.png'
        }, {
          id: 'bigm1c5',
          src: 'bigm1c5.png'
        }, {
          id: 'bigm1c6',
          src: 'bigm1c6.png'
        }, {
          id: 'bigm1c7',
          src: 'bigm1c7.png'
        }, {
          id: 'bigm1c8',
          src: 'bigm1c8.png'
        }, {
          id: 'bigm1c9',
          src: 'bigm1c9.png'
        }, {
          id: 'm1c1',
          src: 'm1c1.png'
        }, {
          id: 'm1c2',
          src: 'm1c2.png'
        }, {
          id: 'm1c3',
          src: 'm1c3.png'
        }, {
          id: 'm1c4',
          src: 'm1c4.png'
        }, {
          id: 'm1c5',
          src: 'm1c5.png'
        }, {
          id: 'm1c6',
          src: 'm1c6.png'
        }, {
          id: 'm1c7',
          src: 'm1c7.png'
        }, {
          id: 'm1c8',
          src: 'm1c8.png'
        }, {
          id: 'm1c9',
          src: 'm1c9.png'
        }, {
          id: 'm1c10',
          src: 'm1c10.png'
        }, {
          id: 'm1c11',
          src: 'm1c11.png'
        }, {
          id: 'm1c12',
          src: 'm1c12.png'
        }, {
          id: 'm1c13',
          src: 'm1c13.png'
        }, {
          id: 'm1c14',
          src: 'm1c14.png'
        }, {
          id: 'bigm2c1',
          src: 'bigm2c1.png'
        }, {
          id: 'bigm2c2',
          src: 'bigm2c2.png'
        }, {
          id: 'bigm2c3',
          src: 'bigm2c3.png'
        }, {
          id: 'bigm2c4',
          src: 'bigm2c4.png'
        }, {
          id: 'bigm2c5',
          src: 'bigm2c5.png'
        }, {
          id: 'bigm2c6',
          src: 'bigm2c6.png'
        }, {
          id: 'bigm2c7',
          src: 'bigm2c7.png'
        }, {
          id: 'bigm2c8',
          src: 'bigm2c8.png'
        }, {
          id: 'bigm2c9',
          src: 'bigm2c9.png'
        }, {
          id: 'm2c1',
          src: 'm2c1.png'
        }, {
          id: 'm2c2',
          src: 'm2c2.png'
        }, {
          id: 'm2c3',
          src: 'm2c3.png'
        }, {
          id: 'm2c4',
          src: 'm2c4.png'
        }, {
          id: 'm2c5',
          src: 'm2c5.png'
        }, {
          id: 'm2c6',
          src: 'm2c6.png'
        }, {
          id: 'm2c7',
          src: 'm2c7.png'
        }, {
          id: 'm2c8',
          src: 'm2c8.png'
        }, {
          id: 'm2c9',
          src: 'm2c9.png'
        }, {
          id: 'm2c10',
          src: 'm2c10.png'
        }, {
          id: 'm2c11',
          src: 'm2c11.png'
        }, {
          id: 'm2c12',
          src: 'm2c12.png'
        }, {
          id: 'm2c13',
          src: 'm2c13.png'
        }, {
          id: 'm2c14',
          src: 'm2c14.png'
        }, {
          id: 'bigm3c1',
          src: 'bigm3c1.png'
        }, {
          id: 'bigm3c2',
          src: 'bigm3c2.png'
        }, {
          id: 'bigm3c3',
          src: 'bigm3c3.png'
        }, {
          id: 'bigm3c4',
          src: 'bigm3c4.png'
        }, {
          id: 'bigm3c5',
          src: 'bigm3c5.png'
        }, {
          id: 'bigm3c6',
          src: 'bigm3c6.png'
        }, {
          id: 'bigm3c7',
          src: 'bigm3c7.png'
        }, {
          id: 'bigm3c8',
          src: 'bigm3c8.png'
        }, {
          id: 'bigm3c9',
          src: 'bigm3c9.png'
        }, {
          id: 'm3c1',
          src: 'm3c1.png'
        }, {
          id: 'm3c2',
          src: 'm3c2.png'
        }, {
          id: 'm3c3',
          src: 'm3c3.png'
        }, {
          id: 'm3c4',
          src: 'm3c4.png'
        }, {
          id: 'm3c5',
          src: 'm3c5.png'
        }, {
          id: 'm3c6',
          src: 'm3c6.png'
        }, {
          id: 'm3c7',
          src: 'm3c7.png'
        }, {
          id: 'm3c8',
          src: 'm3c8.png'
        }, {
          id: 'm3c9',
          src: 'm3c9.png'
        }, {
          id: 'm3c10',
          src: 'm3c10.png'
        }, {
          id: 'm3c11',
          src: 'm3c11.png'
        }, {
          id: 'm3c12',
          src: 'm3c12.png'
        }, {
          id: 'm3c13',
          src: 'm3c13.png'
        }, {
          id: 'm3c14',
          src: 'm3c14.png'
        }, {
          id: 'bigm4c1',
          src: 'bigm4c1.png'
        }, {
          id: 'bigm4c2',
          src: 'bigm4c2.png'
        }, {
          id: 'bigm4c3',
          src: 'bigm4c3.png'
        }, {
          id: 'bigm4c4',
          src: 'bigm4c4.png'
        }, {
          id: 'bigm4c5',
          src: 'bigm4c5.png'
        }, {
          id: 'bigm4c6',
          src: 'bigm4c6.png'
        }, {
          id: 'bigm4c7',
          src: 'bigm4c7.png'
        }, {
          id: 'bigm4c8',
          src: 'bigm4c8.png'
        }, {
          id: 'bigm4c9',
          src: 'bigm4c9.png'
        }, {
          id: 'm4c1',
          src: 'm4c1.png'
        }, {
          id: 'm4c2',
          src: 'm4c2.png'
        }, {
          id: 'm4c3',
          src: 'm4c3.png'
        }, {
          id: 'm4c4',
          src: 'm4c4.png'
        }, {
          id: 'm4c5',
          src: 'm4c5.png'
        }, {
          id: 'm4c6',
          src: 'm4c6.png'
        }, {
          id: 'm4c7',
          src: 'm4c7.png'
        }, {
          id: 'm4c8',
          src: 'm4c8.png'
        }, {
          id: 'm4c9',
          src: 'm4c9.png'
        }, {
          id: 'm4c10',
          src: 'm4c10.png'
        }, {
          id: 'm4c11',
          src: 'm4c11.png'
        }, {
          id: 'm4c12',
          src: 'm4c12.png'
        }, {
          id: 'm4c13',
          src: 'm4c13.png'
        }, {
          id: 'm4c14',
          src: 'm4c14.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/TU2_U3_A1_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/TU2_U3_A1_menu1_breakfast.mp3',
          id: 'm1b'
        }, {
          src: 'sounds/TU2_U3_A1_menu1_dinner.mp3',
          id: 'm1d'
        }, {
          src: 'sounds/TU2_U3_A1_menu1_lunch.mp3',
          id: 'm1l'
        }, {
          src: 'sounds/TU2_U3_A1_menu2_breakfast.mp3',
          id: 'm2b'
        }, {
          src: 'sounds/TU2_U3_A1_menu2_dinner.mp3',
          id: 'm2d'
        }, {
          src: 'sounds/TU2_U3_A1_menu2_lunch.mp3',
          id: 'm2l'
        }, {
          src: 'sounds/TU2_U3_A1_menu3_breakfast.mp3',
          id: 'm3b'
        }, {
          src: 'sounds/TU2_U3_A1_menu3_dinner.mp3',
          id: 'm3d'
        }, {
          src: 'sounds/TU2_U3_A1_menu3_lunch.mp3',
          id: 'm3l'
        }, {
          src: 'sounds/TU2_U3_A1_menu4_breakfast.mp3',
          id: 'm4b'
        }, {
          src: 'sounds/TU2_U3_A1_menu4_dinner.mp3',
          id: 'm4d'
        }, {
          src: 'sounds/TU2_U3_A1_menu4_lunch.mp3',
          id: 'm4l'
        }
      ];
      this.game = {
        common: [
          {
            id: 'menuback',
            x: '157',
            y: '121'
          }, {
            id: 'hojabreakfast',
            x: '164',
            y: '132'
          }, {
            id: 'hojadinner',
            x: '510',
            y: '127'
          }, {
            id: 'hojalunch',
            x: '337',
            y: '132'
          }, {
            id: 'menubreakfast',
            x: '174',
            y: '164'
          }, {
            id: 'menudinner',
            x: '526',
            y: '161'
          }, {
            id: 'menulunch',
            x: '349',
            y: '164'
          }, {
            id: 'labelbreakfast',
            x: '214',
            y: '149'
          }, {
            id: 'labeldinner',
            x: '582',
            y: '150'
          }, {
            id: 'labellunch',
            x: '407',
            y: '151'
          }
        ],
        m1: {
          arriba: [
            {
              id: 'bigm1c1',
              x: '185',
              y: '202'
            }, {
              id: 'bigm1c2',
              x: '261',
              y: '202'
            }, {
              id: 'bigm1c3',
              x: '181',
              y: '296'
            }, {
              id: 'bigm1c4',
              x: '352',
              y: '168'
            }, {
              id: 'bigm1c5',
              x: '372',
              y: '234'
            }, {
              id: 'bigm1c6',
              x: '362',
              y: '320'
            }, {
              id: 'bigm1c7',
              x: '534',
              y: '179'
            }, {
              id: 'bigm1c8',
              x: '530',
              y: '254'
            }, {
              id: 'bigm1c9',
              x: '590',
              y: '275'
            }
          ],
          abajo: [
            {
              id: 'm1c1',
              x: '143',
              y: '473'
            }, {
              id: 'm1c2',
              x: '206',
              y: '454'
            }, {
              id: 'm1c3',
              x: '260',
              y: '455'
            }, {
              id: 'm1c4',
              x: '322',
              y: '459'
            }, {
              id: 'm1c5',
              x: '417',
              y: '455'
            }, {
              id: 'm1c6',
              x: '489',
              y: '452'
            }, {
              id: 'm1c7',
              x: '586',
              y: '461'
            }, {
              id: 'm1c8',
              x: '690',
              y: '474'
            }, {
              id: 'm1c9',
              x: '182',
              y: '526'
            }, {
              id: 'm1c10',
              x: '284',
              y: '515'
            }, {
              id: 'm1c11',
              x: '364',
              y: '527'
            }, {
              id: 'm1c12',
              x: '448',
              y: '522'
            }, {
              id: 'm1c13',
              x: '536',
              y: '519'
            }, {
              id: 'm1c14',
              x: '609',
              y: '536'
            }
          ]
        },
        m2: {
          arriba: [
            {
              id: 'bigm2c1',
              x: '181',
              y: '163'
            }, {
              id: 'bigm2c2',
              x: '259',
              y: '232'
            }, {
              id: 'bigm2c3',
              x: '184',
              y: '279'
            }, {
              id: 'bigm2c4',
              x: '353',
              y: '177'
            }, {
              id: 'bigm2c5',
              x: '408',
              y: '274'
            }, {
              id: 'bigm2c6',
              x: '339',
              y: '279'
            }, {
              id: 'bigm2c7',
              x: '548',
              y: '177'
            }, {
              id: 'bigm2c8',
              x: '554',
              y: '245'
            }, {
              id: 'bigm2c9',
              x: '536',
              y: '308'
            }
          ],
          abajo: [
            {
              id: 'm2c1',
              x: '145',
              y: '466'
            }, {
              id: 'm2c2',
              x: '235',
              y: '473'
            }, {
              id: 'm2c3',
              x: '292',
              y: '460'
            }, {
              id: 'm2c4',
              x: '373',
              y: '473'
            }, {
              id: 'm2c5',
              x: '462',
              y: '458'
            }, {
              id: 'm2c6',
              x: '523',
              y: '466'
            }, {
              id: 'm2c7',
              x: '615',
              y: '469'
            }, {
              id: 'm2c8',
              x: '664',
              y: '458'
            }, {
              id: 'm2c9',
              x: '207',
              y: '525'
            }, {
              id: 'm2c10',
              x: '298',
              y: '525'
            }, {
              id: 'm2c11',
              x: '380',
              y: '517'
            }, {
              id: 'm2c12',
              x: '491',
              y: '518'
            }, {
              id: 'm2c13',
              x: '557',
              y: '532'
            }, {
              id: 'm2c14',
              x: '635',
              y: '515'
            }
          ]
        },
        m3: {
          arriba: [
            {
              id: 'bigm3c1',
              x: '189',
              y: '177'
            }, {
              id: 'bigm3c2',
              x: '262',
              y: '217'
            }, {
              id: 'bigm3c3',
              x: '186',
              y: '303'
            }, {
              id: 'bigm3c4',
              x: '364',
              y: '174'
            }, {
              id: 'bigm3c5',
              x: '353',
              y: '251'
            }, {
              id: 'bigm3c6',
              x: '403',
              y: '272'
            }, {
              id: 'bigm3c7',
              x: '534',
              y: '174'
            }, {
              id: 'bigm3c8',
              x: '587',
              y: '249'
            }, {
              id: 'bigm3c9',
              x: '537',
              y: '315'
            }
          ],
          abajo: [
            {
              id: 'm3c1',
              x: '152',
              y: '451'
            }, {
              id: 'm3c2',
              x: '207',
              y: '447'
            }, {
              id: 'm3c3',
              x: '254',
              y: '449'
            }, {
              id: 'm3c4',
              x: '319',
              y: '460'
            }, {
              id: 'm3c5',
              x: '403',
              y: '453'
            }, {
              id: 'm3c6',
              x: '462',
              y: '456'
            }, {
              id: 'm3c7',
              x: '530',
              y: '458'
            }, {
              id: 'm3c8',
              x: '628',
              y: '449'
            }, {
              id: 'm3c9',
              x: '175',
              y: '521'
            }, {
              id: 'm3c10',
              x: '251',
              y: '504'
            }, {
              id: 'm3c11',
              x: '339',
              y: '519'
            }, {
              id: 'm3c12',
              x: '434',
              y: '526'
            }, {
              id: 'm3c13',
              x: '516',
              y: '519'
            }, {
              id: 'm3c14',
              x: '623',
              y: '526'
            }
          ]
        },
        m4: {
          arriba: [
            {
              id: 'bigm4c1',
              x: '184',
              y: '191'
            }, {
              id: 'bigm4c2',
              x: '262',
              y: '227'
            }, {
              id: 'bigm4c3',
              x: '192',
              y: '287'
            }, {
              id: 'bigm4c4',
              x: '351',
              y: '181'
            }, {
              id: 'bigm4c5',
              x: '445',
              y: '235'
            }, {
              id: 'bigm4c6',
              x: '355',
              y: '309'
            }, {
              id: 'bigm4c7',
              x: '535',
              y: '174'
            }, {
              id: 'bigm4c8',
              x: '560',
              y: '241'
            }, {
              id: 'bigm4c9',
              x: '535',
              y: '313'
            }
          ],
          abajo: [
            {
              id: 'm4c1',
              x: '136',
              y: '453'
            }, {
              id: 'm4c2',
              x: '192',
              y: '469'
            }, {
              id: 'm4c3',
              x: '272',
              y: '454'
            }, {
              id: 'm4c4',
              x: '325',
              y: '463'
            }, {
              id: 'm4c5',
              x: '413',
              y: '462'
            }, {
              id: 'm4c6',
              x: '519',
              y: '454'
            }, {
              id: 'm4c7',
              x: '580',
              y: '474'
            }, {
              id: 'm4c8',
              x: '654',
              y: '462'
            }, {
              id: 'm4c9',
              x: '166',
              y: '523'
            }, {
              id: 'm4c10',
              x: '264',
              y: '526'
            }, {
              id: 'm4c11',
              x: '351',
              y: '522'
            }, {
              id: 'm4c12',
              x: '452',
              y: '527'
            }, {
              id: 'm4c13',
              x: '538',
              y: '519'
            }, {
              id: 'm4c14',
              x: '623',
              y: '525'
            }
          ]
        }
      };
      this.answers = {
        m1: [
          {
            sound: 'm1b',
            values: [
              {
                index: 'm1c1',
                r: false
              }, {
                index: 'm1c2',
                r: false
              }, {
                index: 'm1c4',
                r: false
              }
            ],
            target: 'menubreakfast',
            r: false
          }, {
            sound: 'm1l',
            values: [
              {
                index: 'm1c6',
                r: false
              }, {
                index: 'm1c7',
                r: false
              }, {
                index: 'm1c14',
                r: false
              }
            ],
            target: 'menulunch',
            r: false
          }, {
            sound: 'm1d',
            values: [
              {
                index: 'm1c9',
                r: false
              }, {
                index: 'm1c10',
                r: false
              }, {
                index: 'm1c13',
                r: false
              }
            ],
            target: 'menudinner',
            r: false
          }
        ],
        m2: [
          {
            sound: 'm2b',
            values: [
              {
                index: 'm2c3',
                r: false
              }, {
                index: 'm2c9',
                r: false
              }, {
                index: 'm2c12',
                r: false
              }
            ],
            target: 'menubreakfast',
            r: false
          }, {
            sound: 'm2l',
            values: [
              {
                index: 'm2c5',
                r: false
              }, {
                index: 'm2c10',
                r: false
              }, {
                index: 'm2c13',
                r: false
              }
            ],
            target: 'menulunch',
            r: false
          }, {
            sound: 'm2d',
            values: [
              {
                index: 'm2c1',
                r: false
              }, {
                index: 'm2c4',
                r: false
              }, {
                index: 'm2c7',
                r: false
              }
            ],
            target: 'menudinner',
            r: false
          }
        ],
        m3: [
          {
            sound: 'm3b',
            values: [
              {
                index: 'm3c2',
                r: false
              }, {
                index: 'm3c4',
                r: false
              }, {
                index: 'm3c5',
                r: false
              }
            ],
            target: 'menubreakfast',
            r: false
          }, {
            sound: 'm3l',
            values: [
              {
                index: 'm3c8',
                r: false
              }, {
                index: 'm3c10',
                r: false
              }, {
                index: 'm3c14',
                r: false
              }
            ],
            target: 'menulunch',
            r: false
          }, {
            sound: 'm3d',
            values: [
              {
                index: 'm3c9',
                r: false
              }, {
                index: 'm3c11',
                r: false
              }, {
                index: 'm3c12',
                r: false
              }
            ],
            target: 'menudinner',
            r: false
          }
        ],
        m4: [
          {
            sound: 'm4b',
            values: [
              {
                index: 'm4c1',
                r: false
              }, {
                index: 'm4c2',
                r: false
              }, {
                index: 'm4c4',
                r: false
              }
            ],
            target: 'menubreakfast',
            r: false
          }, {
            sound: 'm4l',
            values: [
              {
                index: 'm4c3',
                r: false
              }, {
                index: 'm4c5',
                r: false
              }, {
                index: 'm4c10',
                r: false
              }
            ],
            target: 'menulunch',
            r: false
          }, {
            sound: 'm4d',
            values: [
              {
                index: 'm4c8',
                r: false
              }, {
                index: 'm4c9',
                r: false
              }, {
                index: 'm4c12',
                r: false
              }
            ],
            target: 'menudinner',
            r: false
          }
        ],
        total: 4
      };
      U3A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U3A1.prototype.setStage = function() {
      U3A1.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertBitmap('instructions', 'inst', 20, 100);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 20, 500, 12, 0));
      return this.setDropper().setMenu(1).introEvaluation();
    };

    U3A1.prototype.setDropper = function() {
      var common, i, repeat, v, _i, _ref;
      common = new createjs.Container();
      common.name = 'common';
      repeat = new Button('repeat', this.preload.getResult('repeatbtn'), 0, 404, 413);
      for (i = _i = 1, _ref = this.game.common.length; 1 <= _ref ? _i <= _ref : _i >= _ref; i = 1 <= _ref ? ++_i : --_i) {
        v = this.createBitmap(this.game.common[i - 1].id, this.game.common[i - 1].id, this.game.common[i - 1].x, this.game.common[i - 1].y);
        common.addChild(v);
        this.addToLibrary(v);
        this.addToMain(common, repeat);
      }
      return this;
    };

    U3A1.prototype.setMenu = function(num) {
      var menu, v, value, _i, _len, _ref;
      menu = new createjs.Container();
      menu.name = 'menu';
      _ref = this.game["m" + num].abajo;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        v = new Draggable(value.id, this.preload.getResult(value.id), value.id, value.x, value.y);
        this.observer.subscribe("init_" + num + "_evaluation", v.onInitEvaluation);
        v.addEventListener('drop', this.evaluateDrop);
        menu.addChild(v);
      }
      this.addToMain(menu);
      return this;
    };

    U3A1.prototype.introEvaluation = function() {
      U3A1.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['common'], 1, {
        alpha: 0,
        x: 0,
        delay: 1
      });
      TweenLite.from(this.library['repeat'], 1, {
        alpha: 0,
        y: this.library['repeat'].y + 20,
        delay: 1.2
      });
      return TweenLite.from(this.library['menu'], 1, {
        alpha: 0,
        y: this.library['menu'].y + 20,
        delay: 1.4,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U3A1.prototype.initEvaluation = function(e) {
      U3A1.__super__.initEvaluation.apply(this, arguments);
      this.a_index = 0;
      this.observer.notify("init_" + (this.index + 1) + "_evaluation");
      this.library['repeat'].addEventListener('click', this.playSound);
      return createjs.Sound.play(this.answers["m" + (this.index + 1)][this.a_index].sound);
    };

    U3A1.prototype.evaluateDrop = function(e) {
      var match, pt, value, _i, _len, _ref;
      this.answer = e.target;
      pt = this.library[this.answers["m" + (this.index + 1)][this.a_index].target].globalToLocal(this.stage.mouseX, this.stage.mouseY);
      if (this.library[this.answers["m" + (this.index + 1)][this.a_index].target].hitTest(pt.x, pt.y)) {
        match = false;
        _ref = this.answers["m" + (this.index + 1)][this.a_index].values;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          value = _ref[_i];
          if (this.answer.index === value.index) {
            value.r = true;
            match = true;
          }
        }
        if (match) {
          this.answer.onStopEvaluation();
          return this.evaluateValues();
        } else {
          this.warning();
          return this.answer.returnToPlace();
        }
      } else {
        return this.answer.returnToPlace();
      }
    };

    U3A1.prototype.evaluateValues = function() {
      var complete, value, _i, _len, _ref;
      complete = true;
      _ref = this.answers["m" + (this.index + 1)][this.a_index].values;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        value = _ref[_i];
        if (value.r === false) {
          complete = false;
        }
      }
      if (complete) {
        this.library['score'].plusOne();
        return this.evaluateAnswer();
      }
    };

    U3A1.prototype.evaluateAnswer = function() {
      if (this.a_index < this.answers["m" + (this.index + 1)].length - 1) {
        this.a_index++;
        return this.playSound();
      } else {
        return setTimeout(this.finishEvaluation, 1 * 1000);
      }
    };

    U3A1.prototype.finishEvaluation = function() {
      return TweenLite.to(this.library['menu'], 0.5, {
        alpha: 0,
        y: -200,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U3A1.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.total) {
        this.a_index = 0;
        this.setMenu(this.index + 1);
        this.observer.notify("init_" + (this.index + 1) + "_evaluation");
        return TweenLite.to(this.library['menu'], 0.5, {
          alpha: 1,
          y: 0,
          ease: Back.easeOut,
          onComplete: this.playSound
        });
      } else {
        return this.finish();
      }
    };

    U3A1.prototype.playSound = function() {
      createjs.Sound.stop();
      return createjs.Sound.play(this.answers["m" + (this.index + 1)][this.a_index].sound);
    };

    U3A1.prototype.finish = function() {
      return U3A1.__super__.finish.apply(this, arguments);
    };

    window.U3A1 = U3A1;

    return U3A1;

  })(Oda);

}).call(this);
