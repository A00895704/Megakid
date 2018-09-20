color pelletColor = color(200, 100, 100);
class Pellets extends Attacks{
int removalTimer=5;


boolean toBeRemoved=false;
  Pellets(PVector pos , PVector vel, PVector dim){
  super(pos, vel, dim);
  damage=20;
  }
  
  void drawMe(){
  pushMatrix();
  pushStyle();
    translate(pos.x, pos.y);
    fill(pelletColor);
    rect(0, 0, dim.x, dim.y);
    popStyle();
  popMatrix();
  }
   boolean atkCollisionCheck(){
    
    for (int i=0; i < platforms.size(); i++){
      Platform p = platforms.get(i);
      if (abs(p.pos.x-pos.x) < p.dim.x/2 + dim.x/2-lessCollision && abs(p.pos.y-pos.y) < p.dim.y/2 + dim.y/2-lessCollision ){
        vel=new PVector(0,0);
        timer=30;
        detonation=true;
        return true;
      }
      
    }
    return false;
  }
  
   boolean playerCollisionCheck(){
    
      if (abs(player.pos.x-pos.x) < player.dim.x/2 + dim.x/2-7 && abs(player.pos.y-pos.y) < player.dim.y/2 + dim.y/2-7 ){
        vel=new PVector(0,0);
        timer=5;
       
        return true;
      } 
    return false;
   }
   
   
   
   void update(){
    pushMatrix();
     pos.add(vel);
    drawMe();
       
   if(playerCollisionCheck() && !toBeRemoved){
   toBeRemoved=true;
   }
   
   if(toBeRemoved){
     removalTimer--;
   }
   
   if (removalTimer==0 || atkCollisionCheck() || outOfBounds()){
   mAttacks.remove(this);
    }
     
   if(playerCollisionCheck()){
   
   mAttacks.remove(this);
   }
   if (outOfBounds()){
   mAttacks.remove(this);
   
   }
  
   popMatrix();
   
   }
   
   void drawExplosion(){
   
   
   }
}