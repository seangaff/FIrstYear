class Bomb {
 float x;
 float y;
 int exploded;
 PImage bombImage = loadImage("bomb.png");
 
  
  Bomb(float alienX, float alienY) {
    x = alienX;
    y = alienY;
    exploded = 0;
  }
  void move() {
    y += 2;
  }
  void draw() {
    offScreen();
    if(offScreen() == false) {
      if(exploded == 0) {
        image(bombImage,x,y);
      }
      else if(exploded > 0 && exploded < 25) {
        image(explosionImage,x,y);
        exploded++;
      }
    }
  }
  boolean offScreen() {
    if(y > SCREENY) {
     return true;
    }
    else {
     return false; 
    }
  }
  void playerCollide(Player player) {
    if(player.exploded == 0){
            boolean alignX = x>=player.x && x<=player.x+player.playerImage.width;
            boolean alignY = y>=player.y && y<=player.y+player.playerImage.height;
            if(alignX&&alignY){
                exploded++;
                player.explode();
            }
        }
  }
  
}
