var stage, mainContainer, i, song, imgurl="imgs/";


var manifest = [
    {nombre: 'imgHeader', id: 'head', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', id:'inst' , src: imgurl + 'texto_look.png'},
    {nombre: 'imgC1', id:'c1' , src: imgurl + 'circle1.png'},
    {nombre: 'imgC2', id:'c2' , src: imgurl + 'circle2.png'},
    {nombre: 'fondoguia', id:'gu' , src: imgurl + 'guia.png'},
    {nombre: 'linea', id: 'linea', src: imgurl + 'linea.png'},
    {nombre: 'aboveBtn', id: 'above', src: imgurl + 'above-btn.png'},
    {nombre: 'behindBtn', id: 'behind', src: imgurl + 'behind-btn.png'},
    {nombre: 'inBtn', id: 'in', src: imgurl + 'in-btn.png'},
    {nombre: 'nextBtn', id: 'next', src: imgurl + 'next-btn.png'},
    {nombre: 'onBtn', id: 'on', src: imgurl + 'on-btn.png'},
    {nombre: 'p1Btn', id: 'p1', src: imgurl + 'p1-btn.png'},
    {nombre: 'p2Btn', id: 'p2', src: imgurl + 'p2-btn.png'},
    {nombre: 'p3Btn', id: 'p3', src: imgurl + 'p3-btn.png'},
    {nombre: 'underBtn', id: 'under', src: imgurl + 'under-btn.png'},
    {nombre: 'marco1', id: 'm1', src: imgurl + 'marco-1.png'},
    {nombre: 'marco2', id: 'm2', src: imgurl + 'marco-2.png'},
    {nombre: 'marco3', id: 'm3', src: imgurl + 'marco-3.png'},

 ];

var manifest2 = [
    {nombre: 'p1p1',     id: 'p1p1',       src: imgurl + 'puzzle1-1.png', },
    {nombre: 'p1p1back', id: 'p1p1back',       src: imgurl + 'puzzle1-1-back.png'},
    {nombre: 'p1p2',     id: 'p1p2',       src: imgurl + 'puzzle1-2.png'},
    {nombre: 'p1p2back', id: 'p1p2back',       src: imgurl + 'puzzle1-2-back.png'},
    {nombre: 'p1p3',     id: 'p1p3',       src: imgurl + 'puzzle1-3.png'},
    {nombre: 'p1p3back', id: 'p1p3back',       src: imgurl + 'puzzle1-3-back.png'},
    {nombre: 'p1p4',     id: 'p1p4',       src: imgurl + 'puzzle1-4.png'},
    {nombre: 'p1p4back', id: 'p1p4back',       src: imgurl + 'puzzle1-4-back.png'},
    {nombre: 'p1p5',     id: 'p1p5',       src: imgurl + 'puzzle1-5.png'},
    {nombre: 'p1p5back', id: 'p1p5back',       src: imgurl + 'puzzle1-5-back.png'},
    {nombre: 'p1p6',     id: 'p1p6',       src: imgurl + 'puzzle1-6.png'},
    {nombre: 'p1p6back', id: 'p1p6back',       src: imgurl + 'puzzle1-6-back.png'},
    {nombre: 'p1p7',     id: 'p1p7',       src: imgurl + 'puzzle1-7.png'},
    {nombre: 'p1p7back', id: 'p1p7back',       src: imgurl + 'puzzle1-7-back.png'},
    {nombre: 'p1p8',     id: 'p1p8',       src: imgurl + 'puzzle1-8.png'},
    {nombre: 'p1p8back', id: 'p1p8back',       src: imgurl + 'puzzle1-8-back.png'},
    {nombre: 'p1p9',     id: 'p1p9',       src: imgurl + 'puzzle1-9.png'},
    {nombre: 'p1p9back',id: 'p1p9back',       src: imgurl + 'puzzle1-9-back.png'},
    {nombre: 'p1p10',    id: 'p1p10',       src: imgurl + 'puzzle1-10.png'},
    {nombre: 'p1p10back',id: 'p1p10back',       src: imgurl + 'puzzle1-10-back.png'},
    {nombre: 'p1p11',    id: 'p1p11',       src: imgurl + 'puzzle1-11.png'},
    {nombre: 'p1p11back',id: 'p1p11back',       src: imgurl + 'puzzle1-11-back.png'},
    {nombre: 'p1p12',    id: 'p1p12',       src: imgurl + 'puzzle1-12.png'},
    {nombre: 'p1p12back',id: 'p1p12back',       src: imgurl + 'puzzle1-12-back.png'},

    {nombre: 'p2p1',     id: 'p2p1',       src: imgurl + 'puzzle2-1.png'},
    {nombre: 'p2p1back', id: 'p2p1back',       src: imgurl + 'puzzle2-1-back.png'},
    {nombre: 'p2p2',     id: 'p2p2',       src: imgurl + 'puzzle2-2.png'},
    {nombre: 'p2p2back', id: 'p2p2back',       src: imgurl + 'puzzle2-2-back.png'},
    {nombre: 'p2p3',     id: 'p2p3',       src: imgurl + 'puzzle2-3.png'},
    {nombre: 'p2p3back', id: 'p2p3back',       src: imgurl + 'puzzle2-3-back.png'},
    {nombre: 'p2p4',     id: 'p2p4',       src: imgurl + 'puzzle2-4.png'},
    {nombre: 'p2p4back', id: 'p2p4back',       src: imgurl + 'puzzle2-4-back.png'},
    {nombre: 'p2p5',     id: 'p2p5',       src: imgurl + 'puzzle2-5.png'},
    {nombre: 'p2p5back', id: 'p2p5back',       src: imgurl + 'puzzle2-5-back.png'},
    {nombre: 'p2p6',     id: 'p2p6',       src: imgurl + 'puzzle2-6.png'},
    {nombre: 'p2p6back', id: 'p2p6back',       src: imgurl + 'puzzle2-6-back.png'},
    {nombre: 'p2p7',     id: 'p2p7',       src: imgurl + 'puzzle2-7.png'},
    {nombre: 'p2p7back', id: 'p2p7back',       src: imgurl + 'puzzle2-7-back.png'},
    {nombre: 'p2p8',     id: 'p2p8',       src: imgurl + 'puzzle2-8.png'},
    {nombre: 'p2p8back', id: 'p2p8back',       src: imgurl + 'puzzle2-8-back.png'},
    {nombre: 'p2p9',     id: 'p2p9',       src: imgurl + 'puzzle2-9.png'},
    {nombre: 'p2p9back', id: 'p2p9back',       src: imgurl + 'puzzle2-9-back.png'},
    {nombre: 'p2p10',    id: 'p2p10',       src: imgurl + 'puzzle2-10.png'},
    {nombre: 'p2p10back',id: 'p2p10back',       src: imgurl + 'puzzle2-10-back.png'},
    {nombre: 'p2p11',    id: 'p2p11',       src: imgurl + 'puzzle2-11.png'},
    {nombre: 'p2p11back',id: 'p2p11back',       src: imgurl + 'puzzle2-11-back.png'},
    {nombre: 'p2p12',    id: 'p2p12',       src: imgurl + 'puzzle2-12.png'},
    {nombre: 'p2p12back',id: 'p2p12back',       src: imgurl + 'puzzle2-12-back.png'},

    {nombre: 'p3p1',     id: 'p3p1',       src: imgurl + 'puzzle3-1.png'},
    {nombre: 'p3p1back', id: 'p3p1back',       src: imgurl + 'puzzle3-1-back.png'},
    {nombre: 'p3p2',     id: 'p3p2',       src: imgurl + 'puzzle3-2.png'},
    {nombre: 'p3p2back', id: 'p3p2back',       src: imgurl + 'puzzle3-2-back.png'},
    {nombre: 'p3p3',     id: 'p3p3',       src: imgurl + 'puzzle3-3.png'},
    {nombre: 'p3p3back', id: 'p3p3back',       src: imgurl + 'puzzle3-3-back.png'},
    {nombre: 'p3p4',     id: 'p3p4',       src: imgurl + 'puzzle3-4.png'},
    {nombre: 'p3p4back', id: 'p3p4back',       src: imgurl + 'puzzle3-4-back.png'},
    {nombre: 'p3p5',     id: 'p3p5',       src: imgurl + 'puzzle3-5.png'},
    {nombre: 'p3p5back', id: 'p3p5back',       src: imgurl + 'puzzle3-5-back.png'},
    {nombre: 'p3p6',     id: 'p3p6',       src: imgurl + 'puzzle3-6.png'},
    {nombre: 'p3p6back', id: 'p3p6back',       src: imgurl + 'puzzle3-6-back.png'},
    {nombre: 'p3p7',     id: 'p3p7',       src: imgurl + 'puzzle3-7.png'},
    {nombre: 'p3p7back', id: 'p3p7back',       src: imgurl + 'puzzle3-7-back.png'},
    {nombre: 'p3p8',     id: 'p3p8',       src: imgurl + 'puzzle3-8.png'},
    {nombre: 'p3p8back', id: 'p3p8back',       src: imgurl + 'puzzle3-8-back.png'},
    {nombre: 'p3p9',     id: 'p3p9',       src: imgurl + 'puzzle3-9.png'},
    {nombre: 'p3p9back', id: 'p3p9back',       src: imgurl + 'puzzle3-9-back.png'},
    {nombre: 'p3p10',    id: 'p3p10',       src: imgurl + 'puzzle3-10.png'},
    {nombre: 'p3p10back',id: 'p3p10back',       src: imgurl + 'puzzle3-10-back.png'},
    {nombre: 'p3p11',    id: 'p3p11',       src: imgurl + 'puzzle3-11.png'},
    {nombre: 'p3p11back',id: 'p3p11back',       src: imgurl + 'puzzle3-11-back.png'},
    {nombre: 'p3p12',    id: 'p3p12',       src: imgurl + 'puzzle3-12.png'},
    {nombre: 'p3p12back',id: 'p3p12back',       src: imgurl + 'puzzle3-12-back.png'}
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
var puzzle3, puzzle2, puzzle1, nubeCuatroContenedor, words;
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

function createPuzzlePieces(name, ficha, parent){
 
    eval("var piezaSuelta"+ficha+" = new Draggable('piezaSuelta"+ficha+"', "+name+", 0, ficha+1,ficha*88 , 0);");
    eval("piezaSuelta"+ficha+".scaleX = piezaSuelta"+ficha+".scaleY=0.6;");
    eval(parent+".addChild(piezaSuelta"+ficha+");");

}


function createPuzzle(name, equis, ye, container, numero){
    var sprite=  (name)+"Sps"; 
    var animacion=  (name)+"Anim"; 

    var data = {
        images: [], 
        frames: {width: eval(name).width, height: eval(name).height , regX: 0, regY: 0},
    };
    eval("var im = preload.getResult('"+manifest2[numero+1].src+"'); data.images.push(im);");
     eval("var im = preload.getResult('"+manifest2[numero].id+"'); data.images.push(im);");

    eval(sprite+" = new createjs.SpriteSheet(data);");
    eval(animacion+" = new createjs.BitmapAnimation("+sprite+");");
    eval(animacion+".x = "+equis+";");
    eval(animacion+".y = "+ye+";");
    eval(animacion+".currentFrame = 0;");
    eval(container+".addChild("+animacion+");");
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
    createImage("fondoguia",0,0, "mainContainer");
    createImage("behindBtn",118,290, "mainContainer");
    createImage("inBtn",118,347, "mainContainer");
    createImage("underBtn",118,404, "mainContainer");
    createImage("nextBtn",628,293, "mainContainer");
    createImage("onBtn",628,350, "mainContainer");
    createImage("aboveBtn",628,407, "mainContainer");
    createImage("p1Btn",731,436, "mainContainer");
    createImage("p2Btn",731,483, "mainContainer");
    createImage("p3Btn",731,530, "mainContainer");

    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);

    //header.filters = [vblurFilter];
    //header.cache(header.x+vBnds.x, header.y+vBnds.y, header.image.width+vBnds.width, header.image.height+vBnds.height);

    mainContainer.addChild(score);
    setDropper();

    setPuzzle3();
    setPuzzle2();
    setPuzzle1();

    initTest();
}
function setDropper(){
    var fondo = new createjs.Bitmap(linea);
    fondo.x=200;
    hit1 = new WordContainer( 'h1', '', 200, -40, 115, 38 );
    
    var pregunta = new createjs.Text("The boots are ", "32px Arial", "#333333");
    pregunta.x=0;
    pregunta.y=-31;
 
    var pregunta2 = new createjs.Text("the teddy bear.", "32px Arial", "#333333");
    pregunta2.x=320;
    pregunta2.y=-31;
   
    words = new createjs.Container();

    words.x = 148;
    words.y = 565;

    words.addChild(fondo, hit1, pregunta, pregunta2);

    mainContainer.addChild(words);
}
function setPuzzle3(){
    puzzle3 = new createjs.Container();
    puzzle3.y = 130;
    puzzle3.x = 75;
 
    createImage("marco3",147,100, "puzzle3");


    createPuzzle("p3p1",162,112,"puzzle3",48);
    createPuzzle("p3p2",252,112,"puzzle3",50);
    createPuzzle("p3p3",323,112,"puzzle3",52);
    createPuzzle("p3p4",416,112,"puzzle3",54);
    createPuzzle("p3p5",162,188,"puzzle3",56);
    createPuzzle("p3p6",253,188,"puzzle3",58);
    createPuzzle("p3p7",321,188,"puzzle3",60);
    createPuzzle("p3p8",410,188,"puzzle3",62);
    createPuzzle("p3p9",162,270,"puzzle3",64);
    createPuzzle("p3p10",236,270,"puzzle3",66);
    createPuzzle("p3p11",341,270,"puzzle3",68);
    createPuzzle("p3p12",410,270,"puzzle3",70);


    createPuzzlePieces("p3p8",0,"puzzle3");
    createPuzzlePieces("p3p7",1,"puzzle3");
    createPuzzlePieces("p3p10",2,"puzzle3");
    createPuzzlePieces("p3p12",3,"puzzle3");
    createPuzzlePieces("p3p5",4,"puzzle3");
    createPuzzlePieces("p3p3",5,"puzzle3");
    createPuzzlePieces("p3p6",6,"puzzle3");
    createPuzzlePieces("p3p9",7,"puzzle3");
 
    mainContainer.addChild(puzzle3);
}
function setPuzzle2(){
    puzzle2 = new createjs.Container();
    puzzle2.y = 130;
    puzzle2.x = 75;

    createImage("marco2",161,85, "puzzle2");


    createPuzzle("p2p1",189,95, "puzzle2",24);
    createPuzzle("p2p2",265,95, "puzzle2",26);
    createPuzzle("p2p3",366,95, "puzzle2",28);
    createPuzzle("p2p4",189,152, "puzzle2",30);
    createPuzzle("p2p5",264,164, "puzzle2",32);
    createPuzzle("p2p6",363,164, "puzzle2",34);
    createPuzzle("p2p7",189,232, "puzzle2",36);
    createPuzzle("p2p8",259,216, "puzzle2",38);
    createPuzzle("p2p9",362,218, "puzzle2",40);
    createPuzzle("p2p10",189,284,"puzzle2",42);
    createPuzzle("p2p11",268,285,"puzzle2",44);
    createPuzzle("p2p12",368,289,"puzzle2",46);

    createPuzzlePieces("p2p4",0,"puzzle2");
    createPuzzlePieces("p2p8",1,"puzzle2");
    createPuzzlePieces("p2p7",2,"puzzle2");
    createPuzzlePieces("p2p2",3,"puzzle2");
    createPuzzlePieces("p2p6",4,"puzzle2");
    createPuzzlePieces("p2p3",5,"puzzle2");
    createPuzzlePieces("p2p11",6,"puzzle2");
    createPuzzlePieces("p2p1",7,"puzzle2");

    mainContainer.addChild(puzzle2);
}
function setPuzzle1(){
    puzzle1 = new createjs.Container();
    puzzle1.y = 130;
    puzzle1.x = 75;

    createImage("marco1",187,87, "puzzle1");

    createPuzzle("p1p1",198,97,  "puzzle1",0);
    createPuzzle("p1p2",271,97,  "puzzle1",2);
    createPuzzle("p1p3",366,97,  "puzzle1",4);
    createPuzzle("p1p4",198,155, "puzzle1",6);
    createPuzzle("p1p5",270,168, "puzzle1",8);
    createPuzzle("p1p6",363,167, "puzzle1",10);
    createPuzzle("p1p7",198,236, "puzzle1",12);
    createPuzzle("p1p8",264,220, "puzzle1",14);
    createPuzzle("p1p9",362,222, "puzzle1",16);
    createPuzzle("p1p10",198,290,"puzzle1",18);
    createPuzzle("p1p11",271,290,"puzzle1",20);
    createPuzzle("p1p12",368,295,"puzzle1",22);

    createPuzzlePieces("p1p9",0,"puzzle1");
    createPuzzlePieces("p1p5",1,"puzzle1");
    createPuzzlePieces("p1p1",2,"puzzle1");
    createPuzzlePieces("p1p11",3,"puzzle1");
    createPuzzlePieces("p1p7",4,"puzzle1");
    createPuzzlePieces("p1p8",5,"puzzle1");
    createPuzzlePieces("p1p3",6,"puzzle1");
    createPuzzlePieces("p1p10",7,"puzzle1");

    mainContainer.addChild(puzzle1);
}



function initTest(){
    i = 0;
 
    score.updateCount( i );

    TweenLite.from(imgHeader, 1, {y:-imgHeader.height});
    TweenLite.from(imgInstrucciones, 1, {alpha:0, x:0, delay:0.5});
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

 
