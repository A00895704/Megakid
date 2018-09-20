

class Spitter extends Monster{
  int pelletTimer=90;
  int hideTimer=240;
  int emergeTimer=120;
  int firingTimer;
  boolean hiding=false;
  
  Spitter(int health, PVector pos, PVector vel, PVector dim){
    super(health, pos, vel, dim);
    damage=10;
  }
void drawCharacter(){
    pushMatrix();
    pushStyle();
    translate(pos.x, pos.y);
    if (hiding){
    fill(0, 0, 255);
    }
    else
    fill(spitColor);
    
    scale(-1, 1);
    
    ellipse(0, 0, dim.x, dim.y);
    checkSwitchDirections();
    popStyle();
    
    popMatrix();
  }

  

  void update(){
    findPlayer();
    if (!isDead){
    drawCharacter();
    
    if (detectPlayer(width, height)){
    hideTimer--;
    pelletTimer--;
    findPlayer();
      if (pelletTimer==0 && !hiding){
        firePellets();
        pelletTimer=90;
      }
    if (hideTimer==0){      
      hiding=true;
     emergeTimer=120;
    } 
    if(hiding){
    emergeTimer--;
    
    }
    if(emergeTimer==0 && hiding){
    hiding=false;
    pelletTimer=30;
    hideTimer=240;
    }
    }
  
    gravPlat();
    if(!hiding)
    pAttackCollisionCheck();
    }
    death();
    
   
}

  void firePellets(){
    if (Direction==1){
      PVector leftSideofMonster=new PVector(this.pos.x-this.dim.x, this.pos.y-30);
      
      mAttacks.add(new Pellets(leftSideofMonster, new PVector(-calculateCosSpeed(), -calculateSinSpeed() ), new PVector(30, 30)));
    }
    else{
      PVector rightSideofMonster=new PVector(this.pos.x + this.dim.x, this.pos.y-30);
      mAttacks.add(new Pellets(rightSideofMonster, new PVector(calculateCosSpeed(), calculateSinSpeed()), new PVector(30, 30)));
    }
  }
}