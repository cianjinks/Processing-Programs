class Player {
  float x,y;
  PImage playerImage;
  int currentPowerUp = -1;
  Player(float x, float y, PImage playerImage) {
    this.x = x;
    this.y = y;
    this.playerImage = playerImage;
  }
  
  void move(int x) {
     this.x = x;
  }
  
  Bullet shoot(float x, float y, int speed) {
    Bullet bullet = new Bullet(x, y, speed);
    return bullet;
  }
  
  void setCurrentPowerUp(int currentPowerUp) {
    if(currentPowerUp >= -1 && currentPowerUp <= 2) {
      this.currentPowerUp = currentPowerUp;
    }
  }
  
  void draw() {
     image(playerImage, x, y); 
  }
}
