var stage, imgurl="imgs/";

var imgBrat1 = new Image(), 
    imgBrat2 = new Image(), 
    imgBrat3 = new Image(),
    imgSideBack = new Image(),
    imgSideBratz1 = new Image(), imgSideBratz2 = new Image(), imgSideBratz3 = new Image(),
    imgSideWorld1 = new Image(), imgSideWorld2 = new Image(), imgSideWorld3 = new Image(),
    imgSideAtt1 = new Image(), imgSideAtt2 = new Image(), imgSideAtt3 = new Image(),
    imgSideLook1 = new Image(), imgSideLook2 = new Image(), imgSideLook3 = new Image(),
    imgFlechita = new Image(), imgFlechitaArriba = new Image(), imgFlechitaAbajo = new Image();

var bratzSps, bratzAnim;
var worldSps, worldAnim;
var attitudeSps, attitudeAnim;
var labioJadeSps, labioJadeAnim;
var labioYasminSps, labioYasminAnim;
var labioCloeSps, labioCloeAnim;
var ropaJadeSps, ropaJadeAnim;
var ropaYasminSps, ropaYasminAnim;
var ropaCloeSps, ropaCloeAnim;
var zapatosJadeSps, zapatosJadeAnim;
var zapatosYasminSps, zapatosYasminAnim;
var zapatosCloeSps, zapatosCloeAnim;
var plusSps;
var sideBratz, sideWorlds, sideAttitude, sideLook;
var sideOut, sideIn, arrowIn;
var progressLabel, preload;

function oda() {
  preload = new createjs.LoadQueue(false);
  preload.addEventListener('complete', handleComplete);
  preload.addEventListener('progress', handleProgress);
    preload.loadManifest([
      {id: 'isb', src: imgurl + 'side_back.png'},
      {id: 'isbr1', src: imgurl + 'side_bratz_jade.png'},
      {id: 'isbr2', src: imgurl + 'side_bratz_yasmin.png'},
      {id: 'isbr3', src: imgurl + 'side_bratz_cloe.png'},
      {id: 'isw1', src: imgurl + 'side_backs_1.png'},
      {id: 'isw2', src: imgurl + 'side_backs_2.png'},
      {id: 'isw3', src: imgurl + 'side_backs_3.png'},
      {id: 'isa3', src: imgurl + 'side_attitude_compartida.png'},
      {id: 'isa1', src: imgurl + 'side_attitude_suenos.png'},
      {id: 'isa2', src: imgurl + 'side_attitude_unica.png'},
      {id: 'isl1', src: imgurl + 'side_chars_1.png'},
      {id: 'isl2', src: imgurl + 'side_chars_2.png'},
      {id: 'isl3', src: imgurl + 'side_chars_3.png'},
        {id: 'fl', src: imgurl + 'flecharosa.png'},
        {id: 'fl2', src: imgurl + 'arrow_up.png'},
        {id: 'fl3', src: imgurl + 'arrow_down.png'},
      {id: 'br1', src: imgurl + 'bratz_jade.png'},
      {id: 'br2', src: imgurl + 'bratz_yasmin.png'},
      {id: 'br3', src: imgurl + 'bratz_cloe.png'},
      {id: 'fo1', src: imgurl + 'fondo_1.png'},
      {id: 'fo2', src: imgurl + 'fondo_2.png'},
      {id: 'fo3', src: imgurl + 'fondo_3.png'},
      {id: 'at3', src: imgurl + 'attitude_compartida.png'},
      {id: 'at1', src: imgurl + 'attitude_suenos.png'},
      {id: 'at2', src: imgurl + 'attitude_unica.png'},

        {id: 'lb0', src: imgurl + 'vacio.png'},
        
        {id: 'lb1', src: imgurl + 'labio_2.png'},
        {id: 'lb2', src: imgurl + 'labio_3.png'},
        {id: 'lby1', src: imgurl + 'labio_yasmin_1.png'},
        {id: 'lby2', src: imgurl + 'labio_yasmin_2.png'},
        {id: 'lbc1', src: imgurl + 'labio_cloe_1.png'},
        {id: 'lbc2', src: imgurl + 'labio_cloe_2.png'},

        {id: 'rj1', src: imgurl + 'ropa_jade_1.png'},
        {id: 'rj2', src: imgurl + 'ropa_jade_2.png'},
        {id: 'ry1', src: imgurl + 'ropa_yasmin_1.png'},
        {id: 'ry2', src: imgurl + 'ropa_yasmin_2.png'},
        {id: 'rc1', src: imgurl + 'ropa_cloe_1.png'},
        {id: 'rc2', src: imgurl + 'ropa_cloe_2.png'},

        {id: 'zj1', src: imgurl + 'zapatos_jade_1.png'},
        {id: 'zj2', src: imgurl + 'zapatos_jade_2.png'},
        {id: 'zy1', src: imgurl + 'zapatos_yasmin_1.png'},
        {id: 'zy2', src: imgurl + 'zapatos_yasmin_2.png'},
        {id: 'zc1', src: imgurl + 'zapatos_cloe_1.png'},
        {id: 'zc2', src: imgurl + 'zapatos_cloe_2.png'},

        {id: 'pl1', src: imgurl + 'plus_0.png'},
        {id: 'pl2', src: imgurl + 'plus_1.png'},
        {id: 'pl3', src: imgurl + 'plus_2.png'},
        {id: 'pl4', src: imgurl + 'plus_3.png'},

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
    setListeners();
    createjs.Ticker.addListener(window);
  createjs.Ticker.setFPS(60);
}
function initAssets(){
    imgSideBack = preload.getResult('isb');
    imgSideBratz1 = preload.getResult('isbr1');
    imgSideBratz2 = preload.getResult('isbr2');
    imgSideBratz3 = preload.getResult('isbr3');
    imgSideWorld1 = preload.getResult('isw1');
    imgSideWorld2 = preload.getResult('isw2');
    imgSideWorld3 = preload.getResult('isw3');
    imgSideWorld4 = preload.getResult('isw3');
    imgSideAtt1 = preload.getResult('isa1');
    imgSideAtt2 = preload.getResult('isa2');
    imgSideAtt3 = preload.getResult('isa3');
    imgSideAtt4 = preload.getResult('isa3');
    imgSideLook1 = preload.getResult('isl1');
    imgSideLook2 = preload.getResult('isl2');
    imgSideLook3 = preload.getResult('isl3');
    imgSideLook4 = preload.getResult('isl3');
    imgFlechita = preload.getResult('fl');
    imgFlechitaArriba = preload.getResult('fl2');
    imgFlechitaAbajo = preload.getResult('fl3');

    labioJadeSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('lb1'), preload.getResult('lb2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });  
    labioYasminSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('lby1'), preload.getResult('lby2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });      
    labioCloeSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('lbc1'), preload.getResult('lbc2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
    
    });     

    ropaJadeSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('rj1'), preload.getResult('rj2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });     
    ropaYasminSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('ry1'), preload.getResult('ry2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });     
    ropaCloeSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('rc1'), preload.getResult('rc2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });     
    zapatosJadeSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('zj1'), preload.getResult('zj2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });     
    zapatosYasminSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('zy1'), preload.getResult('zy2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });     
    zapatosCloeSps = new createjs.SpriteSheet({
        images: [preload.getResult('lb0'), preload.getResult('zc1'), preload.getResult('zc2')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
      
    });     

    bratzSps = new createjs.SpriteSheet({
        images: [preload.getResult('br1'), preload.getResult('br2'), preload.getResult('br3')],
        frames: {width: 360, height: 465, regX: 180, regY: 233},
        animations: {
            jade: 0,
            yasmin: 1,
            cloe: 2
        }
    });
  
    worldSps = new createjs.SpriteSheet({
        images: [preload.getResult('fo1'), preload.getResult('fo2'), preload.getResult('fo3')],
        frames: {width: 547, height: 670, regX: 274, regY: 335}
    });
    plusSps = new createjs.SpriteSheet({
        images: [ preload.getResult('pl1'), preload.getResult('pl2'), preload.getResult('pl3'), preload.getResult('pl4')],
        frames: {width: 547, height: 670, regX: 0, regY: 0}
    });
    attitudeSps = new createjs.SpriteSheet({
     images: [preload.getResult('at1'), preload.getResult('at2'), preload.getResult('at3')],
     frames: {width: 173, height: 87, regX: 86, regY: 43} 
    });
    bratzAnim = new createjs.BitmapAnimation(bratzSps);
    worldAnim = new createjs.BitmapAnimation(worldSps);
    plusAnim = new createjs.BitmapAnimation(plusSps);
    attitudeAnim = new createjs.BitmapAnimation(attitudeSps);
  
    labioJadeAnim = new createjs.BitmapAnimation(labioJadeSps);
    labioYasminAnim = new createjs.BitmapAnimation(labioYasminSps);
    labioCloeAnim = new createjs.BitmapAnimation(labioCloeSps);

    ropaJadeAnim = new createjs.BitmapAnimation(ropaJadeSps);
    ropaYasminAnim = new createjs.BitmapAnimation(ropaYasminSps);
    ropaCloeAnim = new createjs.BitmapAnimation(ropaCloeSps);

    zapatosJadeAnim = new createjs.BitmapAnimation(zapatosJadeSps);
    zapatosYasminAnim = new createjs.BitmapAnimation(zapatosYasminSps);
    zapatosCloeAnim = new createjs.BitmapAnimation(zapatosCloeSps);
}

function setStage(){
    stage = new createjs.Stage("stage");
    sideOut = stage.canvas.width;
    sideIn = stage.canvas.width - imgSideBack.width;
    arrowIn = stage.canvas.width - imgFlechita.width;
        
    createjs.Touch.enable(stage);
    stage.enableMouseOver();
    
    setBratzStage();
    setSide();

    var test = new Dragtxt('test','test',100,100);
    stage.addChild(test);
}
function setBratzStage(){
    bratzAnim.x = stage.canvas.width/2 - 20;
    bratzAnim.y = stage.canvas.height/2;
    
    worldAnim.x = stage.canvas.width/2;
    worldAnim.y = stage.canvas.height/2;
    
    attitudeAnim.x = 370;
    attitudeAnim.y = 180;
    
    zapatosJadeAnim.x = zapatosYasminAnim.x = zapatosCloeAnim.x = ropaJadeAnim.x = ropaYasminAnim.x = ropaCloeAnim.x = labioJadeAnim.x = labioYasminAnim.x = labioCloeAnim.x = stage.canvas.width/2 - 20 ;

    zapatosJadeAnim.y = zapatosYasminAnim.y = zapatosCloeAnim.y = ropaJadeAnim.y = ropaYasminAnim.y = ropaCloeAnim.y = labioJadeAnim.y =   labioYasminAnim.y =  labioCloeAnim.y = stage.canvas.height/2;

 
    worldAnim.currentFrame = 0;
    plusAnim.currentFrame = 0;
 
    labioJadeAnim.currentFrame = 0;
    labioYasminAnim.currentFrame = 0;
    labioCloeAnim.currentFrame = 0;

    ropaJadeAnim.currentFrame = 0;
    ropaYasminAnim.currentFrame = 0;   
    ropaCloeAnim.currentFrame = 0;

    zapatosJadeAnim.currentFrame = 0;
    zapatosYasminAnim.currentFrame = 0;   
    zapatosCloeAnim.currentFrame = 0;

    stage.addChild(worldAnim);
    stage.addChild(plusAnim);
    stage.addChild(bratzAnim);
    stage.addChild(attitudeAnim);

    stage.addChild(labioJadeAnim);
    stage.addChild(labioYasminAnim);
    stage.addChild(labioCloeAnim);

    stage.addChild(ropaJadeAnim);
    stage.addChild(ropaYasminAnim);
    stage.addChild(ropaCloeAnim);

    stage.addChild(zapatosJadeAnim);
    stage.addChild(zapatosYasminAnim);
    stage.addChild(zapatosCloeAnim);

}
function setSide(){
    setBratzSide();
    setWorldsSide();
    setAttitudeSide();
    setLookSide();
    flechita = new createjs.Bitmap(imgFlechita);
    flechita.x = sideOut;
    flechita.y = 0;
    stage.addChild(flechita);


}
function setBratzSide(){
    var sideBack = new createjs.Bitmap(imgSideBack);
    var brt1 = new Draggable('brt1', imgSideBratz1, 'bratz', 1, 26, 26);
    var brt2 = new Draggable('brt2', imgSideBratz2, 'bratz', 2, 26, 190);
    var brt3 = new Draggable('brt3', imgSideBratz3, 'bratz', 3, 26, 360);
    sideBratz = new createjs.Container();
    
    sideBratz.y = 53;
    sideBratz.x = stage.canvas.width;
    
    sideBratz.addChild(sideBack, brt1, brt2, brt3);
    stage.addChild(sideBratz);
}

function setWorldsSide(){
  var wld1 = new Draggable('wld1', imgSideWorld1, 'world', 1, 26, 26);
    var wld2 = new Draggable('wld2', imgSideWorld2, 'world', 2, 26, 190);
    var wld3 = new Draggable('wld3', imgSideWorld3, 'world', 3, 26, 360);
    var wld4 = new Draggable('wld4', imgSideWorld4, 'world', 4, 26, 530);
  sideWorlds = new Scrollable('wld0', stage.canvas.width, 53);
  
  sideWorlds.addCollection(wld1,wld2,wld3,wld4);
  stage.addChild(sideWorlds);
}
function setAttitudeSide(){
    var sideBack = new createjs.Bitmap(imgSideBack);
    var att1 = new Draggable('att1', imgSideAtt1, 'attitude', 1, 26, 26);
    var att2 = new Draggable('att2', imgSideAtt2, 'attitude', 2, 26, 190);
    var att3 = new Draggable('att3', imgSideAtt3, 'attitude', 3, 26, 360);
    var att4 = new Draggable('att4', imgSideAtt4, 'attitude', 4, 26, 530);
    sideAttitude = new Scrollable('att0', stage.canvas.width, 53);
    
    sideAttitude.addCollection(att1,att2,att3,att4);
    stage.addChild(sideAttitude);

}
function setLookSide(){
    var sideBack = new createjs.Bitmap(imgSideBack);
    var lok1 = new Draggable('lok1', imgSideLook1, 'look', 1, 26, 26);
    var lok2 = new Draggable('lok2', imgSideLook2, 'look', 2, 26, 190);
    var lok3 = new Draggable('lok3', imgSideLook3, 'look', 3, 26, 360);
    var lok4 = new Draggable('lok4', imgSideLook4, 'look', 4, 26, 530);
    sideLook = new Scrollable('lok0', stage.canvas.width, 53);
    
    sideLook.addCollection(lok1,lok2,lok3,lok4);
    stage.addChild(sideLook);

}
function setListeners(){
    for(var i = 1; i <= 3; i++){
        sideBratz.getChildByName('brt'+i).addEventListener('dropped', updateStage);
        //sideWorlds.getChildByName('wld'+i).addEventListener('dropped', updateStage);
        //sideAttitude.getChildByName('att'+i).addEventListener('dropped', updateStage);
        //sideLook.getChildByName('lok'+i).addEventListener('dropped', updateStage);
    }
}
function updateStage(e){
    switch(e.target.side){
        case 'bratz':
            bratzBtn();
            labioJadeAnim.currentFrame=0;
            labioYasminAnim.currentFrame=0;
            labioCloeAnim.currentFrame=0;
            ropaJadeAnim.currentFrame=0;
            ropaYasminAnim.currentFrame=0;
            ropaCloeAnim.currentFrame=0;
            zapatosJadeAnim.currentFrame=0;
            zapatosYasminAnim.currentFrame=0;
            zapatosCloeAnim.currentFrame=0;

            if(e.target.selection == 1) bratzAnim.gotoAndStop('jade');
            if(e.target.selection == 2) bratzAnim.gotoAndStop('yasmin');
            if(e.target.selection == 3) bratzAnim.gotoAndStop('cloe');
            break;
        case 'look':
            lookBtn();
            if(e.target.selection == 1) {
            if(bratzAnim.currentAnimation == 'jade'){  
                    labioJadeAnim.currentFrame = labioJadeAnim.currentFrame+1;
                }
                if( bratzAnim.currentAnimation == 'yasmin'){  
                      labioYasminAnim.currentFrame = labioYasminAnim.currentFrame+1;
                }
                if( bratzAnim.currentAnimation == 'cloe'){  
                      labioCloeAnim.currentFrame = labioCloeAnim.currentFrame+1;
                }
            }
            if(e.target.selection == 2) {
                if(bratzAnim.currentAnimation == 'jade'){  
                    ropaJadeAnim.currentFrame = ropaJadeAnim.currentFrame+1;
                }
                if( bratzAnim.currentAnimation == 'yasmin'){  
                      ropaYasminAnim.currentFrame = ropaYasminAnim.currentFrame+1;
                }
                if( bratzAnim.currentAnimation == 'cloe'){  
                      ropaCloeAnim.currentFrame = ropaCloeAnim.currentFrame+1;
                }
            }
            if(e.target.selection == 3) {
                if(bratzAnim.currentAnimation == 'jade'){  
                    zapatosJadeAnim.currentFrame = zapatosJadeAnim.currentFrame+1;
                }
                if( bratzAnim.currentAnimation == 'yasmin'){  
                      zapatosYasminAnim.currentFrame = zapatosYasminAnim.currentFrame+1;
                }
                if( bratzAnim.currentAnimation == 'cloe'){  
                      zapatosCloeAnim.currentFrame = zapatosCloeAnim.currentFrame+1;
                }
            }
            if(e.target.selection == 4) {
                      plusAnim.currentFrame = plusAnim.currentFrame+1;
                console.log("boton cuatro");
            }

            break;
        case 'world':
            worldBtn();
            worldAnim.currentFrame = e.target.selection - 1;
            break;
        case 'attitude':
            attiBtn();
          attitudeAnim.currentFrame = e.target.selection - 1;
          break;
    }
}
function chooseBratz() {
  flechita.y = 250;
    if(sideBratz.x == sideIn){
        TweenLite.fromTo(flechita, 0.5, {x: arrowIn}, {x: sideOut});
        TweenLite.fromTo(sideBratz, 0.5, {x: sideIn}, {x: sideOut});
    }else{
        TweenLite.fromTo(flechita, 0.5, {x: sideOut}, {x: arrowIn});
        TweenLite.fromTo(sideBratz, 0.5, {x: sideOut}, {x: sideIn});
    }
}
function chooseWorld() {
  flechita.y = 375;
    if(sideWorlds.x == sideIn){
        TweenLite.fromTo(flechita, 0.5, {x: arrowIn}, {x: sideOut});
        TweenLite.fromTo(sideWorlds, 0.5, {x: sideIn}, {x: sideOut});
    }else{
        TweenLite.fromTo(flechita, 0.5, {x: sideOut}, {x: arrowIn});
        TweenLite.fromTo(sideWorlds, 0.5, {x: sideOut}, {x: sideIn});
    }
}
function chooseAttitude() {
  flechita.y = 130;
    if(sideAttitude.x == sideIn){
        TweenLite.fromTo(flechita, 0.5, {x: arrowIn}, {x: sideOut});
        TweenLite.fromTo(sideAttitude, 0.5, {x: sideIn}, {x: sideOut});
    }else{
        TweenLite.fromTo(flechita, 0.5, {x: sideOut}, {x: arrowIn});
        TweenLite.fromTo(sideAttitude, 0.5, {x: sideOut}, {x: sideIn});
    }
}
function chooseLook() {
    flechita.y = 500;
    if(sideLook.x == sideIn){
        TweenLite.fromTo(flechita, 0.5, {x: arrowIn}, {x: sideOut});
        TweenLite.fromTo(sideLook, 0.5, {x: sideIn}, {x: sideOut});
    }else{
        TweenLite.fromTo(flechita, 0.5, {x: sideOut}, {x: arrowIn});
        TweenLite.fromTo(sideLook, 0.5, {x: sideOut}, {x: sideIn});
    }
}
function hideChoosers(){
    TweenLite.to(flechita, 0.5, {x: sideOut})
    TweenLite.to(sideBratz, 0.5, {x: sideOut});
    TweenLite.to(sideWorlds, 0.5, {x: sideOut});
    TweenLite.to(sideAttitude, 0.5, {x: sideOut});
    TweenLite.to(sideLook, 0.5, {x: sideOut});
}
function tick() {
    stage.update();
}