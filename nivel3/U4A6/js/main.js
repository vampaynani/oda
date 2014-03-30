/*

NEW ODA
*/


(function() {
  var U4A6,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A6 = (function(_super) {
    __extends(U4A6, _super);

    function U4A6() {
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
          id: 'youshouldcover',
          src: 'youshouldcover.png'
        }, {
          id: 'youshoulddentist',
          src: 'youshoulddentist.png'
        }, {
          id: 'souvenir',
          src: 'souvenir.png'
        }, {
          id: 'alotofcats',
          src: 'a-lot-of-cats.png'
        }, {
          id: 'anap',
          src: 'a-nap.png'
        }, {
          id: 'itakeanap',
          src: 'i-take-a-nap.png'
        }, {
          id: 'itstheirs',
          src: 'its-theirs.png'
        }, {
          id: 'jointheoutdoorsclub',
          src: 'join-the-outdoors-club.png'
        }, {
          id: 'many',
          src: 'many.png'
        }, {
          id: 'notgoodat',
          src: 'not-good-at.png'
        }, {
          id: 'take',
          src: 'take.png'
        }, {
          id: 'thatahealthyhabit',
          src: 'that-a-healthy-habit.png'
        }, {
          id: 'thatsbadadvice',
          src: 'thats-bad-advice.png'
        }, {
          id: 'thereareafew',
          src: 'there-are-a-few.png'
        }, {
          id: 'twodollarsA',
          src: 'two-dollarsA.png'
        }, {
          id: 'twodollarsB',
          src: 'two-dollarsB.png'
        }, {
          id: 'youshould',
          src: 'you-should.png'
        }, {
          src: 'TU3_U4_A6_instructions.mp3',
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
              text: 'Take the review quiz! Click on the correct option.',
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
                      success: 2
                    }
                  }, {
                    name: 'chs1',
                    opts: {
                      type: 'txt',
                      img: {
                        name: 'jointheoutdoorsclub',
                        x: 20,
                        y: 100
                      },
                      opt1: 'Join the Crafts Club.',
                      opt2: 'Join the Outdoors Club.'
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
                      img: {
                        name: 'thatsbadadvice',
                        x: 20,
                        y: 100
                      },
                      opt1: 'That\'s good advice.',
                      opt2: 'That\'s bad advice.'
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
                      img: {
                        name: 'take',
                        x: 20,
                        y: 100
                      },
                      opt1: 'I want to taking violin lessons.',
                      opt2: 'I want to take violin lessons.'
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
                      caption: 'You should cover your mouth when you have',
                      img: {
                        name: 'youshouldcover',
                        x: 20,
                        y: 100
                      },
                      opt1: 'chicken pox.',
                      opt2: 'a cough.'
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
                      img: {
                        name: 'anap',
                        x: 20,
                        y: 100
                      },
                      opt1: 'Grandma is taking a picture.',
                      opt2: 'Grandma is taking a nap.'
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
                      label: 'Whose cat is it?',
                      img: {
                        name: 'itstheirs',
                        x: 20,
                        y: 100
                      },
                      opt1: 'It\'s his.',
                      opt2: 'It\'s theirs.'
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
                      img: {
                        name: 'notgoodat',
                        x: 20,
                        y: 100
                      },
                      opt1: 'He\'s good at taking pictures.',
                      opt2: 'He\'s not good at taking pictures.'
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
                      label: 'I love drinking milk.',
                      img: {
                        name: 'thatahealthyhabit',
                        x: 20,
                        y: 100
                      },
                      opt1: 'That\'s a healthy habit.',
                      opt2: 'That\'s an unhealthy habit.'
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
                      type: 'img',
                      label: 'How much are the pears?',
                      caption: 'They\'re two dollars and thirty cents a kilo.',
                      opt1: 'twodollarsA',
                      opt2: 'twodollarsB'
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
                      img: {
                        name: 'alotofcats',
                        x: 20,
                        y: 100
                      },
                      opt1: 'There are much cats.',
                      opt2: 'There are a lot of cats.'
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
                      label: 'When I\'m sleepy,',
                      img: {
                        name: 'itakeanap',
                        x: 20,
                        y: 100
                      },
                      opt1: 'I take a nap.',
                      opt2: 'I take a test.'
                    }
                  }
                ]
              ],
              mixed: true,
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
                  lineWidth: 300
                }
              }
            ],
            groups: []
          }
        ]
      };
      U4A6.__super__.constructor.call(this);
    }

    window.U4A6 = U4A6;

    return U4A6;

  })(Oda);

}).call(this);
