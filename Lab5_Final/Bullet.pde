class Bullet {
  float x, y, speed;
  int bulletWidth = 4;
  int bulletHeight = 4;
  
  Bullet(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }
  
  void move(Player player) {
    // Default
    if(player.currentPowerUp == -1) {
      y = y - speed;  
    }
    // Double shot
    else if (player.currentPowerUp == 0) {
      y = y - speed;
    } 
    // Sin shot
    else if(player.currentPowerUp == 1) {
      y = y - speed;
      x = x + 5*sin(0.1*y);
    }
    // Fire rate increase
    else if(player.currentPowerUp == 2) {
      y = y - speed*2; 
    }
  }
  
  PowerUp collide(Alien[] aliens, PImage explodeImage, PImage explodeImage2) {
    for(int index = 0; index < aliens.length; index++) {
      if(aliens[index] != null ) {
        if(x > aliens[index].x && x < aliens[index].x + ALIEN_WIDTH) {
          if(y > aliens[index].y && y < aliens[index].y + ALIEN_HEIGHT) {
            aliens[index].explode(explodeImage, explodeImage2); 
            float alienx = aliens[index].x;
            float alieny = aliens[index].y;
            aliens[index] = null;
            aliensDead++;
            float chance = random(0, 5);
            if(chance < 2) {
              float type = random(0, 3);
              return new PowerUp((int)type, alienx, alieny);   
            } else {
              return null; 
            }
          }
        }
      }
    }
    return null;
  }
  
  void collide(ArrayList<PowerUp> powerups, Player player) {
    for(int index = 0; index < powerups.size(); index++) {
      if(powerups.get(index).lifeTime == POWER_UP_COOLDOWN) {
        if(x > powerups.get(index).x && x < powerups.get(index).x + ALIEN_WIDTH) {
           if(y > powerups.get(index).y && y < powerups.get(index).y + ALIEN_HEIGHT) {
              player.setCurrentPowerUp(powerups.get(index).type);
              System.out.println("[Power Up]: " + powerups.get(index).type);
              powerups.remove(index);
           }
        }
      }
    }
  }
  
  boolean collide(Shield shield) {
    if(x > shield.x && x < shield.x + SHIELD_WIDTH) {
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
  
  void draw() {
     rect(x, y, bulletWidth, bulletHeight);
     fill(0, 0, 0);
  }
}
