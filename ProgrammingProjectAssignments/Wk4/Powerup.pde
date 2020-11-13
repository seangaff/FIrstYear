class Powerup {
  float x;
  float y;
  int size;
  int power;
  float angle;

  Powerup(int alienX, int alienY) {
    power = int(random(0,2));
    if(power == 0) {
      fill(0,0,255);
    }
    else if(power == 1) {
      fill(0,255,0);
    }
    else if(power == 2) {
      fill(255,0,0);
    }
    size = 20;
    x = alienX - size/2;
    y = alienY - size/2;
  }
  void move() {
    y += 3;
  }
  
  void draw () {
    rect(size, size, x, y);
    angle += 0.2;
    rotate(angle);
  }
}
