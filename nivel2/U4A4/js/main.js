(function() {
  var U4A4,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A4 = (function(_super) {
    __extends(U4A4, _super);

    function U4A4() {
      this.finish = __bind(this.finish, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
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
          id: 'playagain',
          src: 'play_again.png'
        }, {
          id: 'startgame',
          src: 'start_game.png'
        }, {
          id: 'btnfalse',
          src: 'btn_false.png'
        }, {
          id: 'btntrue',
          src: 'btn_true.png'
        }, {
          id: 'framedesert',
          src: 'frame_desert.png'
        }, {
          id: 'framegrasslands',
          src: 'frame_grasslands.png'
        }, {
          id: 'framejungle',
          src: 'frame_jungle.png'
        }, {
          id: 'frameocean',
          src: 'frame_ocean.png'
        }, {
          id: 'incamel',
          src: 'in_camel.png'
        }, {
          id: 'incrocodile',
          src: 'in_crocodile.png'
        }, {
          id: 'indolphin',
          src: 'in_dolphin.png'
        }, {
          id: 'inelephant',
          src: 'in_elephant.png'
        }, {
          id: 'ingiraffe',
          src: 'in_giraffe.png'
        }, {
          id: 'injaguar',
          src: 'in_jaguar.png'
        }, {
          id: 'inlion',
          src: 'in_lion.png'
        }, {
          id: 'inlizard',
          src: 'in_lizard.png'
        }, {
          id: 'inmonkey',
          src: 'in_monkey.png'
        }, {
          id: 'inoctopus',
          src: 'in_octopus.png'
        }, {
          id: 'inparrot',
          src: 'in_parrot.png'
        }, {
          id: 'inscorpion',
          src: 'in_scorpion.png'
        }, {
          id: 'inshark',
          src: 'in_shark.png'
        }, {
          id: 'insnake',
          src: 'in_snake.png'
        }, {
          id: 'inwhale',
          src: 'in_whale.png'
        }, {
          id: 'inzebra',
          src: 'in_zebra.png'
        }, {
          id: 'outcamel',
          src: 'out_camel.png'
        }, {
          id: 'outcrocodile',
          src: 'out_crocodile.png'
        }, {
          id: 'outdolphin',
          src: 'out_dolphin.png'
        }, {
          id: 'outelephant',
          src: 'out_elephant.png'
        }, {
          id: 'outgiraffe',
          src: 'out_giraffe.png'
        }, {
          id: 'outjaguar',
          src: 'out_jaguar.png'
        }, {
          id: 'outlion',
          src: 'out_lion.png'
        }, {
          id: 'outlizard',
          src: 'out_lizard.png'
        }, {
          id: 'outmonkey',
          src: 'out_monkey.png'
        }, {
          id: 'outoctopus',
          src: 'out_octopus.png'
        }, {
          id: 'outparrot',
          src: 'out_parrot.png'
        }, {
          id: 'outscorpion',
          src: 'out_scorpion.png'
        }, {
          id: 'outshark',
          src: 'out_shark.png'
        }, {
          id: 'outsnake',
          src: 'out_snake.png'
        }, {
          id: 'outwhale',
          src: 'out_whale.png'
        }, {
          id: 'outzebra',
          src: 'out_zebra.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/TU2_U4_A4_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.game = {
        answers: [
          {
            text: "A camel eats meat.",
            animal: 'camel',
            respuestas: 'off',
            showanimal: 'incamel'
          }, {
            text: "A jaguar eats meat.",
            animal: 'jaguar',
            respuestas: 'on',
            showanimal: 'injaguar'
          }, {
            text: "A dolphin can fly.",
            animal: 'dolphin',
            respuestas: 'off',
            showanimal: 'indolphin'
          }, {
            text: "An octopus can jump.",
            animal: 'octopus',
            respuestas: 'off',
            showanimal: 'inoctopus'
          }, {
            text: "Elephants live in the desert.",
            animal: 'elephant',
            respuestas: 'off',
            showanimal: 'inelephant'
          }, {
            text: "An elephant has a beak.",
            animal: 'elephant',
            respuestas: 'off',
            showanimal: 'inelephant'
          }, {
            text: "A lion has paws.",
            animal: 'lion',
            respuestas: 'on',
            showanimal: 'inlion'
          }, {
            text: "A parrot has claws.",
            animal: 'parrot',
            respuestas: 'on',
            showanimal: 'inparrot'
          }, {
            text: "Sharks have wings.",
            animal: 'shark',
            respuestas: 'off',
            showanimal: 'inshark'
          }, {
            text: "A lizard can crawl.",
            animal: 'lizard',
            respuestas: 'on',
            showanimal: 'inlizard'
          }, {
            text: "Snakes have scales.",
            animal: 'snake',
            respuestas: 'on',
            showanimal: 'insnake'
          }, {
            text: "Monkeys can't climb.",
            animal: 'monkey',
            respuestas: 'off',
            showanimal: 'inmonkey'
          }, {
            text: "Giraffes live in the jungle.",
            animal: 'giraffe',
            respuestas: 'off',
            showanimal: 'ingiraffe'
          }, {
            text: "Whales have a tail.",
            animal: 'whale',
            respuestas: 'on',
            showanimal: 'inwhale'
          }, {
            text: "An octopus can change colors.",
            animal: 'octopus',
            respuestas: 'on',
            showanimal: 'inoctopus'
          }, {
            text: "A baby dolphin drinks milk.",
            animal: 'dolphin',
            respuestas: 'on',
            showanimal: 'indolphin'
          }, {
            text: "A parrot can't speak.",
            animal: 'parrot',
            respuestas: 'on',
            showanimal: 'inparrot'
          }, {
            text: "Lizards eat insects.",
            animal: 'lizard',
            respuestas: 'on',
            showanimal: 'inlizard'
          }, {
            text: "A scorpion can't crawl.",
            animal: 'scorpion',
            respuestas: 'off',
            showanimal: 'inscorpion'
          }, {
            text: "Monkeys don't have feathers.",
            animal: 'monkey',
            respuestas: 'on',
            showanimal: 'inmonkey'
          }, {
            text: "Snakes don't have fur.",
            animal: 'snake',
            respuestas: 'on',
            showanimal: 'insnake'
          }, {
            text: "Giraffes don't have a tail.",
            animal: 'giraffe',
            respuestas: 'off',
            showanimal: 'ingiraffe'
          }, {
            text: "A jaguar doesn't have fur.",
            animal: 'jaguar',
            respuestas: 'off',
            showanimal: 'injaguar'
          }, {
            text: "A lion can sleep in trees.",
            animal: 'lion',
            respuestas: 'on',
            showanimal: 'inlion'
          }, {
            text: "A whale can't crawl.",
            animal: 'whale',
            respuestas: 'on',
            showanimal: 'inwhale'
          }, {
            text: "A crocodile has a tail.",
            animal: 'crocodile',
            respuestas: 'on',
            showanimal: 'incrocodile'
          }, {
            text: "Zebras can run.",
            animal: 'zebra',
            respuestas: 'on',
            showanimal: 'inzebra'
          }, {
            text: "Camels live in the grasslands.",
            animal: 'camel',
            respuestas: 'off',
            showanimal: 'incamel'
          }
        ]
      };
      U4A4.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A4.prototype.setStage = function() {
      U4A4.__super__.setStage.apply(this, arguments);
      this.answers = this.shuffleNoRepeat(this.game.answers, 16);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look at the pictures, read the sentences and click on True or False.', 80, 200);
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 16, 0));
      return this.setAnimals().setClick().introEvaluation();
    };

    U4A4.prototype.setAnimals = function() {
      this.insertBitmap('framedesert', 'framedesert', 894, 618);
      this.insertBitmap('framegrasslands', 'framegrasslands', 894, 262);
      this.insertBitmap('framejungle', 'framejungle', 348, 618);
      this.insertBitmap('frameocean', 'frameocean', 336, 262);
      this.insertBitmap('incamel', 'incamel', 892, 730);
      this.insertBitmap('incrocodile', 'incrocodile', 564, 838);
      this.insertBitmap('indolphin', 'indolphin', 336, 434);
      this.insertBitmap('inelephant', 'inelephant', 1210, 360);
      this.insertBitmap('ingiraffe', 'ingiraffe', 904, 276);
      this.insertBitmap('injaguar', 'injaguar', 320, 752);
      this.insertBitmap('inlion', 'inlion', 1080, 296);
      this.insertBitmap('inlizard', 'inlizard', 1122, 686);
      this.insertBitmap('inmonkey', 'inmonkey', 610, 628);
      this.insertBitmap('inoctopus', 'inoctopus', 348, 280);
      this.insertBitmap('inparrot', 'inparrot', 346, 652);
      this.insertBitmap('inscorpion', 'inscorpion', 1110, 820);
      this.insertBitmap('inshark', 'inshark', 584, 280);
      this.insertBitmap('insnake', 'insnake', 1202, 732);
      this.insertBitmap('inwhale', 'inwhale', 480, 438);
      this.insertBitmap('inzebra', 'inzebra', 1026, 396);
      this.insertSprite('animalesfuera', ['outcamel', 'outcrocodile', 'outdolphin', 'outelephant', 'outgiraffe', 'outjaguar', 'outlion', 'outlizard', 'outmonkey', 'outoctopus', 'outparrot', 'outscorpion', 'outshark', 'outsnake', 'outwhale', 'outzebra'], {
        camel: 0,
        crocodile: 1,
        dolphin: 2,
        elephant: 3,
        giraffe: 4,
        jaguar: 5,
        lion: 6,
        lizard: 7,
        monkey: 8,
        octopus: 9,
        parrot: 10,
        scorpion: 11,
        shark: 12,
        snake: 13,
        whale: 14,
        zebra: 15
      }, 486, 1070, 'mc');
      this.allInvisible();
      return this;
    };

    U4A4.prototype.allInvisible = function() {
      this.library['incamel'].visible = false;
      this.library['incrocodile'].visible = false;
      this.library['indolphin'].visible = false;
      this.library['inelephant'].visible = false;
      this.library['ingiraffe'].visible = false;
      this.library['injaguar'].visible = false;
      this.library['inlion'].visible = false;
      this.library['inlizard'].visible = false;
      this.library['inmonkey'].visible = false;
      this.library['inoctopus'].visible = false;
      this.library['inparrot'].visible = false;
      this.library['inscorpion'].visible = false;
      this.library['inshark'].visible = false;
      this.library['insnake'].visible = false;
      this.library['inwhale'].visible = false;
      return this.library['inzebra'].visible = false;
    };

    U4A4.prototype.setClick = function() {
      this.insertBitmap('btnfalse', 'btnfalse', 1072, 1070);
      this.insertBitmap('btntrue', 'btntrue', 818, 1072);
      this.library.btnfalse.index = 'off';
      this.library.btntrue.index = 'on';
      this.library['btntrue'].addEventListener('click', this.evaluateAnswer);
      this.library['btnfalse'].addEventListener('click', this.evaluateAnswer);
      return this;
    };

    U4A4.prototype.introEvaluation = function() {
      U4A4.__super__.introEvaluation.apply(this, arguments);
      this.library.animalesfuera.visible = false;
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0
      });
      TweenLite.from(this.library.btnfalse, 1, {
        alpha: 0,
        y: this.library.btnfalse.y - 20,
        ease: Quart.easeOut
      });
      TweenLite.from(this.library.btntrue, 1, {
        alpha: 0,
        y: this.library.btntrue.y - 20,
        ease: Quart.easeOut
      });
      TweenLite.from(this.library.frameocean, 1, {
        alpha: 0,
        y: this.library.frameocean.y - 20,
        ease: Quart.easeOut,
        delay: 0.4
      });
      TweenLite.from(this.library.framejungle, 1, {
        alpha: 0,
        y: this.library.framejungle.y - 20,
        ease: Quart.easeOut,
        delay: 0.6
      });
      TweenLite.from(this.library.framegrasslands, 1, {
        alpha: 0,
        y: this.library.framegrasslands.y - 20,
        ease: Quart.easeOut,
        delay: 0.8
      });
      return TweenLite.from(this.library.framedesert, 1, {
        alpha: 0,
        y: this.library.framedesert.y - 20,
        ease: Quart.easeOut,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
    };

    U4A4.prototype.initEvaluation = function(e) {
      U4A4.__super__.initEvaluation.apply(this, arguments);
      this.library.animalesfuera.visible = true;
      this.library.animalesfuera.gotoAndStop(this.answers[this.index].animal);
      this.insertText('frases', this.answers[this.index].text, '40px Quicksand', '#333', 820, 1000);
      TweenLite.from(this.library.frases, 0.5, {
        alpha: 0,
        y: this.library.frases - 20,
        ease: Quart.easeOut
      });
      return TweenLite.from(this.library.animalesfuera, 0.5, {
        alpha: 0,
        y: this.library.animalesfuera.y - 40
      });
    };

    U4A4.prototype.evaluateAnswer = function(e) {
      this.answer = e.target;
      if (this.answer.index === this.answers[this.index].respuestas) {
        this.library.score.plusOne();
        createjs.Sound.play('good');
        if (!this.library[this.answers[this.index].showanimal].visible) {
          this.library[this.answers[this.index].showanimal].visible = true;
          TweenLite.from(this.library[this.answers[this.index].showanimal], 1, {
            alpha: 0,
            ease: Back.easeOut
          });
        }
      } else {
        this.warning();
      }
      return TweenLite.to(this.library.animalesfuera, 0.5, {
        alpha: 0,
        y: stageSize.h,
        ease: Back.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U4A4.prototype.finishEvaluation = function() {
      return this.nextEvaluation();
    };

    U4A4.prototype.nextEvaluation = function() {
      this.index++;
      if (this.index < this.answers.length) {
        this.library.animalesfuera.gotoAndStop(this.answers[this.index].animal);
        TweenLite.to(this.library.animalesfuera, 0.5, {
          alpha: 1,
          y: 1070,
          ease: Back.easeOut
        });
        return this.library.frases.text = this.answers[this.index].text;
      } else {
        return setTimeout(this.finish, 1 * 1000);
      }
    };

    U4A4.prototype.finish = function() {
      this.allInvisible();
      TweenLite.to(this.library.btnfalse, 1, {
        alpha: 0,
        y: this.library.btnfalse.y - 20,
        ease: Quart.easeOut
      });
      TweenLite.to(this.library.btntrue, 1, {
        alpha: 0,
        y: this.library.btntrue.y - 20,
        ease: Quart.easeOut
      });
      TweenLite.to(this.library.frameocean, 1, {
        alpha: 0,
        y: this.library.frameocean.y - 20,
        ease: Quart.easeOut,
        delay: 0.4
      });
      TweenLite.to(this.library.framejungle, 1, {
        alpha: 0,
        y: this.library.framejungle.y - 20,
        ease: Quart.easeOut,
        delay: 0.6
      });
      TweenLite.to(this.library.framegrasslands, 1, {
        alpha: 0,
        y: this.library.framegrasslands.y - 20,
        ease: Quart.easeOut,
        delay: 0.8
      });
      TweenLite.to(this.library.framedesert, 1, {
        alpha: 0,
        y: this.library.framedesert.y - 20,
        ease: Quart.easeOut,
        delay: 1
      });
      TweenLite.to(this.library.frases, 0.5, {
        alpha: 0,
        y: this.library.frases - 20,
        ease: Quart.easeOut
      });
      return U4A4.__super__.finish.apply(this, arguments);
    };

    window.U4A4 = U4A4;

    return U4A4;

  })(Oda);

}).call(this);
