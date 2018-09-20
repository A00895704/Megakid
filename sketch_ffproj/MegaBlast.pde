class MegaBlast extends Attacks{

  MegaBlast(PVector pos , PVector vel, PVector dim){
  super(pos, vel, dim);
  damage=100;
  }
  
   void drawMe(){
    pushMatrix();
    pushStyle();
  translate(pos.x, pos.y);
  fill(255, 0, 0);
  ellipse(0, 0, dim.x*2, dim.y*2);
  popStyle();
  popMatrix();
  }
  
   void drawExplosion(){
 pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  stroke(255, 0, 0);
  strokeWeight(8);
  fill(255);
  ellipse(0, 0, 35, 35);
  popStyle();
  popMatrix();
 
 }

}