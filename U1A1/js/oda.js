var stage, mainContainer, i, song, imgurl="imgs/";


var manifest = [
    {nombre: 'imgHeader', id: 'head', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', id:'inst' , src: imgurl + 'texto_look.png'},
    {nombre: 'imgC1', id:'c1' , src: imgurl + 'circle1.png'},
    {nombre: 'imgC2', id:'c2' , src: imgurl + 'circle2.png'},
    {nombre: 'imgSG', id:'sg' , src: imgurl + 'start_game.png'},
    {nombre: 'imgPA', id:'pa' , src: imgurl + 'play_again.png'},
    {nombre: 'guiafondo', id:'gu' , src: imgurl + 'guia.png'},
    {nombre: 'imgNube1', id: 'n1', src: imgurl + 'nube1.png'},
    {nombre: 'imgNube2', id: 'n2', src: imgurl + 'nube2.png'},
    {nombre: 'imgNube3', id: 'n3', src: imgurl + 'nube3.png'},
    {nombre: 'imgGlobito', id: 'gg', src: imgurl + 'cuadro_naranja.png'},
];

var manifest2 = [
    {nombre: 'p1', id: 'per1', src: imgurl + 'ninos_cantando.png'},
    {nombre: 'p2', id: 'per2', src: imgurl + 'ninos_jugando.png'},
    {nombre: 'p3', id: 'per3', src: imgurl + 'nina_jugando.png'},
    {nombre: 'p4', id: 'per4', src: imgurl + 'ninos_leyendo.png'},
    {nombre: 'p5', id: 'per5', src: imgurl + 'nino_flauta.png'},
];


var manifestSounds = [
    {src:'sounds/boing.mp3', nombre:'boing'},
    {src:'sounds/TU2_U1_A1_Instructions.mp3', nombre:'instructions'},
    {src:'sounds/TU2_U1_A1_Im_painting_picture.mp3', nombre:'picture'},
    {src:'sounds/TU2_U1_A1_Im_playing_flute.mp3', nombre:'flute'},
    {src:'sounds/TU2_U1_A1_Were_playing_outside.mp3', nombre:'outside'},
    {src:'sounds/TU2_U1_A1_Were_singing_song.mp3', nombre:'song'},
    {src:'sounds/TU2_U1_A1_Were_studying_english.mp3', nombre:'english'},
];



var todo = $.merge( manifest, manifest2);

for (var i = manifest.length - 1; i >= 0; i--) {
   eval("var " + manifest[i].nombre + " = new Image(); "); 
};

//var header, instructions, sg, pa;
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

    //crea todos los sonidos
    for (var i = manifestSounds.length - 1; i >= 0; i--) {
       eval("createjs.Sound.registerSound('"+manifestSounds[i].src+"', '"+manifestSounds[i].nombre+"');");
    }

    createPreloaderBar();
    resizeOda();

    preload.addEventListener('complete', handleComplete);
    preload.addEventListener('progress', handleProgress);
    preload.loadManifest(todo);

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

function preloadImagenes(manifestName){
    for (var i = manifestName.length - 1; i >= 0; i--) {
       eval(manifestName[i].nombre+" = preload.getResult('"+manifestName[i].id+"');");
    };
}

function preloadSprite(manifestName, spriteName, spriteAnim, ancho, alto, equis, ye, Xtotal, Ytotal){
    var sprite=  (spriteName); 
    var animacion=  (spriteAnim); 
    var data = {
        images: [], 
        frames: {width: ancho, height: alto, regX: equis, regY: ye},
    };
    for (var i = 0; i <= manifestName.length - 1; i++) {
        eval("var im = preload.getResult('"+manifestName[i].src+"'); data.images.push(im);");
    };

    eval(sprite+" = new createjs.SpriteSheet(data);");
    eval(animacion+" = new createjs.BitmapAnimation("+sprite+");");
    eval(animacion+".x ="+Xtotal+";");
    eval(animacion+".y ="+Ytotal+";");
    eval(animacion+".currentFrame = 0;");
    eval("mainContainer.addChild("+animacion+");");
}
 
function createImage(name, equis, ye, parent){
    eval(name+" =  new createjs.Bitmap("+name+");");
    eval(name+".x = "+equis+";");
    eval(name+".y = "+ye+";");
    eval(parent+".addChild("+name+");");
}
function initAssets(){
    preloadImagenes(manifest);
    preloadSprite(manifest2, "personajeSps", "personajeAnim", 250, 200,125, 100,stageSize.w/2,200);
}

function setStage(){
    vblurFilter = new createjs.BlurFilter(0, 10, 1);
    hblurFilter = new createjs.BlurFilter(10, 0, 1);
    vBnds = vblurFilter.getBounds();
    hBnds = hblurFilter.getBounds();

    createImage("imgHeader",stageSize.w / 2 - imgHeader.width / 2,0, "mainContainer");
    createImage("imgInstrucciones",20,100, "mainContainer");

    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);

    //header.filters = [vblurFilter];
    //header.cache(header.x+vBnds.x, header.y+vBnds.y, header.image.width+vBnds.width, header.image.height+vBnds.height);

    mainContainer.addChild( score);
    setDropper();
    setNube1();
    setNube2();
    setNube3();
    initTest();
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

    personajeAnim.currentFrame = i;
    personajeAnim.scaleX = 1;
    personajeAnim.scaleY = 1;
    personajeAnim.alpha = 1;

    score.updateCount( i );

    TweenLite.from(imgHeader, 1, {y:-imgHeader.height});
    TweenLite.from(imgInstrucciones, 1, {alpha:0, x:0, delay:0.5});
    TweenLite.from(personajeAnim, 0.5, {alpha:0, y:personajeAnim.y+20, delay:1});
    TweenLite.from(words, 0.5, {alpha:0, y:words.y+50, delay:1});
    TweenLite.from(nubeUnoContenedor, 0.3, {alpha:0, y:nubeUnoContenedor.y+50, delay:1.5});
    TweenLite.from(nubeDosContenedor, 0.3, {alpha:0, y:nubeDosContenedor.y+50, delay:1.8});
    TweenLite.from(nubeTresContenedor, 0.3, {alpha:0, y:nubeTresContenedor.y+50, delay:2.1, onComplete: playInstructions});
}
function playInstructions(){
    if(dealersjs.mobile.isIOS() || dealersjs.mobile.isAndroid()){
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
    score.updateCount( i );
    if(i < answers.length){
        personajeAnim.currentFrame = i;
        TweenLite.to(personajeAnim, 0.5, {scaleX: 1, scaleY: 1, alpha: 1});
        evaluateWord1();
    }else{
        imgPA = preload.getResult('pa');
        pa = new createjs.Bitmap(imgPA);
        pa.regX = imgPA.width / 2;
        pa.regY = imgPA.height / 2;
        pa.x = 400;
        pa.y = 300;
        pa.addEventListener('click', paClickEvent);
        mainContainer.addChild(pa);
        TweenLite.from(pa, 0.5, {alpha:0, y:pa.y-20});
    }
}
function paClickEvent(){
    pa.removeEventListener('click', playAgain);
    TweenLite.to(pa, 0.5, {alpha:0, y:pa.y-20, onComplete: playAgain});
}
function playAgain(){
    mainContainer.removeChild(pa);
    initTest();
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

 
