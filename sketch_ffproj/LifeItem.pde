class LifeItem extends Items{
  int moreLives=1;
  LifeItem(PVector pos, PVector dim){
  super(pos, dim);
  
  
  }
  
  void draw(){
  pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  
  fill(0, 200 , 0);
  ellipse(0, 0, healthRestore, healthRestore);
  
  popStyle();
  popMatrix();
  
  
  
  }
  
  
}  
  