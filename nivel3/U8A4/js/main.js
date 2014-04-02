/*

NEW ODA
*/


(function() {
  var U8A4,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A4 = (function(_super) {
    __extends(U8A4, _super);

    function U8A4() {
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
          id: 'tara',
          src: 'tara_1.png'
        }, {
          id: 'dragblepainting',
          src: 'dragble_painting.png'
        }, {
          id: 'dragblewaterpark',
          src: 'dragble_waterpark.png'
        }, {
          id: 'dragbleicecream',
          src: 'dragble_icecream.png'
        }, {
          id: 'dragblepool',
          src: 'dragble_pool.png'
        }, {
          id: 'dragbleseashells',
          src: 'dragble_seashells.png'
        }, {
          id: 'tyler',
          src: 'tyler_1.png'
        }, {
          id: 'dragbledolphins',
          src: 'dragble_dolphins.png'
        }, {
          id: 'dragbleboooks',
          src: 'dragble_boooks.png'
        }, {
          id: 'dragblesandcastles',
          src: 'dragble_sandcastles.png'
        }, {
          id: 'dragblebike',
          src: 'dragble_bike.png'
        }, {
          id: 'dragblefishing',
          src: 'dragble_fishing.png'
        }, {
          src: 'TU3_U8_A4_instructions.mp3',
          id: 's/instructions'
        }, {
          src: 'TU3_U8_A4_instructions2.mp3',
          id: 's/instructions2'
        }, {
          src: 'TU3_U8_A4_tara.mp3',
          id: 's/tara'
        }, {
          src: 'TU3_U8_A4_tyler.mp3',
          id: 's/tyler'
        }
      ];
      this.onDrop = function(dispatcher, target) {
        var a, b;
        a = lib[dispatcher];
        b = target;
        console.log(a, b);
        if (a.index === b.success) {
          a.afterSuccess();
          b.update();
          b.complete = true;
          return lib.scene.success();
        } else {
          a.afterFail();
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
              text: 'Listen and drag the words to complete the text.',
              sound: 's/instructions',
              played: false
            }, {
              text: 'Listen again and click on the pictures in order.',
              sound: 's/instructions2',
              played: false
            }
          ]
        },
        score: {
          type: 'points',
          x: 20,
          y: 500,
          init: 0,
          total: 20,
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
                    name: 'pcpt1',
                    opts: {
                      pattern: ['Hi! My name\'s Tyler and I live on an island in the gulf of Mexico. I did a lot of fun', '#rtn', 'things last summer.', '#tcpt', ', I went fishing with my dad.', '#tcpt', ', I built sandcastles on', '#rtn', 'the beach with my friends.', '#tcpt', ', my uncle taught me to ride a bike. It was so much', '#rtn', 'fun!', '#tcpt', ', I went swimming with the dolphins that live near the island.', '#tcpt', ',', '#rtn', 'I read some books and watched some cartoons to relax. What a vacation! I\'m really', '#rtn', 'looking forward to the next one!'],
                      targets: [
                        {
                          text: 'First',
                          success: 'first'
                        }, {
                          text: 'Then',
                          success: 'then'
                        }, {
                          text: 'Next',
                          success: 'next'
                        }, {
                          text: 'After that',
                          success: 'after'
                        }, {
                          text: 'Finally',
                          success: 'finally'
                        }
                      ]
                    }
                  }
                ]
              ],
              type: 'steps'
            },
            containers: [
              {
                type: 'img',
                id: 'tyler',
                x: 50,
                y: 160
              }, {
                type: 'pcpt',
                id: 'pcpt1',
                x: 230,
                y: 200,
                font: '13px Roboto',
                margin: 5,
                bcolor: '#f0f5d5',
                stroke: 1,
                scolor: '#eb188e'
              }, {
                type: 'ldrg',
                id: 'ldrg1',
                x: 130,
                y: 140,
                index: 'first',
                text: 'first',
                font: '20px Quicksand',
                color: '#333',
                target: ['pcpt1'],
                "eval": this.onDrop,
                afterSuccess: 'hide',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg2',
                x: 230,
                y: 140,
                index: 'then',
                text: 'then',
                font: '20px Quicksand',
                color: '#333',
                target: ['pcpt1'],
                "eval": this.onDrop,
                afterSuccess: 'hide',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg3',
                x: 330,
                y: 140,
                index: 'next',
                text: 'next',
                font: '20px Quicksand',
                color: '#333',
                target: ['pcpt1'],
                "eval": this.onDrop,
                afterSuccess: 'hide',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg4',
                x: 430,
                y: 140,
                index: 'after',
                text: 'after that',
                font: '20px Quicksand',
                color: '#333',
                target: ['pcpt1'],
                "eval": this.onDrop,
                afterSuccess: 'hide',
                afterFail: 'return'
              }, {
                type: 'ldrg',
                id: 'ldrg5',
                x: 570,
                y: 140,
                index: 'finally',
                text: 'finally',
                font: '20px Quicksand',
                color: '#333',
                target: ['pcpt1'],
                "eval": this.onDrop,
                afterSuccess: 'hide',
                afterFail: 'return'
              }
            ],
            groups: []
          }
        ]
      };
      U8A4.__super__.constructor.call(this);
    }

    window.U8A4 = U8A4;

    return U8A4;

  })(Oda);

}).call(this);
