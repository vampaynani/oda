/*

NEW ODA
*/


(function() {
  var U4A3,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A3 = (function(_super) {
    __extends(U4A3, _super);

    function U4A3() {
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
          id: 'btnConfused',
          src: 'btn_confused.png'
        }, {
          id: 'btnDirty',
          src: 'btn_dirty.png'
        }, {
          id: 'btnEnergetic',
          src: 'btn_energetic.png'
        }, {
          id: 'btnHot',
          src: 'btn_hot.png'
        }, {
          id: 'btnSick',
          src: 'btn_sick.png'
        }, {
          id: 'btnTired',
          src: 'btn_tired.png'
        }, {
          id: 'faceConfused',
          src: 'face_confused.png'
        }, {
          id: 'faceDirty',
          src: 'face_dirty.png'
        }, {
          id: 'faceEnergetic',
          src: 'face_energetic.png'
        }, {
          id: 'faceHot',
          src: 'face_hot.png'
        }, {
          id: 'faceSick',
          src: 'face_sick.png'
        }, {
          id: 'faceTired',
          src: 'face_tired.png'
        }, {
          id: 'n2',
          src: 'tag_answer.png'
        }, {
          id: 'n3',
          src: 'tag_pronoun.png'
        }, {
          id: 'n1',
          src: 'tag_verb.png'
        }, {
          src: 'TU3_U4_A3_instructions.mp3',
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
              text: 'Read and choose the correct picture. Then click on the words to complete the sentence.',
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
          total: 12,
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
                    name: 'grp0',
                    opts: {
                      type: 'fadeIn',
                      target: 'faceDirty'
                    }
                  }, {
                    name: 'grp1',
                    opts: {
                      type: 'success',
                      success: 'btnDirty',
                      targetGroup: 'grp2',
                      nextGroup: 'grp3'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['When I\'m dirty, I', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'take'
                        }, {
                          text: 'a shower',
                          success: 'ashower'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp0',
                    opts: {
                      type: 'fadeIn',
                      target: 'faceTired'
                    }
                  }, {
                    name: 'grp1',
                    opts: {
                      type: 'success',
                      success: 'btnTired',
                      targetGroup: 'grp2',
                      nextGroup: 'grp3'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['When I\'m tired, I', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'go'
                        }, {
                          text: 'to bed',
                          success: 'tobed'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp0',
                    opts: {
                      type: 'fadeIn',
                      target: 'faceConfused'
                    }
                  }, {
                    name: 'grp1',
                    opts: {
                      type: 'success',
                      success: 'btnConfused',
                      targetGroup: 'grp2',
                      nextGroup: 'grp3'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['When I\'m confused, I', '#tcpt', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'ask'
                        }, {
                          text: 'my teacher',
                          success: 'myteacher'
                        }, {
                          text: 'a question',
                          success: 'aquestion'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp0',
                    opts: {
                      type: 'fadeIn',
                      target: 'faceEnergetic'
                    }
                  }, {
                    name: 'grp1',
                    opts: {
                      type: 'success',
                      success: 'btnEnergetic',
                      targetGroup: 'grp2',
                      nextGroup: 'grp3'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['When I\'m energetic, I', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'go'
                        }, {
                          text: 'roller skating',
                          success: 'rollerskating'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp0',
                    opts: {
                      type: 'fadeIn',
                      target: 'faceHot'
                    }
                  }, {
                    name: 'grp1',
                    opts: {
                      type: 'success',
                      success: 'btnHot',
                      targetGroup: 'grp2',
                      nextGroup: 'grp3'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['When I\'m hot, I', '#tcpt', '#tcpt', '#tcpt', ' .'],
                      targets: [
                        {
                          text: 'sit'
                        }, {
                          text: 'in front of',
                          success: 'infrontof'
                        }, {
                          text: 'a fan',
                          success: 'afan'
                        }
                      ]
                    }
                  }
                ], [
                  {
                    name: 'grp0',
                    opts: {
                      type: 'fadeIn',
                      target: 'faceSick'
                    }
                  }, {
                    name: 'grp1',
                    opts: {
                      type: 'success',
                      success: 'btnSick',
                      targetGroup: 'grp2',
                      nextGroup: 'grp3'
                    }
                  }, {
                    name: 'pcpt1',
                    opts: {
                      pattern: ['When I\'m sick, I', '#tcpt', '#tcpt', '.'],
                      targets: [
                        {
                          text: 'go'
                        }, {
                          text: 'to the doctor',
                          success: 'tothedoctor'
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
                id: 'faceSick',
                x: 150,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'faceConfused',
                x: 150,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'faceTired',
                x: 150,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'faceHot',
                x: 150,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'faceDirty',
                x: 150,
                y: 165,
                align: 'mc'
              }, {
                type: 'img',
                id: 'faceEnergetic',
                x: 150,
                y: 165,
                align: 'mc'
              }, {
                type: 'pcpt',
                id: 'pcpt1',
                x: 200,
                y: 165,
                font: '24px Quicksand',
                margin: 10,
                align: 'tl',
                scolor: '#eb188e'
              }, {
                type: 'btn',
                id: 'btn1',
                x: 200,
                y: 275,
                index: 'btnSick',
                target: 'grp1',
                "eval": 'switch_01',
                states: [
                  {
                    img: {
                      name: 'btnSick',
                      x: 0,
                      y: 0,
                      align: 'mc',
                      scale: 0.8
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn2',
                x: 415,
                y: 275,
                index: 'btnConfused',
                target: 'grp1',
                "eval": 'switch_01',
                states: [
                  {
                    img: {
                      name: 'btnConfused',
                      x: 0,
                      y: 0,
                      align: 'mc',
                      scale: 0.8
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn3',
                x: 630,
                y: 275,
                index: 'btnTired',
                target: 'grp1',
                "eval": 'switch_01',
                states: [
                  {
                    img: {
                      name: 'btnTired',
                      x: 0,
                      y: 0,
                      align: 'mc',
                      scale: 0.8
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn4',
                x: 200,
                y: 420,
                index: 'btnHot',
                target: 'grp1',
                "eval": 'switch_01',
                states: [
                  {
                    img: {
                      name: 'btnHot',
                      x: 0,
                      y: 0,
                      align: 'mc',
                      scale: 0.8
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn5',
                x: 415,
                y: 420,
                index: 'btnDirty',
                target: 'grp1',
                "eval": 'switch_01',
                states: [
                  {
                    img: {
                      name: 'btnDirty',
                      x: 0,
                      y: 0,
                      align: 'mc',
                      scale: 0.8
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn6',
                x: 630,
                y: 420,
                index: 'btnEnergetic',
                target: 'grp1',
                "eval": 'switch_01',
                states: [
                  {
                    img: {
                      name: 'btnEnergetic',
                      x: 0,
                      y: 0,
                      align: 'mc',
                      scale: 0.8
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'btnSick',
                x: 400,
                y: 310,
                align: 'mc'
              }, {
                type: 'img',
                id: 'btnConfused',
                x: 400,
                y: 310,
                align: 'mc'
              }, {
                type: 'img',
                id: 'btnTired',
                x: 400,
                y: 310,
                align: 'mc'
              }, {
                type: 'img',
                id: 'btnHot',
                x: 400,
                y: 310,
                align: 'mc'
              }, {
                type: 'img',
                id: 'btnDirty',
                x: 400,
                y: 310,
                align: 'mc'
              }, {
                type: 'img',
                id: 'btnEnergetic',
                x: 400,
                y: 310,
                align: 'mc'
              }, {
                type: 'img',
                id: 'n1',
                x: 110,
                y: 452
              }, {
                type: 'btn',
                id: 'btn_n11',
                x: 141,
                y: 488,
                index: 'go',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'go',
                      name: 'go',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n12',
                x: 179,
                y: 473,
                index: 'take',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'take',
                      name: 'take',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n13',
                x: 177,
                y: 522,
                index: 'sit',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'sit',
                      name: 'sit',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n14',
                x: 217,
                y: 499,
                index: 'ask',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'ask',
                      name: 'ask',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'n2',
                x: 312,
                y: 395
              }, {
                type: 'btn',
                id: 'btn_n21',
                x: 456,
                y: 420,
                index: 'ashower',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'a shower',
                      name: 'ashower',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n22',
                x: 348,
                y: 441,
                index: 'myteacher',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'my teacher',
                      name: 'myteacher',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n23',
                x: 398,
                y: 469,
                index: 'tothedoctor',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'to the doctor',
                      name: 'tothedoctor',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n24',
                x: 328,
                y: 488,
                index: 'infrontof',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'in front of',
                      name: 'infrontof',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n25',
                x: 426,
                y: 508,
                index: 'rollerskating',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'roller skating',
                      name: 'rollerskating',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n26',
                x: 379,
                y: 527,
                index: 'tobed',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'to bed',
                      name: 'tobed',
                      x: 0,
                      y: 0,
                      font: '18px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'n3',
                x: 626,
                y: 459
              }, {
                type: 'btn',
                id: 'btn_n31',
                x: 648,
                y: 480,
                index: 'aquestion',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'a question',
                      name: 'aquestion',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn_n32',
                x: 669,
                y: 516,
                index: 'afan',
                target: 'pcpt1',
                "eval": 'click_O1',
                states: [
                  {
                    txt: {
                      text: 'a fan',
                      name: 'afan',
                      x: 0,
                      y: 0,
                      font: '20px Quicksand'
                    }
                  }
                ]
              }
            ],
            groups: [
              {
                type: 'grp',
                id: 'grp0',
                invisible: true,
                group: ['faceSick', 'faceConfused', 'faceTired', 'faceHot', 'faceDirty', 'faceEnergetic']
              }, {
                type: 'grp',
                id: 'grp1',
                group: ['btn1', 'btn2', 'btn3', 'btn4', 'btn5', 'btn6']
              }, {
                type: 'grp',
                id: 'grp2',
                invisible: true,
                group: ['btnSick', 'btnConfused', 'btnTired', 'btnHot', 'btnDirty', 'btnEnergetic']
              }, {
                type: 'grp',
                id: 'grp3',
                invisible: true,
                group: ['n1', 'btn_n11', 'btn_n12', 'btn_n13', 'btn_n14', 'n2', 'btn_n21', 'btn_n22', 'btn_n23', 'btn_n24', 'btn_n25', 'btn_n26', 'n3', 'btn_n31', 'btn_n32']
              }
            ]
          }
        ]
      };
      U4A3.__super__.constructor.call(this);
    }

    window.U4A3 = U4A3;

    return U4A3;

  })(Oda);

}).call(this);
