/* Declare an Alien */
Alien[] aliens;
PImage alienImage;
PImage explodeImage;
PImage alienImage2;
PImage explodeImage2;
int lastExplosion = 0;

void settings() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup(){
 /* create a new alien object */ 
 frameRate(60);
 alienImage = loadImage("spacer.gif");
 explodeImage = loadImage("exploding.gif");
 alienImage2 = loadImage("spacer2.gif");
 explodeImage2 = loadImage("exploding2.gif");
 aliens = new Alien[ALIEN_COUNT];
 for(int index = 0; index < aliens.length; index++) {
   if(index <= 4) {
     aliens[index] = new Alien(ALIEN_WIDTH*index + 25*index, 48, alienImage, alienImage2);
   }
   else {
     aliens[index] = new Alien(ALIEN_WIDTH*(index-5) + 25*(index-5), 48*2 + 10, alienImage, alienImage2);
   }
 }
}

void draw(){
  /* clear the screen */
  /* move the alien */
  /* draw the alien */
 background(255);
 noStroke();
 for(int index = 0; index < aliens.length; index++) {
   aliens[index].explode(explodeImage, explodeImage2);
   aliens[index].move();
   aliens[index].draw();
 }
}
