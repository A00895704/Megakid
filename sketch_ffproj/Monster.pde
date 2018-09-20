

class Monster extends Character{
boolean firstTime=true;
int delayTimer;
boolean isDead=false;
int damage;
int damageTaken;
int deathTimer=60;
float pelletSpeed=5;
int moreCollision=3;
boolean isFacingLeft=true;
boolean dropItemOnce=true;
float dropChance=random(100);
int transparency;
int changeInTrans;
boolean firstShot=true;

  Monster(int health, PVector pos, PVector vel, PVector dim){
    super(health, pos, vel, dim);
   
  }
  
  float calculateCosSpeed(){
  return(pelletSpeed*cos(atan((player.pos.y-pos.y)/(player.pos.x-pos.x))));
}
float calculateSinSpeed(){
  return(pelletSpeed*sin(atan((player.pos.y-pos.y)/(player.pos.x-pos.x))));
}
  
  void checkSwitchDirections(){
  if(!isFacingLeft && Direction==1){ //should be facing left
    scale(-1, 1);
    isFacingLeft=true;
    }
    else if(isFacingLeft && Direction==-1){ //should be facing right
    scale(-1, 1);
    isFacingLeft=false;
    }
  }
  
  boolean detectPlayer(int detectionWidth, int detectionHeight){
  if (abs(player.pos.x-pos.x) < detectionWidth && abs(player.pos.y - pos.y) < detectionHeight){
      return true;  
  }
    return false;
  }
  void findPlayer(){
  if ((player.pos.x-pos.x)>0){
    Direction=-1;
  }
  else Direction=1;
    
}
void gravPlat() {
    //manage the platform. If the player is on a platform, then its platform field will be (not) null.
    //if the player is on a platform, then check if the player is STILL on the platform
    if (platform!=null) {
      if (!platform.isOn(this)) {
        inAir = true; //if the player has walked off his platform, then the player is inAir
        
      }
    }
    
      if(wall!=null){   
        if (wall.isFallenOut(this) ){
        inAir=true;
        wallSlide=false;
        wall=null;
       
     }
      
     }
    
    
  
  
    if(!inAir)
    checkPlatforms();
    if(inAir){
      this.accelerate(gravForce);
      
      checkPlatforms();
     }
   
    
  }



 void checkPlatforms(){
  
    //AND, if the player's in the air, then we must check to see whether we can find a platform for him to land on
      for (int i = 0; i < platforms.size(); i++) {
        Platform p = platforms.get(i);
       
        //if the player has hit a platform then we make the player landon the platform
        if (p.collisionCheck(this)) {
          
          {
         
         if (abs(pos.x-p.pos.x)<dim.x/2 + p.dim.x/2 && pos.y < p.pos.y - p.dim.y/2 ) // if the player is above the platform
         {
          landOn(p);
           
          } 
          else if((pos.x <= p.pos.x-p.dim.x/2 || pos.x>= p.pos.x+p.dim.x/2) && abs(pos.y-p.pos.y) < dim.y/2 + p.dim.y/2 ) //if left or right side of platform
          {
          inAir=true;
         // platformIndex=i;
         // Platform w = platforms.get(platformIndex);
            if(pos.x > p.pos.x && abs(pos.y-p.pos.y ) <p.dim.y/2+ dim.y/2)// right side of platform
            {
              pos.x = p.pos.x + dim.x/2 + p.dim.x/2;    //character position is half the character's dimension + right side of platform
            }
            else if(abs(pos.y-p.pos.y ) <p.dim.y/2+ dim.y/2) //pos.x < p.pos.x character is on left side
             pos.x = p.pos.x - dim.x/2 - p.dim.x/2;
  
          }
         else if (abs(pos.x-p.pos.x)<dim.x/2 + p.dim.x/2 && pos.y > p.pos.y + p.dim.y/2)
         {
          vel.y*=-1;
          pos.y= p.pos.y +dim.y/2 + p.dim.y/2;
          inAir=true;
          
          }
          
        }
      
      }
      else 
      inAir=true;
      
      }
      
  }
 
 
boolean pAttackCollisionCheck(){
   for(int i=0; i<pAttacks.size();i++){
     Attacks pA= pAttacks.get(i);
     if(abs(pos.x-pA.pos.x)< dim.x/2 + pA.dim.x/2+moreCollision && abs(pos.y-pA.pos.y) < pA.dim.y/2 + dim.y/2 + moreCollision) {
       damageTaken=pA.damage;
       health-=damageTaken;
       return true;
     }
   }
   return false;
 }
 void fireLOrb(){
      if(firstShot){
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( -5, 0 ), new PVector(50, 50))); //left
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( 5, 0  ), new PVector(50, 50))); //right
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( 0, -5 ), new PVector(50, 50))); //up
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( 0, 5 ), new PVector(50, 50))); //down
      }
      
      else{
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( -2, -2 ), new PVector(50, 50))); //left-up
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( 2, -2  ), new PVector(50, 50))); //right-up
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( -2, 2 ), new PVector(50, 50))); //left-down
      mAttacks.add(new LightningOrb(new PVector(pos.x, pos.y), new PVector( 2,  2), new PVector(50, 50))); //right-down
      
      }
  }
  
  
  
  
  
 
 
 
 void death(){
   
   if(health<=0){
     isDead=true;
     if(dropItemOnce){
       if(dropChance >25){
         
          items.add(new HealthItem(new PVector(pos.x, pos.y), new PVector(30, 30), random(20, 50)));
        //  items.add(new HealthUpgrade(new PVector(pos.x, pos.y), new PVector(30, 30)));
       dropItemOnce=false;}
     }
     deathTimer--;
     deaths.add(new DeathExplosion(pos, dim));
     if (deathTimer==0){
     monsters.remove(this);
     }
   }
 }
  


}