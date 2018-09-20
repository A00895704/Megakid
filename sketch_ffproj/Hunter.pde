class Hunter extends Monster{
  int jumpDelayTimer=90;
  int jumpTimer=60;
  boolean isJumping=true;
  boolean isJumpingLeft=true;
  boolean checkDirection=true;
  Hunter(int health, PVector pos, PVector vel, PVector dim){
    super(health, pos, vel, dim);
    damage = 30;
  
  }

  void drawCharacter(){
  pushMatrix();
  translate(pos.x-dim.x/2, pos.y-dim.y/2);
  
  fill(0, 0, 255);
 
  rect(0, 0, dim.x, dim.y);
  checkSwitchDirections();
  popMatrix();
  }
  void update(){
    if(!isDead){
      
  drawCharacter();
  pos.add(vel);
  vel.mult(damp);
  gravPlat();
  pAttackCollisionCheck();
  if(checkDirection){
    findPlayer();
    checkDirection=false;
    
  }
    
  HunterJump();
   
    }
   death();
  }
void jumpLeft(){
  jumpTimer--;
    if(jumpTimer<=60 && jumpTimer>45){
  vel.add(-1, -2.5);
  
  }
  else if(jumpTimer<=45 && jumpTimer>30){
  vel.add( -2, -2); 
  
  }
  else if(jumpTimer<=30 && jumpTimer>15){
  vel.add( -2, 0.5); 
  }
  else if(jumpTimer<=15 && jumpTimer >0){
  vel.add(-1, 0.5);
  
  }
  
  
  }
  
  void jumpRight(){
  jumpTimer--;
    if(jumpTimer<=60 && jumpTimer>45){
  vel.add(1, -2.5);
  
  }
  else if(jumpTimer<=45 && jumpTimer>30){
  vel.add( 2, -2); 
  
  }
  else if(jumpTimer<=30 && jumpTimer>15){
  vel.add( 2, 0.5); 
  }
  else if(jumpTimer<=15 && jumpTimer >0){
  vel.add(1, 0.5);
  
  }
  
  
  }
  
 void HunterJump(){
  if(checkDirection){
    findPlayer();
    checkDirection=false;
    
  }
    
  if(detectPlayer(width/2, height/3)){
    if(isJumping){ 
     // jumpingCollisionCheck();
      if (Direction==1){
        jumpLeft();}
       else{
       jumpRight();}
     
    }
  if(jumpTimer<=0){
    isJumping=false;
    
  }
  if(!isJumping){
  jumpDelayTimer--;
    if(jumpDelayTimer==0){
    isJumping=true;
    jumpTimer=60;
    checkDirection=true;
    jumpDelayTimer=90;
    }
  }
  
  }
 
 
 }




}