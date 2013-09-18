var stage, mainContainer, i, song, imgurl="imgs/";

var imgHeader = new Image(),
    imgNube1 = new Image(),
    imgNube2 = new Image(),
    imgNube3 = new Image(),
    imgInstrucciones = new Image(),
    imgGlobito = new Image(),
    imgC1 = new Image(),
    imgC2 = new Image(),
    imgSG = new Image();

var header, instructions, sg;
var vblurFilter, hblurFilter, vBnds, hBnds;
var personajeSps, personajeAnim;
var p1n1, p2n1, p1n2, p2n2, p3n2, p4n2, p1n3, p2n3, p3n3, p4n3, p5n3;
var nubeUnoContenedor, nubeDosContenedor, nubeTresContenedor, words;
var hit1, hit2, hit3;
var backUno, backDos, backTres;
var progressLabel, preload, loaderBar, loaderColor, barHeight, barWidth, loadStep;
var answers = [
    {w1:1, w2:2, w3:2, sound:'song' },
    {w1:1, w2:1, w3:4, sound:'outside' },
    {w1:0, w2:0, w3:0, sound:'picture'},
    {w1:1, w2:3, w3:1, sound:'english' },
    {w1:0, w2:1, w3:3, sound:'flute'},
];
var stageSize = {w:800, h:600, r:1};

function resizeOda(){
    // browser viewport size
    var w = window.innerWidth;
    var h = window.innerHeight;
        
    // keep aspect ratio
    stageSize.r = Math.min(w / stageSize.w, h / stageSize.h);
    mainContainer.scaleX = stageSize.r;
    mainContainer.scaleY = stageSize.r;
            
    // Resize the canvas element
    $('#oda').width(w);
    stage.canvas.width = w;
    stage.canvas.height = h;          
            
    // Content: centered
    mainContainer.x = stage.canvas.width / 2 ;
    mainContainer.y = stage.canvas.height / 2;
}
function oda() {
    stage = new createjs.Stage('oda');
    preload = new createjs.LoadQueue(false);
    mainContainer = new createjs.Container();
    loadStep = 0;
    barHeight = 7;
    barWidth = 35;
    loaderColor = "#E62922";

    createjs.Ticker.addListener(window);
    createjs.Ticker.setFPS(60);
    createjs.Touch.enable(stage);
    stage.enableMouseOver();

    loaderBar = new createjs.Container();
    loaderBar.x = stageSize.w / 2;
    loaderBar.y = stageSize.h / 2;

    mainContainer.regY = stageSize.h / 2;
    mainContainer.regX = stageSize.w / 2;

    createjs.Sound.registerSound('sounds/boing.mp3', 'boing');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Instructions.mp3', 'instructions');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Im_painting_picture.mp3', 'picture');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Im_playing_flute.mp3', 'flute');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Were_playing_outside.mp3', 'outside');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Were_singing_song.mp3', 'song');
    createjs.Sound.registerSound('sounds/TU2_U1_A1_Were_studying_english.mp3', 'english');

    createPreloaderBar();
    resizeOda();

    preload.addEventListener('complete', handleComplete);
    preload.addEventListener('progress', handleProgress);
    preload.loadManifest([
      {id: 'n1', src: imgurl + 'nube1.png'},
      {id: 'n2', src: imgurl + 'nube2.png'},
      {id: 'n3', src: imgurl + 'nube3.png'},
      {id: 'inst', src: imgurl + 'texto_look.png'},
      {id: 'glob', src: imgurl + 'cuadro_naranja.png'},
      {id: 'head', src: imgurl + 'pleca.png'},
      {id: 'per1', src: imgurl + 'ninos_cantando.png'},
      {id: 'per2', src: imgurl + 'ninos_jugando.png'},
      {id: 'per3', src: imgurl + 'nina_jugando.png'},
      {id: 'per4', src: imgurl + 'ninos_leyendo.png'},
      {id: 'per5', src: imgurl + 'nino_flauta.png'},
      {id: 'c1', src: imgurl + 'circle1.png'},
      {id: 'c2', src: imgurl + 'circle2.png'}, 
      {id: 'sg', src: imgurl + 'start_game.png'}    
    ]);

    stage.addChild(mainContainer);
    mainContainer.addChild(loaderBar);

    TweenLite.from(loaderBar, 1, {alpha:0.9, ease: Quart.easeOut})
}
function createPreloaderBar(){
    for (var i=1; i<13; i++){
        var bgBar = new createjs.Shape();
        bgBar.graphics.setStrokeStyle(1).beginStroke(loaderColor).beginFill(loaderColor).drawRoundRect(0, 0, barWidth, barHeight, 5);
        bgBar.regX=-20;
        bgBar.regY= barHeight / 2;
        bgBar.rotation= (i-1) * 30;
        bgBar.alpha=0.05;
        bgBar.name= "bar"+ i.toString();
        loaderBar.addChild(bgBar);
    }
}
function handleProgress( e ){
    var percent = Math.round(preload.progress*100);
    if(e.loaded >= loadStep / 12 && loadStep < 12){
        showBar("bar" + (loadStep  + 1).toString());
        loadStep++;
    }
}
function showBar( name ){
    TweenLite.to(loaderBar.getChildByName(name), 2.5, {alpha:1, ease: Quart.easeOut});
}
function handleComplete(){
    preload.removeEventListener('complete', handleComplete);
    preload.removeEventListener('progress', handleProgress);
    
    TweenLite.to(loaderBar, 1, {alpha:0, ease: Quart.easeOut});
    
    initAssets();
    setStage();
}
function initAssets(){
    imgHeader = preload.getResult('head');
    imgNube1 = preload.getResult('n1');
    imgNube2 = preload.getResult('n2');
    imgNube3 = preload.getResult('n3');
    imgInstrucciones = preload.getResult('inst');
    imgGlobito = preload.getResult('glob');
    imgC1 = preload.getResult('c1');
    imgC2 = preload.getResult('c2');
    personajeSps = new createjs.SpriteSheet({
        images: [preload.getResult('per1'), preload.getResult('per2'), preload.getResult('per3'), preload.getResult('per4'), preload.getResult('per5')],
        frames: {width: 250, height: 200, regX: 125, regY: 100},
    });  
    personajeAnim = new createjs.BitmapAnimation(personajeSps);
}

function setStage(){
    vblurFilter = new createjs.BlurFilter(0, 10, 1);
    hblurFilter = new createjs.BlurFilter(10, 0, 1);
    vBnds = vblurFilter.getBounds();
    hBnds = hblurFilter.getBounds();

    header = new createjs.Bitmap(imgHeader);
    instructions = new createjs.Bitmap(imgInstrucciones);
    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);

    //header.filters = [vblurFilter];
    //header.cache(header.x+vBnds.x, header.y+vBnds.y, header.image.width+vBnds.width, header.image.height+vBnds.height);

    personajeAnim.x = stageSize.w/2;
    personajeAnim.y = 200;
    personajeAnim.currentFrame = 0;
    
    header.x = stageSize.w / 2 - imgHeader.width / 2;

    instructions.x = 20;
    instructions.y = 100;
    

    mainContainer.addChild(personajeAnim, header, instructions, score);

    setDropper();
    setNube1();
    setNube2();
    setNube3();
    initTest();
}
function refresh( bf, obj ){
    //obj.filters = [bf];
    //var objBnds = bf.getBounds();
    //obj.cache(obj.x+objBnds.x, obj.y+objBnds.y, obj.image.width+objBnds.width+50, obj.image.height+objBnds.height+50);
}
function setDropper(){
    var fondo = new createjs.Bitmap(imgGlobito);
    hit1 = new WordContainer( 'h1', '', 14, 62, 90, 22 );
    hit2 = new WordContainer( 'h2', '', 118, 62, 122, 22 );
    hit3 = new WordContainer( 'h3', '', 254, 62, 137, 22 );
    words = new createjs.Container();

    words.x = stageSize.w / 2 - imgGlobito.width / 2;
    words.y = personajeAnim.y + 80;

    words.addChild(fondo, hit1, hit2, hit3);

    mainContainer.addChild(words);
}

function setNube1(){
    backUno = new createjs.Bitmap(imgNube1);

    p1n1 = new Dragtxt("p1n1", "I'm", 1, 0, 40, 10);
    p2n1 = new Dragtxt("p2n1", "We're", 1, 1, 30, 40);

    nubeUnoContenedor = new createjs.Container();
     
    nubeUnoContenedor.y = words.y + 120;
    nubeUnoContenedor.x = 100;
    
    nubeUnoContenedor.addChild(backUno, p1n1, p2n1);

    mainContainer.addChild(nubeUnoContenedor);
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

    mainContainer.addChild(nubeDosContenedor);
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

    mainContainer.addChild(nubeTresContenedor);
}
function initTest(){
    i = 0;

    TweenLite.from(header, 1, {y:-imgHeader.height});
    TweenLite.from(instructions, 1, {alpha:0, x:0, delay:0.5});
    TweenLite.from(personajeAnim, 0.5, {alpha:0, y:personajeAnim.y+20, delay:1});
    TweenLite.to(vblurFilter, 1, {blurY:0, onUpdate: refresh, onUpdateParams:[vblurFilter, header]});
    TweenLite.from(words, 0.5, {alpha:0, y:words.y+50, delay:1});
    TweenLite.from(nubeUnoContenedor, 0.3, {alpha:0, y:nubeUnoContenedor.y+50, delay:1.5});
    TweenLite.from(nubeDosContenedor, 0.3, {alpha:0, y:nubeDosContenedor.y+50, delay:1.8});
    TweenLite.from(nubeTresContenedor, 0.3, {alpha:0, y:nubeTresContenedor.y+50, delay:2.1, onComplete: playInstructions});
}
function playInstructions(){
    if(createjs.Sound.BrowserDetect.isIOS || createjs.Sound.BrowserDetect.isAndroid){
        imgSG = preload.getResult('sg');
        sg = new createjs.Bitmap(imgSG);
        sg.regX = imgSG.width / 2;
        sg.regY = imgSG.height / 2;
        sg.x = 400;
        sg.y = 300;
        sg.addEventListener('click', initMobileInstructions);
        mainContainer.addChild(sg);
        TweenLite.from(sg, 0.3, {alpha:0, y:sg.y+20});
    }else{
        inst = createjs.Sound.play('instructions');
        inst.addEventListener('complete', initEvaluation);
    }
}
function initMobileInstructions(e){
    e.target.removeEventListener('click', initMobileInstructions);
    createjs.Sound.stop();
    inst = createjs.Sound.play('instructions');
    TweenLite.to(sg, 0.3, {alpha:0, y:sg.y+20, onComplete: removeMobileInstructions});
    inst.addEventListener('complete', initEvaluation);
}
function removeMobileInstructions(){
    mainContainer.removeChild(sg);
}
function initEvaluation(){
    $(window).trigger('initEval');
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
        score.updateCount( i );
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
            warning();
            palabra.returnToPlace();
        }
    }else{
        //createjs.Sound.play('boing');
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
            warning();
            palabra.returnToPlace();
        }
    }else{
        //createjs.Sound.play('boing');
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
            warning();
            palabra.returnToPlace();
        }
    }else{
        //createjs.Sound.play('boing');
        palabra.returnToPlace();
    }
}
function warning(){
    createjs.Sound.play('boing');
    TweenMax.to(mainContainer, 0.1, {x:mainContainer.x+10, repeat:6, yoyo:true});
}
function tick() {
    stage.update();
}

 
