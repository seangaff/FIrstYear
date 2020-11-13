int x1;
int x2;
int y1;
int y2;
int dirY1;
int dirY2;
float clr;
float clr1;

void setup() {
  size(200, 200);
  x2 = 75;
  x1 = 75;
  y1 = 75;
  y2 = 75;
  dirY1 = 1;
  dirY2 = -1;
  clr1 = -1;
  clr = random(0, 255);
  
}
void draw() {
  clr = random(0, 255);
  background(0);
  noStroke(); fill(y1, y2, clr);
  rect(x1++, y1, 50, 50);
  if(x1>=150 && x1<=200){
    rect(0,y1,x1%50,50);
  } else if(x1 >= 200) x1 = 0;
  
  noStroke(); fill(y2, y1, clr);
  rect(x2--, y2, 50, 50);
  if(x2<=0 && x2>=-50){
    rect(200+x2,y2, 50,50);
  } else if(x2 <= -50) x2 = 150;
  
  if(y1 >= 200-50 || y1 <= 0) dirY1 = dirY1 * -1;
  if(y2 >= 200-50 || y2 <= 0) dirY2 = dirY2 * -1;
  //if(clr >= 255 || clr <= 0) clr1 = clr1 * -1;
  //clr += clr1;
  y1 += dirY1;
  y2 += dirY2;
}
