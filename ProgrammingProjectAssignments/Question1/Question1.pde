int i;
void setup() {
  size(200, 200);
  noStroke(); fill(255, 204, 0);
  i = 0;
}
void draw() {
  background(255);
  fill(100,0,0);
  rect(i, 20, 50, 50);
  fill(0,100,0);
  rect(20, i, 50, 50);
  fill(0,0,100);
  rect(50-i, 40, 50, 50);
  i++;
}
