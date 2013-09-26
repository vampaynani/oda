var stage, mainContainer, i, song, imgurl="imgs/";

var manifest = [
    {nombre: 'imgHeader', id: 'head', src: imgurl + 'pleca.png'},
    {nombre: 'imgInstrucciones', id:'inst' , src: imgurl + 'texto_look.png'},
    {nombre: 'imgC1', id:'c1' , src: imgurl + 'circle1.png'},
    {nombre: 'imgC2', id:'c2' , src: imgurl + 'circle2.png'},
    {nombre: 'calendar', id:'cal' , src: imgurl + 'calendar.png'},
    {nombre: 'guiafondo', id:'gg' , src: imgurl + 'guia.png'},
    {nombre: 'iconGym', id:'gym' , src: imgurl + 'icon_excercisesGymMM.png'},
    {nombre: 'iconLunch', id:'lunch' , src: imgurl + 'icon_lunchCafeTnF.png'},
    {nombre: 'iconArt', id:'art' , src: imgurl + 'icon_paintArtRoomMnF.png'},
    {nombre: 'iconRead', id:'read' , src: imgurl + 'icon_readLibTT.png'},
    {nombre: 'iconWatch', id:'watch' , src: imgurl + 'icon_watchAudTT.png'},
    {nombre: 'line1', id:'l1' , src: imgurl + 'line1.png'},
    {nombre: 'line2', id:'l2' , src: imgurl + 'line2.png'}
  
];

var manifest2 = [
    {nombre: 'p1', id: 'per1', src: imgurl + 'image_april.png'},
    {nombre: 'p6', id: 'per6', src: imgurl + 'image_danielle.png'}

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

function initAssets(){
    preloadImagenes(manifest);
    preloadSprite(manifest2, "personajeSps", "personajeAnim", 0, 0, 0, 0, 0, 0 );

}

function setStage(){
    vblurFilter = new createjs.BlurFilter(0, 10, 1);
    hblurFilter = new createjs.BlurFilter(10, 0, 1);
    vBnds = vblurFilter.getBounds();
    hBnds = hblurFilter.getBounds();

    createImage("imgHeader",stageSize.w / 2 - imgHeader.width / 2,0, "mainContainer");
    createImage("imgInstrucciones",20,100, "mainContainer");
    //createImage("guiafondo",0,0, "mainContainer");
    createImage("calendar",0,130, "mainContainer");
    createImage("iconGym",375,210, "mainContainer");
    createImage("iconArt",194,199, "mainContainer");
    createImage("iconWatch",255,248, "mainContainer");
    createImage("iconRead",320,248, "mainContainer");
    createImage("iconLunch",455,328, "mainContainer");

    score = new Score('score', 20, 500, imgC2, imgC1, 5, 0);

    //header.filters = [vblurFilter];
    //header.cache(header.x+vBnds.x, header.y+vBnds.y, header.image.width+vBnds.width, header.image.height+vBnds.height);

    mainContainer.addChild(score);
    setDropper();
    setGroup1();
    setGroup2();
    setGroup3();
    initTest();
}
/*
function refresh( bf, obj ){
    //obj.filters = [bf];
    //var objBnds = bf.getBounds();
    //obj.cache(obj.x+objBnds.x, obj.y+objBnds.y, obj.image.width+objBnds.width+50, obj.image.height+objBnds.height+50);
}
*/
function setDropper(){
    var linea = new createjs.Bitmap(line1);
    var linea2 = new createjs.Bitmap(line1);
    var linea3 = new createjs.Bitmap(line2);
    linea.y = linea2.y = 31;
    linea2.x = 290;
    linea3.x = 100;
    linea3.y = 69;
    hit1 = new WordContainer( 'h1', '', 0, 0, 275, 30 );
    hit2 = new WordContainer( 'h2', '', 290, 0, 275, 30 );
    hit3 = new WordContainer( 'h3', '', 100, 37, 355, 30 );
    words = new createjs.Container();

    words.x = 170;
    words.y = stageSize.h - 100;

    words.addChild(linea, linea2, linea3, hit1, hit2, hit3);

    mainContainer.addChild(words);
}

function setGroup1(){

    p1n1 = new Dragtxt("p1n1", "We read books", 1, 0, 0, 0);
    p2n1 = new Dragtxt("p2n1", "We do exercise", 1, 1, 0, 18);
    p3n1 = new Dragtxt("p3n1", "We point", 1, 2, 0, 36);
    p4n1 = new Dragtxt("p4n1", "We eat lunch", 1, 3, 0, 54);
    p5n1 = new Dragtxt("p5n1", "We watch movies", 1, 4, 0, 72);

    groupUnoContenedor = new createjs.Container();
     
    groupUnoContenedor.y = 132;
    groupUnoContenedor.x = 565;
    
    groupUnoContenedor.addChild( p1n1, p2n1, p3n1,p4n1,p5n1);

    mainContainer.addChild(groupUnoContenedor);
}
function setGroup2(){

    p1n2 = new Dragtxt("p1n2", "in the gym", 2, 0, 0, 0);
    p2n2 = new Dragtxt("p2n2", "in the cafeteria", 2, 1, 0, 18);
    p3n2 = new Dragtxt("p3n2", "in the library", 2, 2, 0, 36);
    p4n2 = new Dragtxt("p4n2", "in the auditorium", 2, 3, 0, 54);
    p5n2 = new Dragtxt("p5n2", "in the art room", 2, 4, 0, 72);

    groupDosContenedor = new createjs.Container();
     
    groupDosContenedor.y = 247;
    groupDosContenedor.x = 565;
    
    groupDosContenedor.addChild( p1n2, p2n2, p3n2, p4n2, p5n2);

    mainContainer.addChild(groupDosContenedor);
}
function setGroup3(){

    p1n3 = new Dragtxt("p1n3", "on Monday and Friday.", 3, 0, 0, 0);
    p2n3 = new Dragtxt("p2n3", "on Tuesday and Thursday.", 3, 1, 0, 18);
    p3n3 = new Dragtxt("p3n3", "on Thursday and Friday.", 3, 2, 0, 36);
    p4n3 = new Dragtxt("p4n3", "on Tuesday and Friday.", 3, 3, 0, 54);
    p5n3 = new Dragtxt("p5n3", "on Monday and Wednesday.", 3, 4, 0, 72  );
  
    groupTresContenedor = new createjs.Container();

    groupTresContenedor.y = 360;
    groupTresContenedor.x = 565;
    
    groupTresContenedor.addChild( p1n3, p2n3, p3n3, p4n3, p5n3);

    mainContainer.addChild(groupTresContenedor);
}
function initTest(){
    i = 0;

    personajeAnim.currentFrame = i;
    personajeAnim.scaleX = 1;
    personajeAnim.scaleY = 1;
    personajeAnim.alpha = 1;

    TweenLite.from(imgHeader, 1, {y:-imgHeader.height});
    TweenLite.from(imgInstrucciones, 1, {alpha:0, x:0, delay:0.5});
    TweenLite.from(personajeAnim, 0.5, {alpha:0, y:personajeAnim.y+20, delay:1});
    //TweenLite.to(vblurFilter, 1, {blurY:0, onUpdate: refresh, onUpdateParams:[vblurFilter, header]});
    TweenLite.from(words, 0.5, {alpha:0, y:words.y+50, delay:1});
    TweenLite.from(groupUnoContenedor, 0.3, {alpha:0, y:groupUnoContenedor.y+50, delay:1.5});
    TweenLite.from(groupDosContenedor, 0.3, {alpha:0, y:groupDosContenedor.y+50, delay:1.8});
    TweenLite.from(groupTresContenedor, 0.3, {alpha:0, y:groupTresContenedor.y+50, delay:2.1, onComplete: playInstructions});
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

 
