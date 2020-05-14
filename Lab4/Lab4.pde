/* Declare an Alien */
Alien[] aliens;
ArrayList<Bullet> bullets;
ArrayList<Bullet> doubleBullets;
ArrayList<PowerUp> powerups;
Player player;
PImage alienImage;
PImage explodeImage;
PImage alienImage2;
PImage explodeImage2;
PImage playerImage;
int lastExplosion = 0;

void settings() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

void setup(){
 /* create a new alien object */ 
 frameRate(60);
 bullets = new ArrayList<Bullet>();
 doubleBullets = new ArrayList<Bullet>();
 powerups = new ArrayList<PowerUp>();
 alienImage = loadImage("spacer.gif");
 explodeImage = loadImage("exploding.gif");
 alienImage2 = loadImage("spacer2.gif");
 explodeImage2 = loadImage("exploding2.gif");
 playerImage = loadImage("ship.gif");
 aliens = new Alien[ALIEN_COUNT];
 for(int index = 0; index < aliens.length; index++) {
   if(index <= 4) {
     aliens[index] = new Alien(ALIEN_WIDTH*index + 25*index, 48, alienImage, alienImage2);
   }
   else {
     aliens[index] = new Alien(ALIEN_WIDTH*(index-5) + 25*(index-5), 48*2 + 10, alienImage, alienImage2);
   }
 }
 
 player = new Player(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 50, playerImage);
}

void draw(){
  /* clear the screen */
  /* move the alien */
  /* draw the alien */
 background(255);
 noStroke();
 for(int index = 0; index < aliens.length; index++) {
   if(aliens[index] != null) {
     aliens[index].move();
     aliens[index].draw();
   }
 }
 for(int index = 0; index < bullets.size(); index++) {
   PowerUp powerup = bullets.get(index).collide(aliens, explodeImage, explodeImage2);
   if(powerup != null) {
     powerups.add(powerup); 
   }
   
   bullets.get(index).collide(powerups, player);
   
   bullets.get(index).move(player);
   bullets.get(index).draw();
   if(bullets.get(index).y < 0) {
     bullets.remove(index);
   }
 }
 for(int index = 0; index < doubleBullets.size(); index++) {
    doubleBullets.get(index).collide(powerups, player);
   
    doubleBullets.get(index).move(player);
    doubleBullets.get(index).draw();
    if(doubleBullets.get(index).y < 0) {
      doubleBullets.remove(index);
    } 
  }
   
 for(int index = 0; index < powerups.size(); index++) {
   powerups.get(index).draw(); 
 }
 player.move(mouseX);
 player.draw();
}

void mouseClicked() {
  Bullet bullet;
  if(player.currentPowerUp != 0) {
    bullet = player.shoot(player.x + PLAYER_WIDTH / 2 - 2, player.y - PLAYER_HEIGHT / 2 + 10, BULLET_BASE_SPEED);
  }
  else {
    bullet = player.shoot(player.x + PLAYER_WIDTH / 2 - 7, player.y - PLAYER_HEIGHT / 2 + 10, BULLET_BASE_SPEED);
  }
  bullets.add(bullet);
  if(player.currentPowerUp == 0) {
    Bullet doubleBullet = player.shoot(player.x + PLAYER_WIDTH / 2 + 7, player.y - PLAYER_HEIGHT / 2 + 10, BULLET_BASE_SPEED);
    doubleBullets.add(doubleBullet);
  }
}
