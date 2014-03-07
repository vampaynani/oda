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
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        common: [
          {
            id: 'menuback',
            x: 314,
            y: 242
          }, {
            id: 'hojabreakfast',
            x: 328,
            y: 264
          }, {
            id: 'hojadinner',
            x: 1020,
            y: 254
          }, {
            id: 'hojalunch',
            x: 674,
            y: 264
          }, {
            id: 'menubreakfast',
            x: 348,
            y: 328
          }, {
            id: 'menudinner',
            x: 1052,
            y: 322
          }, {
            id: 'menulunch',
            x: 698,
            y: 328
          }, {
            id: 'labelbreakfast',
            x: 428,
            y: 298
          }, {
            id: 'labeldinner',
            x: 1164,
            y: 300
          }, {
            id: 'labellunch',
            x: 814,
            y: 302
          }
        ],
        m1: {
          arriba: [
            {
              id: 'bigm1c1',
              x: 370,
              y: 404
            }, {
              id: 'bigm1c2',
              x: 522,
              y: 404
            }, {
              id: 'bigm1c3',
              x: 362,
              y: 592
            }, {
              id: 'bigm1c4',
              x: 704,
              y: 336
            }, {
              id: 'bigm1c5',
              x: 744,
              y: 468
            }, {
              id: 'bigm1c6',
              x: 724,
              y: 640
            }, {
              id: 'bigm1c7',
              x: 1068,
              y: 358
            }, {
              id: 'bigm1c8',
              x: 1060,
              y: 508
            }, {
              id: 'bigm1c9',
              x: 1080,
              y: 550
            }
          ],
          abajo: [
            {
              id: 'm1c1',
              x: 286,
              y: 946
            }, {
              id: 'm1c2',
              x: 412,
              y: 908
            }, {
              id: 'm1c3',
              x: 520,
              y: 910
            }, {
              id: 'm1c4',
              x: 644,
              y: 918
            }, {
              id: 'm1c5',
              x: 834,
              y: 910
            }, {
              id: 'm1c6',
              x: 978,
              y: 904
            }, {
              id: 'm1c7',
              x: 1172,
              y: 922
            }, {
              id: 'm1c8',
              x: 1380,
              y: 948
            }, {
              id: 'm1c9',
              x: 364,
              y: 1052
            }, {
              id: 'm1c10',
              x: 568,
              y: 1030
            }, {
              id: 'm1c11',
              x: 728,
              y: 1054
            }, {
              id: 'm1c12',
              x: 896,
              y: 1044
            }, {
              id: 'm1c13',
              x: 1072,
              y: 1038
            }, {
              id: 'm1c14',
              x: 1218,
              y: 1072
            }
          ]
        },
        m2: {
          arriba: [
            {
              id: 'bigm2c1',
              x: 362,
              y: 326
            }, {
              id: 'bigm2c2',
              x: 518,
              y: 464
            }, {
              id: 'bigm2c3',
              x: 368,
              y: 558
            }, {
              id: 'bigm2c4',
              x: 706,
              y: 354
            }, {
              id: 'bigm2c5',
              x: 816,
              y: 548
            }, {
              id: 'bigm2c6',
              x: 678,
              y: 558
            }, {
              id: 'bigm2c7',
              x: 1096,
              y: 354
            }, {
              id: 'bigm2c8',
              x: 1108,
              y: 490
            }, {
              id: 'bigm2c9',
              x: 1072,
              y: 616
            }
          ],
          abajo: [
            {
              id: 'm2c1',
              x: 290,
              y: 932
            }, {
              id: 'm2c2',
              x: 470,
              y: 946
            }, {
              id: 'm2c3',
              x: 584,
              y: 920
            }, {
              id: 'm2c4',
              x: 746,
              y: 946
            }, {
              id: 'm2c5',
              x: 924,
              y: 916
            }, {
              id: 'm2c6',
              x: 1046,
              y: 932
            }, {
              id: 'm2c7',
              x: 1230,
              y: 938
            }, {
              id: 'm2c8',
              x: 1328,
              y: 916
            }, {
              id: 'm2c9',
              x: 414,
              y: 1050
            }, {
              id: 'm2c10',
              x: 596,
              y: 1050
            }, {
              id: 'm2c11',
              x: 760,
              y: 1034
            }, {
              id: 'm2c12',
              x: 982,
              y: 1036
            }, {
              id: 'm2c13',
              x: 1114,
              y: 1064
            }, {
              id: 'm2c14',
              x: 1270,
              y: 1030
            }
          ]
        },
        m3: {
          arriba: [
            {
              id: 'bigm3c1',
              x: 378,
              y: 354
            }, {
              id: 'bigm3c2',
              x: 524,
              y: 434
            }, {
              id: 'bigm3c3',
              x: 372,
              y: 606
            }, {
              id: 'bigm3c4',
              x: 728,
              y: 348
            }, {
              id: 'bigm3c5',
              x: 706,
              y: 502
            }, {
              id: 'bigm3c6',
              x: 806,
              y: 544
            }, {
              id: 'bigm3c7',
              x: 1068,
              y: 348
            }, {
              id: 'bigm3c8',
              x: 1174,
              y: 498
            }, {
              id: 'bigm3c9',
              x: 1074,
              y: 630
            }
          ],
          abajo: [
            {
              id: 'm3c1',
              x: 304,
              y: 902
            }, {
              id: 'm3c2',
              x: 414,
              y: 894
            }, {
              id: 'm3c3',
              x: 508,
              y: 898
            }, {
              id: 'm3c4',
              x: 638,
              y: 920
            }, {
              id: 'm3c5',
              x: 806,
              y: 906
            }, {
              id: 'm3c6',
              x: 924,
              y: 912
            }, {
              id: 'm3c7',
              x: 1060,
              y: 916
            }, {
              id: 'm3c8',
              x: 1256,
              y: 898
            }, {
              id: 'm3c9',
              x: 350,
              y: 1042
            }, {
              id: 'm3c10',
              x: 502,
              y: 1008
            }, {
              id: 'm3c11',
              x: 678,
              y: 1038
            }, {
              id: 'm3c12',
              x: 868,
              y: 1052
            }, {
              id: 'm3c13',
              x: 1032,
              y: 1038
            }, {
              id: 'm3c14',
              x: 1246,
              y: 1052
            }
          ]
        },
        m4: {
          arriba: [
            {
              id: 'bigm4c1',
              x: 368,
              y: 382
            }, {
              id: 'bigm4c2',
              x: 524,
              y: 454
            }, {
              id: 'bigm4c3',
              x: 384,
              y: 574
            }, {
              id: 'bigm4c4',
              x: 702,
              y: 362
            }, {
              id: 'bigm4c5',
              x: 890,
              y: 470
            }, {
              id: 'bigm4c6',
              x: 710,
              y: 618
            }, {
              id: 'bigm4c7',
              x: 1070,
              y: 348
            }, {
              id: 'bigm4c8',
              x: 1120,
              y: 482
            }, {
              id: 'bigm4c9',
              x: 1070,
              y: 626
            }
          ],
          abajo: [
            {
              id: 'm4c1',
              x: 272,
              y: 906
            }, {
              id: 'm4c2',
              x: 384,
              y: 938
            }, {
              id: 'm4c3',
              x: 544,
              y: 908
            }, {
              id: 'm4c4',
              x: 650,
              y: 926
            }, {
              id: 'm4c5',
              x: 826,
              y: 924
            }, {
              id: 'm4c6',
              x: 1038,
              y: 908
            }, {
              id: 'm4c7',
              x: 1160,
              y: 948
            }, {
              id: 'm4c8',
              x: 1308,
              y: 924
            }, {
              id: 'm4c9',
              x: 332,
              y: 1046
            }, {
              id: 'm4c10',
              x: 528,
              y: 1052
            }, {
              id: 'm4c11',
              x: 702,
              y: 1044
            }, {
              id: 'm4c12',
              x: 904,
              y: 1054
            }, {
              id: 'm4c13',
              x: 1076,
              y: 1038
            }, {
              id: 'm4c14',
              x: 1246,
              y: 1050
            }
          ]
        },
        answers: {
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
        }
      };
      U3A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U3A1.prototype.setStage = function() {
      U3A1.__super__.setStage.apply(this, arguments);
      this.answers = this.clone(this.game.answers);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and drag the foods and drinks to the menu.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 18, 0));
      this.setDropper().setMenu(1).introEvaluation();
      return this.intento = 0;
    };

    U3A1.prototype.setDropper = function() {
      var common, i, repeat, v, _i, _ref;
      common = new createjs.Container();
      common.name = 'common';
      repeat = new Button('repeat', this.preload.getResult('repeatbtn'), 0, 808, 826);
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
        console.log(v.scaleX, v.scaleY);
        v.scaleX = v.scaleY = 0.7;
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
        y: this.library['repeat'].y + 40,
        delay: 1.2
      });
      return TweenLite.from(this.library['menu'], 1, {
        alpha: 0,
        y: this.library['menu'].y + 40,
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
          this.evaluateValues();
          if (this.intento === 0) {
            this.library['score'].plusOne();
          }
          createjs.Sound.play('good');
          return this.intento = 0;
        } else {
          this.warning();
          this.intento = 1;
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
        y: -400,
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
      TweenLite.to(this.library['common'], 1, {
        alpha: 0,
        x: 0
      });
      TweenLite.to(this.library['repeat'], 1, {
        alpha: 0,
        y: this.library['repeat'].y + 40
      });
      TweenLite.to(this.library['menu'], 1, {
        alpha: 0,
        y: this.library['menu'].y + 40
      });
      return U3A1.__super__.finish.apply(this, arguments);
    };

    window.U3A1 = U3A1;

    return U3A1;

  })(Oda);

}).call(this);
