int x1;
int x2;
void setup() {
  x2 = 100;
  size(200, 200);
  x1 = 0;
}
void draw() {
  background(255);
  noStroke(); fill(255, 204, 0);
  rect(x1++, 20, 50, 50);
  if(x1>=150 && x1<=200){
    rect(0,20,x1%50,50);
  } else if(x1 >= 200) x1 = 0;
  
  noStroke(); fill(22, 255, 0);
  rect(x2--, 100, 50, 50);
  if(x2<=0 && x2>=-50){
    rect(200+x2,100, 50,50);
  } else if(x2 <= -50) x2 = 150;
}
