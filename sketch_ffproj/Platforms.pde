class Platform{
  PVector pos, dim, vel, maxVel;
  boolean invisible=false;
  int currentTimer, cycleTimer ;
  
  
   
  Platform(PVector pos, PVector dim, boolean invisible) {
    this.pos = pos;
    this.dim = dim;
    this.invisible= invisible;
  }
  
  Platform(PVector pos, PVector dim, boolean invisible, PVector vel, int cycleTimer ){
  this.vel=vel;
  currentTimer=cycleTimer;
  this.cycleTimer=cycleTimer;
  this.invisible= invisible;
  this.dim = dim;
  this.pos=pos;
  maxVel=vel;
  }

  //returns true if the character is on top of the platform 
  boolean isOn(Character c) {
    if (abs(c.pos.x - pos.x) < c.dim.x / 2 + dim.x/2 && c.pos.y <c.pos.y -dim.y/2 - c.dim.y/2) {
      
      return true;
    }
    return false;
  }

  //simple collision check between the Character and the Platform
  boolean collisionCheck(Character c) {
    if (abs(c.pos.x - pos.x) < c.dim.x / 2 + dim.x / 2 &&
      abs(c.pos.y - pos.y) < c.dim.y / 2 + dim.y / 2) {
      return true;
    }
    return false;
  }
  
   
  boolean isFallenOut(Character c){
    if (abs(c.pos.y-pos.y ) <dim.y/2+ c.dim.y/2){
    
       if(c.pos.x > pos.x + c.dim.x/2 +dim.x/2  || c.pos.x < pos.x - c.dim.x/2 - dim.x/2 ) {
      
        return true;
       }
    }
     return false;
  }
  
  void draw() {
    pushMatrix();
    
    pushStyle();
     
     if(invisible){
     noStroke();
     fill(0, 0);
     
     }
     else 
     fill(0);
    translate(pos.x, pos.y);
    
    rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
    pushStyle();
    fill(255, 120, 0);
    ellipse(0, 0, 50, 50);
    
    popStyle();
    popStyle();
    popMatrix();
  }
  void update(){
    draw();
    if(vel!=null){
    
    pos.add(vel);
    currentTimer--;
    if(currentTimer==0){
      vel.mult(-1);
      currentTimer=cycleTimer;
    }
    
  
  }
  }
   

}