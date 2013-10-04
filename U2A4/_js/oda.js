var stage, mainContainer, i, song, imgurl="imgs/";


var manifest = [
    {nombre: 'imgHeader', id: 'head', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', id:'inst' , src: imgurl + 'texto_look.png'},
    {nombre: 'imgC1', id:'c1' , src: imgurl + 'circle1.png'},
    {nombre: 'imgC2', id:'c2' , src: imgurl + 'circle2.png'},
    {nombre: 'fondoguia', id:'gu' , src: imgurl + 'guia.png'},
    {nombre: 'finishBtn', id:'finish' , src: imgurl + 'finish-btn.png'},
    {nombre: 'repeatBtn', id:'repeat' , src: imgurl + 'repeat-btn.png'},
    {nombre: 'box1', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box2', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box3', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box4', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box5', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box6', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box7', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box8', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box9', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box10', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box11', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'box12', id:'clockbox' , src: imgurl + 'clock-container.png'},
    {nombre: 'megClock1', id:'mc1' , src: imgurl + 'meg-clock-1.png'},
    {nombre: 'megClock2', id:'mc2' , src: imgurl + 'meg-clock-2.png'},
    {nombre: 'megClock3', id:'mc3' , src: imgurl + 'meg-clock-3.png'},
    {nombre: 'megClock4', id:'mc4' , src: imgurl + 'meg-clock-4.png'},
    {nombre: 'megClock5', id:'mc5' , src: imgurl + 'meg-clock-5.png'},
    {nombre: 'megClock6', id:'mc6' , src: imgurl + 'meg-clock-6.png'},

    {nombre: 'megWakes', id:'m1' , src: imgurl + 'meg-wakes.png'},
    {nombre: 'megBreakfast', id:'m2' , src: imgurl + 'meg-breakfast.png'},
    {nombre: 'megLeaves', id:'m3' , src: imgurl + 'meg-leaves.png'},
    {nombre: 'megDishes', id:'m4' , src: imgurl + 'meg-dishes.png'},
    {nombre: 'megDinner', id:'m5' , src: imgurl + 'meg-dinner.png'},
    {nombre: 'megSleep', id:'m6' , src: imgurl + 'meg-sleep.png'},

    {nombre: 'jimClock1', id:'jc1' , src: imgurl + 'jim-clock-1.png'},
    {nombre: 'jimClock2', id:'jc2' , src: imgurl + 'jim-clock-2.png'},
    {nombre: 'jimClock3', id:'jc3' , src: imgurl + 'jim-clock-3.png'},
    {nombre: 'jimClock4', id:'jc4' , src: imgurl + 'jim-clock-4.png'},
    {nombre: 'jimClock5', id:'jc5' , src: imgurl + 'jim-clock-5.png'},
    {nombre: 'jimClock6', id:'jc6' , src: imgurl + 'jim-clock-6.png'},

    {nombre: 'jimShower', id:'j1' , src: imgurl + 'jim-shower.png'},
    {nombre: 'jimBreakfast', id:'j2' , src: imgurl + 'jim-breakfast.png'},
    {nombre: 'jimLeaves', id:'j3' , src: imgurl + 'jim-leaves.png'},
    {nombre: 'jimBus', id:'j4' , src: imgurl + 'jim-bus.png'},
    {nombre: 'jimCat', id:'j5' , src: imgurl + 'jim-cat.png'},
    {nombre: 'jimTv', id:'j6' , src: imgurl + 'jim-tv.png'},
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

var meg, box;
var hit1, hit2, hit3, hit4, hit5, hit6;
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
    createImage("fondoguia",0,0, "mainContainer");
    createImage("repeatBtn",117+428,124+415, "mainContainer");
    createImage("finishBtn",546+117,124+415, "mainContainer");
 

    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);

    //header.filters = [vblurFilter];
    //header.cache(header.x+vBnds.x, header.y+vBnds.y, header.image.width+vBnds.width, header.image.height+vBnds.height);

    mainContainer.addChild(score);

    setMeg();
    setJim();
    setDropper();

    initTest();
}
function setDropper(){
    hit1 = new WordContainer( 'h1', '',17,5,    66, 42 );
    hit2 = new WordContainer( 'h2', '',225,5,   66, 42 );
    hit3 = new WordContainer( 'h3', '',17,153,  66, 42 );
    hit4 = new WordContainer( 'h4', '',225,153, 66, 42 );
    hit5 = new WordContainer( 'h5', '',17,305,  66, 42 );
    hit6 = new WordContainer( 'h6', '',225,305, 66, 42 );

   
    box = new createjs.Container();
    box.x = 118;
    box.y = 122;

    box.addChild( hit1, hit2, hit3, hit4, hit5, hit6);

    mainContainer.addChild(box);
}

function setMeg(){
    meg = new createjs.Container();
    meg.y = 124;
    meg.x = 117;

    createImage("megWakes",15,13,"meg")
    createImage("box1",17,5,"meg")
    createImage("megBreakfast",223,13,"meg")
    createImage("box2",225,5,"meg")
    createImage("megLeaves",15,161,"meg")
    createImage("box3",17,153,"meg")
    createImage("megDishes",223,161,"meg")
    createImage("box4",225,153,"meg")
    createImage("megDinner",15,313,"meg")
    createImage("box5",17,305,"meg")
    createImage("megSleep",223,313,"meg")
    createImage("box6",225,305,"meg")

    var mClock1 = new Draggable("mClock1",megClock1.src,0,1,485,13);
    var mClock2 = new Draggable("mClock2",megClock2.src,0,2,527,79 );
    var mClock3 = new Draggable("mClock3",megClock3.src,0,3,485,145);
    var mClock4 = new Draggable("mClock4",megClock4.src,0,4,527,211);
    var mClock5 = new Draggable("mClock5",megClock5.src,0,5,485,276);
    var mClock6 = new Draggable("mClock6",megClock6.src,0,6,527,343);
    meg.addChild(mClock1,mClock2,mClock3,mClock4,mClock5,mClock6);

    mainContainer.addChild(meg);
}
function setJim(){
    jim = new createjs.Container();
    jim.y = 124;
    jim.x = 117;

    createImage("jimShower",15,13,"jim")
    createImage("box7",17,5,"jim")
    createImage("jimBreakfast",223,13,"jim")
    createImage("box8",225,5,"jim")
    createImage("jimLeaves",15,161,"jim")
    createImage("box9",17,153,"jim")
    createImage("jimBus",223,161,"jim")
    createImage("box10",225,153,"jim")
    createImage("jimCat",15,313,"jim")
    createImage("box11",17,305,"jim")
    createImage("jimTv",223,313,"jim")
    createImage("box12",225,305,"jim")

    var jClock1 = new Draggable("jClock1",jimClock1.src,0,1,485,13);
    var jClock2 = new Draggable("jClock2",jimClock2.src,0,2,527,79 );
    var jClock3 = new Draggable("jClock3",jimClock3.src,0,3,485,145);
    var jClock4 = new Draggable("jClock4",jimClock4.src,0,4,527,211);
    var jClock5 = new Draggable("jClock5",jimClock5.src,0,5,485,276);
    var jClock6 = new Draggable("jClock6",jimClock6.src,0,6,527,343);
    jim.addChild(jClock1,jClock2,jClock3,jClock4,jClock5,jClock6);

    mainContainer.addChild(jim);
}
 
function initTest(){
    i = 0;
 
    score.updateCount( i );

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

 
