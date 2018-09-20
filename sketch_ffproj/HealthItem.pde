class HealthItem extends Items{
  
 
 HealthItem(PVector pos, PVector dim, float healthRestore){ 
  super(pos, dim);
  this.healthRestore=healthRestore;
  
 }

void draw(){
  pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  
  fill(200, 0 , 0);
  ellipse(0, 0, healthRestore, healthRestore);
  
  popStyle();
  popMatrix();

}


}