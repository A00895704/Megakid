class LightningOrb extends Pellets{
  

  LightningOrb(PVector pos, PVector vel, PVector dim){
  super(pos, vel, dim);
  damage=30;
  }
  void drawMe(){
  pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  strokeWeight(2);
  stroke(255, 255, 0);
  fill(255, 255, 0);
  ellipse(0, 0, dim.x, dim.y);
  popStyle();
  popMatrix();
  
  }
  
  void update(){
    drawMe();
    pos.add(vel);
    outOfBounds();
    
    if (outOfBounds()){
     
      mAttacks.remove(this);
   
   }
  
  }
  
  
}