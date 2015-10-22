//You should implement your assign2 here.

final int GAME_START=1, GAME_RUN=2,GAME_OVER=3;
int GAME_STATE;
PImage bg1,bg2,enemy,fighter,hp,treasure,start1,start2,end1,end2;


int hpx,tx,ty,ex,ey,bg1x,bg2x,bg3x;
float fighterX;
float fighterY;
float fighterSpeed = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup () {
  size(640, 480) ;
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  
  GAME_STATE = GAME_START;
  
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  
    
  
  hpx = floor(random(10,205));
  tx = floor(random(600));
  ty = floor(random(0,470));
  ex = 0;
  ey = floor(random(0,470));
  bg1x = 0;
  bg2x = 0;
  bg3x = 0;
  fighterX = width -50;
  fighterY = height/2;

}

void draw() {
 
  switch(GAME_STATE){
  
  case GAME_START:
    image(start2,0,0);
    if(mouseX>208 && mouseX<458 && mouseY>374 && mouseY<416){
    image(start1,0,0);
    if(mousePressed){
    GAME_STATE = GAME_RUN;
    }
    }
    break;
