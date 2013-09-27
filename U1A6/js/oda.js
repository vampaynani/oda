var stage, mainContainer, i, song, imgurl="imgs/";

var manifest = [
    {nombre: 'imgHeader', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', src: imgurl + 'texto_look.png'},
    {nombre: 'imgC1',  src: imgurl + 'circle1.png'},
    {nombre: 'imgC2',  src: imgurl + 'circle2.png'},
    {nombre: 'guiafondo',  src: imgurl + 'guia.png'},
    {nombre: 'crossWords',  src: imgurl + 'cross_words.png'},
    {nombre: 'bass', src: imgurl + 'bass.png'},
    {nombre: 'bass_number', src: imgurl + 'bass_number.png'},
    {nombre: 'drum', src: imgurl + 'drum.png'},
    {nombre: 'drum_number', src: imgurl + 'drum_number.png'},
    {nombre: 'guitar', src: imgurl + 'guitar.png'},
    {nombre: 'guitar_number', src: imgurl + 'guitar_number.png'},
    {nombre: 'flute', src: imgurl + 'flute.png'},
    {nombre: 'flute_number', src: imgurl + 'flute_number.png'},
    {nombre: 'piano', src: imgurl + 'piano.png'},
    {nombre: 'piano_number', src: imgurl + 'piano_number.png'},
    {nombre: 'sax', src: imgurl + 'sax.png'},
    {nombre: 'sax_number', src: imgurl + 'sax_number.png'},
    {nombre: 'tambourine', src: imgurl + 'tambourine.png'},
    {nombre: 'tambourine_number', src: imgurl + 'tambourine_number.png'},
    {nombre: 'trumpet', src: imgurl + 'trumpet.png'},
    {nombre: 'trumpet_number', src: imgurl + 'trumpet_number.png'},
];

var manifest2 = [
    {nombre: 'aLetra', src: imgurl + 'a.png'},
    {nombre: 'bLetra', src: imgurl + 'b.png'},
    {nombre: 'cLetra', src: imgurl + 'c.png'},
    {nombre: 'dLetra', src: imgurl + 'd.png'},
    {nombre: 'eLetra', src: imgurl + 'e.png'},
    {nombre: 'fLetra', src: imgurl + 'f.png'},
    {nombre: 'gLetra', src: imgurl + 'g.png'},
    {nombre: 'hLetra', src: imgurl + 'h.png'},
    {nombre: 'iLetra', src: imgurl + 'i.png'},
    {nombre: 'jLetra', src: imgurl + 'j.png'},
    {nombre: 'kLetra', src: imgurl + 'k.png'},
    {nombre: 'lLetra', src: imgurl + 'l.png'},
    {nombre: 'mLetra', src: imgurl + 'm.png'},
    {nombre: 'nLetra', src: imgurl + 'n.png'},
    {nombre: 'oLetra', src: imgurl + 'o.png'},
    {nombre: 'pLetra', src: imgurl + 'p.png'},
    {nombre: 'qLetra', src: imgurl + 'q.png'},
    {nombre: 'rLetra', src: imgurl + 'r.png'},
    {nombre: 'sLetra', src: imgurl + 's.png'},
    {nombre: 'tLetra', src: imgurl + 't.png'},
    {nombre: 'uLetra', src: imgurl + 'u.png'},
    {nombre: 'vLetra', src: imgurl + 'v.png'},
    {nombre: 'wLetra', src: imgurl + 'w.png'},
    {nombre: 'xLetra', src: imgurl + 'x.png'},
    {nombre: 'yLetra', src: imgurl + 'y.png'},
    {nombre: 'zLetra', src: imgurl + 'z.png'},

];

var manifestSounds = [
    {src:'sounds/boing.mp3', nombre:'boing'},
  
];

var answers = [
    {w1:1, w2:2, w3:2, sound:'song' },
    {w1:1, w2:1, w3:4, sound:'outside' },
    {w1:0, w2:0, w3:0, sound:'picture'},
    {w1:1, w2:3, w3:1, sound:'english' },
    {w1:0, w2:1, w3:3, sound:'flute'},
];

var todo = $.merge( manifest, manifest2);

for (var i = manifest.length - 1; i >= 0; i--) {
   eval("var " + manifest[i].nombre + " = new Image(); "); 
};

var personajeSps, personajeAnim;
var vblurFilter, hblurFilter, vBnds, hBnds;
var p1n1, p2n1, p3n1, p4n1, p5n1, p1n2, p2n2, p3n2, p4n2, p5n2, p1n3, p2n3, p3n3, p4n3, p5n3;

var groupUnoContenedor, groupDosContenedor, groupTresContenedor, words;
var hit1, hit2, hit3;
var backUno, backDos, backTres;
var progressLabel, preload, loaderBar, loaderColor, barHeight, barWidth, loadStep;

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

function letrasAbajo(){
    for (var i = 0; i <= 13; i++) {
        eval("var letra"+i+" = new Draggable('letra"+i+"', "+manifest2[i].nombre+", 0, i, 135+41.5*i, 510);");
        eval("mainContainer.addChild(letra"+i+");");
    }
    for (var i = 14; i <= manifest2.length-1; i++) {
        eval("var letra"+i+" = new Draggable('letra"+i+"', "+manifest2[i].nombre+", 0, i, 41.5*i-405, 544);");
        eval("mainContainer.addChild(letra"+i+");");

    }
}

function initAssets(){
    preloadImagenes(manifest);
}

function setStage(){
    vblurFilter = new createjs.BlurFilter(0, 10, 1);
    hblurFilter = new createjs.BlurFilter(10, 0, 1);
    vBnds = vblurFilter.getBounds();
    hBnds = hblurFilter.getBounds();

    createImage("imgHeader",stageSize.w / 2 - imgHeader.width / 2,0, "mainContainer");
    createImage("imgInstrucciones",20,100, "mainContainer");
    //createImage("guiafondo",0,0, "mainContainer");
    createImage("crossWords",289,200, "mainContainer");
    createImage("sax",341,118, "mainContainer");
    createImage("sax_number",346,130, "mainContainer");
    createImage("drum",99,125, "mainContainer");
    createImage("drum_number",69,125, "mainContainer");
    createImage("guitar",99,228, "mainContainer");
    createImage("guitar_number",163,252, "mainContainer");
    createImage("tambourine",192,412, "mainContainer");
    createImage("tambourine_number",197,390, "mainContainer");
    createImage("trumpet",353,446, "mainContainer");
    createImage("trumpet_number",322,444, "mainContainer");
    createImage("flute",546,448, "mainContainer");
    createImage("flute_number",521,443, "mainContainer");
    createImage("bass",639,249, "mainContainer");
    createImage("bass_number",621,279, "mainContainer");
    createImage("piano",567,77, "mainContainer");
    createImage("piano_number",567,138, "mainContainer");

    letrasAbajo();

    //header.filters = [vblurFilter];
    //header.cache(header.x+vBnds.x, header.y+vBnds.y, header.image.width+vBnds.width, header.image.height+vBnds.height);

    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);
    mainContainer.addChild(score);

    setDropper();

    initTest();
}
/*
function refresh( bf, obj ){
    //obj.filters = [bf];
    //var objBnds = bf.getBounds();
    //obj.cache(obj.x+objBnds.x, obj.y+objBnds.y, obj.image.width+objBnds.width+50, obj.image.height+objBnds.height+50);
}
*/
function charContainer( hit, numero, xcoord, ycoord){
    eval("var hit"+numero+";");
    var cuadricula=23.5;
    eval("hit"+numero+"= new WordContainer('h"+numero+"', '', "+xcoord*cuadricula+","+ycoord*cuadricula+",22,22);");
    eval("words.addChild(hit"+numero+");");
}
function setDropper(){
  
    words = new createjs.Container();
    words.x = 303;
    words.y = 214;

    charContainer("hit1", 1,0,2);
    charContainer("hit2", 2,0,3);
    charContainer("hit3", 3,0,4);
    charContainer("hit4", 4,0,5);
    charContainer("hit5", 5,0,6);
    charContainer("hit6", 6,0,7);
    charContainer("hit7", 7,0,8);

    charContainer("hit8", 8,1,2);
    charContainer("hit9", 9,1,6);

    charContainer("hit10", 10,2,2);
    charContainer("hit11", 11,2,5);
    charContainer("hit12", 12,2,6);
    charContainer("hit13", 13,2,7);
    charContainer("hit14", 14,2,8);

    charContainer("hit15", 15,3,2);
    charContainer("hit16", 16,3,6);
    charContainer("hit17", 17,3,8);

    charContainer("hit18", 18,4,2);
    charContainer("hit19", 19,4,6);
    charContainer("hit20", 20,4,8);

    charContainer("hit21", 21,5,0);
    charContainer("hit22", 22,5,1);
    charContainer("hit23", 23,5,2);
    charContainer("hit24", 24,5,3);
    charContainer("hit25", 25,5,8);

    charContainer("hit26", 26,6,2);
    charContainer("hit27", 27,6,8);

    charContainer("hit28", 28,7,0);
    charContainer("hit29", 29,7,1);
    charContainer("hit30", 30,7,2);
    charContainer("hit31", 31,7,3);
    charContainer("hit32", 32,7,4);
    charContainer("hit33", 33,7,5);
    charContainer("hit34", 34,7,8);

    charContainer("hit35", 35,8,2);
    charContainer("hit36", 36,8,8);

    charContainer("hit37", 37,9,2);
    charContainer("hit38", 38,9,8);

    charContainer("hit39", 39,10,4);
    charContainer("hit40", 40,10,5);
    charContainer("hit41", 41,10,6);
    charContainer("hit42", 42,10,7);
    charContainer("hit43", 43,10,8);

    mainContainer.addChild(words);
}

function initTest(){
    i = 0;

    TweenLite.from(imgHeader, 1, {y:-imgHeader.height});
    TweenLite.from(imgInstrucciones, 1, {alpha:0, x:0, delay:0.5});
    //TweenLite.to(vblurFilter, 1, {blurY:0, onUpdate: refresh, onUpdateParams:[vblurFilter, header]});
    TweenLite.from(words, 0.5, {alpha:0, y:words.y+50, delay:1});
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
    if(i < answers.length){
        score.updateCount( i );
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

 
