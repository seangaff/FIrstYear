class Bullet {
  float x;
  float y;
  PImage bulletImage = loadImage("beams.png");
  boolean collided;
  Bullet(float playerX) {
    x = playerX-7;
    y = SCREENY-50;
    collided = false;
  }
  
  void move() {
    y -= 5;
  }
  void draw() {
      image(bulletImage,x,y);
    
  }
  void checkCollide(Alien alien){
        if(alien.exploded == ALIEN_ALIVE){
            boolean alignX = x>=alien.x && x<=alien.x+alien.alienImage.width;
            boolean alignY = y>=alien.y && y<=alien.y+alien.alienImage.height;
            if(alignX&&alignY){
                alien.explode();
                collided = true;
            }
        }
   }
  
  }
