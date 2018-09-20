//avatar is the playable characte

class Avatar extends Character{
  boolean weaponUpgrade=false;
  boolean healthUpgrade=false;
  PVector hitKnockback=new PVector(playerDirection*2,-15);
  boolean isHit=false;
  int knockbackDirection;
  boolean isInvin=false;
  int invinTimer, hitTimer, healthBar, currentHealth, damageTaken, maxHealth;
  int lives=3;
  int lessCollision=2;
  boolean canJump=false;
  
  Avatar(int health, PVector pos, PVector vel, PVector dim){
    super(health, pos, vel, dim);
   // acc=new PVector();
    currentHealth=health;
    maxHealth=health;
  }
  
  void drawCharacter(){
    pushMatrix();
    pushStyle();
    translate(pos.x, pos.y);
    fill(selectButton);
    if(chargeTimer>60){
    fill(0,255,0);
    }
     if(chargeTimer>150)fill(255,0,0);
    
     if(chargeTimer>240 && weaponUpgrade)fill(201, 41, 255);
    if (playerDirection==-1){
    scale(-1, 1);
    ellipse(0, 0, dim.x, dim.y);
    }
    else 
    ellipse(0, 0, dim.x, dim.y);
    popStyle();
    popMatrix();
  }

void update(){
  death();
   drawCharacter();
   pos.add(vel);
   vel.mult(damp);
   gravPlat();
    displayHealth();
    checkItems();
   if(allCollisionChecks() && !isInvin){
   playerIsHit();
   }
   
   if (isHit){
   hitTimer--;
   wallSlide=false;
   inAir=true;
   }
   if(hitTimer==0){
   isHit=false;
   
   }
  if(isInvin){
    invinTimer--;
  
  } 
  if(invinTimer==0){
  isInvin=false;
  }
   
}

  void accelerate(PVector move){
    vel.add(move);
  }
  void jump() {
      if(wallSlide==true){
        if(pos.x > wall.pos.x)//right jump
        {
          vel.x=wallJumpX;
          vel.y=wallJumpY;
         // player.accelerate(new PVector(wallJump.x, wallJump.y));
          
        }
        else if(pos.x<wall.pos.x)//left jump
        {
          vel.x=-wallJumpX;
          vel.y=wallJumpY;
         // player.accelerate(new PVector(-wallJump.x, wallJump.y));
         
        }
        
        
      }
      else{
      accelerate(upForce);
      inAir = true;
      }
  
      
  }
  
  
  
  boolean allCollisionChecks(){
    for (int i=0; i<monsters.size(); i++){
    Monster m = monsters.get(i);
    if(mCollisionCheck(m)){
      return true;
    }  
  }
  
  for (int i=0; i<mAttacks.size(); i++){
    Attacks mA= mAttacks.get(i);
    if(pCollisionCheck(mA)){
      return true;
  
  }
  }
 
  for (int i=0; i<hazards.size(); i++){
  Hazard h = hazards.get(i);
   if(hCollisionCheck(h)){
     return true;
   }
  
  }
 
  
  return false;
  }
  
  boolean mCollisionCheck(Monster monster){
      if(abs(pos.x-monster.pos.x)< dim.x/2 + monster.dim.x/2-lessCollision && abs(pos.y-monster.pos.y)< dim.y/2 + monster.dim.y/2-lessCollision){
          if(monster.pos.x > pos.x){
          knockbackDirection=-1;
          
          }
          else
          knockbackDirection=1;
          damageTaken=monster.damage;
        return true;
      }
      else
      return false;
  }
  
  boolean pCollisionCheck(Attacks attack){
    if(abs(pos.x-attack.pos.x)< dim.x/2 + attack.dim.x/2-lessCollision && abs(pos.y-attack.pos.y) < attack.dim.y/2 + dim.y/2-lessCollision){
       if(attack.pos.x> pos.x){
       knockbackDirection=-1;
       }   
       else
       knockbackDirection=1;
       damageTaken=attack.damage;
       return true;
      }
      else
      return false;
  }
  
  
  boolean hCollisionCheck(Hazard hazard){
    if(abs(pos.x-hazard.pos.x)< dim.x/2 + hazard.dim.x/2 && abs(pos.y-hazard.pos.y)< hazard.dim.y/2 + dim.y/2){
      if(hazard.pos.x >pos.x){
      knockbackDirection=-1;
      
      }  
      else
      knockbackDirection=1;
      damageTaken=hazard.damage;
      return true;
      }
      else
      return false;
  }
   
  void displayHealth(){
  pushMatrix();
  pushStyle();
  
  healthBar=currentHealth/10;
  
  for (int i=0; i < healthBar; i++){
    if (i<=5)
    fill(255, 0, 0);
    else if(i>=6 && i<=12){
    fill(255, 154, 0 );
    }
    else
    fill(0, 255, 0);
    
    rect(camX+50, camY +height/2 - i*10, 15, 5); 
  }
  
  popStyle();
  
  popMatrix();
  }
  
  void checkItems(){
    
    for (int i=0; i<items.size(); i++){
     Items it= items.get(i);
     if (abs(pos.x-it.pos.x)< dim.x/2 + it.dim.x/2 && abs(pos.y-it.pos.y)< it.dim.y/2 + dim.y/2){
       if(it.healthRestore>0){
         if((currentHealth+=it.healthRestore) > maxHealth)
         currentHealth=maxHealth;
         else
         currentHealth+=it.healthRestore;
       
       }
       
       if(it.moreLives>0){
       lives+=1;
       }
       
       if(it.healthUpgrade){
         maxHealth+=50;
         currentHealth=maxHealth;
       
       }
       if(it.weaponUpgrade){
         if(!weaponUpgrade)
         weaponUpgrade=true;
         
       }
       it.itemPickUp();
     
     }
     
    
    }
  
  }
  
  void playerIsHit(){
    hitTimer=30;
    invinTimer=90;
    isHit=true;
    isInvin=true;
    currentHealth-=damageTaken;
    hitKnockback=new PVector(5*knockbackDirection , -17);
    player.accelerate(hitKnockback);
    inAir=true;
  }
  
  void death(){
    if(pos.y >4800){
    state=SHOW_LOSE_SCREEN;
    }
    if(currentHealth<=0){
      println("you have died");
      state=SHOW_LOSE_SCREEN;
    }
  
  }
}