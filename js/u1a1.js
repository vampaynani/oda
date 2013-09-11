var stage, imgurl="imgs/";

var imgHeader = new Image(),
    imgNube1 = new Image(),
    imgNube2 = new Image(),
    imgNube3 = new Image(),
    imgInstrucciones = new Image(),
    imgGlobito = new Image();

var personajeSps, personajeAnim;

var nubeUnoContenedor, nubeDosContenedor, nubeTresContenedor;
var progressLabel, preload;

function oda() {
    var activities = [
        {img:1, txt1:1, txt2:1, txt3:1},
        {img:2, txt1:2, txt2:1, txt3:2},
        {img:3, txt1:1, txt2:1, txt3:3},
        {img:4, txt1:2, txt2:1, txt3:4},
        {img:5, txt1:1, txt2:1, txt3:5},
    ];


  preload = new createjs.LoadQueue(false);
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
    //setListeners();
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
    
    console.log(personajeAnim);

    stage.addChild(personajeAnim);
    stage.addChild(header);
    
    setNube1();
    setNube2();
    setNube3();
    
}

function setNube1(){
    var fondo1 = new createjs.Bitmap(imgNube1);

    var palabra1nube1 = new Dragtxt("p1n1", "I'm", 0, 0, 20);
    var palabra2nube1 = new Dragtxt("p2n1", "We're", 1, 120, 120);
   
    nubeUnoContenedor = new createjs.Container();
     
    nubeUnoContenedor.y = 400;
    nubeUnoContenedor.x = 100;
    
    nubeUnoContenedor.addChild(fondo1, palabra1nube1, palabra2nube1);

    stage.addChild(nubeUnoContenedor);
}

function setNube2(){
    var fondo1 = new createjs.Bitmap(imgNube2);

    var palabra1nube2 = new Dragtxt("p1n2", "aqui texto", 20, 20);
    var palabra2nube2 = new Dragtxt("p2n2", "aqui texto", 20, 20);
    var palabra3nube2 = new Dragtxt("p3n2", "aqui texto", 20, 20);
    var palabra4nube2 = new Dragtxt("p4n2", "aqui texto", 20, 20);
  
    nubeDosContenedor = new createjs.Container();
     
    nubeDosContenedor.y = 353;
    nubeDosContenedor.x = 250;
    
    nubeDosContenedor.addChild(fondo1, palabra1nube2, palabra2nube2, palabra3nube2, palabra4nube2);

    stage.addChild(nubeDosContenedor);
}
function setNube3(){
    var fondo1 = new createjs.Bitmap(imgNube3);

    var palabra1nube3 = new Dragtxt("p1n3", "aqui texto", 20, 20);
    var palabra2nube3 = new Dragtxt("p2n3", "aqui texto", 20, 20);
    var palabra3nube3 = new Dragtxt("p3n3", "aqui texto", 20, 20);
    var palabra4nube3 = new Dragtxt("p4n3", "aqui texto", 20, 20);
    var palabra5nube3 = new Dragtxt("p5n3", "aqui texto", 20, 20);
  
    nubeTresContenedor = new createjs.Container();

    nubeTresContenedor.y = 353;
    nubeTresContenedor.x = 540;
    
    nubeTresContenedor.addChild(fondo1, palabra1nube3, palabra2nube3, palabra3nube3, palabra4nube3, palabra5nube3);

    stage.addChild(nubeTresContenedor);
}

function setListeners(){
    
}
function updateStage(e){
    
}

function tick() {
    stage.update();
}

 
