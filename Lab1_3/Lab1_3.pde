int i;
void setup() {
   frameRate(60);
   size(480, 480);
   i = 0;
}

void draw() {
  background(255);
  rect(i, 100, 100, 100);
  fill(255, 255, 0);
  rect(i - 480, 100, 100, 100);
  fill(255, 255, 0);
  stroke(0);
  if(i >= 480) {
     i = 0; 
  }
  i++;
}
