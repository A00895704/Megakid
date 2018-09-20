class ShockTrap extends Hazard{

  ShockTrap(PVector pos, PVector dim){
    super(pos, dim);
    damage=20;
  
  }
  
  void drawMe(){
  pushMatrix();
  pushStyle();
  translate(pos.x-dim.x/2, pos.y-dim.y);
  fill(255, 255, 0);
  rect(0, 0, dim.x, dim.y*2);
  fill(255, 154, 0);
  ellipse(0, 0, 50, 50);

  popStyle();
  popMatrix();
  
  
  }


}