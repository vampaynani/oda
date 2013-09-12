var stage, i, song, imgurl="imgs/";

var imgHeader = new Image(),
    imgNube1 = new Image(),
    imgNube2 = new Image(),
    imgNube3 = new Image(),
    imgInstrucciones = new Image(),
    imgGlobito = new Image();

var personajeSps, personajeAnim;

var p1n1, p2n1, p1n2, p2n2, p3n2, p4n2, p1n3, p2n3, p3n3, p4n3, p5n3;
var nubeUnoContenedor, nubeDosContenedor, nubeTresContenedor, words;
var hit1, hit2, hit3;
var backUno, backDos, backTres;
var progressLabel, preload;
var answers = [
    {w1:1, w2:2, w3:2, sound:'song' },
    {w1:1, w2:1, w3:4, sound:'outside' },
    {w1:0, w2:0, w3:0, sound:'picture'},
    {w1:1, w2:3, w3:1, sound:'english' },
    {w1:0, w2:1, w3:3, sound:'flute'},
];

function oda() {
    preload = new createjs.LoadQueue(false);

    createjs.Sound.registerSound('sounds/TU2_U1_A1_Im_painting_picture.mp3', 'picture');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Im_playing_flute.mp3', 'flute');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Were_playing_outside.mp3', 'outside');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Were_singing_song.mp3', 'song');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Were_studying_english.mp3', 'english');

    preload.addEventListener('complete', handleComplete);
    preload.addEventListener('progress', handleProgress);
    preload.loadManifest([
      {id: 'n1', src: imgurl + 'nube1.png'},
      {id: 'n2', src: imgurl + 'nube2.png'},
      {id: 'n3', src: imgurl + 'nube3.png'},
      {id: 'inst', src: imgurl + 'texto_look.png'},
      {id: 'glob', src: imgurl + 'cuadro_naranja.png'},
      {id: 'head', src: imgurl + 'head.png'},
      {id: 'per1', src: imgurl + 'ninos_cantando.png'},
      {id: 'per2', src: imgurl + 'ninos_jugando.png'},
      {id: 'per3', src: imgurl + 'nina_jugando.png'},
      {id: 'per4', src: imgurl + 'ninos_leyendo.png'},
      {id: 'per5', src: imgurl + 'nino_flauta.png'},     
    ]);
}
function handleProgress(){
  var percent = Math.round(preload.progress*100);
  $('#preloader').text(percent+"%");
}
function handleComplete(){
  $('#preloader').hide();
    initAssets();
    setStage();
    createjs.Ticker.addListener(window);
    createjs.Ticker.setFPS(60);
}
function initAssets(){
    imgHeader = preload.getResult('head');
    imgNube1 = preload.getResult('n1');
    imgNube2 = preload.getResult('n2');
    imgNube3 = preload.getResult('n3');
    imgInstrucciones = preload.getResult('inst');
    imgGlobito = preload.getResult('glob');
    personajeSps = new createjs.SpriteSheet({
        images: [preload.getResult('per1'), preload.getResult('per2'), preload.getResult('per3'), preload.getResult('per4'), preload.getResult('per5')],
        frames: {width: 250, height: 200, regX: 125, regY: 100},
    });  
    personajeAnim = new createjs.BitmapAnimation(personajeSps);
}

function setStage(){
    stage = new createjs.Stage('oda');

    createjs.Touch.enable(stage);
    stage.enableMouseOver();
    
    var header = new createjs.Bitmap(imgHeader);
    
    personajeAnim.x = stage.canvas.width/2;
    personajeAnim.y = 200;
    personajeAnim.currentFrame = 0;
    
    stage.addChild(personajeAnim);
    stage.addChild(header);
    
    setDropper();
    setNube1();
    setNube2();
    setNube3();
    initTest();
}

function setDropper(){
    var fondo = new createjs.Bitmap(imgGlobito);
    //hit1 = new createjs.Shape(new createjs.Graphics().beginFill('#ff0000').drawRect(0,0,90,22));
    hit1 = new WordContainer( 'h1', '', 14, 62, 90, 22 );
    hit2 = new WordContainer( 'h2', '', 118, 62, 122, 22 );
    hit3 = new WordContainer( 'h3', '', 254, 62, 137, 22 );
    words = new createjs.Container();

    words.x = stage.canvas.width/2 - imgGlobito.width/2;
    words.y = personajeAnim.y + 80;

    words.addChild(fondo, hit1, hit2, hit3);

    stage.addChild(words);
}

function setNube1(){
    backUno = new createjs.Bitmap(imgNube1);

    p1n1 = new Dragtxt("p1n1", "I'm", 1, 0, 40, 10);
    p2n1 = new Dragtxt("p2n1", "We're", 1, 1, 30, 40);

    nubeUnoContenedor = new createjs.Container();
     
    nubeUnoContenedor.y = words.y + 120;
    nubeUnoContenedor.x = 100;
    
    nubeUnoContenedor.addChild(backUno, p1n1, p2n1);

    stage.addChild(nubeUnoContenedor);
}
function setNube2(){
    backDos = new createjs.Bitmap(imgNube2);

    p1n2 = new Dragtxt("p1n2", "painting", 2, 0, 40, 30);
    p2n2 = new Dragtxt("p2n2", "playing", 2, 1, 140, 60);
    p3n2 = new Dragtxt("p3n2", "singing", 2, 2, 40, 80);
    p4n2 = new Dragtxt("p4n2", "studying", 2, 3, 120, 120);

    nubeDosContenedor = new createjs.Container();
     
    nubeDosContenedor.y = words.y + 120;
    nubeDosContenedor.x = 250;
    
    nubeDosContenedor.addChild(backDos, p1n2, p2n2, p3n2, p4n2);

    stage.addChild(nubeDosContenedor);
}
function setNube3(){
    backTres = new createjs.Bitmap(imgNube3);

    p1n3 = new Dragtxt("p1n3", "a picture.", 3, 0, 140, 30);
    p2n3 = new Dragtxt("p2n3", "English.", 3, 1, 20, 50);
    p3n3 = new Dragtxt("p3n3", "a song.", 3, 2, 140, 80);
    p4n3 = new Dragtxt("p4n3", "the flute.", 3, 3, 30, 100);
    p5n3 = new Dragtxt("p5n3", "outside.", 3, 4, 100, 140);
  
    nubeTresContenedor = new createjs.Container();

    nubeTresContenedor.y = words.y + 120;
    nubeTresContenedor.x = 540;
    
    nubeTresContenedor.addChild(backTres, p1n3, p2n3, p3n3, p4n3, p5n3);

    stage.addChild(nubeTresContenedor);
}
function initTest(){
    i = 0;
    evaluateWord1();
}
function blink( object, on ){
    if( on ){
        TweenMax.to(object, 0.5, {alpha:.2, repeat:-1, yoyo:true});
    }else{
        TweenMax.killTweensOf( object );
        object.alpha = 1;
    }
}
function clearQuestion(){
    var qs = new Array(p1n1, p2n1, p1n2, p2n2, p3n2, p4n2, p1n3, p2n3, p3n3, p4n3, p5n3);
    var hits = new Array(hit1, hit2, hit3);
    TweenLite.to(personajeAnim, 0.5, {scaleX: 1.5, scaleY: 1.5, alpha: 0, onComplete: nextQuestion});
    for(p in qs){
        qs[p].visible = true;
        qs[p].returnToPlace();
    }
    for(h in hits){
        hits[h].changeText('');
    }
}
function nextQuestion(){
    i++;
    if(i < answers.length){
        personajeAnim.currentFrame = i;
        TweenLite.to(personajeAnim, 0.5, {scaleX: 1, scaleY: 1, alpha: 1});
        evaluateWord1();
    }else{
        alert('Test terminado');
    }

}
function evaluateWord1(){
    p1n1.addEventListener('drop', validateHit1);
    p2n1.addEventListener('drop', validateHit1);
    hit1.blink();
    blink(backUno, true);
}
function evaluateWord2(){
    p1n2.addEventListener('drop', validateHit2);
    p2n2.addEventListener('drop', validateHit2);
    p3n2.addEventListener('drop', validateHit2);
    p4n2.addEventListener('drop', validateHit2);
    hit2.blink();
    blink(backDos, true);
}
function evaluateWord3(){
    p1n3.addEventListener('drop', validateHit3);
    p2n3.addEventListener('drop', validateHit3);
    p3n3.addEventListener('drop', validateHit3);
    p4n3.addEventListener('drop', validateHit3);
    p5n3.addEventListener('drop', validateHit3);
    hit3.blink();
    blink(backTres, true);
}
function validateHit1(e){
    var palabra = e.target;
    var pt = hit1.globalToLocal(stage.mouseX, stage.mouseY);
    if(hit1.hitTest( pt.x, pt.y ) ){
        if(palabra.value == answers[i].w1){
            palabra.visible = false;
            hit1.changeText( palabra.text.text );
            hit1.noBlink();
            blink(backUno, false);
            evaluateWord2();
        }else{
            palabra.returnToPlace();
        }
    }else{
        palabra.returnToPlace();
    }
}
function validateHit2(e){
    var palabra = e.target;
    var pt = hit2.globalToLocal(stage.mouseX, stage.mouseY);
    if(hit2.hitTest( pt.x, pt.y ) ){
        if(palabra.value == answers[i].w2){
            palabra.visible = false;
            hit2.changeText( palabra.text.text );
            hit2.noBlink();
            blink(backDos, false);
            evaluateWord3();
        }else{
            palabra.returnToPlace();
        }
    }else{
        palabra.returnToPlace();
    }
}
function validateHit3(e){
    var palabra = e.target;
    var pt = hit3.globalToLocal(stage.mouseX, stage.mouseY);
    if(hit3.hitTest( pt.x, pt.y ) ){
        if(palabra.value == answers[i].w3){
            palabra.visible = false;
            hit3.changeText( palabra.text.text );
            hit3.noBlink();
            blink(backTres, false);
            song = createjs.Sound.play(answers[i].sound);
            song.addEventListener('complete', clearQuestion);
        }else{
            palabra.returnToPlace();
        }
    }else{
        palabra.returnToPlace();
    }
}
function tick() {
    stage.update();
}

 
