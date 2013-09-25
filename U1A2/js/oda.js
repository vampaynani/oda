var stage, mainContainer, i, song, imgurl="imgs/";

var manifest = [
    {nombre: 'imgHeader', id: 'head', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', id:'inst' , src: imgurl + 'texto_look.png'},
    {nombre: 'imgC1', id:'c1' , src: imgurl + 'circle1.png'},
    {nombre: 'imgC2', id:'c2' , src: imgurl + 'circle2.png'},
    {nombre: 'guia', id:'gg' , src: imgurl + 'guia.png'},

    {nombre: 'question', id:'q' , src: imgurl + 'question_name.png'},
    {nombre: 'button', id:'btn' , src: imgurl + 'repeat_btn.png'},
    {nombre: 'facesfondo', id:'faces' , src: imgurl + 'faces_stage.png'},

    {nombre: 'name1', id:'n1' , src: imgurl + 'kid_april.png'},
    {nombre: 'name6', id:'n6' , src: imgurl + 'kid_danielle.png'},
    {nombre: 'name5', id:'n5' , src: imgurl + 'kid_holly.png'},
    {nombre: 'name3', id:'n3' , src: imgurl + 'kid_jess.png'},
    {nombre: 'name2', id:'n2' , src: imgurl + 'kid_lindsey.png'},
    {nombre: 'name4', id:'n4' , src: imgurl + 'kid_madison.png'},
   
];

var manifest2 = [
    {nombre: 'p1', id: 'per1', src: imgurl + 'image_april.png'},
    {nombre: 'p6', id: 'per6', src: imgurl + 'image_danielle.png'},
    {nombre: 'p5', id: 'per5', src: imgurl + 'image_holly.png'},
    {nombre: 'p3', id: 'per3', src: imgurl + 'image_jess.png'},
    {nombre: 'p2', id: 'per2', src: imgurl + 'image_lindsey.png'},
    {nombre: 'p4', id: 'per4', src: imgurl + 'image_madison.png'}
];

var manifestSounds = [
    {src:'sounds/boing.mp3', nombre:'boing'},
    {src:'sounds/TU2_U1_A2_instructions.mp3', nombre:'instructions'},
    {src:'sounds/TU2_U1_A2_april.mp3', nombre:'april'},
    {src:'sounds/TU2_U1_A2_danielle.mp3', nombre:'danielle'},
    {src:'sounds/TU2_U1_A2_holly.mp3', nombre:'holly'},
    {src:'sounds/TU2_U1_A2_jess.mp3', nombre:'jess'},
    {src:'sounds/TU2_U1_A2_lindsey.mp3', nombre:'lindsey'},
    {src:'sounds/TU2_U1_A2_madison.mp3', nombre:'madison'}
];

var answers = [
    {w1:1, w2:2, w3:2, sound:'song' },
    {w1:1, w2:1, w3:4, sound:'outside' },
    {w1:0, w2:0, w3:0, sound:'picture'},
    {w1:1, w2:3, w3:1, sound:'english' },
    {w1:0, w2:1, w3:3, sound:'flute'},
];

var todo = $.merge( manifest, manifest2);
console.log(todo);

for (var i = manifest.length - 1; i >= 0; i--) {
   eval("var " + manifest[i].nombre + " = new Image(); "); 
   console.log ( manifest[i].nombre);
};

var personajeSps, personajeAnim;
var p1n1, p2n1;
var nombreContenedor, words;
var hit1;
var backUno, boton;
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

function preloadSprite(manifestName, spriteName, spriteAnim, ancho, alto, equis, ye){
    var sprite=  (spriteName); 
    var animacion=  (spriteAnim); 
    var data = {
        images: [], 
        frames: {width: ancho, height: alto, regX: equis, regY: ye},
    };
    for (var i = 0; i <= manifestName.length - 1; i++) {
        eval("var im = preload.getResult('"+manifestName[i].src+"'); data.images.push(im); console.log(im.width, im.height);");
    };
    eval(sprite+" = new createjs.SpriteSheet(data);");
    eval(animacion+" = new createjs.BitmapAnimation("+sprite+");");
}
 
function initAssets(){
    preloadImagenes(manifest);
    preloadSprite(manifest2, "personajeSps", "personajeAnim", 180, 180, 0, 0);
}

function setStage(){
    header = new createjs.Bitmap(imgHeader);
    instructions = new createjs.Bitmap(imgInstrucciones);


    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);

    personajeAnim.x = 100;
    personajeAnim.y = stageSize.h - 180;

    personajeAnim.currentFrame = 0;
    header.x = stageSize.w / 2 - imgHeader.width / 2;
    instructions.x = 20;
    instructions.y = 100;
    mainContainer.addChild(personajeAnim, header, instructions, score);
    setDropper();
    setNombres();

    initTest();
}
function setDropper(){
    var fondo = new createjs.Bitmap(question);
    hit1 = new WordContainer( 'h1', '', 250, 0, 120, 22 );
   
    words = new createjs.Container();

    words.x = 285;
    words.y = stageSize.h - 70;

    words.addChild(fondo, hit1);

    mainContainer.addChild(words);
}

function setNombres(){
    backUno = new createjs.Bitmap(facesfondo);
    backUno.x=69;

    boton = new createjs.Bitmap(button);
    boton.x =300;
    boton.y =320;

    name1 = new createjs.Bitmap(name1);
    name1.x = 16;
    name1.y = 20;
    name2 = new createjs.Bitmap(name2);
    name2.x = 4;
    name2.y = 78;
    name3 = new createjs.Bitmap(name3);
    name3.x = 16;
    name3.y = 125;
    name4 = new createjs.Bitmap(name4);
    name4.x = 4;
    name4.y = 164;    
    name5 = new createjs.Bitmap(name5);
    name5.x = 16;
    name5.y = 210;        
    name6 = new createjs.Bitmap(name6);
    name6.x = 4;
    name6.y = 260;      
  
    nombreContenedor = new createjs.Container();
    nombreContenedor.y = 132;
    nombreContenedor.x = 120;
    
    nombreContenedor.addChild(backUno, boton, name1, name2, name3, name4, name5, name6);

    mainContainer.addChild(nombreContenedor);
}
function initTest(){
    i = 0;

    personajeAnim.currentFrame = i;
    personajeAnim.scaleX = 1;
    personajeAnim.scaleY = 1;
    personajeAnim.alpha = 1;

    TweenLite.from(header, 1, {y:-imgHeader.height});
    TweenLite.from(instructions, 1, {alpha:0, x:0, delay:0.5});
    TweenLite.from(personajeAnim, 0.5, {alpha:0, y:personajeAnim.y+20, delay:1});
    TweenLite.from(words, 0.5, {alpha:0, y:words.y+50, delay:1});
    TweenLite.from(nombreContenedor, 0.3, {alpha:0, y:nombreContenedor.y+50, delay:1.5, onComplete: playInstructions});
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
        console.log(createjs.Sound);
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

 
