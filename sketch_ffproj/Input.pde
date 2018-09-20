boolean left, down, right, up;
boolean zed, exe, sea;
float speed=1.1;
float jumpSpeed=2;
PVector leftForce=new PVector(-speed, 0);
PVector rightForce=new PVector(speed, 0);
PVector upForce=new PVector(0, -jumpSpeed*17);
PVector downForce = new PVector(0, speed);
void keyPressed() {
  if (state==SHOW_MAIN_MENU) {
    if (key==CODED) {
      if (keyCode==UP) {
        up=true;
        if (menuSelect==1){
        menuSelect--;
        }
      }
      if (keyCode==DOWN) {
        down=true;
        if (menuSelect==0){
          menuSelect++;
        }
      }
    }    
    if(key=='z'){
        if (menuSelect==0){
          state=PLAY_GAME1;
        }
        if(menuSelect==1){
          exit();
        }
      }
 
}
  
  if (state==PLAY_GAME1 || state==PLAY_GAME2 || state==PLAY_GAME3) {
   
    if (key==CODED) {
      if (keyCode==LEFT) {
        left=true;
     
      } 
      if (keyCode==DOWN) {
        down=true;
      }

      if (keyCode==RIGHT) {
        right=true;
      }
   } 
     if(key=='z' && player.canJump){
       
       player.jump();
      player.canJump=false;      
      }
      if (key=='x'){
       
        exe=true;
      }
   

  }
  if(state==SHOW_LOSE_SCREEN){
    if(key=='z'){
      continueOrRestart();
      println("you pressed z");
    }
  
  
  }
}

void keyReleased() {
  if (state==PLAY_GAME1 || state==PLAY_GAME2 || state==PLAY_GAME3) {
    if (key==CODED) {
      if (keyCode==LEFT) {
        left=false;
      }

      if (keyCode==UP) {
        up=false;
      }

      if (keyCode==RIGHT) {
        right=false;
      }

      if (keyCode==DOWN) {
        down=false;
      }
      
    }
    if (key=='x'){
      if(chargeTimer>240 && player.weaponUpgrade){
        fireGigaBlast();
      
      }
      
      else if (chargeTimer>150)
        fireMegaBlast();       
      else if(chargeTimer>60)
        fireTinyBlast();
      
       else
       fireBlaster();
      
    exe=false;
    chargeTimer=0;
  }
  }
}

void  avatarActions() {
  if (player.isHit==false){
  if (left) {
    player.accelerate(leftForce);
    player.pos.x= player.pos.x;
    playerDirection=1;
  }
  if (down && zed) {
    player.accelerate(downForce);
  }

  if (right) {
    player.accelerate(rightForce);
    playerDirection=-1;
    player.pos.x=player.pos.x;
  }
  if (zed && player.canJump) {
    player.jump();
    player.canJump=false;
  }
  
  
  if (exe){
  fireBlaster();   
  
  }
  }
  
}