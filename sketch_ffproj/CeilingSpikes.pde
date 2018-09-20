

class ceilingSpikes extends Hazard{
  
  
  ceilingSpikes(PVector pos, PVector dim){
    super(pos, dim);
    damage=20;
  }

  void update(){
    drawMe();
  }
  
  void drawMe(){
  pushMatrix();
  pushStyle();
  
  translate(pos.x-dim.x/2, pos.y);
  
  fill(0, 0, 255);
  triangle(0, 0, dim.x, 0, dim.x/2 , dim.y);
   
  
  popStyle();
  popMatrix();
  
  }
}