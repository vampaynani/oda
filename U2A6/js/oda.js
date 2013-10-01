var stage, mainContainer, i, song, imgurl="imgs/";

var manifest = [
    {nombre: 'imgHeader', id: 'head', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', id:'inst' , src: imgurl + 'texto_look.png'},
    {nombre: 'fondoguia', id:'guia' , src: imgurl + 'guia.png'},
    {nombre: 'background', id:'background', src:imgurl + 'background.png'},
    {nombre: 'bucket6', id:'bucket6', src:imgurl + 'bucket.png'},
    {nombre: 'bucket1', id:'bucket1', src:imgurl + 'bucket.png'},
    {nombre: 'bucket2', id:'bucket2', src:imgurl + 'bucket.png'},
    {nombre: 'bucket3', id:'bucket3', src:imgurl + 'bucket.png'},
    {nombre: 'bucket4', id:'bucket4', src:imgurl + 'bucket.png'},
    {nombre: 'bucket5', id:'bucket5', src:imgurl + 'bucket.png'},
    {nombre: 'circle', id:'circle', src:imgurl + 'circle.png'},
    {nombre: 'level1Btn', id:'level1Btn', src:imgurl + 'level1-btn.png'},
    {nombre: 'level2Btn', id:'level2Btn', src:imgurl + 'level2-btn.png'},
    {nombre: 'level3Btn', id:'level3Btn', src:imgurl + 'level3-btn.png'},
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

var gotas;
var hit1, hit2, hit3, hit4, hit5, hit6;
var progressLabel, preload, loaderBar, loaderColor, barHeight, barWidth, loadStep;
var answers = [

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
}
function setStage(){
    vblurFilter = new createjs.BlurFilter(0, 10, 1);
    hblurFilter = new createjs.BlurFilter(10, 0, 1);
    vBnds = vblurFilter.getBounds();
    hBnds = hblurFilter.getBounds();
    createImage("background",0,0, "mainContainer");
    createImage("level1Btn",731,436, "mainContainer");
    createImage("level2Btn",731,483, "mainContainer");
    createImage("level3Btn",731,530, "mainContainer");
    createImage("circle",20,482, "mainContainer");

    createImage("imgHeader",stageSize.w / 2 - imgHeader.width / 2,0, "mainContainer");
    createImage("imgInstrucciones",20,100, "mainContainer");

    setGotas();
    setDropper();
    initTest();
}
function setDropper(){
    hit1 = new WordContainer( 'h1', '',132,492, 76,80 );
    hit2 = new WordContainer( 'h2', '',232,466, 76,80 );
    hit3 = new WordContainer( 'h3', '',332,492, 76,80 );
    hit4 = new WordContainer( 'h4', '',432,466, 76,80 );
    hit5 = new WordContainer( 'h5', '',532,492, 76,80 );
    hit6 = new WordContainer( 'h6', '',632,466, 76,80 );
   
    box = new createjs.Container();
    box.x = 0;
    box.y = 0;
    createImage("bucket1",132,492,"box");
    createImage("bucket2",232,466,"box");
    createImage("bucket3",332,492,"box");
    createImage("bucket4",432,466,"box");
    createImage("bucket5",532,492,"box");
    createImage("bucket6",632,466,"box");

    box.addChild( hit1, hit2, hit3, hit4, hit5, hit6);

    mainContainer.addChild(box);
}

function setGotas(){
    gotas = new createjs.Container();
    gotas.y = 0;
    gotas.x = 0;

    gotas.addChild();

    mainContainer.addChild(gotas);
}
 
function initTest(){
    i = 0;
 
    //score.updateCount( i );

    TweenLite.from(imgHeader, 1, {y:-imgHeader.height});
    TweenLite.from(imgInstrucciones, 1, {alpha:0, x:0, delay:0.5});
    TweenLite.from(box, 0.5, {alpha:0, y:box.y+50, delay:1});
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
}
function blink( object, on ){
    if( on ){
        TweenMax.to(object, 0.5, {alpha:.2, repeat:-1, yoyo:true});
    }else{
        TweenMax.killTweensOf( object );
        object.alpha = 1;
    }
}

function warning(){
    createjs.Sound.play('boing');
    TweenMax.to(mainContainer, 0.1, {x:mainContainer.x+10, repeat:6, yoyo:true});
}
function tick() {
    stage.update();
}

 
