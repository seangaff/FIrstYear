final int ALIEN_ALIVE = 0;
final int ALIEN_EXPLODED = 1;
final int ALIEN_DEAD = 15;

int SCREENX = 500;
int SCREENY = 500;
Alien aliens[];
ArrayList<Bullet> bullets;
ArrayList<Powerup> powerups;
ArrayList<Bomb> bombs;
Player thePlayer;
PImage spacer;
PImage explosionImage;
boolean drawBullet;
  void settings(){
    size(SCREENX, SCREENY);
  }
  void setup(){
    aliens = new Alien[15];
    thePlayer = new Player(SCREENY-50);
    bullets = new ArrayList<Bullet>();
    powerups = new ArrayList<Powerup>();
    bombs = new ArrayList<Bomb>();
    spacer = loadImage("spacer.gif");
    explosionImage = loadImage("explosion.png");
    PFont myFont = loadFont("Serif-18.vlw");
    textFont(myFont);
    fill(50);
    initArray(aliens);
    drawBullet = false;
  }
  void draw(){
    background(255);
    moveArray(aliens);
    drawArray(aliens);
    bombSpawn(aliens);
    thePlayer.move(mouseX);
    thePlayer.draw();
    for (Bullet bullet : bullets) {
      alienCollision(bullet);
      bullet.move();
      bullet.draw();
    }
    for(Bomb bomb: bombs) {
      bomb.move();
      bomb.playerCollide(thePlayer);
      bomb.draw();
    }
    bulletCleanUp(bullets);
  }
  void initArray(Alien alienArr[]){
    int randNum = int(random(0,alienArr.length));
    for(int i=0; i<alienArr.length; i++){
      if(i==randNum){
        alienArr[i] = new Alien(int(0 +  (i  * spacer.width)), int(0), true);
        //alienArr[i] = new Alien(int(random(0,SCREENX-spacer.width)), int(random(0,SCREENY-spacer.height)), true);
      } else {
        alienArr[i] = new Alien(int(0 +  (i  * spacer.width)), int(0), false);
        //alienArr[i] = new Alien(int(random(0,SCREENX-spacer.width)), int(random(0,SCREENY-spacer.height)), false);
      }
    }
  }
  void drawArray(Alien alienArr[]){
    boolean allAlive = false;
    for (int i = 0; i < alienArr.length; ++i) {
      if(int(random(0,10000))==i){
        alienArr[i].explode();
      }
      if(alienArr[i].exploded < 25) {
        allAlive = true;
      }
      alienArr[i].draw();
    }
    if(allAlive == false) {
     println("You Win"); 
     text("You Win",SCREENX/2-30,SCREENY/2-30);
     frameRate(0);
    }
  }
  void moveArray(Alien alienArr[]){
    for (int i = 0; i < alienArr.length; ++i) {
        alienArr[i].move();
    }
  }
  void mousePressed() {
    bullets.add(new Bullet(mouseX));
    drawBullet = true;
  } 
  void bulletCleanUp(ArrayList<Bullet> bullets) {
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet bullet = bullets.get(i);
      if (bullet.y + bullet.bulletImage.height < 0) {
        bullets.remove(i);
      }
    }
  }
  void alienCollision(Bullet bullet) {
    for (int i = 0; i < aliens.length; ++i) {
        bullet.checkCollide(aliens[i]);
      }
  }
  void bombSpawn(Alien alienArr[]) {  
  for (int i = 0; i < alienArr.length; ++i) {
        if(alienArr[i].exploded < 1 && alienArr[i].canBomb == 0) {
          int randomNum = int(random(0,2500));
          if(randomNum == 0) {
            bombs.add(new Bomb(alienArr[i].x,alienArr[i].y));
            alienArr[i].dontBomb();
          }
        }
    }
  } 




 
