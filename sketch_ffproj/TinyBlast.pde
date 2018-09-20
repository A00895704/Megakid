class TinyBlast extends Attacks{

  TinyBlast( PVector pos , PVector vel, PVector dim){
  super(pos, vel, dim);
  damage=40;
  }
  
  
  
  void drawMe(){
    pushMatrix();
    pushStyle();
  translate(pos.x, pos.y);
  fill(0, 255, 0);
  ellipse(0, 0, dim.x/2, dim.y/2);
  popStyle();
  popMatrix();
  }
  
 void drawExplosion(){
 pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  stroke(0, 255, 0);
  strokeWeight(4);
  fill(255);
  ellipse(0, 0, 30, 30);
  popStyle();
  popMatrix();
 
 }

}