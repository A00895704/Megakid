class Attacks{
  PVector pos, vel, dim;
  boolean detonation=false;
  int timer;
  int lessCollision=7;
  int damage;
  int attackTimer=0;
  Attacks(PVector pos , PVector vel, PVector dim){
  this.pos = pos;
  this.vel = vel;
  this.dim=dim;
  damage=10;
  }
  
  boolean monCollisionCheck(){
   for (int i=0; i< monsters.size(); i++){
      Monster m= monsters.get(i);
      if(abs(m.pos.x-pos.x) < m.dim.x/2 + dim.x/2-1 && abs(m.pos.y-pos.y) < m.dim.y/2 + dim.y/2){
          return true;
    
      }
    }
    return false;
  }
  
  boolean platCollisionCheck(){
   
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
  void drawExplosion(){
  pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  stroke(255, 204, 0);
  strokeWeight(2);
  fill(255);
  ellipse(0, 0, 15, 15);
  popStyle();
  popMatrix();
  }
  
  void drawMe(){
    pushMatrix();
    pushStyle();
  translate(pos.x, pos.y);
  ellipse(0, 0, dim.x/3, dim.y/3);
  popStyle();
  popMatrix();
  }
  void update(){
  pos.add(vel);
  if(detonation==false)
  platCollisionCheck();
  if (timer==0)
  drawMe();
  if( timer>0){
  timer--;
  drawExplosion();
  }
   if (timer==0 && detonation==true || monCollisionCheck()){
   pAttacks.remove(this);  
     }
   outOfBounds();
   
   
  
  
  }
  boolean outOfBounds(){
    attackTimer++;
   if(attackTimer>1200)
     return true;
   return false;
   
   }
  
  }