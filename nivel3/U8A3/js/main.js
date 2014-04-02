/*

NEW ODA
*/


(function() {
  var U8A3,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A3 = (function(_super) {
    __extends(U8A3, _super);

    function U8A3() {
      var _this = this;
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
          id: 'btnnext',
          src: 'btn_next.png'
        }, {
          id: 'country',
          src: 'country.png'
        }, {
          id: 'nationality',
          src: 'nationality.png'
        }, {
          id: 'languages',
          src: 'languages.png'
        }, {
          id: 'mapa1',
          src: 'mapa0001.png'
        }, {
          id: 'mapa2',
          src: 'mapa0002.png'
        }, {
          id: 'mapa3',
          src: 'mapa0003.png'
        }, {
          id: 'mapa4',
          src: 'mapa0004.png'
        }, {
          id: 'mapa5',
          src: 'mapa0005.png'
        }, {
          id: 'mapa6',
          src: 'mapa0006.png'
        }, {
          id: 'mapa7',
          src: 'mapa0007.png'
        }, {
          id: 'mapa8',
          src: 'mapa0008.png'
        }, {
          id: 'mapa9',
          src: 'mapa0009.png'
        }, {
          src: 'TU3_U8_A3_instructions.mp3',
          id: 's/instructions'
        }
      ];
      this.clickCountry = function(dispatcher, target) {
        var a, b;
        a = lib[dispatcher];
        b = lib[target];
        if (a.index === b.success) {
          lib.score.plusOne();
          return createjs.Sound.play('s/good');
        } else {
          return lib.scene.fail();
        }
      };
      this.clickNation = function(dispatcher, target) {
        var a, b;
        a = lib[dispatcher];
        b = lib[target];
        if (a.index === b.success) {
          b.complete = true;
          lib.score.plusOne();
          return createjs.Sound.play('s/good');
        } else {
          return lib.scene.fail();
        }
      };
      this.clickLang = function(dispatcher, target) {
        var a;
        a = lib[dispatcher];
        if (a.index === d2oda.evaluator.success) {
          return lib.scene.success();
        } else {
          return lib.scene.fail();
        }
      };
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Look, read and click on the correct options.',
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
          total: 24,
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
                    name: 'mapa',
                    opts: {
                      goto: 7,
                      success: 3
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'This is the most populated country in the world!',
                      success: 1
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'Russia'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'India'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'China'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Chinese'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'Russian'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'Indian'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'Mandarin Chinese',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'Hindi and English',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'Japanese',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }
                ], [
                  {
                    name: 'mapa',
                    opts: {
                      goto: 8,
                      success: 2
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'Kangaroos and koalas live in this country.',
                      success: 1
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'Austria'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'Australia'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'New Zealand',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Australian',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'Asian'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'Austrian'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'English',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'Australian'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'English and 70 Aboriginal languages',
                        y: -5,
                        lineWidth: 100,
                        font: '10px Quicksand'
                      }
                    }
                  }
                ], [
                  {
                    name: 'mapa',
                    opts: {
                      goto: 1,
                      success: 3
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'The inuit people live in the north of this country.',
                      success: 1
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'France'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'Australia'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'Canada',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Canadian',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'French'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'Australian'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'Canadian',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'English and French',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'French',
                        font: '18px Quicksand'
                      }
                    }
                  }
                ], [
                  {
                    name: 'mapa',
                    opts: {
                      goto: 5,
                      success: 2
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'This country is famous for its cheese and chocolate.',
                      success: 3
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'Sweden'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'Switzerland',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'Scotland'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Scottish'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'Swedish'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'Swiss'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'English and Scottish',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'Swiss and French',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'French, German, italian, Romansh',
                        y: -5,
                        lineWidth: 100,
                        font: '10px Quicksand'
                      }
                    }
                  }
                ], [
                  {
                    name: 'mapa',
                    opts: {
                      goto: 4,
                      success: 3
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'This is famous for soccer, tango and beef.',
                      success: 1
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'Uruguay'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'Paraguay'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'Argentina'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Argentinian',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'Paraguayan',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'Uruguayan',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'Spanish',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'Argentinian and Spanish',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'Guaraní',
                        font: '18px Quicksand'
                      }
                    }
                  }
                ], [
                  {
                    name: 'mapa',
                    opts: {
                      goto: 3,
                      success: 1
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'This country is famous for sushi.',
                      success: 3
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'Japan'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'Nippon'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'Jamaica'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Korean',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'Jamaican'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'Japanese'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'English'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'Japanese',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'Mandarin'
                      }
                    }
                  }
                ], [
                  {
                    name: 'mapa',
                    opts: {
                      goto: 2,
                      success: 1
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'Samba comes from this country.',
                      success: 2
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'Brazil'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'Portugal',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'Cuba'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Portuguese',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'Brazilian',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'Cuban',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'Spanish'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'Portuguese'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'Brazilian'
                      }
                    }
                  }
                ], [
                  {
                    name: 'mapa',
                    opts: {
                      goto: 6,
                      success: 2
                    }
                  }, {
                    name: 'lbl1',
                    opts: {
                      text: 'The East and West parts of this country unified in 1990.',
                      success: 3
                    }
                  }, {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'btn_11',
                    opts: {
                      txt: {
                        text: 'Czech Republic',
                        lineWidth: 100,
                        font: '12px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_12',
                    opts: {
                      txt: {
                        text: 'Germany',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_13',
                    opts: {
                      txt: {
                        text: 'Austria'
                      }
                    }
                  }, {
                    name: 'btn_21',
                    opts: {
                      txt: {
                        text: 'Czech',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_22',
                    opts: {
                      txt: {
                        text: 'Austrian',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_23',
                    opts: {
                      txt: {
                        text: 'German',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_31',
                    opts: {
                      txt: {
                        text: 'Czech'
                      }
                    }
                  }, {
                    name: 'btn_32',
                    opts: {
                      txt: {
                        text: 'German',
                        font: '18px Quicksand'
                      }
                    }
                  }, {
                    name: 'btn_33',
                    opts: {
                      txt: {
                        text: 'Austrian'
                      }
                    }
                  }
                ]
              ],
              type: 'steps'
            },
            containers: [
              {
                type: 'spr',
                id: 'mapa',
                imgs: ['mapa1', 'mapa2', 'mapa3', 'mapa4', 'mapa5', 'mapa6', 'mapa7', 'mapa8', 'mapa9'],
                frames: null,
                x: 60,
                y: 150
              }, {
                type: 'lbl',
                id: 'lbl1',
                x: 360,
                y: 510,
                font: '20px Quicksand',
                color: '#333',
                align: 'center'
              }, {
                type: 'img',
                id: 'country',
                x: 656,
                y: 145
              }, {
                type: 'btn',
                id: 'btn_11',
                x: 700,
                y: 175,
                index: 1,
                target: 'mapa',
                "eval": this.clickCountry,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_12',
                x: 700,
                y: 210,
                index: 2,
                target: 'mapa',
                "eval": this.clickCountry,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_13',
                x: 700,
                y: 245,
                index: 3,
                target: 'mapa',
                "eval": this.clickCountry,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'nationality',
                x: 656,
                y: 285
              }, {
                type: 'btn',
                id: 'btn_21',
                x: 700,
                y: 315,
                index: 1,
                target: 'lbl1',
                "eval": this.clickNation,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_22',
                x: 700,
                y: 350,
                index: 2,
                target: 'lbl1',
                "eval": this.clickNation,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_23',
                x: 700,
                y: 385,
                index: 3,
                target: 'lbl1',
                "eval": this.clickNation,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'languages',
                x: 656,
                y: 425
              }, {
                type: 'btn',
                id: 'btn_31',
                x: 700,
                y: 455,
                index: 1,
                target: 'global',
                "eval": this.clickLang,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_32',
                x: 700,
                y: 490,
                index: 2,
                target: 'global',
                "eval": this.clickLang,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_33',
                x: 700,
                y: 525,
                index: 3,
                target: 'global',
                "eval": this.clickLang,
                states: [
                  {
                    txt: {
                      text: '',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand',
                      align: 'center'
                    }
                  }
                ]
              }
            ],
            groups: []
          }
        ]
      };
      U8A3.__super__.constructor.call(this);
    }

    window.U8A3 = U8A3;

    return U8A3;

  })(Oda);

}).call(this);
