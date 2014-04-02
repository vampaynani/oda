/*

NEW ODA
*/


(function() {
  var U8A2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U8A2 = (function(_super) {
    __extends(U8A2, _super);

    function U8A2() {
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
          id: 'btnrepeat',
          src: 'btn_repeat.png'
        }, {
          id: 'menuAshton',
          src: 'ashton.png'
        }, {
          id: 'menuCarla',
          src: 'carla.png'
        }, {
          id: 'menuEva',
          src: 'eva.png'
        }, {
          id: 'menuJack',
          src: 'jack.png'
        }, {
          id: 'menuKevin',
          src: 'kevin.png'
        }, {
          id: 'menuMarissa',
          src: 'marissa.png'
        }, {
          id: 'menuRenee',
          src: 'renee.png'
        }, {
          id: 'menuSam',
          src: 'sam.png'
        }, {
          id: 'menuWilson',
          src: 'wilson.png'
        }, {
          id: 'centerAshton',
          src: 'b_ashton.png'
        }, {
          id: 'centerCarla',
          src: 'b_carla.png'
        }, {
          id: 'centerEva',
          src: 'b_eva.png'
        }, {
          id: 'centerJack',
          src: 'b_jack.png'
        }, {
          id: 'centerKevin',
          src: 'b_kevin.png'
        }, {
          id: 'centerMarissa',
          src: 'b_marissa.png'
        }, {
          id: 'centerRenee',
          src: 'b_renee.png'
        }, {
          id: 'centerSam',
          src: 'b_sam.png'
        }, {
          id: 'centerWilson',
          src: 'b_wilson.png'
        }, {
          id: 'caja0Ashton',
          src: 'caja_ashton.png'
        }, {
          id: 'caja1Ashton',
          src: 'caja1_ashton.png'
        }, {
          id: 'caja0Carla',
          src: 'caja_carla.png'
        }, {
          id: 'caja1Carla',
          src: 'caja1_carla.png'
        }, {
          id: 'caja0Eva',
          src: 'caja_eva.png'
        }, {
          id: 'caja1Eva',
          src: 'caja1_eva.png'
        }, {
          id: 'caja0Jack',
          src: 'caja_jack.png'
        }, {
          id: 'caja1Jack',
          src: 'caja1_jack.png'
        }, {
          id: 'caja0Kevin',
          src: 'caja_kevin.png'
        }, {
          id: 'caja1Kevin',
          src: 'caja1_kevin.png'
        }, {
          id: 'caja0Marissa',
          src: 'caja_marissa.png'
        }, {
          id: 'caja1Marissa',
          src: 'caja1_marissa.png'
        }, {
          id: 'caja0Renee',
          src: 'caja_renee.png'
        }, {
          id: 'caja1Renee',
          src: 'caja1_renee.png'
        }, {
          id: 'caja0Sam',
          src: 'caja_sam.png'
        }, {
          id: 'caja1Sam',
          src: 'caja1_sam.png'
        }, {
          id: 'caja0Wilson',
          src: 'caja_wilson.png'
        }, {
          id: 'caja1Wilson',
          src: 'caja1_wilson.png'
        }, {
          id: 'globo0Ashton',
          src: 'globo_ashton.png'
        }, {
          id: 'globo1Ashton',
          src: 'globo1_ashton.png'
        }, {
          id: 'globo0Carla',
          src: 'globo00_carla.png'
        }, {
          id: 'globo1Carla',
          src: 'globo01_carla.png'
        }, {
          id: 'globo0Eva',
          src: 'globo_eva.png'
        }, {
          id: 'globo1Eva',
          src: 'globo1_eva.png'
        }, {
          id: 'globo0Jack',
          src: 'globo_jack.png'
        }, {
          id: 'globo1Jack',
          src: 'globo1_jack.png'
        }, {
          id: 'globo0Kevin',
          src: 'globo_kevin.png'
        }, {
          id: 'globo1Kevin',
          src: 'globo1_kevin.png'
        }, {
          id: 'globo0Marissa',
          src: 'globo_marissa.png'
        }, {
          id: 'globo1Marissa',
          src: 'globo1_marissa.png'
        }, {
          id: 'globo0Renee',
          src: 'globo_renee.png'
        }, {
          id: 'globo1Renee',
          src: 'globo1_renee.png'
        }, {
          id: 'globo0Sam',
          src: 'globo_sam.png'
        }, {
          id: 'globo1Sam',
          src: 'globo1_sam.png'
        }, {
          id: 'globo0Wilson',
          src: 'globo_wilson.png'
        }, {
          id: 'globo1Wilson',
          src: 'globo1_wilson.png'
        }, {
          id: 'ballonAshtonDragble',
          src: 'ballon_ashton_dragble.png'
        }, {
          id: 'ballonCarlaDragble',
          src: 'ballon_carla_dragble.png'
        }, {
          id: 'ballonEvaDragble',
          src: 'ballon_eva_dragble.png'
        }, {
          id: 'ballonJackDragble',
          src: 'ballon_jack_dragble.png'
        }, {
          id: 'ballonKevinDragble',
          src: 'ballon_kevin_dragble.png'
        }, {
          id: 'ballonMarissaDragble',
          src: 'ballon_marissa_dragble.png'
        }, {
          id: 'ballonReneeDragble',
          src: 'ballon_renee_dragble.png'
        }, {
          id: 'ballonSamDragble',
          src: 'ballon_sam_dragble.png'
        }, {
          id: 'ballonWilsonDragble',
          src: 'ballon_wilson_dragble.png'
        }, {
          id: 'imageAshtonDragble',
          src: 'image_ashton_dragble.png'
        }, {
          id: 'imageCarlaDragble',
          src: 'image_carla_dragble.png'
        }, {
          id: 'imageEvaDragble',
          src: 'image_eva_dragble.png'
        }, {
          id: 'imageJackDragble',
          src: 'image_jack_dragble.png'
        }, {
          id: 'imageKevinDragble',
          src: 'image_kevin_dragble.png'
        }, {
          id: 'imageMarissaDragble',
          src: 'image_marissa_dragble.png'
        }, {
          id: 'imageReneeDragble',
          src: 'image_renee_dragble.png'
        }, {
          id: 'imageSamDragble',
          src: 'image_sam_dragble.png'
        }, {
          id: 'imageWilsonDragble',
          src: 'image_wilson_dragble.png'
        }, {
          src: 'TU3_U8_A2_instructions.mp3',
          id: 's/instructions'
        }, {
          src: 'TU3_U8_A2_ashton.mp3',
          id: 's/Ashton'
        }, {
          src: 'TU3_U8_A2_carla.mp3',
          id: 's/Carla'
        }, {
          src: 'TU3_U8_A2_eva.mp3',
          id: 's/Eva'
        }, {
          src: 'TU3_U8_A2_jack.mp3',
          id: 's/Jack'
        }, {
          src: 'TU3_U8_A2_kevin.mp3',
          id: 's/Kevin'
        }, {
          src: 'TU3_U8_A2_marissa.mp3',
          id: 's/Marissa'
        }, {
          src: 'TU3_U8_A2_renee.mp3',
          id: 's/Renee'
        }, {
          src: 'TU3_U8_A2_sam.mp3',
          id: 's/Sam'
        }, {
          src: 'TU3_U8_A2_wilson.mp3',
          id: 's/Wilson'
        }
      ];
      this.btnClick = function(dispatcher, target) {
        _this.selection = lib[dispatcher].index;
        lib[dispatcher].scaleX = lib[dispatcher].scaleY = 1;
        lib[dispatcher].removeAllEventListeners();
        lib.grp_buttons.update({
          type: 'fadeOut'
        });
        lib.grp_center.update({
          type: 'fadeIn',
          ignoreY: true,
          ignoreCurrentAlpha: true,
          target: "center" + _this.selection
        });
        lib.grp_caja.update({
          type: 'fadeIn',
          ignoreY: true,
          ignoreCurrentAlpha: true,
          target: "caja" + _this.selection
        });
        lib.grp_globo.update({
          type: 'fadeIn',
          ignoreY: true,
          ignoreCurrentAlpha: true,
          target: "globo" + _this.selection
        });
        lib.grp_drags.update({
          type: 'fadeIn'
        });
        lib.scene.snd = "s/" + _this.selection;
        createjs.Sound.stop();
        createjs.Sound.play("s/" + _this.selection);
        return lib.repeat.alpha = 1;
      };
      this.drgDrop = function(dispatcher, target) {
        var a, b;
        a = lib[dispatcher];
        b = target.parent;
        if (a.index === b.success) {
          b.goto(1);
          a.afterSuccess();
          lib.scene.success(true, false);
        } else {
          a.afterFail();
          lib.scene.fail();
        }
        if (lib["globo" + _this.selection].sprite.currentFrame === 1 && lib["caja" + _this.selection].sprite.currentFrame === 1) {
          return d2oda.methods.delay(1000, function() {
            lib.grp_center.update({
              type: 'fadeOut',
              ignoreY: true,
              ignoreCurrentAlpha: true
            });
            lib.grp_caja.update({
              type: 'fadeOut',
              ignoreY: true,
              ignoreCurrentAlpha: true
            });
            lib.grp_globo.update({
              type: 'fadeOut',
              ignoreY: true,
              ignoreCurrentAlpha: true
            });
            lib.grp_buttons.update({
              type: 'fadeIn'
            });
            lib.grp_drags.update({
              type: 'fadeOut'
            });
            return lib.repeat.alpha = 0;
          });
        }
      };
      this.game = {
        header: 'head',
        instructions: {
          x: 40,
          y: 100,
          states: [
            {
              text: 'Click, listen and match.',
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
          total: 18,
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
                    name: 'grp_buttons',
                    opts: {
                      type: 'fadeIn'
                    }
                  }, {
                    name: 'cajaWilson',
                    opts: {
                      success: 'wilson'
                    }
                  }, {
                    name: 'globoWilson',
                    opts: {
                      success: 'wilson'
                    }
                  }, {
                    name: 'cajaJack',
                    opts: {
                      success: 'jack'
                    }
                  }, {
                    name: 'globoJack',
                    opts: {
                      success: 'jack'
                    }
                  }, {
                    name: 'cajaRenee',
                    opts: {
                      success: 'renee'
                    }
                  }, {
                    name: 'globoRenee',
                    opts: {
                      success: 'renee'
                    }
                  }, {
                    name: 'cajaAshton',
                    opts: {
                      success: 'ashton'
                    }
                  }, {
                    name: 'globoAshton',
                    opts: {
                      success: 'ashton'
                    }
                  }, {
                    name: 'cajaEva',
                    opts: {
                      success: 'eva'
                    }
                  }, {
                    name: 'globoEva',
                    opts: {
                      success: 'eva'
                    }
                  }, {
                    name: 'cajaKevin',
                    opts: {
                      success: 'kevin'
                    }
                  }, {
                    name: 'globoKevin',
                    opts: {
                      success: 'kevin'
                    }
                  }, {
                    name: 'cajaMarissa',
                    opts: {
                      success: 'marissa'
                    }
                  }, {
                    name: 'globoMarissa',
                    opts: {
                      success: 'marissa'
                    }
                  }, {
                    name: 'cajaSam',
                    opts: {
                      success: 'sam'
                    }
                  }, {
                    name: 'globoSam',
                    opts: {
                      success: 'sam'
                    }
                  }, {
                    name: 'cajaCarla',
                    opts: {
                      success: 'carla'
                    }
                  }, {
                    name: 'globoCarla',
                    opts: {
                      success: 'carla'
                    }
                  }
                ]
              ],
              type: 'steps'
            },
            containers: [
              {
                type: 'btn',
                id: 'btn1',
                x: 100,
                y: 290,
                index: 'Wilson',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuWilson',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn2',
                x: 250,
                y: 290,
                index: 'Jack',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuJack',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn3',
                x: 400,
                y: 290,
                index: 'Renee',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuRenee',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn4',
                x: 550,
                y: 290,
                index: 'Ashton',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuAshton',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn5',
                x: 700,
                y: 290,
                index: 'Eva',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuEva',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn6',
                x: 180,
                y: 490,
                index: 'Kevin',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuKevin',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn7',
                x: 330,
                y: 490,
                index: 'Marissa',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuMarissa',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn8',
                x: 480,
                y: 490,
                index: 'Sam',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuSam',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'btn',
                id: 'btn9',
                x: 630,
                y: 490,
                index: 'Carla',
                target: null,
                "eval": this.btnClick,
                states: [
                  {
                    img: {
                      name: 'menuCarla',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }, {
                type: 'img',
                id: 'centerWilson',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaWilson',
                imgs: ['caja0Wilson', 'caja1Wilson'],
                frames: null,
                x: 530,
                y: 320,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoWilson',
                imgs: ['globo0Wilson', 'globo1Wilson'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerJack',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaJack',
                imgs: ['caja0Jack', 'caja1Jack'],
                frames: null,
                x: 530,
                y: 320,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoJack',
                imgs: ['globo0Jack', 'globo1Jack'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerRenee',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaRenee',
                imgs: ['caja0Renee', 'caja1Renee'],
                frames: null,
                x: 530,
                y: 320,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoRenee',
                imgs: ['globo0Renee', 'globo1Renee'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerAshton',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaAshton',
                imgs: ['caja0Ashton', 'caja1Ashton'],
                frames: null,
                x: 530,
                y: 340,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoAshton',
                imgs: ['globo0Ashton', 'globo1Ashton'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerEva',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaEva',
                imgs: ['caja0Eva', 'caja1Eva'],
                frames: null,
                x: 530,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoEva',
                imgs: ['globo0Eva', 'globo1Eva'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerKevin',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaKevin',
                imgs: ['caja0Kevin', 'caja1Kevin'],
                frames: null,
                x: 530,
                y: 320,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoKevin',
                imgs: ['globo0Kevin', 'globo1Kevin'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerMarissa',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaMarissa',
                imgs: ['caja0Marissa', 'caja1Marissa'],
                frames: null,
                x: 530,
                y: 320,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoMarissa',
                imgs: ['globo0Marissa', 'globo1Marissa'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerSam',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaSam',
                imgs: ['caja0Sam', 'caja1Sam'],
                frames: null,
                x: 530,
                y: 340,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoSam',
                imgs: ['globo0Sam', 'globo1Sam'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'img',
                id: 'centerCarla',
                x: 400,
                y: 350,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'cajaCarla',
                imgs: ['caja0Carla', 'caja1Carla'],
                frames: null,
                x: 530,
                y: 380,
                align: 'mc'
              }, {
                type: 'spr',
                id: 'globoCarla',
                imgs: ['globo0Carla', 'globo1Carla'],
                frames: null,
                x: 250,
                y: 350,
                align: 'mc'
              }, {
                type: 'drg',
                id: 'imageWilsonDragble',
                x: 50,
                y: 230,
                index: 'wilson',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageJackDragble',
                x: 140,
                y: 200,
                index: 'jack',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageSamDragble',
                x: 230,
                y: 170,
                index: 'sam',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageReneeDragble',
                x: 320,
                y: 170,
                index: 'renee',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageKevinDragble',
                x: 410,
                y: 170,
                index: 'kevin',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageMarissaDragble',
                x: 500,
                y: 170,
                index: 'marissa',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageEvaDragble',
                x: 590,
                y: 170,
                index: 'eva',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageAshtonDragble',
                x: 680,
                y: 200,
                index: 'ashton',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'imageCarlaDragble',
                x: 770,
                y: 230,
                index: 'carla',
                align: 'mc',
                target: ['globoWilson', 'globoJack', 'globoRenee', 'globoAshton', 'globoEva', 'globoKevin', 'globoMarissa', 'globoSam', 'globoCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonReneeDragble',
                x: 150,
                y: 520,
                index: 'renee',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonSamDragble',
                x: 290,
                y: 520,
                index: 'sam',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonWilsonDragble',
                x: 430,
                y: 520,
                index: 'wilson',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonKevinDragble',
                x: 570,
                y: 520,
                index: 'kevin',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonJackDragble',
                x: 710,
                y: 520,
                index: 'jack',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonAshtonDragble',
                x: 220,
                y: 565,
                index: 'ashton',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonMarissaDragble',
                x: 360,
                y: 565,
                index: 'marissa',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonCarlaDragble',
                x: 500,
                y: 565,
                index: 'carla',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'drg',
                id: 'ballonEvaDragble',
                x: 640,
                y: 565,
                index: 'eva',
                align: 'mc',
                target: ['cajaWilson', 'cajaJack', 'cajaRenee', 'cajaAshton', 'cajaEva', 'cajaKevin', 'cajaMarissa', 'cajaSam', 'cajaCarla'],
                "eval": this.drgDrop,
                afterSuccess: 'origin',
                afterFail: 'return'
              }, {
                type: 'btn',
                id: 'repeat',
                x: 230,
                y: 460,
                alpha: 0,
                isRepeat: true,
                states: [
                  {
                    img: {
                      name: 'btnrepeat',
                      x: 0,
                      y: 0,
                      align: 'bc'
                    }
                  }
                ]
              }
            ],
            groups: [
              {
                type: 'grp',
                id: 'grp_center',
                invisible: true,
                group: ['centerWilson', 'centerJack', 'centerSam', 'centerRenee', 'centerKevin', 'centerMarissa', 'centerEva', 'centerAshton', 'centerCarla']
              }, {
                type: 'grp',
                id: 'grp_caja',
                invisible: true,
                group: ['cajaWilson', 'cajaJack', 'cajaSam', 'cajaRenee', 'cajaKevin', 'cajaMarissa', 'cajaEva', 'cajaAshton', 'cajaCarla']
              }, {
                type: 'grp',
                id: 'grp_globo',
                invisible: true,
                group: ['globoWilson', 'globoJack', 'globoSam', 'globoRenee', 'globoKevin', 'globoMarissa', 'globoEva', 'globoAshton', 'globoCarla']
              }, {
                type: 'grp',
                id: 'grp_drags',
                invisible: true,
                group: ['imageWilsonDragble', 'imageJackDragble', 'imageSamDragble', 'imageReneeDragble', 'imageKevinDragble', 'imageMarissaDragble', 'imageEvaDragble', 'imageAshtonDragble', 'imageCarlaDragble', 'ballonReneeDragble', 'ballonSamDragble', 'ballonWilsonDragble', 'ballonKevinDragble', 'ballonJackDragble', 'ballonAshtonDragble', 'ballonMarissaDragble', 'ballonCarlaDragble', 'ballonEvaDragble']
              }, {
                type: 'grp',
                id: 'grp_buttons',
                invisible: true,
                group: ['btn1', 'btn2', 'btn3', 'btn4', 'btn5', 'btn6', 'btn7', 'btn8', 'btn9']
              }
            ]
          }
        ]
      };
      U8A2.__super__.constructor.call(this);
    }

    window.U8A2 = U8A2;

    return U8A2;

  })(Oda);

}).call(this);
