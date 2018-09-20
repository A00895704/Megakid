class Items{
  PVector pos, dim;
  float healthRestore;
  int moreLives;
  boolean healthUpgrade=false;
  boolean weaponUpgrade=true;
  Items(PVector pos, PVector dim){
  this.pos=pos;
  this.dim=dim;
  }
  
  void itemPickUp(){
      items.remove(this);    
      
   }
  
  
  
  
  
  
  void draw(){
  pushMatrix();
  pushStyle();
  translate(pos.x, pos.y);
  
  fill(0, 200, 0);
  ellipse(0, 0, 60, 60);
  
  popStyle();
  popMatrix();
  
  }


}