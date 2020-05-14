int i;
float j;
int red;
int increment;
void setup() {
   frameRate(60);
   size(480, 480);
   i = 0;
   j = 0;
   red = 0;
   increment = 7;
}

void draw() {
  background(255);
  rect(i, 100 * sin(0.1 * j) + 240, 100, 100);
  rect(i - 480, 100 * sin(0.1 * j) + 240, 100, 100);
  fill(red, 77, 204);
  if(red > 255) {
     increment = -7;
  } else if (red < 0) {
     increment = 7;
  }
  red += increment;
  stroke(0);
  if(i >= 480) {
     i = 0; 
  }
  // Period = 2pi / 0.1
  if(j >= (2*PI / 0.1)) {
      j = 0;
  }
  i++;
  j++;
}
