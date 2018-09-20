class BossDeath extends DeathExplosion{
  
  BossDeath(PVector pos, PVector dim){
  super(pos, dim);
  
  deathTimer=30;  
}
  
  void draw(){
     pushMatrix();
     pushStyle();
     
     translate(pos.x, pos.y);
     stroke(255, 154, 0);
     fill(240, 240, 0);
     dim.x+=0.7;
     dim.y+=0.7;
     if (deathTimer>0){
     ellipse(0, 0, dim.x, dim.y);
     
     }
     
     
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