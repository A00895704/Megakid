class GigaBlast extends Attacks{

  GigaBlast(PVector pos , PVector vel, PVector dim){
  super(pos, vel, dim);
  damage=200;
  }
  
   void drawMe(){
    pushMatrix();
    pushStyle();
  translate(pos.x, pos.y);
  fill(201, 41, 255);
  ellipse(0, 0, dim.x*4, dim.y*4);
  popStyle();
  popMatrix();
  }
  
   void update(){
  pos.add(vel);
  drawMe();
  if(outOfBounds()){
  pAttacks.remove(this);
  
  }
   
  }
  


}