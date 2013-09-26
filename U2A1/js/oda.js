var stage, mainContainer, i, song, imgurl="imgs/";


var manifest = [
    {nombre: 'imgHeader', id: 'head', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', id:'inst' , src: imgurl + 'texto_look.png'},
    {nombre: 'imgC1', id:'c1' , src: imgurl + 'circle1.png'},
    {nombre: 'imgC2', id:'c2' , src: imgurl + 'circle2.png'},
    {nombre: 'fondoguia', id:'gu' , src: imgurl + 'guia.png'},
    {nombre: 'imgNube1', id: 'n1', src: imgurl + 'nube1.png'},
    {nombre: 'imgNube2', id: 'n2', src: imgurl + 'nube2.png'},
    {nombre: 'imgNube3', id: 'n3', src: imgurl + 'nube3.png'},
    {nombre: 'imgNube4', id: 'n4', src: imgurl + 'nube4.png'},
    {nombre: 'fondo', id: 'casa', src: imgurl + 'casita.png'},
    {nombre: 'linea', id: 'linea', src: imgurl + 'linea.png'},
 ];

var manifest2 = [
   
];


var manifestSounds = [
    {src:'sounds/boing.mp3', nombre:'boing'},
 
];



var todo = $.merge( manifest, manifest2);

for (var i = manifest.length - 1; i >= 0; i--) {
   eval("var " + manifest[i].nombre + " = new Image(); "); 
};

//var header, instructions, sg, pa;
var vblurFilter, hblurFilter, vBnds, hBnds;

var p1n1, p1n2, p1n3, p1n4;
var nubeUnoContenedor, nubeDosContenedor, nubeTresContenedor, nubeCuatroContenedor, words;
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
   // preloadSprite(manifest2, "personajeSps", "personajeAnim", 250, 200,125, 100,stageSize.w/2,200);
}

function setStage(){
    vblurFilter = new createjs.BlurFilter(0, 10, 1);
    hblurFilter = new createjs.BlurFilter(10, 0, 1);
    vBnds = vblurFilter.getBounds();
    hBnds = hblurFilter.getBounds();

    createImage("imgHeader",stageSize.w / 2 - imgHeader.width / 2,0, "mainContainer");
    createImage("imgInstrucciones",20,100, "mainContainer");
    //createImage("fondoguia",0,0, "mainContainer");
    createImage("fondo",84,137, "mainContainer");

    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);

    //header.filters = [vblurFilter];
    //header.cache(header.x+vBnds.x, header.y+vBnds.y, header.image.width+vBnds.width, header.image.height+vBnds.height);

    mainContainer.addChild( score);
    setDropper();
    setNube1();
    setNube2();
    setNube3();
    setNube4();
    initTest();
}
function setDropper(){
    var fondo = new createjs.Bitmap(linea);
    hit1 = new WordContainer( 'h1', '', 0, -40, 175, 38 );
    
    var pregunta = new createjs.Text("two dresses in the closet.", "30px Arial", "#333333");
    pregunta.x=188;
    pregunta.y=-30;
   

    words = new createjs.Container();

    words.x = 170;
    words.y = 560;

    words.addChild(fondo, hit1, pregunta);

    mainContainer.addChild(words);
}

function setNube1(){
    //backUno = new createjs.Bitmap(imgNube1);

    p1n1 = new Dragtxt("p1n1", "There is", 1, 0, 10, 16);

    nubeUnoContenedor = new createjs.Container();
    nubeUnoContenedor.y = 130;
    nubeUnoContenedor.x = 661;
    
    createImage("imgNube1",0,0,"nubeUnoContenedor");

    nubeUnoContenedor.addChild(p1n1);

    mainContainer.addChild(nubeUnoContenedor);
}
function setNube2(){

    p1n2 = new Dragtxt("p1n1", "There are", 2, 0, 10, 20);

    nubeDosContenedor = new createjs.Container();
    nubeDosContenedor.y = 223;
    nubeDosContenedor.x = 654;
    
    createImage("imgNube2",0,0,"nubeDosContenedor");

    nubeDosContenedor.addChild(p1n2);
    
    mainContainer.addChild(nubeDosContenedor);
}
function setNube3(){

    p1n3 = new Dragtxt("p1n3", "There isn't", 3, 0, 10, 20);
     
    nubeTresContenedor = new createjs.Container();
    nubeTresContenedor.y = 327;
    nubeTresContenedor.x = 650;
    
    createImage("imgNube3",0,0,"nubeTresContenedor");

    nubeTresContenedor.addChild( p1n3);

    mainContainer.addChild(nubeTresContenedor);
}
function setNube4(){

    p1n4 = new Dragtxt("p1n4", "There aren't", 4, 0, 10, 20);
     
    nubeCuatroContenedor = new createjs.Container();
    nubeCuatroContenedor.y = 425;
    nubeCuatroContenedor.x = 645;
    
    createImage("imgNube4",0,0,"nubeCuatroContenedor");

    nubeCuatroContenedor.addChild(p1n4);

    mainContainer.addChild(nubeCuatroContenedor);
}
function initTest(){
    i = 0;
 
    score.updateCount( i );

    TweenLite.from(imgHeader, 1, {y:-imgHeader.height});
    TweenLite.from(imgInstrucciones, 1, {alpha:0, x:0, delay:0.5});
    TweenLite.from(words, 0.5, {alpha:0, y:words.y+50, delay:1});
    TweenLite.from(nubeUnoContenedor, 0.3, {alpha:0, y:nubeUnoContenedor.y+50, delay:1.5});
    TweenLite.from(nubeDosContenedor, 0.3, {alpha:0, y:nubeDosContenedor.y+50, delay:1.8});
    TweenLite.from(nubeTresContenedor, 0.3, {alpha:0, y:nubeTresContenedor.y+50, delay:2.1});
    TweenLite.from(nubeCuatroContenedor, 0.3, {alpha:0, y:nubeCuatroContenedor.y+50, delay:2.4, onComplete: playInstructions});
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
    p1n2.addEventListener('drop', validateHit1);
    p1n3.addEventListener('drop', validateHit1);
    p1n4.addEventListener('drop', validateHit1);
  
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

 
