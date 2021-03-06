/*

NEW ODA
*/


(function() {
  var U5A3,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U5A3 = (function(_super) {
    __extends(U5A3, _super);

    function U5A3() {
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
          id: 'prof',
          src: 'prop_teacher.png'
        }, {
          id: 'repeat',
          src: 'btn_repeat.png'
        }, {
          id: 'electricity1',
          src: 'electricity_1.png'
        }, {
          id: 'electricity2',
          src: 'electricity_2.png'
        }, {
          id: 'gasoline1',
          src: 'gasoline_1.png'
        }, {
          id: 'gasoline2',
          src: 'gasoline_2.png'
        }, {
          id: 'lights1',
          src: 'lights_1.png'
        }, {
          id: 'lights2',
          src: 'lights_2.png'
        }, {
          id: 'plasticbags1',
          src: 'plasticbags_1.png'
        }, {
          id: 'plasticbags2',
          src: 'plasticbags_2.png'
        }, {
          id: 'pollair1',
          src: 'pollair_1.png'
        }, {
          id: 'pollair2',
          src: 'pollair_2.png'
        }, {
          id: 'pollwater1',
          src: 'pollwater_1.png'
        }, {
          id: 'pollwater2',
          src: 'pollwater_2.png'
        }, {
          id: 'recycle1',
          src: 'recycle_1.png'
        }, {
          id: 'recycle2',
          src: 'recycle_2.png'
        }, {
          id: 'species1',
          src: 'species_1.png'
        }, {
          id: 'species2',
          src: 'species_2.png'
        }, {
          id: 'teeth1',
          src: 'teeth_1.png'
        }, {
          id: 'teeth2',
          src: 'teeth_2.png'
        }, {
          id: 'transport1',
          src: 'transport_1.png'
        }, {
          id: 'transport2',
          src: 'transport_2.png'
        }, {
          id: 'trash1',
          src: 'trash_1.png'
        }, {
          id: 'trash2',
          src: 'trash_2.png'
        }, {
          id: 'water1',
          src: 'water_1.png'
        }, {
          id: 'water2',
          src: 'water_2.png'
        }, {
          src: 'TU3_U5_A3_instructions.mp3',
          id: 's/instructions'
        }, {
          src: 'TU3_U5_A3_saveElectricity.mp3',
          id: 's/electricity1'
        }, {
          src: 'TU3_U5_A3_saveGasoline.mp3',
          id: 's/gasoline1'
        }, {
          src: 'TU3_U5_A3_turnOffLights.mp3',
          id: 's/lights1'
        }, {
          src: 'TU3_U5_A3_reusePlastic.mp3',
          id: 's/plasticbags1'
        }, {
          src: 'TU3_U5_A3_stopPollutingAir.mp3',
          id: 's/pollair1'
        }, {
          src: 'TU3_U5_A3_stopPollutingWater.mp3',
          id: 's/pollwater1'
        }, {
          src: 'TU3_U5_A3_recycle.mp3',
          id: 's/recycle1'
        }, {
          src: 'TU3_U5_A3_protectSpecies.mp3',
          id: 's/species1'
        }, {
          src: 'TU3_U5_A3_turnOffWaterBrushTeeth.mp3',
          id: 's/teeth1'
        }, {
          src: 'TU3_U5_A3_usePublicTransportation.mp3',
          id: 's/transport1'
        }, {
          src: 'TU3_U5_A3_useTrashCan.mp3',
          id: 's/trash1'
        }, {
          src: 'TU3_U5_A3_stopWastingWater.mp3',
          id: 's/water1'
        }
      ];
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Listen and click on the correct picture.',
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
          acolor: '#ff9933',
          bimg: 'c2',
          bcolor: '#bfd951'
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
                    name: 'snd',
                    opts: {
                      id: 's/electricity1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'electricity1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'electricity2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/gasoline1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'gasoline1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'gasoline2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/lights1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'lights1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'lights2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/plasticbags1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'plasticbags1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'plasticbags2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/pollair1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'pollair1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'pollair2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/pollwater1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'pollwater1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'pollwater2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/recycle1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'recycle1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'recycle2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/species1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'species1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'species2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/teeth1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'teeth1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'teeth2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 1
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/transport1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'transport1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'transport2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/trash1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'trash1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'trash2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 2
                    }
                  }, {
                    name: 'snd',
                    opts: {
                      id: 's/water1'
                    }
                  }, {
                    name: 'btn1',
                    opts: {
                      img: {
                        name: 'water1',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }, {
                    name: 'btn2',
                    opts: {
                      img: {
                        name: 'water2',
                        align: 'mc',
                        x: 0,
                        y: 0
                      }
                    }
                  }
                ]
              ],
              type: 'steps',
              mixed: true
            },
            containers: [
              {
                type: 'img',
                id: 'prof',
                x: 550,
                y: 300,
                align: 'mc'
              }, {
                type: 'btn',
                id: 'btn1',
                x: 240,
                y: 222,
                index: 1,
                target: 'global',
                "eval": 'global_01',
                states: [
                  {
                    img: null
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn2',
                x: 240,
                y: 432,
                index: 2,
                target: 'global',
                "eval": 'global_01',
                states: [
                  {
                    img: null
                  }
                ]
              }, {
                type: 'btn',
                id: 'repeat',
                x: 570,
                y: 440,
                align: 'mc',
                isRepeat: true,
                states: [
                  {
                    img: {
                      name: 'repeat',
                      x: 0,
                      y: 0
                    }
                  }
                ]
              }
            ],
            groups: []
          }
        ]
      };
      U5A3.__super__.constructor.call(this);
    }

    window.U5A3 = U5A3;

    return U5A3;

  })(Oda);

}).call(this);
