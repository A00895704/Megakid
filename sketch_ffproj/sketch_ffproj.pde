//height of the world is 4800
//length of the world is to be determined

int offsetMaxX;
int offsetMaxY;
int offsetMinX;
int offsetMinY;
final int STAGE1LENGTH=10000;
final int STAGE2HEIGHT=10000;
final int SHOW_MAIN_MENU=0;
final int PLAY_GAME1=1;
final int SHOW_WIN_SCREEN=2;
final int SHOW_LOSE_SCREEN=3;
final int PLAY_GAME2=4;
final int PLAY_GAME3=5;
final int BLASTER_DELAY_TIME=15;
int chargeTimer;
int blasterDelayTimer;
int playerDirection=-1; //determines if the player is facing left or right
int menuSelect;              //determines where the select arrow points to
int state=SHOW_MAIN_MENU;
PFont font;
ArrayList<Avatar> avatarList = new ArrayList<Avatar>();
ArrayList<Boss> boss = new ArrayList<Boss>();
ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Monster> monsters = new ArrayList<Monster>();
ArrayList<Attacks> pAttacks= new ArrayList<Attacks>();
ArrayList<Attacks> mAttacks=new ArrayList<Attacks>();
ArrayList<Hazard> hazards= new ArrayList<Hazard>();
ArrayList<addDelShockTrap> traps= new ArrayList<addDelShockTrap>();
ArrayList<DeathExplosion> deaths=new ArrayList<DeathExplosion>();
ArrayList<Items> items=new ArrayList<Items>();
float grav = 1.3;
float wallSlideSpeed= 0.8;
float wallJumpX=17;
float wallJumpY=-44;
PVector gravForce = new PVector(0, grav);
PVector lastCheckpoint;
color spitColor = color(35, 200, 100);
color selectButton;  
float camX;
float camY;
int currentStage=1;
Avatar player;
void setup(){
  size(1200, 800);
    
  selectButton= color(255, 153, 51);
  
  font = loadFont("Calibri-48.vlw");
  initializeStages();
  
}

void createPlatforms1(){
 
// 4x4 grid of areas. 
// bottom left = (1, 1)
//bottom boundary
//platforms.add(new Platform(new PVector(2000, 4750), new PVector(10000, 100), true));

//left boundary
platforms.add(new Platform(new PVector(0, 2400), new PVector(10, 4800), true));
//top boundary
platforms.add(new Platform(new PVector(2000, 50), new PVector(10000, 100), true));
//platforms.add(new Platform(new PVector(3000, 2400), new PVector(0, 4800), true));

//ground pieces
platforms.add(new Platform(new PVector(150, 4725), new PVector(300, 150), false));
platforms.add(new Platform(new PVector(450, 4700), new PVector(300, 200), false));
platforms.add(new Platform(new PVector(750, 4700), new PVector(300, 200), false));
platforms.add(new Platform(new PVector(1050, 4600), new PVector(300, 400), false));
platforms.add(new Platform(new PVector(1350, 4400), new PVector(300, 275), false));
platforms.add(new Platform(new PVector(1350, 4740), new PVector(300, 120), false));
//left wall of area (1, 1), (2,1), (3,1)

platforms.add(new Platform(new PVector(375, 2800), new PVector(750, 3000), false));

platforms.add(new Platform(new PVector(375, 600), new PVector(750, 1000), false));
//jutting out (2, 1)
platforms.add(new Platform(new PVector(1100, 3725), new PVector(500, 25), false));
platforms.add(new Platform(new PVector(1000, 3000), new PVector(500, 25), false));
platforms.add(new Platform(new PVector(1100, 2400), new PVector(500, 25), false));
// between (1,1 and 1,2) pillar extending upwards
platforms.add(new Platform(new PVector(1500, 2250), new PVector(300, 3000), false));

//platforms forming a bridge (1,2)
platforms.add(new Platform(new PVector(1700, 4200), new PVector(150, 10), false));

platforms.add(new Platform(new PVector(2000, 4200), new PVector(150, 10), false));

platforms.add(new Platform(new PVector(2300, 4200), new PVector(150, 10), false));

platforms.add(new Platform(new PVector(2600, 4400), new PVector(150, 800), false));

//(1,2) lower ground
platforms.add(new Platform(new PVector(2800, 4600), new PVector(300, 400), false));

//(1,2) jutting out platform

platforms.add(new Platform(new PVector(2775, 3900), new PVector(150, 10), false));

//(1,3) bottom piece

platforms.add(new Platform(new PVector(2950, 4600), new PVector(200, 400), false));

//(1,3) mid piece

platforms.add(new Platform(new PVector(2950, 3900), new PVector(200, 500), false));

//(1,3) upper mid piece

platforms.add(new Platform(new PVector(2950, 3200), new PVector(200, 500), false));

//(1,3)ground

platforms.add(new Platform(new PVector(3700, 4740), new PVector(1500, 120), false));

//(1,3) vertical jutting out poles

platforms.add(new Platform(new PVector(3200, 4530), new PVector(15, 300 ), false));

platforms.add(new Platform(new PVector(3500, 4530), new PVector(15, 300 ), false));

platforms.add(new Platform(new PVector(3800, 4370), new PVector(15, 140 ), false));
platforms.add(new Platform(new PVector(3800, 4020), new PVector(50, 300 ), false));

platforms.add(new Platform(new PVector(4400, 4530), new PVector(15, 300 ), false));

//(1,3) upper mid
platforms.add(new Platform(new PVector(3200, 3700), new PVector(300, 100), false));
platforms.add(new Platform(new PVector(3350, 3600), new PVector(100, 300), false));
platforms.add(new Platform(new PVector(3900, 3500), new PVector(1000, 100), false));
//(1,3) jutting out platform below uppermidzz

platforms.add(new Platform(new PVector(3525, 3730), new PVector(250, 20), false));

//(2,3) center pillars

platforms.add(new Platform(new PVector(3800, 2990), new PVector(200, 600), false));
platforms.add(new Platform(new PVector(3800, 2200), new PVector(200, 600), false));

//(2,3) jutting out platforms 
platforms.add(new Platform(new PVector(4225, 3300), new PVector(350, 20), false));

platforms.add(new Platform(new PVector(4075, 3000), new PVector(350, 20), false));

platforms.add(new Platform(new PVector(4225, 2700), new PVector(350, 20), false));

platforms.add(new Platform(new PVector(4075, 2450), new PVector(350, 20), false));

platforms.add(new Platform(new PVector(4225, 2310), new PVector(350, 20), false));

//between (2,3) and (2,4) pillar

platforms.add(new Platform(new PVector(4500, 3000), new PVector(200, 1400), false));

//(1,4) ground for (2,4)
platforms.add(new Platform(new PVector(5350, 3500), new PVector(1500, 100), false));

//(1,4) ground

platforms.add(new Platform(new PVector(5200, 4740), new PVector(1500, 120), false));

//(1,4) room

platforms.add(new Platform(new PVector(5650, 3960), new PVector(1500, 120), false));
platforms.add(new Platform(new PVector(4800, 4250), new PVector(200, 700), false));
platforms.add(new Platform(new PVector(6150, 4725), new PVector(400, 150), false));
platforms.add(new Platform(new PVector(5960, 4385), new PVector(20, 530), false));
//platforms.add(new Platform(new PVector(6090, 3725), new PVector(20, 350), false));
//(1,4), (2,4), (3,4) right most wall
platforms.add(new Platform(new PVector(6500, 2600), new PVector(300, 4400), false));

platforms.add(new Platform(new PVector(6500, 50), new PVector(300, 100), false));
//(2,4) first thin divider
platforms.add(new Platform(new PVector(4590, 1500), new PVector(20, 1600), false));

platforms.add(new Platform(new PVector(4590, 250), new PVector(20, 500), false));

//(2,4)2nd thin divider

platforms.add(new Platform(new PVector(5500, 1500), new PVector(20, 2800), false));

platforms.add(new Platform(new PVector(5500, 3250), new PVector(20, 400), false));

//(3, 3) small platform
platforms.add(new Platform(new PVector(5460, 300), new PVector(80, 20), false));

//(2,4) 2nd obstacle course
platforms.add(new Platform(new PVector(5900, 2950), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 3100), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5850, 3270), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 2800), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 2650), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 2500), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 2350), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 2200), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 2050), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 1900), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 1750), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 1600), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 1450), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 1300), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 1150), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 1000), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 850), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 700), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 540), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5700, 380), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(5900, 380), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(6100, 380), new PVector(100, 20), false));

platforms.add(new Platform(new PVector(6300, 380), new PVector(100, 20), false));


//(2,4) third divider for pitfall

platforms.add(new Platform(new PVector(6085, 1950), new PVector(30, 3150), false));

//transition room

platforms.add(new Platform(new PVector(6800, 50), new PVector(300, 100), false));

platforms.add(new Platform(new PVector(6945, 250), new PVector(10, 400 ), false));

platforms.add(new Platform(new PVector(6800, 450), new PVector(300, 100), false));


}

// for stage 2
void createPlatforms2(){
//just after transition hallway
platforms.add(new Platform(new PVector(7500, 50), new PVector(1100, 100), false));

platforms.add(new Platform(new PVector(7300, 450), new PVector(700, 100), false));

//the fall right side

platforms.add(new Platform(new PVector(8000, 750), new PVector(150, 1500 ), false));

platforms.add(new Platform(new PVector(8075, 1550), new PVector(300, 100 ), false));
platforms.add(new Platform(new PVector(8275, 1700), new PVector(100, 400 ), false));
platforms.add(new Platform(new PVector(8075, 1850), new PVector(300, 100 ), false));

platforms.add(new Platform(new PVector(8000, 2500), new PVector(150, 1200 ), false));

//platforms.add(new Platform(new PVector(8000, 750), new PVector(150, 1500 ), false));

//the fall left side

platforms.add(new Platform(new PVector(7575, 2000), new PVector(150, 3000 ), false));
//landing & bottom floor
platforms.add(new Platform(new PVector(7800, 3550), new PVector(600, 150 ), false));

platforms.add(new Platform(new PVector(9825, 2950), new PVector(3500, 150 ), false));

platforms.add(new Platform(new PVector(9600, 3700), new PVector(3500, 150 ), false));


//small obstacle course
platforms.add(new Platform(new PVector(8600, 3370), new PVector(20, 250 ), false));
platforms.add(new Platform(new PVector(8900, 3500), new PVector(620, 20 ), false));
platforms.add(new Platform(new PVector(8900, 3200), new PVector(20, 350 ), false));
platforms.add(new Platform(new PVector(9500, 3200), new PVector(20, 350 ), false));
platforms.add(new Platform(new PVector(9200, 3370), new PVector(20, 250 ), false));
platforms.add(new Platform(new PVector(9800, 3370), new PVector(20, 250 ), false));
platforms.add(new Platform(new PVector(9500, 3500), new PVector(620, 20 ), false));

//to 2nd level
platforms.add(new Platform(new PVector(11400, 3625), new PVector(150, 300 ), false));
platforms.add(new Platform(new PVector(11775, 3550), new PVector(600, 150 ), false));

platforms.add(new Platform(new PVector(11500, 2700), new PVector(150, 400 ), false));
platforms.add(new Platform(new PVector(12150, 2850), new PVector(150, 1550 ), false));

platforms.add(new Platform(new PVector(11825, 2025), new PVector(800, 150 ), false));
//2nd level
platforms.add(new Platform(new PVector(10000, 2025), new PVector(3000, 150 ), false));
platforms.add(new Platform(new PVector(9700, 2650), new PVector(3500, 150 ), false));

//3rd level
platforms.add(new Platform(new PVector(9925, 1550), new PVector(3200, 100 ), false));
platforms.add(new Platform(new PVector(12135, 1470), new PVector(700, 400 ), false));
platforms.add(new Platform(new PVector(12135, 1850), new PVector(700, 250 ), false));
//hall way to secret 
platforms.add(new Platform(new PVector(12635, 1470), new PVector(700, 400 ), false));
platforms.add(new Platform(new PVector(12635, 1850), new PVector(700, 250 ), false));

//secret room

platforms.add(new Platform(new PVector(13475, 1470), new PVector(1000, 30 ), false));
platforms.add(new Platform(new PVector(13985, 1660), new PVector(30, 410 ), false));
platforms.add(new Platform(new PVector(13475, 1850), new PVector(1000, 30 ), false));

//forth level
platforms.add(new Platform(new PVector(11000, 1260), new PVector(2500, 30 ), false));
platforms.add(new Platform(new PVector(9600, 1260), new PVector(30, 500 ), false));
//fifth level
platforms.add(new Platform(new PVector(10335, 1000), new PVector(1500, 30 ), false));
platforms.add(new Platform(new PVector(11300, 1010), new PVector(30, 500 ), false));
//sixth level
platforms.add(new Platform(new PVector(10715, 760), new PVector(1200, 30 ), false));
platforms.add(new Platform(new PVector(9900, 635), new PVector(30, 750 ), false));
//seventh level
platforms.add(new Platform(new PVector(10335, 495), new PVector(900, 30 ), false));
platforms.add(new Platform(new PVector(11000, 520), new PVector(30, 500 ), false));
//eighth level & final level

platforms.add(new Platform(new PVector(9900, 760), new PVector(30, 500 ), false));

platforms.add(new Platform(new PVector(10085, 250), new PVector(400, 30 ), false));
platforms.add(new Platform(new PVector(10815, 255), new PVector(400, 30 ), false));

platforms.add(new Platform(new PVector(10270, 25), new PVector(30, 460 ), false));
platforms.add(new Platform(new PVector(10630, 25), new PVector(30, 460 ), false));




}

void createPlatforms3(){
platforms.add(new Platform(new PVector(10500, -1100), new PVector(2000, 30 ), false));
platforms.add(new Platform(new PVector(9500, -1300), new PVector(300, 500 ), false));
platforms.add(new Platform(new PVector(11500, -1300), new PVector(300, 500 ), false));

}

void createMovPlatforms1(){
  //first lift upwards
  platforms.add(new Platform(new PVector(4450, 2150), new PVector(150, 20), false, new PVector(0, -3.5), 440 ));
  
  //(2,4) 1st obstacle course
  platforms.add(new Platform(new PVector(4850, 2200), new PVector(200, 20), false, new PVector(0, 3.5), 300 ));
  platforms.add(new Platform(new PVector(5350, 3400), new PVector(200, 20), false, new PVector(0, -3.5), 360 ));
  
  //(3,4) entrance to obstacle course
  
  platforms.add(new Platform(new PVector(4750, 660), new PVector(170, 20), false, new PVector(3, 0), 200 ));
  
  platforms.add(new Platform(new PVector(4750, 860), new PVector(170, 20), false, new PVector(2, 0), 260 ));
  
  platforms.add(new Platform(new PVector(5300, 1060), new PVector(170, 20), false, new PVector(-2, 0), 260 ));
  
  platforms.add(new Platform(new PVector(5300, 1260), new PVector(170, 20), false, new PVector(-2, 0), 130 ));
  
  platforms.add(new Platform(new PVector(4750, 1260), new PVector(170, 20), false, new PVector(2, 0), 130 ));
  
  platforms.add(new Platform(new PVector(4750, 1460), new PVector(170, 20), false, new PVector(2, 2), 260 ));
  
  platforms.add(new Platform(new PVector(5300, 1460), new PVector(170, 20), false, new PVector(-2, 2), 260 ));
  
}

void createMovPlatforms2(){
  //bottom floor
  platforms.add(new Platform(new PVector(8100, 3530), new PVector(170, 20), false, new PVector(3.7, 0 ), 1060 ));

//second floor
  platforms.add(new Platform(new PVector(11050, 2550), new PVector(20, 150), false, new PVector(0, -2 ), 180 ));
  
  platforms.add(new Platform(new PVector(10750, 2200), new PVector(20, 150), false, new PVector(0, 2 ), 140 ));
  
  platforms.add(new Platform(new PVector(10450, 2550), new PVector(20, 150), false, new PVector(0, -2 ), 180 ));
  
  platforms.add(new Platform(new PVector(10150, 2200), new PVector(20, 150), false, new PVector(0, 1.5 ), 180 ));
  
  platforms.add(new Platform(new PVector(9850, 2550), new PVector(20, 150), false, new PVector(0, -2 ), 180 ));
  
  platforms.add(new Platform(new PVector(9550, 2550), new PVector(20, 165), false, new PVector(0, -2.2 ), 140 ));
  platforms.add(new Platform(new PVector(9400, 2200), new PVector(20, 175), false, new PVector(0, 2.0 ), 150 ));
  platforms.add(new Platform(new PVector(9250, 2550), new PVector(20, 185), false, new PVector(0, -1.6 ), 190 ));
  platforms.add(new Platform(new PVector(9100, 2550), new PVector(20, 195), false, new PVector(0, -1.5 ), 195 ));
  platforms.add(new Platform(new PVector(8950, 2550), new PVector(20, 205), false, new PVector(0, -1.4 ), 195 ));
  platforms.add(new Platform(new PVector(8800, 2550), new PVector(20, 215), false, new PVector(0, -1.3 ), 195 ));
  platforms.add(new Platform(new PVector(8650, 2550), new PVector(20, 225), false, new PVector(0, -1.2 ), 200 ));
  platforms.add(new Platform(new PVector(8500, 2550), new PVector(20, 235), false, new PVector(0, -1.0 ), 205 ));
  platforms.add(new Platform(new PVector(8350, 2450), new PVector(20, 235), false, new PVector(0, -1.0 ), 205 ));
  platforms.add(new Platform(new PVector(8200, 2350), new PVector(20, 235), false, new PVector(0, -1.0 ), 205 ));
  
  
  //secret Hider
  
  platforms.add(new Platform(new PVector(12135, 1800), new PVector(700, 150), false, new PVector(0, -1.5 ), 120 ));
 
  //to level 3
  platforms.add(new Platform(new PVector(10450, 455), new PVector(150, 20), false, new PVector(0, -1.5 ), 540 ));
}
  



void draw(){
switch(state) {
  case SHOW_MAIN_MENU:
    showMainMenu();
    break;
  case PLAY_GAME1:
    Stage1();
    break;
  case PLAY_GAME2:
    Stage2();
    break;
  case PLAY_GAME3:
    Stage3();
    break;
    
  case SHOW_WIN_SCREEN:
    showWinScreen();
    break;
  case SHOW_LOSE_SCREEN:
    showLoseScreen();
    break;
 
  }

}

void showMainMenu(){
  pushMatrix();
  background(0);
  textAlign(CENTER);
  translate(width/2, height/2);
  fill(255);
  textSize(64);
  text("MegaKid", 0, -100);

  textSize(24);
  text("Start", 0, 50);
  text("Exit", 0, 150);
  textSize(18);
  text("Press 'z' to confirm and UP or DOWN to select", 0, 350);
  
  fill(selectButton);
  if(menuSelect==0)
    triangle(-100 , 45, -125 , 70, -125, 20);
  if(menuSelect==1)
    triangle(-100 , 145, -125 , 170, -125, 120);
    
  popMatrix();
}

void camera(){
  camX = player.pos.x - width/ 2; 
  camY = player.pos.y - height / 2;
  if(currentStage==1){
   offsetMaxX = 6800 - 1200;
   offsetMaxY = 4600 - 600;
   offsetMinX = 0;
   offsetMinY = 0;
  }
  
  else if(currentStage==2){
    offsetMaxX = 13800 - 1200;
   offsetMaxY = 4600 - 600;
   offsetMinX = 6600;
   offsetMinY = -200;
  
  }
  
  else{
   offsetMaxX = 14000 - 1200;
   offsetMaxY = -1800;
   offsetMinX = 9000;
   offsetMinY = -2000;
  
  }
  
  if (camX > offsetMaxX)
  
    camX = offsetMaxX;
else if (camX < offsetMinX)
    camX = offsetMinX;
    
    if (camY > offsetMaxY){
    
    camY = offsetMaxY;}
else if (camY < offsetMinY)
    camY = offsetMinY;
    translate(-camX, -camY);
}
void Stage1(){
  currentStage=1;
  lastCheckpoint= new PVector(100, 4600);
  camera();
  println("player pos: " + player.pos.x + ", " + player.pos.y);
  
  background(51, 204, 204);
  pushStyle();
  fill(255);
  ellipse(0, 0, 150, 150);
  
  popStyle();
  updateEverything();
  if (player.pos.x > 6700 && player.pos.y< 400){
  state=PLAY_GAME2;
  player.pos=new PVector(7000, 360);
  }
  
}

void Stage2(){
currentStage=2;
lastCheckpoint= new PVector(7000, 360);
println("player pos: " + player.pos.x + ", " + player.pos.y);
camera();
 background(51, 204, 204);
  pushStyle();
  fill(255);
  ellipse(0, 0, 150, 150);
  popStyle();
updateEverything();
if (player.pos.y <-100){
  player.pos=new PVector(10000, -1800);
  state=PLAY_GAME3;
  
}
}

void Stage3(){
currentStage=3;
lastCheckpoint= new PVector(10000, -1460);
println("player pos: " + player.pos.x + ", " + player.pos.y);
camera();

background(51, 204, 204);
  pushStyle();
  fill(255);
  ellipse(0, 0, 150, 150);
  updateEverything();
  popStyle();

}

void updateEverything(){
 for(int i=0; i<traps.size();i++){
  addDelShockTrap t= traps.get(i);
  t.update();
  
  }
  
  for (int i=0; i < deaths.size();i++){
  DeathExplosion d = deaths.get(i);
  d.update();
  
  }
  
  for (int i=0; i < hazards.size();i++){
  Hazard h = hazards.get(i);
  h.update();
  
  }
   for (int i=0; i < platforms.size();i++){
  Platform p = platforms.get(i);
  p.update();
  
  }
  
  for (int i=0; i < monsters.size();i++){
  Monster m = monsters.get(i);
  m.update();
  
  }
  
  for (int i=0; i<pAttacks.size(); i++){
  Attacks pA= pAttacks.get(i);
  pA.update();
  }
  
  
  for (int i=0; i<mAttacks.size(); i++){
  Attacks mA= mAttacks.get(i);
  mA.update();
  }
  for (int i=0; i<items.size(); i++){
  Items it= items.get(i);
  it.draw();
  }
  for (int i=0; i<boss.size(); i++){
  Boss b= boss.get(i);
  b.update();
  }
  
  if (blasterDelayTimer>0) {
    blasterDelayTimer--;
  }
  if (exe){
  chargeTimer++;
  }
  player.update();
  avatarActions();
}

void fireBlaster(){
  if (blasterDelayTimer==0 && !(chargeTimer>60 )) 
  {
     PVector SideofPlayer=new PVector(player.pos.x+player.dim.x*-playerDirection, player.pos.y);
      pAttacks.add(new Attacks(SideofPlayer, new PVector(-playerDirection*7, 0), new PVector(50, 50)));
    blasterDelayTimer=BLASTER_DELAY_TIME;
  }
}

void fireMegaBlast(){
       PVector SideofPlayer=new PVector(player.pos.x+player.dim.x*-playerDirection, player.pos.y);
      pAttacks.add(new MegaBlast(SideofPlayer, new PVector(-playerDirection*7, 0), new PVector(35, 35)));

}

void fireGigaBlast(){
       PVector SideofPlayer=new PVector(player.pos.x+player.dim.x*-playerDirection, player.pos.y);
      pAttacks.add(new GigaBlast(SideofPlayer, new PVector(-playerDirection*7, 0), new PVector(35, 35)));

}

void fireTinyBlast(){
 
      PVector SideofPlayer=new PVector(player.pos.x+player.dim.x*-playerDirection, player.pos.y);
      pAttacks.add(new TinyBlast(SideofPlayer, new PVector(-playerDirection*7, 0), new PVector(40, 40)));
    
}
void createSpikesAndPlatform(PVector pos, PVector dim, int spikes){
  for (int i=0; i <spikes; i++){
    Spikes s = new Spikes(new PVector(pos.x+dim.x*i, pos.y), new PVector(dim.x , dim.y ));
    hazards.add(s);
  }
  Platform p = new Platform(new PVector(pos.x+dim.x*spikes/2-dim.x/2, pos.y), new PVector(dim.x*spikes-1, dim.y-1), true);
  platforms.add(p);


}

void createCeilingSpikes(PVector pos, PVector dim, int spikes){

 for (int i=0; i <spikes; i++){
    ceilingSpikes s = new ceilingSpikes(new PVector(pos.x+dim.x*i, pos.y), new PVector(dim.x , dim.y ));
    hazards.add(s);
  }


}

void createShockTrap(PVector pos, PVector dim){
  ShockTrap t= new ShockTrap(pos, dim);
  hazards.add(t);
  traps.add(new addDelShockTrap(t, random(120, 240), random(120, 240)));
  

}

void spawnHazards1(){

  
//createCeilingSpikes(new PVector(620, 550), new PVector(20, 50), 5 );
createShockTrap(new PVector(3125, 4655), new PVector(120, 20));
createShockTrap(new PVector(3350, 4655), new PVector(250, 20));
createShockTrap(new PVector(3950, 4655), new PVector(850, 20));
createSpikesAndPlatform(new PVector(4630, 3425), new PVector(20, 50), 43 );
}

void spawnHazards2(){
  createSpikesAndPlatform(new PVector(8150, 3600), new PVector(20, 50), 160 );

//createCeilingSpikes(new PVector(620, 550), new PVector(20, 50), 5 );
//createShockTrap(new PVector(350, 2840), new PVector(20, 50));
}

void spawnItems1(){
  items.add(new LifeItem(new PVector(215, 1275), new PVector(20, 20)));
  items.add(new HealthItem(new PVector(250, 1275), new PVector(20, 20), 50));
  items.add(new HealthItem(new PVector(1350, 4650), new PVector(20, 20), 20));
  items.add(new HealthUpgrade(new PVector(3523, 3680), new PVector(20, 40)));
items.add(new WeaponUpgrade(new PVector(6164, 4625), new PVector(20, 40)));
items.add(new LifeItem(new PVector(6200, 3875), new PVector(20, 20)));
items.add(new HealthItem(new PVector(4314, 3425), new PVector(20, 20), 50));
items.add(new HealthUpgrade(new PVector(5454, 265), new PVector(20, 40)));
}

void spawnItems2(){
  items.add(new HealthItem(new PVector(8080, 1775), new PVector(20, 20), 50));
  items.add(new WeaponUpgrade(new PVector(13390, 1810), new PVector(20, 40)));
}

void spawnItems3(){
items.add(new HealthItem(new PVector(9485, -1575), new PVector(20, 20), 150));
items.add(new HealthItem(new PVector(11500, -1575), new PVector(20, 20), 150));

}


void spawnMonsters1(){
createSpitter(30,  new PVector(800, 3300), new PVector(0,0), new PVector(50, 50));
createCharger(50,  new PVector(1300, 3680), new PVector(0,0), new PVector(50, 50));
createCharger(50,  new PVector(830, 2960), new PVector(0,0), new PVector(50, 50));
createSpitter(30,  new PVector(1300, 2600), new PVector(0,0), new PVector(50, 50));
createCharger(80,  new PVector(1265, 2360), new PVector(0,0), new PVector(50, 50));
createSpitter(50,  new PVector(830, 2200), new PVector(0,0), new PVector(50, 50));
createSpitter(50,  new PVector(830, 2000), new PVector(0,0), new PVector(50, 50));
createSpitter(50,  new PVector(2710, 3870), new PVector(0,0), new PVector(50, 50));
createSpitter(50,  new PVector(3500, 4355), new PVector(0,0), new PVector(50, 50));
createHunter(80, new PVector(4400, 4355), new PVector(0,0), new PVector(70, 30));
createHunter(80, new PVector(5850, 4645), new PVector(0,0), new PVector(70, 30));
createCharger(80,  new PVector(5850, 4645), new PVector(0,0), new PVector(50, 50));
createHunter(50, new PVector(4335, 3265), new PVector(0,0), new PVector(70, 30));
createHunter(50, new PVector(3980, 2960), new PVector(0,0), new PVector(70, 30));
createHunter(50, new PVector(4323, 2665), new PVector(0,0), new PVector(70, 30));
createHunter(50, new PVector(3980, 2960), new PVector(0,0), new PVector(70, 30));
createSpitter(50,  new PVector(5100, 1200), new PVector(0,0), new PVector(50, 50));
createSpitter(50,  new PVector(5100, 1400), new PVector(0,0), new PVector(50, 50));


}

void spawnMonsters2(){
  createCharger(80,  new PVector(10900, 2550), new PVector(0,0), new PVector(50, 50));
  createCharger(80,  new PVector(9700, 2550), new PVector(0,0), new PVector(50, 50));
//createSpitter(10,  new PVector(5100, 3300), new PVector(0,0), new PVector(50, 50));
createMage(100, new PVector(9000, 1900), new PVector(0,0), new PVector(70, 70));
createMage(100, new PVector(10900, 1900), new PVector(0,0), new PVector(70, 70));

createCharger(80,  new PVector(10500, 1475), new PVector(0,0), new PVector(50, 50));

createCharger(80,  new PVector(9900, 1475), new PVector(0,0), new PVector(50, 50));
createMage(120, new PVector(10400, 1200), new PVector(0,0), new PVector(70, 70));
createMage(120, new PVector(10500, 950), new PVector(0,0), new PVector(70, 70));

}

void spawnMonsters3(){
createBoss(2000, new PVector(11000, -1150), new PVector(0, 0), new PVector(40, 95)); 

}

void createSpitter(int health, PVector pos, PVector vel, PVector dim){
  Spitter s = new Spitter(health, pos, vel, dim );
  s.inAir=true;
  monsters.add(s);
}
void createCharger(int health, PVector pos, PVector vel, PVector dim){
  Charger c = new Charger(health, pos, vel, dim );
  c.inAir=true;
  monsters.add(c);
}
void createHunter(int health, PVector pos, PVector vel, PVector dim){
  Hunter h = new Hunter(health, pos, vel, dim);
  h.inAir=true;
  monsters.add(h);

}

void createMage(int health, PVector pos, PVector vel, PVector dim){
  Mage m = new Mage(health, pos, vel, dim);
  
  monsters.add(m);

}
void createBoss(int health, PVector pos, PVector vel, PVector dim){
  Boss b = new Boss(health, pos, vel, dim);
  b.inAir=true;
  monsters.add(b);

}


  void showWinScreen(){
    pushMatrix();
    translate(width/2, height/2);  
    background(0);
    fill(255);
    text("Thank you for playing!", 0 , 0 );
    popMatrix();
  }

void continueOrRestart(){
  if(player.lives==0){
     wipeAllArrayList();
    state=SHOW_MAIN_MENU;
   
  }
  else
  respawn();
 
}

void initializeStages(){
  spawnMonsters1();
  createPlatforms1();
  createMovPlatforms1();
  spawnHazards1();
  spawnItems1();
  spawnItems2();
  spawnItems3();
  spawnMonsters2();
  createPlatforms2();
  createMovPlatforms2();
  spawnHazards2();
  
  createPlatforms3();
  spawnMonsters3();
  
  menuSelect=0;
  player= new Avatar(200, new PVector(100, 4600 ), new PVector(0,0), new PVector(50, 50));  
  avatarList.add(player);
  player.inAir = true;
  
}

void respawn(){
  if(currentStage==1){
  lastCheckpoint=new PVector(100, 4600);
  state=PLAY_GAME1;
  }
  else if(currentStage==2){
  lastCheckpoint=new PVector(7200, 370);
  state=PLAY_GAME2;
  }
  else{
  lastCheckpoint=new PVector(9900 ,-1200 );
  state=PLAY_GAME3;
  }
  player.pos=(lastCheckpoint);
  player.currentHealth=player.maxHealth;
  
  for (int i=0; i < monsters.size();i++){
   monsters.remove(i);
  
  }
  if(currentStage==1){
  spawnMonsters1();
  }
  else if(currentStage==2){
  spawnMonsters2();
  }
  else if(currentStage==3){
  spawnMonsters3();
  
  }
}

void wipeAllArrayList(){
  for(int i=0; i<traps.size();i++){
   traps.remove(i);
  }
  for (int i=0; i < deaths.size();i++){
    deaths.remove(i);  
  }
  for (int i=0; i < hazards.size();i++){
    hazards.remove(i);
  }
   for (int i=0; i < platforms.size();i++){
    platforms.remove(i);
  }
  for (int i=0; i < monsters.size();i++){
   monsters.remove(i);  
  }
  for (int i=0; i<pAttacks.size(); i++){
    pAttacks.remove(i);
  } 
  for (int i=0; i<mAttacks.size(); i++){
   mAttacks.remove(i);
  }
  for (int i=0; i<items.size(); i++){
    items.remove(i);
  }
  for (int i=0; i<boss.size(); i++){
    boss.remove(i);
  }
  for (int i=0; i<avatarList.size(); i++){
  avatarList.remove(i);
  }
  
  initializeStages();

}


  void showLoseScreen(){
      pushMatrix();
      textAlign(CENTER);
      translate(width/2, height/2);  
      background(0);
      fill(255);
      text("Stage1", 0 , 0 );
      text("Lives: " + player.lives, 0 , 20 );
      
      popMatrix();

  }