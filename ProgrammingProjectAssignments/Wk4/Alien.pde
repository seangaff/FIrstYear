final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;

class Alien {
  float x; float y;
  int dir = 1;
  PImage alienImage = loadImage("spacer.gif");
  PImage explode = loadImage("exploding.gif");
  PImage alienAlt =loadImage("space-invaders-2png.png");
  int count;
  int heightDiff = alienImage.height;
  int exploded;
  boolean special;
  float dy; float dx;
  float angle;
  int canBomb;
  
  Alien(int xpos, int ypos, boolean isSpecial){
    x = xpos; y = ypos;
    exploded = 0;
    canBomb = 0;
    count = 0;
    special = isSpecial;
    if(isSpecial){
      dy = 1;
      dx = 1;
    }
  }
void move(){
    if(exploded<1){
      if(special){
        if(x<0 || (x+alienImage.width >= width)){
          dx*=-1;
          //dy*=-1;
          x+=dx;
          y+=dy+sin(angle);
          println(dx, ", ", dy);
          
        } else if(y<0 || (y+alienImage.height>=height)){
          //dx*=-1;
          dy*=-1;
          x+=dx;
          //y+=dy;
          y+=dy+sin(angle);
          //println(dx, ", ", dy);
        } else {
          x += dx;
          y += dy+sin(angle);
          
        }
        //dx += 0.1;
        angle += TWO_PI/90;
        if(angle>=TWO_PI) angle=0;
      } else {
        // Normal
        if(x<0 || (x+alienImage.width >= width)){
          if(count<heightDiff){
            y++;
            count++;
          } else {
            dir*=-1;
            x+=dir;
            count = 0;
          };
        } else {
          x += dir;
        }
      }
        
    }
  }
  void draw(){
    if(exploded>=1 && exploded<25){
      image(explode, x, y);
      exploded++;
    } else if(exploded==0){  
      if(special) {
        image(alienAlt, x, y);
      }
      else {
      image(alienImage, x, y);
      }
    }
    if(canBomb >= 1 && canBomb <= 2000) {
      canBomb++;
    }
    else if(canBomb > 2000) {
      canBomb = 0;
    }
  }
  
  void explode(){
    if(exploded==0){
      int toExplode = int(random(0,2));
      if(toExplode<1){
        exploded = 1;
      } else {
        exploded = 0;
      }
    }
  }
  void dontBomb(){
    canBomb++;
  } 
}
