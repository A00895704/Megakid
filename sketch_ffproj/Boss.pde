class Boss extends Monster{
  boolean secondTime=true;
  boolean createPlatformsOnce=true;
  Boss(int health, PVector pos, PVector vel, PVector dim ){
    super(health, pos, vel, dim);
    transparency=4;
    changeInTrans=3;
    damage=30;
   
  }
  void drawCharacter(){
  pushMatrix();
  pushStyle();
  translate(pos.x-dim.x/2, pos.y-dim.y/2);
  if(health>0 && health<=1000){
  fill(255, 0, 0, transparency);
  ellipse(0, 0, dim.x, dim.y);
  }
  else
  fill(255, 0, 0);
  rect(0, 0, dim.x, dim.y);
  
  popStyle();
  popMatrix();
  }
  void firstStage(){
  gravPlat();
   if (firstTime){
      findPlayer();
      firstTime=false;
      platforms.add(new Platform(new PVector(10150, -1300), new PVector(15, 100 ), false));
      platforms.add(new Platform(new PVector(10850, -1300), new PVector(15, 100 ), false));
    }
    if (delayTimer> 150){
      findPlayer();
      delayTimer=0;
    }
    if (detectPlayer(width*2, height*2 )){ 
      if (Direction==1){
          vel.add(new PVector(-2.0, 0));
          delayTimer++;
          
      }
    else{
      vel.add(new PVector(2.0, 0));
        delayTimer++;
    } 
  }  
  
  }
  void secondStage(){
   if(secondTime){
      platforms.add(new Platform(new PVector(10000, -1450), new PVector(170, 20), false, new PVector(2, 0), 540 ));
      platforms.add(new Platform(new PVector(11200, -1450), new PVector(170, 20), false, new PVector(-2, 0), 540 ));
      secondTime=false;
      }
          transparency += changeInTrans;

    if (transparency > 255) {
      transparency = 255;
      changeInTrans *= -1;
    } else if (transparency < 0) {

      transparency = 0;
      changeInTrans *= -1;
    }
      

      if (transparency==0) {
        pos=new PVector(random(9900, 11200), -1500);
       
      }
    if (transparency>=150 && transparency <= 155){
    fireLOrb();
    if(firstShot)
    firstShot=false;
    
    else
    firstShot=true;
    }
  
  }
  void transitionReset(){
    vel=new PVector(0, 0);
    firstTime=true;
    
  }
  
  void update(){
   if(!isDead){
    drawCharacter();
    pos.add(vel);
    
    vel.mult(damp);
    pAttackCollisionCheck();
    
  
  if(health>1000 && health <=2000){
    firstStage();
    }
    
    if(health>500 && health<=1000){
    secondStage(); 
    
    
    }
    
    if(health>0 &&health<=500){
    firstStage();
    secondStage();
      
    }
   }
  death();
  
  
  
  }
  
  void death(){
   if(health<=0){
     isDead=true;
     damage=0;
     deathTimer--;
     deaths.add(new BossDeath(pos, dim));
     if (deathTimer==0){
     monsters.remove(this);
     state=SHOW_WIN_SCREEN;
     }
   }
  
  
  }
  


}