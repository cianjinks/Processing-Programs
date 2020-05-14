class Shield {
 float x, y;
 int health, shieldWidth, shieldHeight;
 Shield(float x, float y, int shieldWidth, int shieldHeight, int health) {
   this.x = x;
   this.y = y;
   this.health = health;
   this.shieldWidth = shieldWidth;
   this.shieldHeight = shieldHeight;
 }
 
 void draw() {
   if(health > 0) {
     rect(x, y, shieldWidth, shieldHeight);
     fill(0, 0, 0);
   }
 }
}
