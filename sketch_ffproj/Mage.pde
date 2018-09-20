class Mage extends Monster {
  int transparency=4;
  int changeInTrans=2;
  boolean firstShot=true;
  
  Mage(int health, PVector pos, PVector vel, PVector dim) {
    super(health, pos, vel, dim);
    damage=20;
  }

  void drawCharacter() {

    pushMatrix();
    pushStyle();
    if (detectPlayer(width, height )) {
      transparency += changeInTrans;

    if (transparency > 255) {
      transparency = 255;
      changeInTrans *= -1;
    } else if (transparency < 0) {

      transparency = 0;
      changeInTrans *= -1;
    }
      translate(pos.x, pos.y);
      fill(0, 255, 0, transparency);

      ellipse(0, 0, dim.x, dim.y);

      if (transparency==0) {
        pos=new PVector(random(player.pos.x-width/2, player.pos.x+width/2), random(player.pos.y-height/2, player.pos.y ));
        //transparency=4;
        //reverse=0;
      }
    }
    popStyle();
    popMatrix();
  }
  void update() {
    if(!isDead){
    drawCharacter();
    
    if (transparency>=150 && transparency <= 153){
    fireLOrb();
    if(firstShot){
    firstShot=false;
    }
    else
    firstShot=true;
    }
    pAttackCollisionCheck();
    }
    death();
  }
  
  
  
}