int i;
int x;
int y;
void setup() {
   frameRate(60);
   size(480, 480);
   i = 0;
   x = 250;
   y = 120;
}

void draw() {
  background(255);
  rect(x + i, y, 100, 100);
  fill(255, 255, 0);
  noStroke();
  i++;
  if((x+i) > 480) {
     x = 0;
     i = 0;
  }
}
