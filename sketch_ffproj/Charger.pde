class Charger extends Monster{
  int delayTimer;
  boolean firstTime=true;
  color chargerColor= color(0, 50, 255);
  Charger(int health, PVector pos, PVector vel, PVector dim){
    super(health,  pos, vel, dim); 
    damage=30;
  }
  
  void drawCharacter(){
    pushMatrix();
    pushStyle();
    translate(pos.x-dim.x/2, pos.y-dim.y/2);
    fill(chargerColor);
    rect(0, 0, dim.x, dim.y);
    checkSwitchDirections();
    popStyle();
    popMatrix();
  }
  void update(){
    death();
    if(!isDead){
    if(detectPlayer(width, height)){
      drawCharacter();
    pos.add(vel);
    vel.mult(damp);
    gravPlat();
    pAttackCollisionCheck();
    if (firstTime){
      findPlayer();
      firstTime=false;
    }
    if (delayTimer> 150){
      findPlayer();
      delayTimer=0;
    }
    if (detectPlayer(width*2/3, height/4 )){ 
      if (Direction==1){
          vel.add(new PVector(-1.7, 0));
          delayTimer++;
          
      }
    else{
      vel.add(new PVector(1.7, 0));
        delayTimer++;
    } 
    }
    }
    }
  
  }
}