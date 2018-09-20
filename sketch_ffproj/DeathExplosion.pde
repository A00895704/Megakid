class DeathExplosion{
  PVector pos, dim;
  int deathTimer=60;  
  DeathExplosion(PVector pos, PVector dim){
  this.pos=pos;
  this.dim=dim;
  }
  
  void draw(){
     pushMatrix();
     pushStyle();
     
     translate(pos.x, pos.y);
     stroke(255, 154, 0);
     fill(240, 240, 0);
     if (deathTimer<=60 && deathTimer>40)
     ellipse(-dim.x/2 , -dim.y/2 , dim.x, dim.x);
     else if(deathTimer<=40 && deathTimer >20)
     ellipse(dim.x/2, 0, dim.x, dim.x);
     else
     ellipse(-dim.x/2, dim.y/2, dim.x , dim.x);
     
     popStyle();
     popMatrix();
    
    }
  
  
  void update(){
    draw();
    deathTimer--;
  if (deathTimer==0){
    deaths.remove(this);
  
  }

  }
}