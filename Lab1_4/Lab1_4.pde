int i;
int j;
void setup() {
   frameRate(60);
   size(480, 480);
   i = 0;
   j = 0;
}

void draw() {
  background(255);
  rect(i, 100, 100, 100);
  rect(i - 480, 100, 100, 100);
  fill(255, 255, 0);
  stroke(0);
  if(i >= 480) {
     i = 0; 
  }
  i++;
  
  rect(j, 250, 100, 100);
  rect(j + 480, 250, 100, 100);
  fill(0, 255, 0);
  if(j <= -480) {
    j = 0;
  }
  j--;
}
