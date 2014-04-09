/*

NEW ODA
*/


(function() {
  var U8A6,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A6 = (function(_super) {
    __extends(U8A6, _super);

    function U8A6() {
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
          id: 'babypanda',
          src: 'baby-panda.png'
        }, {
          id: 'bridge',
          src: 'bridge.png'
        }, {
          id: 'compass',
          src: 'compass.png'
        }, {
          id: 'dinosaurlong',
          src: 'dinosaur-long.png'
        }, {
          id: 'dragonfly',
          src: 'dragonfly.png'
        }, {
          id: 'emperorwall',
          src: 'emperor-wall.png'
        }, {
          id: 'fishing',
          src: 'fishing.png'
        }, {
          id: 'garbage1995',
          src: 'garbage-1995.png'
        }, {
          id: 'kidshy',
          src: 'kid-shy.png'
        }, {
          id: 'krakatoa',
          src: 'krakatoa.png'
        }, {
          id: 'lunchlucy',
          src: 'lunch-lucy.png'
        }, {
          id: 'paintcaves',
          src: 'paint-caves.png'
        }, {
          id: 'pollution',
          src: 'pollution.png'
        }, {
          id: 'read',
          src: 'read.png'
        }, {
          id: 'shopping',
          src: 'shopping.png'
        }, {
          id: 'stopdriving',
          src: 'stop-driving.png'
        }, {
          id: 'swimbasket',
          src: 'swim-basket.png'
        }, {
          id: 'turtle',
          src: 'turtle.png'
        }, {
          id: 'wastewater',
          src: 'waste-water.png'
        }, {
          id: 'yaks',
          src: 'yaks.png'
        }, {
          src: 'TU3_U8_A6_instructions.mp3',
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
              text: 'Click on the correct options.',
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
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'mtxt',
                      label: 'When I was a baby...',
                      img: {
                        name: 'babypanda',
                        x: 0,
                        y: 100
                      },
                      opt1: 'I could played with other pandas.',
                      opt2: 'I can play with other pandas.',
                      opt3: 'I could play with other pandas.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'mtxt',
                      img: {
                        name: 'bridge',
                        x: 0,
                        y: 80
                      },
                      opt1: 'There was a bridge.',
                      opt2: 'There were some bridges.',
                      opt3: 'There weren\'t any bridges.'
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
                      type: 'mtxt',
                      img: {
                        name: 'dinosaurlong',
                        x: 0,
                        y: 40
                      },
                      opt1: 'How long was it?',
                      opt2: 'How heavy was it?',
                      opt3: 'How fast was it?',
                      caption: 'Twelve meters.',
                      cy: 420
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
                      type: 'mtxt',
                      img: {
                        name: 'dragonfly',
                        x: 0,
                        y: 100
                      },
                      opt1: 'When did the giant dragonfly live?',
                      opt2: 'Where did the dragonfly live?',
                      opt3: 'What did the dragonfly live?',
                      caption: 'It lived in swamps',
                      cy: 450
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'mtxt',
                      label: 'The Emperor built the wall because...',
                      img: {
                        name: 'emperorwall',
                        x: 0,
                        y: 100
                      },
                      opt1: 'He wanted to atack the nomads.',
                      opt2: 'He wanted the nomads to atack.',
                      opt3: 'He didn\'t want the nomads to atack.'
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
                      type: 'mtxt',
                      label: 'What are Tyler and his dad going to do this summer?',
                      img: {
                        name: 'fishing',
                        x: 0,
                        y: 65
                      },
                      opt1: 'There going to go fishing.',
                      opt2: 'They are going to go fishing.',
                      opt3: 'They\'re going go fishing.'
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
                      type: 'mtxt',
                      img: {
                        name: 'garbage1995',
                        x: 0,
                        y: 50
                      },
                      opt1: 'We didn\'t produce any garbage in Brown Town in 1995.',
                      opt2: 'We produce a lot of garbage in Brown Town in 1995.',
                      opt3: 'We produced some garbage in Brown Town in 1995.'
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
                      type: 'mtxt',
                      img: {
                        name: 'krakatoa',
                        x: 0,
                        y: 70
                      },
                      opt1: 'Was there Krakatoa a volcano?',
                      opt2: 'Was Krakatoa a volcano?',
                      opt3: 'Krakatoa was a volcano?',
                      caption: 'Yes, it was.',
                      cy: 420
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
                      type: 'mtxt',
                      img: {
                        name: 'compass',
                        x: 0,
                        y: 20
                      },
                      opt1: 'Who invented the compass?',
                      opt2: 'Who did invent the compass?',
                      opt3: 'Who did the compass invent?',
                      caption: 'The Chinese',
                      cy: 420
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'mtxt',
                      img: {
                        name: 'lunchlucy',
                        x: 0,
                        y: 70
                      },
                      opt1: 'What did you have for lunch?',
                      opt2: 'Where did you have lunch?',
                      opt3: 'Who did you have lunch with?',
                      caption: 'I had lunch with Lucy.',
                      cy: 420
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'mtxt',
                      img: {
                        name: 'paintcaves',
                        x: 0,
                        y: 70
                      },
                      opt1: 'People didn\'t paint in caves.',
                      opt2: 'People paint in caves.',
                      opt3: 'People painted in caves.'
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
                      type: 'mtxt',
                      img: {
                        name: 'pollution',
                        x: 0,
                        y: 80
                      },
                      opt1: 'There wasn\'t any pollution.',
                      opt2: 'There weren\'t any pollution.',
                      opt3: 'There was a lot of pollution.'
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
                      type: 'mtxt',
                      img: {
                        name: 'read',
                        x: 0,
                        y: 80
                      },
                      label: 'John is at school. When he gets home...',
                      opt1: 'he is going to read a book.',
                      opt2: 'he reads a book.',
                      opt3: 'he read a book.'
                    }
                  }
                ], [
                  {
                    name: 'global',
                    opts: {
                      success: 3
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'mtxt',
                      img: {
                        name: 'shopping',
                        x: 0,
                        y: 80
                      },
                      label: 'What is she going to do this summer?',
                      opt1: 'Is she going to go shopping.',
                      opt2: 'She going to go shopping.',
                      opt3: 'She\'s going to go shopping.'
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
                      type: 'mtxt',
                      img: {
                        name: 'stopdriving',
                        x: 0,
                        y: 80
                      },
                      opt1: 'We have to stop driving cars all day.',
                      opt2: 'We don\'t have to stop driving cars all day.',
                      opt3: 'We have to stop driving red, yellow and white cars.'
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
                      type: 'mtxt',
                      img: {
                        name: 'swimbasket',
                        x: 0,
                        y: 70
                      },
                      label: 'First I went swimming.',
                      opt1: 'Then I played basketball.',
                      opt2: 'Finally I played basketball.',
                      opt3: 'Always I played basketball.'
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
                      type: 'mtxt',
                      img: {
                        name: 'turtle',
                        x: 0,
                        y: 70
                      },
                      label: 'The sand turtle only ate plants.',
                      opt1: 'It was an herbivore.',
                      opt2: 'It wasn\'t an herbivore.',
                      opt3: 'It were an herbivore.'
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
                      type: 'mtxt',
                      img: {
                        name: 'wastewater',
                        x: 0,
                        y: 70
                      },
                      opt1: 'We wasted water.',
                      opt2: 'We saved water.',
                      opt3: 'We didn\'t waste water.'
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
                      type: 'mtxt',
                      img: {
                        name: 'yaks',
                        x: 0,
                        y: 70
                      },
                      opt1: 'A nomad is an animal with a lot of hair.',
                      opt2: 'Yaks eat grass in a field.',
                      opt3: 'A herder takes care of the grass.'
                    }
                  }
                ]
              ],
              type: 'limit',
              limit: 10
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
                  lineWidth: 400
                }
              }
            ],
            groups: []
          }
        ]
      };
      U8A6.__super__.constructor.call(this);
    }

    window.U8A6 = U8A6;

    return U8A6;

  })(Oda);

}).call(this);
