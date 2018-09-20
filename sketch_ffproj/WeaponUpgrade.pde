class WeaponUpgrade extends Items{
  boolean weaponUpgrade=true;
  WeaponUpgrade(PVector pos, PVector dim){
  super(pos, dim);
  
  }
  
  void draw(){
  pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  
  
  fill(255, 0 , 0);
  ellipse(0, 0, dim.x, dim.y);
  fill(0);
  textAlign(CENTER);
  textSize(24);
  text("D", 0, 9);
  
  popStyle();
  popMatrix();
  
  
  }
}