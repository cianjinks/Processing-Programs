class Bomb {
 
  float x;
  float y;
  PImage bombImage;
  float speed = 3;
  
  Bomb(float x, float y, PImage bombImage) {
    this.x = x;
    this.y = y;
    this.bombImage = bombImage;
  }
  
  void move() {
    y = y + speed;
  }
  
  void draw() {
    image(bombImage, x, y); 
  }
  
  boolean collide(Player player) {
    if(x > player.x - 10 && x < player.x + PLAYER_WIDTH) {
      if(y > player.y && y < player.y + PLAYER_HEIGHT) {
        return true; 
      }
    } else {
      return false;
    }
    return false;
  }
  
  boolean collide(Shield shield) {
    if(x > shield.x - 10 && x < shield.x + SHIELD_WIDTH) {
      if(y > shield.y && y < shield.y + SHIELD_HEIGHT) {
        if(shield.health > 0) {
          return true;
        }
        return false;
      }
    } else {
      return false;
    }
    return false;
  }
  
  boolean offScreen() {
    if(y > SCREEN_HEIGHT) {
      return true; 
    }
    return false;
  }
}
