(function() {
  var U6A6,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  U6A6 = (function(_super) {
    __extends(U6A6, _super);

    function U6A6() {
      this.finish = __bind(this.finish, this);
      this.nextEvaluation = __bind(this.nextEvaluation, this);
      this.finishEvaluation = __bind(this.finishEvaluation, this);
      this.evaluateAnswer = __bind(this.evaluateAnswer, this);
      this.showHelper = __bind(this.showHelper, this);
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
          id: 'crossWords',
          src: 'cruci.png'
        }, {
          id: 'btn3',
          src: 'btn_chef.png'
        }, {
          id: 'btn1',
          src: 'btn_doctor.png'
        }, {
          id: 'btn8',
          src: 'btn_firefighter.png'
        }, {
          id: 'btn2',
          src: 'btn_mechanic.png'
        }, {
          id: 'btn6',
          src: 'btn_police.png'
        }, {
          id: 'btn4',
          src: 'btn_salesclerk.png'
        }, {
          id: 'btn7',
          src: 'btn_vet.png'
        }, {
          id: 'btn5',
          src: 'btn_waiter.png'
        }, {
          id: 'numberchef',
          src: 'number_chef.png'
        }, {
          id: 'numberdoctor',
          src: 'number_doctor.png'
        }, {
          id: 'numberfirefighter',
          src: 'number_firefighter.png'
        }, {
          id: 'numbermechanic',
          src: 'number_mechanic.png'
        }, {
          id: 'numberpolice',
          src: 'number_police.png'
        }, {
          id: 'numbersalesclerk',
          src: 'number_salesclerk.png'
        }, {
          id: 'numbervet',
          src: 'number_vet.png'
        }, {
          id: 'numberwaiter',
          src: 'number_waiter.png'
        }, {
          id: 'personchef',
          src: 'person_chef.png'
        }, {
          id: 'persondoctor',
          src: 'person_doctor.png'
        }, {
          id: 'personfirefighter',
          src: 'person_firefighter.png'
        }, {
          id: 'personmechanic',
          src: 'person_mechanic.png'
        }, {
          id: 'personpolice',
          src: 'person_police.png'
        }, {
          id: 'personsalesclerk',
          src: 'person_salesclerk.png'
        }, {
          id: 'personvet',
          src: 'person_vet.png'
        }, {
          id: 'personwaiter',
          src: 'person_waiter.png'
        }, {
          id: 'prophelper',
          src: 'prop_helper.png'
        }, {
          id: 'aLetra',
          src: 'a.png'
        }, {
          id: 'bLetra',
          src: 'b.png'
        }, {
          id: 'cLetra',
          src: 'c.png'
        }, {
          id: 'dLetra',
          src: 'd.png'
        }, {
          id: 'eLetra',
          src: 'e.png'
        }, {
          id: 'fLetra',
          src: 'f.png'
        }, {
          id: 'gLetra',
          src: 'g.png'
        }, {
          id: 'hLetra',
          src: 'h.png'
        }, {
          id: 'iLetra',
          src: 'i.png'
        }, {
          id: 'jLetra',
          src: 'j.png'
        }, {
          id: 'kLetra',
          src: 'k.png'
        }, {
          id: 'lLetra',
          src: 'l.png'
        }, {
          id: 'mLetra',
          src: 'm.png'
        }, {
          id: 'nLetra',
          src: 'n.png'
        }, {
          id: 'oLetra',
          src: 'o.png'
        }, {
          id: 'pLetra',
          src: 'p.png'
        }, {
          id: 'qLetra',
          src: 'q.png'
        }, {
          id: 'rLetra',
          src: 'r.png'
        }, {
          id: 'sLetra',
          src: 's.png'
        }, {
          id: 'tLetra',
          src: 't.png'
        }, {
          id: 'uLetra',
          src: 'u.png'
        }, {
          id: 'vLetra',
          src: 'v.png'
        }, {
          id: 'wLetra',
          src: 'w.png'
        }, {
          id: 'xLetra',
          src: 'x.png'
        }, {
          id: 'yLetra',
          src: 'y.png'
        }, {
          id: 'zLetra',
          src: 'z.png'
        }
      ];
      sounds = [
        {
          src: 'sounds/TU2_U6_A6_instructions.mp3',
          id: 'instructions'
        }, {
          src: 'sounds/boing.mp3',
          id: 'boing'
        }, {
          src: 'sounds/good.mp3',
          id: 'good'
        }, {
          src: 'sounds/wrong.mp3',
          id: 'wrong'
        }
      ];
      this.abc = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
      this.numbers = [
        {
          id: '1',
          x: 1,
          y: 0
        }, {
          id: '2',
          x: 5,
          y: 3
        }, {
          id: '3',
          x: 8,
          y: 1
        }, {
          id: '4',
          x: 11,
          y: -1
        }, {
          id: '5',
          x: 13,
          y: -1
        }, {
          id: '6',
          x: -1,
          y: 5
        }, {
          id: '7',
          x: 8,
          y: 7
        }, {
          id: '8',
          x: -1,
          y: 10
        }
      ];
      this.containers = [
        {
          id: 'd',
          x: 1,
          y: 1,
          a: true
        }, {
          id: 'o',
          x: 1,
          y: 2
        }, {
          id: 'c',
          x: 1,
          y: 3
        }, {
          id: 't',
          x: 1,
          y: 4
        }, {
          id: 'o',
          x: 1,
          y: 5
        }, {
          id: 'r',
          x: 1,
          y: 6
        }, {
          id: 'm',
          x: 5,
          y: 4,
          a: true
        }, {
          id: 'e',
          x: 5,
          y: 5
        }, {
          id: 'c',
          x: 5,
          y: 6
        }, {
          id: 'h',
          x: 5,
          y: 7
        }, {
          id: 'a',
          x: 5,
          y: 8
        }, {
          id: 'n',
          x: 5,
          y: 9
        }, {
          id: 'i',
          x: 5,
          y: 10
        }, {
          id: 'c',
          x: 5,
          y: 11
        }, {
          id: 'c',
          x: 8,
          y: 2,
          a: true
        }, {
          id: 'h',
          x: 8,
          y: 3
        }, {
          id: 'e',
          x: 8,
          y: 4
        }, {
          id: 'f',
          x: 8,
          y: 5
        }, {
          id: 's',
          x: 11,
          y: 0,
          a: true
        }, {
          id: 'a',
          x: 11,
          y: 1
        }, {
          id: 'l',
          x: 11,
          y: 2
        }, {
          id: 'e',
          x: 11,
          y: 3
        }, {
          id: 's',
          x: 11,
          y: 4
        }, {
          id: 'c',
          x: 11,
          y: 5
        }, {
          id: 'l',
          x: 11,
          y: 6
        }, {
          id: 'e',
          x: 11,
          y: 7
        }, {
          id: 'r',
          x: 11,
          y: 8
        }, {
          id: 'k',
          x: 11,
          y: 9
        }, {
          id: 'w',
          x: 13,
          y: 0,
          a: true
        }, {
          id: 'a',
          x: 13,
          y: 1
        }, {
          id: 'i',
          x: 13,
          y: 2
        }, {
          id: 't',
          x: 13,
          y: 3
        }, {
          id: 'e',
          x: 13,
          y: 4
        }, {
          id: 'r',
          x: 13,
          y: 5
        }, {
          id: 'p',
          x: 0,
          y: 5,
          a: true
        }, {
          id: 'l',
          x: 2,
          y: 5
        }, {
          id: 'i',
          x: 3,
          y: 5
        }, {
          id: 'c',
          x: 4,
          y: 5
        }, {
          id: 'o',
          x: 7,
          y: 5
        }, {
          id: 'f',
          x: 9,
          y: 5
        }, {
          id: 'i',
          x: 10,
          y: 5
        }, {
          id: 'e',
          x: 12,
          y: 5
        }, {
          id: 'v',
          x: 8,
          y: 8,
          a: true
        }, {
          id: 'e',
          x: 8,
          y: 9
        }, {
          id: 't',
          x: 8,
          y: 10
        }, {
          id: 'f',
          x: 0,
          y: 10,
          a: true
        }, {
          id: 'i',
          x: 1,
          y: 10
        }, {
          id: 'r',
          x: 2,
          y: 10
        }, {
          id: 'e',
          x: 3,
          y: 10
        }, {
          id: 'f',
          x: 4,
          y: 10
        }, {
          id: 'g',
          x: 6,
          y: 10
        }, {
          id: 'h',
          x: 7,
          y: 10
        }, {
          id: 'e',
          x: 9,
          y: 10
        }, {
          id: 'r',
          x: 10,
          y: 10
        }
      ];
      this.helps = ['He / She helps sick people.', 'He / She fixes cars.', 'He / She makes food.', 'He / She sells things.', 'He / She serves food.', 'He / She protects people.', 'He / She helps sick animals.', 'He / She puts out fires.', ''];
      this.answers = {
        doctor: {
          r: false,
          c: [0, 1, 2, 3, 4, 5]
        },
        mechanic: {
          r: false,
          c: [6, 7, 8, 9, 10, 11, 12, 13]
        },
        chef: {
          r: false,
          c: [14, 15, 16, 17]
        },
        salesclerk: {
          r: false,
          c: [18, 19, 20, 21, 22, 23, 24, 25, 26, 27]
        },
        waiter: {
          r: false,
          c: [28, 29, 30, 31, 32, 33]
        },
        police: {
          r: false,
          c: [34, 4, 35, 36, 37, 7, 38, 17, 39, 40, 23, 41, 33]
        },
        vet: {
          r: false,
          c: [42, 43, 44]
        },
        firefighter: {
          r: false,
          c: [45, 46, 47, 48, 49, 12, 50, 51, 44, 52, 53]
        }
      };
      U6A6.__super__.constructor.call(this, null, manifest, sounds);
    }

    U6A6.prototype.setStage = function() {
      var chef, doc, fire, mec, poli, sales, vet, wait;
      U6A6.__super__.setStage.apply(this, arguments);
      this.insertBitmap('header', 'head', stageSize.w / 2, 0, 'tc');
      this.insertInstructions('instructions', 'Look and drag the letters to complete the crossword puzzle.', 80, 200);
      doc = this.createBitmap('persondoctor', 'persondoctor', 154, 242);
      mec = this.createBitmap('personmechanic', 'personmechanic', 274, 388);
      chef = this.createBitmap('personchef', 'personchef', 54, 416);
      sales = this.createBitmap('personsalesclerk', 'personsalesclerk', 158, 650);
      wait = this.createBitmap('personwaiter', 'personwaiter', 1160, 184);
      poli = this.createBitmap('personpolice', 'personpolice', 1362, 408);
      vet = this.createBitmap('personvet', 'personvet', 1158, 448);
      fire = this.createBitmap('personfirefighter', 'personfirefighter', 1264, 636);
      doc.scaleX = doc.scaleY = mec.scaleX = mec.scaleY = chef.scaleX = chef.scaleY = sales.scaleX = sales.scaleY = wait.scaleX = wait.scaleY = poli.scaleX = poli.scaleY = vet.scaleX = vet.scaleY = fire.scaleX = fire.scaleY = 0.5;
      this.addToMain(doc, mec, chef, sales, wait, poli, vet, fire);
      this.insertBitmap('numberdoctor', 'numberdoctor', 130, 276);
      this.insertBitmap('numbermechanic', 'numbermechanic', 250, 454);
      this.insertBitmap('numberchef', 'numberchef', 56, 502);
      this.insertBitmap('numbersalesclerk', 'numbersalesclerk', 130, 684);
      this.insertBitmap('numberwaiter', 'numberwaiter', 1230, 264);
      this.insertBitmap('numberpolice', 'numberpolice', 1340, 454);
      this.insertBitmap('numbervet', 'numbervet', 1164, 502);
      this.insertBitmap('numberfirefighter', 'numberfirefighter', 1236, 684);
      this.intento = 0;
      this.addToMain(new Score('score', this.preload.getResult('c1'), this.preload.getResult('c2'), 40, 1000, 8, 0));
      this.createHelp();
      this.createDroppers();
      this.createAlphabet();
      return this.introEvaluation();
    };

    U6A6.prototype.createHelp = function() {
      var a, b, c, d, e, f, g, h, help, p, t;
      help = new createjs.Container();
      help.x = 254;
      help.y = 1020;
      help.name = 'helper';
      p = this.createBitmap('prophelper', 'prophelper', 0, 0);
      help.addChild(p);
      t = this.createText('helpertxt', this.helps[8], '28px Quicksand', '#333', 660, 50);
      this.addToLibrary(t);
      a = this.createBitmap("btndoctor", "btn1", 0. * 80 + 20, 40);
      a.index = 1;
      a.addEventListener('click', this.showHelper);
      b = this.createBitmap("btnmechanic", "btn2", 1. * 80 + 20, 40);
      b.index = 2;
      b.addEventListener('click', this.showHelper);
      c = this.createBitmap("btnchef", "btn3", 2. * 80 + 20, 40);
      c.index = 3;
      c.addEventListener('click', this.showHelper);
      d = this.createBitmap("btnsalesclerk", "btn4", 3. * 80 + 20, 40);
      d.index = 4;
      d.addEventListener('click', this.showHelper);
      e = this.createBitmap("btnwaiter", "btn5", 4. * 80 + 20, 40);
      e.index = 5;
      e.addEventListener('click', this.showHelper);
      f = this.createBitmap("btnpolice", "btn6", 5. * 80 + 20, 40);
      f.index = 6;
      f.addEventListener('click', this.showHelper);
      g = this.createBitmap("btnvet", "btn7", 6. * 80 + 20, 40);
      g.index = 7;
      g.addEventListener('click', this.showHelper);
      h = this.createBitmap("btnfirefighter", "btn8", 7. * 80 + 20, 40);
      h.index = 8;
      h.addEventListener('click', this.showHelper);
      this.addToLibrary(a, b, c, d, e, f, g, h);
      help.addChild(a, b, c, d, e, f, g, h);
      help.addChild(t);
      return this.addToMain(help);
    };

    U6A6.prototype.createAlphabet = function() {
      var alphabet, i, letter, letterObj, _i, _ref;
      alphabet = new createjs.Container();
      alphabet.x = 230;
      alphabet.y = 900;
      alphabet.name = 'alphabet';
      for (i = _i = 0, _ref = this.abc.length - 1; _i <= _ref; i = _i += 1) {
        letter = this.abc[i];
        if (i <= 13) {
          letterObj = new DraggableText(letter, letter, letter, 83 * i, 0);
        } else {
          letterObj = new DraggableText(letter, letter, letter, 83 * i - 1080, 68);
        }
        letterObj.text.font = "48px Quicksand";
        letterObj.onInitEvaluation();
        alphabet.addChild(letterObj);
        this.addToLibrary(letterObj);
      }
      return this.addToMain(alphabet);
    };

    U6A6.prototype.createDroppers = function() {
      var crosswords, drop, i, t, _i, _j, _ref;
      crosswords = new createjs.Container();
      crosswords.x = 490;
      crosswords.name = 'crosswords';
      for (i = _i = 0, _ref = this.containers.length - 1; _i <= _ref; i = _i += 1) {
        drop = new WordContainer('h' + i, '', '#FFF', '#999', this.containers[i].x * 46, this.containers[i].y * 46, 46, 46);
        drop.setRectShape('#FFF', '#999', 2, 46, 46);
        drop.text.y -= 3;
        drop.id = this.containers[i].id;
        this.addToLibrary(drop);
        crosswords.addChild(drop);
      }
      for (i = _j = 0; _j <= 7; i = ++_j) {
        t = new createjs.Text(this.numbers[i].id, '28px Quicksand', '#333');
        t.x = this.numbers[i].x * 46 + 12;
        t.y = this.numbers[i].y * 46 + 8;
        crosswords.addChild(t);
      }
      this.addToMain(crosswords);
      return this.library.crosswords.cache(-46, -46, 720, 670);
    };

    U6A6.prototype.introEvaluation = function() {
      var i, letter, _i, _j, _len, _ref, _ref1,
        _this = this;
      U6A6.__super__.introEvaluation.apply(this, arguments);
      this.library.crosswords.y = 290;
      this.library.crosswords.alpha = 1;
      this.library.alphabet.y = 900;
      this.library.alphabet.alpha = 1;
      this.library.persondoctor.alpha = 1;
      this.library.personfirefighter.alpha = 1;
      this.library.personvet.alpha = 1;
      this.library.personpolice.alpha = 1;
      this.library.personwaiter.alpha = 1;
      this.library.personsalesclerk.alpha = 1;
      this.library.personchef.alpha = 1;
      this.library.personmechanic.alpha = 1;
      this.library.numberdoctor.alpha = 1;
      this.library.numberfirefighter.alpha = 1;
      this.library.numbervet.alpha = 1;
      this.library.numberpolice.alpha = 1;
      this.library.numberwaiter.alpha = 1;
      this.library.numbersalesclerk.alpha = 1;
      this.library.numberchef.alpha = 1;
      this.library.numbermechanic.alpha = 1;
      for (i = _i = 0, _ref = this.containers.length - 1; _i <= _ref; i = _i += 1) {
        if (this.containers[i].a) {
          this.library["h" + i].changeText(this.containers[i].id);
        } else {
          this.library["h" + i].changeText('');
        }
      }
      TweenLite.from(this.library.header, 1, {
        y: -this.library.header.height
      });
      TweenLite.from(this.library.instructions, 1, {
        alpha: 0,
        x: 0,
        delay: 0.5
      });
      TweenMax.allFrom([this.library.persondoctor, this.library.personfirefighter, this.library.personvet, this.library.personpolice, this.library.personwaiter, this.library.personsalesclerk, this.library.personchef, this.library.personmechanic], 1, {
        alpha: 0,
        delay: 1.5
      }, 0.2);
      TweenMax.allFrom([this.library.numberdoctor, this.library.numberfirefighter, this.library.numbervet, this.library.numberpolice, this.library.numberwaiter, this.library.numbersalesclerk, this.library.numberchef, this.library.numbermechanic], 1, {
        alpha: 0,
        delay: 1.5
      }, 0.2);
      TweenLite.from(this.library.alphabet, 1, {
        alpha: 0,
        y: this.library.alphabet.y + 40,
        delay: 1.5
      });
      TweenLite.from(this.library.helper, 1, {
        alpha: 0,
        y: this.library.helper.y + 40,
        delay: 1.5
      });
      TweenLite.from(this.library.crosswords, 1, {
        alpha: 0,
        y: this.library.crosswords.y + 40,
        delay: 1,
        onComplete: this.playInstructions,
        onCompleteParams: [this]
      });
      ({
        initEvaluation: function(e) {}
      });
      U6A6.__super__.introEvaluation.apply(this, arguments);
      _ref1 = this.abc;
      for (_j = 0, _len = _ref1.length; _j < _len; _j++) {
        letter = _ref1[_j];
        this.library[letter].addEventListener('drop', this.evaluateAnswer);
      }
      return this.library.crosswords.cache(-46, -46, 720, 670);
    };

    U6A6.prototype.showHelper = function(e) {
      return this.library.helpertxt.text = this.helps[e.target.index - 1];
    };

    U6A6.prototype.evaluateAnswer = function(e) {
      var dropped, hit, hitdrop, i, pt, _i, _ref;
      this.answer = e.target;
      dropped = false;
      hitdrop = null;
      for (i = _i = 0, _ref = this.containers.length - 1; _i <= _ref; i = _i += 1) {
        hit = this.library["h" + i];
        pt = hit.globalToLocal(this.stage.mouseX, this.stage.mouseY);
        if (hit.hitTest(pt.x, pt.y)) {
          dropped = true;
          if (hit.id === this.answer.index) {
            hitdrop = hit;
          }
        } else {
          this.answer.returnToPlace();
        }
      }
      if (dropped === true) {
        if (hitdrop !== null) {
          hitdrop.changeText(hitdrop.id);
          this.answer.x = this.answer.pos.x;
          this.answer.y = this.answer.pos.y;
          this.evaluate('doctor');
          this.evaluate('mechanic');
          this.evaluate('chef');
          this.evaluate('salesclerk');
          this.evaluate('waiter');
          this.evaluate('police');
          this.evaluate('vet');
          this.evaluate('firefighter');
          return this.library.crosswords.cache(-46, -46, 720, 670);
        } else {
          this.warning();
          return this.intento++;
        }
      }
    };

    U6A6.prototype.evaluate = function(obj) {
      var box, ready, _i, _len, _ref, _ref1;
      ready = true;
      if (!this.answers[obj].r) {
        _ref = this.answers[obj].c;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          box = _ref[_i];
          if (this.library["h" + box].text.text === '') {
            ready = false;
          }
        }
        if (ready) {
          this.robj = obj;
          this.answers[obj].r = true;
          if ((_ref1 = this.intento) === 0 || _ref1 === 1) {
            this.library['score'].plusOne();
          }
          this.intento = 0;
          createjs.Sound.play('good');
          this.library.helpertxt.text = this.helps[8];
          return this.finishEvaluation();
        }
      }
    };

    U6A6.prototype.finishEvaluation = function() {
      return TweenMax.allTo([this.library["btn" + this.robj], this.library["person" + this.robj], this.library["number" + this.robj]], 1, {
        alpha: 0,
        ease: Quart.easeOut,
        onComplete: this.nextEvaluation
      });
    };

    U6A6.prototype.nextEvaluation = function() {
      var complete, obj;
      complete = true;
      for (obj in this.answers) {
        if (this.answers[obj].r === false) {
          complete = false;
        }
      }
      if (complete) {
        return TweenLite.to(this.library.crosswords, 0.5, {
          alpha: 0,
          y: this.library.crosswords.y - 200,
          ease: Quart.easeOut,
          onComplete: this.finish
        });
      }
    };

    U6A6.prototype.blink = function(obj, state) {
      if (state == null) {
        state = true;
      }
      TweenMax.killTweensOf(obj);
      obj.alpha = 1;
      if (state) {
        return TweenMax.to(obj, 0.5, {
          alpha: .5,
          repeat: -1,
          yoyo: true
        });
      }
    };

    U6A6.prototype.finish = function() {
      TweenLite.to(this.library.alphabet, 0.5, {
        alpha: 0,
        y: this.library.alphabet.y - 200,
        ease: Quart.easeOut
      });
      TweenLite.from(this.library.helper, 1, {
        alpha: 0,
        y: this.library.helper.y + 40
      });
      return U6A6.__super__.finish.apply(this, arguments);
    };

    window.U6A6 = U6A6;

    return U6A6;

  })(Oda);

}).call(this);
