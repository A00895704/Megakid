class Character {
  int health;
  boolean inAir=false;
  float damp=0.8;
  Platform platform = null;
  Platform wall = null;
  boolean wallSlide=false;
  PVector pos, vel, dim, acc;
  int platformIndex;
  int Direction=-1;

  Character(int health, PVector pos, PVector vel, PVector dim) {
    this.health=health;
    this.pos=pos;
    this.vel=vel;
    this.dim=dim;
    acc= new PVector();
  }
  
  void drawCharacter() {
  }


  void update() {
    drawCharacter();
    pos.add(vel);
    vel.mult(damp);
    gravPlat();
  }

  void accelerate(PVector force) {
    vel.add(force);
  }
  
  void landOn(Platform p) {
    inAir = false;
    platform = p;
    pos.y = p.pos.y - dim.y /2 - p.dim.y / 2;
    vel.y = 0;
  }
  
  void wallSliding(Platform p){
    wallSlide=true; 
    inAir=false;
    wall=p;
  }
  


  void fall() {
    //pos.y = p.pos.y + dim.y /2 + p.dim.y / 2;
    vel.y *= -1;
    acc.y = 0; 
    inAir=true;
  }
  void checkPlatforms(){
  
    //AND, if the player's in the air, then we must check to see whether we can find a platform for him to land on
      for (int i = 0; i < platforms.size(); i++) {
        Platform p = platforms.get(i);
       
        //if the player has hit a platform then we make the player landon the platform
        if (p.collisionCheck(this)) {
          
          {
         
         if (abs(pos.x-p.pos.x)<dim.x/2 + p.dim.x/2 && pos.y < p.pos.y - p.dim.y/2  ) // if the player is above the platform
         {
          landOn(p);
          
          } 
          else if((pos.x <= p.pos.x-p.dim.x/2 || pos.x>= p.pos.x+p.dim.x/2) && abs(pos.y-p.pos.y) < dim.y/2 + p.dim.y/2 ) //if left or right side of platform
          {
          wallSliding(p);
          platformIndex=i;
          }
          else if (abs(pos.x-p.pos.x)<dim.x/2 + p.dim.x/2 && pos.y > p.pos.y + p.dim.y/2)
          {
          vel.y*=-1;
          pos.y= p.pos.y + dim.y/2 + p.dim.y/2;
          inAir=true;
          }
          
          
        }
      
      }
      
      }
  }
  void gravPlat() {
    //manage the platform. If the player is on a platform, then its platform field will be (not) null.
    //if the player is on a platform, then check if the player is STILL on the platform
    if (platform!=null) {
      if(platform.vel!=null && !inAir){
      //  player.accelerate(platform.vel);
        player.pos.y=platform.pos.y-platform.dim.y/2-player.dim.y/2;
      if(platform.vel.x > 0 || platform.vel.x < 0){
      player.vel.x = platform.vel.x ;
      
      
     
      }
      }
      
       if (!platform.isOn(this)) {
         
        platform=null;
        inAir = true; //if the player has walked off his platform, then the player is inAir
        
      }
      
    }
    
    
      if(wall!=null){   
        if (wall.isFallenOut(this) ){
        inAir=true;
        wallSlide=false;
        wall=null;
        player.canJump=false;
       
     }
      
     }
    
    if (wallSlide){
      if (abs(pos.y-wall.pos.y ) <wall.dim.y/2+ dim.y/2) //
      {          
      vel.y=wallSlideSpeed;
      //player.canJump=true;
      }  
      
      else{
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
    if (wallSlide){
      Platform w = platforms.get(platformIndex);
      if(pos.x > w.pos.x && abs(pos.y-w.pos.y ) <w.dim.y/2+ dim.y/2)// right side of platform
      {
        pos.x = w.pos.x + dim.x/2 + w.dim.x/2;    //character position is half the character's dimension + right side of platform
      }
      else if(abs(pos.y-w.pos.y ) <w.dim.y/2+ dim.y/2) //pos.x < p.pos.x character is on left side
       pos.x = w.pos.x - dim.x/2 - w.dim.x/2;
    }
    if(platform!=null|| wall!=null){
    player.canJump=true;
    }
  }
}