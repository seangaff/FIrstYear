int i;
void setup() {
  size(200, 200);
  noStroke(); fill(0, 204, 0);
  i = 0;
}
void draw() {
  background(255);
  rect(i++, 20, 50, 50);
  if(i>=150 && i<=200){
    rect(0,20,i%50,50);
  } else if(i >= 200) i = 0;
  
}
