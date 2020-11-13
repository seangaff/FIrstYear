int i;
void setup() {
  size(200, 200);
  noStroke(); fill(255, 0, 53);
  i = 0;
}
void draw() {
  background(255);
  rect(i, 20, 50, 50);
  if(2*(i++) >= 199) i = 0;
  
}
