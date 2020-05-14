class PowerUp {
  float x, y;
  int type;
  int lifeTime = 0;
  PImage doubleShot, sinShot, fireRate;
  
  PowerUp(int type, float x, float y) {
    if(type > 2 || type < 0) {
      type = 0; 
    }
    this.type = type;
    this.x = x;
    this.y = y;
    
    doubleShot = loadImage("doubleshot.gif");
    sinShot = loadImage("sinshot.gif");
    fireRate = loadImage("firerate.gif");
  }
  
  void draw() {
    if(lifeTime < POWER_UP_COOLDOWN) {
      lifeTime++; 
    }
    // Double shot
    if(type == 0) {
      image(doubleShot, x, y);
    }
    
    // Sin shot
    else if(type == 1) {
      image(sinShot, x, y);
    }
    
    // Fire rate increase
    else if(type == 2) {
      image(fireRate, x, y);
    }
  }
  
  
}
