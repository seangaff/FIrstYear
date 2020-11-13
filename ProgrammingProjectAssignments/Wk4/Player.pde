class Player {
  float x;
  float y;
  PImage playerImage = loadImage("1592.gif");
  int exploded;

  Player(int playerY) {
    y = playerY;
    x = SCREENX/2 - playerImage.width/2;
    exploded = 0;
  }
  void move(float playerX) {
    x = playerX - playerImage.width/2;
  }
  
  void draw () {
    if(exploded == 0) {
        image(playerImage,x,y);
      }
      else if(exploded > 0 && exploded < 25) {
        image(explosionImage,x,y);
        exploded++;
      }
  }
  void explode(){
    exploded++;
    
    text("Game Over",SCREENX/2-30,SCREENY/2-30);
    println("GAME OVER");
    frameRate(0);
  }
}
