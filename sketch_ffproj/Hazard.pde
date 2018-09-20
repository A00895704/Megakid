//Ceiling spikes have hitboxes above them
//Grounded spikes have hitboxes below them

class Hazard {
  int damage;
  PVector pos, dim;
Hazard(PVector pos, PVector dim){
  this.pos=pos;
  this.dim=dim;

}

void update(){
drawMe();
}
void drawMe(){
  

}


}