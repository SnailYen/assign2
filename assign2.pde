
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
 
    
  case GAME_RUN:
  
    //***background***
    image(bg1,bg1x,0); 
    bg1x+=2;
    bg1x%=1280;
    image(bg2,bg2x-640,0);
    bg2x+=2;
    bg2x%=1280;
    image(bg1,bg3x-1280,0);
    bg3x+=2;
    bg3x%=1280;
    
    //fighter
    

    image(fighter,fighterX,fighterY);
    

    if (upPressed) {
      fighterY -= fighterSpeed;
    }
    if (downPressed) {
      fighterY += fighterSpeed;
    }
    if (leftPressed) {
      fighterX -= fighterSpeed;
    }
    if (rightPressed) {
      fighterX += fighterSpeed;
    }
    //fighter boundary
    if (fighterX > width -50){
      fighterX = width -50;
    }
    if (fighterX < 0){
      fighterX = 0;
    }
    if (fighterY > height -50){
      fighterY = height -50;
    }
    if (fighterY < 0){
      fighterY = 0;
    }
    
        
    //hp
    rectMode(CORNERS); 
    rect(5,5,hpx,27);
    fill(255,0,0);
    image(hp,0,0);
    
    //treasure
    image(treasure,tx,ty);
    
    //enemy
    image(enemy,ex,ey);
    ex +=3;
    ex %= 640;
    
    if (fighterX <= ex +30 && fighterX >= ex -30
    && fighterY <= ey +30 && fighterY >= ey -30){
    GAME_STATE = GAME_OVER;
    }
    break;
    
  case GAME_OVER:
    
    image(end2,0,0);
    if(mouseX>208 && mouseX<434 && mouseY>310 && mouseY<346){
    image(end1,0,0);
    if(mousePressed){
    GAME_STATE = GAME_RUN;
    fighterX = width -50;
    fighterY = height/2;
    ex = 0;
    ey = floor(random(0,470));
    }
    break;

    }
  }

}
void keyPressed(){
  if (key == CODED) { // detect special keys 
      switch (keyCode) {
        case UP:
          upPressed = true;
          break;
        case DOWN:
          downPressed = true;
          break;
        case LEFT:
          leftPressed = true;
          break;
        case RIGHT:
          rightPressed = true;
          break;}
  }
}
void keyReleased(){
  if (key == CODED) {
      switch (keyCode) {
        case UP:
          upPressed = false;
          break;
        case DOWN:
          downPressed = false;
          break;
        case LEFT:
          leftPressed = false;
          break;
        case RIGHT:
          rightPressed = false;
          break;
      }
    }
}
