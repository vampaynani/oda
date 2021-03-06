(function() {
  var U4A1,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U4A1 = (function(_super) {
    __extends(U4A1, _super);

    function U4A1() {
      this.repeatSound = __bind(this.repeatSound, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateRows = __bind(this.evaluateRows, this);
      this.evaluateClick = __bind(this.evaluateClick, this);
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
          id: 'repeatbtn',
          src: 'repeat-btn.png'
        }, {
          id: 'playagain',
          src: 'play_again.png'
        }, {
          id: 'startgame',
          src: 'start_game.png'
        }, {
          id: 'scoreYou',
          src: 'score_you.png'
        }, {
          id: 'scoreComputer',
          src: 'score_computer.png'
        }, {
          id: 'c1',
          src: 'circle1.png'
        }, {
          id: 'c2',
          src: 'circle2.png'
        }, {
          id: 'borde1',
          src: 'border0001.png'
        }, {
          id: 'borde2',
          src: 'border0002.png'
        }, {
          id: 'borde3',
          src: 'border0003.png'
        }, {
          id: 'beak',
          src: 'beak.png'
        }, {
          id: 'bear',
          src: 'bear.png'
        }, {
          id: 'camel',
          src: 'camel.png'
        }, {
          id: 'chimpanzee',
          src: 'chimpanzee.png'
        }, {
          id: 'claws',
          src: 'claws.png'
        }, {
          id: 'crocodile',
          src: 'crocodile.png'
        }, {
          id: 'dolphin',
          src: 'dolphin.png'
        }, {
          id: 'eagle',
          src: 'eagle.png'
        }, {
          id: 'elephant',
          src: 'elephant.png'
        }, {
          id: 'feathers',
          src: 'feathers.png'
        }, {
          id: 'fins',
          src: 'fins.png'
        }, {
          id: 'fish',
          src: 'fish.png'
        }, {
          id: 'fox',
          src: 'fox.png'
        }, {
          id: 'frog',
          src: 'frog.png'
        }, {
          id: 'fur',
          src: 'fur.png'
        }, {
          id: 'giraffe',
          src: 'giraffe.png'
        }, {
          id: 'gorilla',
          src: 'gorilla.png'
        }, {
          id: 'jaguar',
          src: 'jaguar.png'
        }, {
          id: 'lion',
          src: 'lion.png'
        }, {
          id: 'monkey',
          src: 'monkey.png'
        }, {
          id: 'octopus',
          src: 'octopus.png'
        }, {
          id: 'owl',
          src: 'owl.png'
        }, {
          id: 'panda',
          src: 'panda.png'
        }, {
          id: 'parrot',
          src: 'parrot.png'
        }, {
          id: 'paws',
          src: 'paws.png'
        }, {
          id: 'penguin',
          src: 'penguin.png'
        }, {
          id: 'polarbear',
          src: 'polar-bear.png'
        }, {
          id: 'python',
          src: 'python.png'
        }, {
          id: 'rhino',
          src: 'rhino.png'
        }, {
          id: 'scales',
          src: 'scales.png'
        }, {
          id: 'seaturtle',
          src: 'sea-turtle.png'
        }, {
          id: 'shark',
          src: 'shark.png'
        }, {
          id: 'snake',
          src: 'snake.png'
        }, {
          id: 'tail',
          src: 'tail.png'
        }, {
          id: 'tiger',
          src: 'tiger.png'
        }, {
          id: 'whale',
          src: 'whale.png'
        }, {
          id: 'whiskers',
          src: 'whiskers.png'
        }, {
          id: 'wings',
          src: 'wings.png'
        }, {
          id: 'zebra',
          src: 'zebra.png'
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
          src: 'sounds/TU2_U4_A1_instructions.mp3',
          id: 'instructions'
        }, {
          id: 'sbeak',
          src: 'sounds/beak.mp3'
        }, {
          id: 'sbear',
          src: 'sounds/bear.mp3'
        }, {
          id: 'scamel',
          src: 'sounds/camel.mp3'
        }, {
          id: 'schimpanzee',
          src: 'sounds/chimpanzee.mp3'
        }, {
          id: 'sclaws',
          src: 'sounds/claws.mp3'
        }, {
          id: 'scrocodile',
          src: 'sounds/crocodile.mp3'
        }, {
          id: 'sdolphin',
          src: 'sounds/dolphin.mp3'
        }, {
          id: 'seagle',
          src: 'sounds/eagle.mp3'
        }, {
          id: 'selephant',
          src: 'sounds/elephant.mp3'
        }, {
          id: 'sfeathers',
          src: 'sounds/feathers.mp3'
        }, {
          id: 'sfins',
          src: 'sounds/fins.mp3'
        }, {
          id: 'sfish',
          src: 'sounds/fish.mp3'
        }, {
          id: 'sfox',
          src: 'sounds/fox.mp3'
        }, {
          id: 'sfrog',
          src: 'sounds/frog.mp3'
        }, {
          id: 'sfur',
          src: 'sounds/fur.mp3'
        }, {
          id: 'sgiraffe',
          src: 'sounds/giraffe.mp3'
        }, {
          id: 'sgorilla',
          src: 'sounds/gorilla.mp3'
        }, {
          id: 'sjaguar',
          src: 'sounds/jaguar.mp3'
        }, {
          id: 'slion',
          src: 'sounds/lion.mp3'
        }, {
          id: 'smonkey',
          src: 'sounds/monkey.mp3'
        }, {
          id: 'soctopus',
          src: 'sounds/octopus.mp3'
        }, {
          id: 'sowl',
          src: 'sounds/owl.mp3'
        }, {
          id: 'spanda',
          src: 'sounds/panda.mp3'
        }, {
          id: 'sparrot',
          src: 'sounds/parrot.mp3'
        }, {
          id: 'spaws',
          src: 'sounds/paws.mp3'
        }, {
          id: 'spenguin',
          src: 'sounds/penguin.mp3'
        }, {
          id: 'spolarbear',
          src: 'sounds/polar-bear.mp3'
        }, {
          id: 'spython',
          src: 'sounds/python.mp3'
        }, {
          id: 'srhino',
          src: 'sounds/rhino.mp3'
        }, {
          id: 'sscales',
          src: 'sounds/scales.mp3'
        }, {
          id: 'sseaturtle',
          src: 'sounds/sea-turtle.mp3'
        }, {
          id: 'sshark',
          src: 'sounds/shark.mp3'
        }, {
          id: 'ssnake',
          src: 'sounds/snake.mp3'
        }, {
          id: 'stail',
          src: 'sounds/tail.mp3'
        }, {
          id: 'stiger',
          src: 'sounds/tiger.mp3'
        }, {
          id: 'swhale',
          src: 'sounds/whale.mp3'
        }, {
          id: 'swhiskers',
          src: 'sounds/whiskers.mp3'
        }, {
          id: 'swings',
          src: 'sounds/wings.mp3'
        }, {
          id: 'szebra',
          src: 'sounds/zebra.mp3'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.animals = [
        {
          id: 'beak'
        }, {
          id: 'bear'
        }, {
          id: 'camel'
        }, {
          id: 'chimpanzee'
        }, {
          id: 'claws'
        }, {
          id: 'crocodile'
        }, {
          id: 'dolphin'
        }, {
          id: 'eagle'
        }, {
          id: 'elephant'
        }, {
          id: 'feathers'
        }, {
          id: 'fins'
        }, {
          id: 'fish'
        }, {
          id: 'fox'
        }, {
          id: 'frog'
        }, {
          id: 'fur'
        }, {
          id: 'giraffe'
        }, {
          id: 'gorilla'
        }, {
          id: 'jaguar'
        }, {
          id: 'lion'
        }, {
          id: 'monkey'
        }, {
          id: 'octopus'
        }, {
          id: 'owl'
        }, {
          id: 'panda'
        }, {
          id: 'parrot'
        }, {
          id: 'paws'
        }, {
          id: 'penguin'
        }, {
          id: 'polarbear'
        }, {
          id: 'python'
        }, {
          id: 'rhino'
        }, {
          id: 'scales'
        }, {
          id: 'seaturtle'
        }, {
          id: 'shark'
        }, {
          id: 'snake'
        }, {
          id: 'tail'
        }, {
          id: 'tiger'
        }, {
          id: 'whale'
        }, {
          id: 'whiskers'
        }, {
          id: 'wings'
        }, {
          id: 'zebra'
        }
      ];
      this.game = {
        animals: this.shuffle(this.animals),
        you: 0,
        pc: 0
      };
      U4A1.__super__.constructor.call(this, null, manifest, sounds);
    }

    U4A1.prototype.setStage = function() {
      this.round = 0;
      console.log('Ronda ' + (this.round + 1));
      U4A1.__super__.setStage.apply(this, arguments);
      this.youcards = this.shuffleNoRepeat(this.animals, 9);
      this.pccards = this.shuffleNoRepeat(this.animals, 9);
      this.game.animals = this.shuffle(this.animals);
      this.game.you = 0;
      this.game.pc = 0;
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Listen and click on the correct pictures.', 80, 200);
      this.insertBitmap('scoreComputer', 'scoreComputer', 38, 926);
      this.insertBitmap('scoreYou', 'scoreYou', 38, 740);
      this.insertBitmap('repeatbtn', 'repeatbtn', 790, 1072);
      this.insertText('pcCount', this.game.pc, '48px Quicksand', '#ffffff', 99, 974, 'center');
      this.insertText('youCount', this.game.you, '48px Quicksand', '#ffffff', 94, 794, 'center');
      return this.setCardsYou().setCardsPc().introEvaluation();
    };

    U4A1.prototype.jug = function() {
      this.game.you++;
      createjs.Sound.play('good');
      this.library['youCount'].text = this.game.you;
      return this;
    };

    U4A1.prototype.compu = function() {
      this.game.pc++;
      createjs.Sound.play('wrong');
      this.library['pcCount'].text = this.game.pc;
      return this;
    };

    U4A1.prototype.nuevaRonda = function() {
      this.index = 0;
      this.round++;
      console.log('Ronda ' + (this.round + 1));
      TweenLite.to(this.library.cartas, 1, {
        alpha: 0,
        y: this.library.cartas.y - 100
      });
      TweenLite.to(this.library.cartaspc, 1, {
        alpha: 0,
        y: this.library.cartaspc.y - 100
      });
      clearInterval(this.interval);
      this.youcards = this.shuffleNoRepeat(this.animals, 9);
      this.pccards = this.shuffleNoRepeat(this.animals, 9);
      this.game.animals = this.shuffle(this.animals);
      if (this.game.you === 2 || this.game.pc === 2) {
        return this.finish();
      } else if (this.round <= 2) {
        return this.setCardsYou().setCardsPc().introEvaluation();
      } else {
        return this.finish();
      }
    };

    U4A1.prototype.setCardsYou = function() {
      var a, b, carta, cartas, h, i, j, texto, _i, _j;
      j = 0;
      cartas = new createjs.Container();
      cartas.x = 200;
      cartas.y = 290;
      cartas.name = 'cartas';
      texto = this.createText('', 'You', '44px Quicksand', '#333', 300, -50);
      cartas.addChild(texto);
      for (h = _i = 0; _i <= 2; h = ++_i) {
        for (i = _j = 0; _j <= 2; i = ++_j) {
          b = this.createSprite('borde', ['borde1', 'borde2', 'borde3'], null, 0, 0);
          a = this.createBitmap('animal', this.youcards[j].id, 0, 0);
          a.scaleX = a.scaleY = 0.72;
          carta = new createjs.Container();
          carta.name = "cartay" + j;
          carta.index = this.youcards[j].id;
          carta.x = i * 224;
          carta.y = h * 260;
          carta.addChild(b, a);
          cartas.addChild(carta);
          this.addToLibrary(carta);
          j++;
        }
      }
      this.addToMain(cartas);
      return this;
    };

    U4A1.prototype.setCardsPc = function() {
      var a, b, carta, cartaspc, h, i, j, texto, _i, _j;
      j = 0;
      cartaspc = new createjs.Container();
      cartaspc.x = 898;
      cartaspc.y = 290;
      cartaspc.name = 'cartaspc';
      texto = this.createText('', 'Computer', '44px Quicksand', '#333', 234, -50);
      cartaspc.addChild(texto);
      for (h = _i = 0; _i <= 2; h = ++_i) {
        for (i = _j = 0; _j <= 2; i = ++_j) {
          b = this.createSprite('borde', ['borde1', 'borde2', 'borde3'], null, 0, 0);
          a = this.createBitmap('animal', this.pccards[j].id, 0, 0);
          a.scaleX = a.scaleY = 0.72;
          carta = new createjs.Container();
          carta.name = "cartac" + j;
          carta.index = this.pccards[j].id;
          carta.x = i * 224;
          carta.y = h * 260;
          carta.addChild(b, a);
          cartaspc.addChild(carta);
          this.addToLibrary(carta);
          j++;
        }
      }
      this.addToMain(cartaspc);
      return this;
    };

    U4A1.prototype.introEvaluation = function() {
      U4A1.__super__.introEvaluation.apply(this, arguments);
      TweenLite.from(this.library['header'], 1, {
        y: -this.library['header'].height
      });
      TweenLite.from(this.library['instructions'], 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenLite.from(this.library['cartas'], 1, {
        alpha: 0,
        y: this.library['cartas'].y - 100,
        delay: 1
      });
      if (this.round === 0) {
        return TweenLite.from(this.library['cartaspc'], 1, {
          alpha: 0,
          y: this.library['cartaspc'].y - 100,
          delay: 1,
          onComplete: this.playInstructions,
          onCompleteParams: [this]
        });
      } else {
        return TweenLite.from(this.library['cartaspc'], 1, {
          alpha: 0,
          y: this.library['cartaspc'].y - 100,
          delay: 1,
          onComplete: this.initEvaluation,
          onCompleteParams: [this]
        });
      }
    };

    U4A1.prototype.initEvaluation = function(e) {
      var i, _i;
      U4A1.__super__.initEvaluation.apply(this, arguments);
      for (i = _i = 0; _i <= 8; i = ++_i) {
        this.library["cartay" + i].addEventListener('click', this.evaluateClick);
      }
      this.library['repeatbtn'].addEventListener('click', this.repeatSound);
      createjs.Sound.play("s" + this.game.animals[this.index].id);
      return this.interval = setInterval(this.nextEvaluation, 5 * 1000);
    };

    U4A1.prototype.evaluateClick = function(e) {
      this.answer = e.currentTarget;
      if (this.answer.index === this.game.animals[this.index].id) {
        this.answer.getChildByName('borde').gotoAndStop(1);
        return this.evaluateRows();
      }
    };

    U4A1.prototype.evaluateRows = function(e) {
      if (this.library["cartay0"].getChildByName('borde').currentFrame === 1 && this.library["cartay1"].getChildByName('borde').currentFrame === 1 && this.library["cartay2"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartay3"].getChildByName('borde').currentFrame === 1 && this.library["cartay4"].getChildByName('borde').currentFrame === 1 && this.library["cartay5"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartay6"].getChildByName('borde').currentFrame === 1 && this.library["cartay7"].getChildByName('borde').currentFrame === 1 && this.library["cartay8"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartay0"].getChildByName('borde').currentFrame === 1 && this.library["cartay3"].getChildByName('borde').currentFrame === 1 && this.library["cartay6"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartay1"].getChildByName('borde').currentFrame === 1 && this.library["cartay4"].getChildByName('borde').currentFrame === 1 && this.library["cartay7"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartay2"].getChildByName('borde').currentFrame === 1 && this.library["cartay5"].getChildByName('borde').currentFrame === 1 && this.library["cartay8"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartay0"].getChildByName('borde').currentFrame === 1 && this.library["cartay4"].getChildByName('borde').currentFrame === 1 && this.library["cartay8"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartay2"].getChildByName('borde').currentFrame === 1 && this.library["cartay4"].getChildByName('borde').currentFrame === 1 && this.library["cartay6"].getChildByName('borde').currentFrame === 1) {
        this.jug().nuevaRonda();
      }
      if (this.library["cartac0"].getChildByName('borde').currentFrame === 2 && this.library["cartac1"].getChildByName('borde').currentFrame === 2 && this.library["cartac2"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      if (this.library["cartac3"].getChildByName('borde').currentFrame === 2 && this.library["cartac4"].getChildByName('borde').currentFrame === 2 && this.library["cartac5"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      if (this.library["cartac6"].getChildByName('borde').currentFrame === 2 && this.library["cartac7"].getChildByName('borde').currentFrame === 2 && this.library["cartac8"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      if (this.library["cartac0"].getChildByName('borde').currentFrame === 2 && this.library["cartac3"].getChildByName('borde').currentFrame === 2 && this.library["cartac6"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      if (this.library["cartac1"].getChildByName('borde').currentFrame === 2 && this.library["cartac4"].getChildByName('borde').currentFrame === 2 && this.library["cartac7"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      if (this.library["cartac2"].getChildByName('borde').currentFrame === 2 && this.library["cartac5"].getChildByName('borde').currentFrame === 2 && this.library["cartac8"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      if (this.library["cartac0"].getChildByName('borde').currentFrame === 2 && this.library["cartac4"].getChildByName('borde').currentFrame === 2 && this.library["cartac8"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      if (this.library["cartac2"].getChildByName('borde').currentFrame === 2 && this.library["cartac4"].getChildByName('borde').currentFrame === 2 && this.library["cartac6"].getChildByName('borde').currentFrame === 2) {
        this.compu().nuevaRonda();
      }
      return this;
    };

    U4A1.prototype.finishEvaluation = function() {};

    U4A1.prototype.nextEvaluation = function() {
      var i, _i;
      for (i = _i = 0; _i <= 8; i = ++_i) {
        if (this.library["cartac" + i].index === this.game.animals[this.index].id) {
          this.library["cartac" + i].getChildByName('borde').gotoAndStop(2);
          this.evaluateRows();
        }
      }
      this.index++;
      if (this.index < this.game.animals.length) {
        return createjs.Sound.play("s" + this.game.animals[this.index].id);
      } else {
        return this.finish();
      }
    };

    U4A1.prototype.repeatSound = function() {
      return createjs.Sound.play("s" + this.game.animals[this.index].id);
    };

    U4A1.prototype.finish = function() {
      clearInterval(this.interval);
      TweenLite.to(this.library.repeatbtn, 1, {
        alpha: 0
      });
      TweenLite.to(this.library.cartas, 1, {
        alpha: 0,
        y: this.library.cartas.y - 100
      });
      TweenLite.to(this.library.cartaspc, 1, {
        alpha: 0,
        y: this.library.cartaspc.y - 100
      });
      return U4A1.__super__.finish.apply(this, arguments);
    };

    window.U4A1 = U4A1;

    return U4A1;

  })(Oda);

}).call(this);
