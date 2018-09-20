class addDelShockTrap{
  ShockTrap trap;
  float currentRemovalTimer;
  float currentCreationTimer;
  float removalTimer;
  float creationTimer;
  boolean toBeRemoved=true;
  boolean toBeCreated=false;
  addDelShockTrap(ShockTrap trap, float removalTimer, float creationTimer){
    this.trap=trap;
    this.removalTimer=removalTimer;
    this.creationTimer=creationTimer;
    currentRemovalTimer=removalTimer;
    currentCreationTimer=creationTimer;
  }
  
  void update(){
    //println("creationTimer; " + currentCreationTimer);
   // println("removalTimer; " + currentRemovalTimer);
    if(toBeCreated){
    currentCreationTimer--;
      if(currentCreationTimer<=0){
        hazards.add(trap);
        toBeCreated=false;
        toBeRemoved=true;
        currentRemovalTimer=removalTimer;
      }
    }
    
    if(toBeRemoved){
      currentRemovalTimer--;
      if(currentRemovalTimer<=0){
        hazards.remove(trap);
        toBeCreated=true;
        toBeRemoved=false;
        currentCreationTimer=creationTimer;
      }
    }
  
  
  
  }


}