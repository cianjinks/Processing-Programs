class Ball {
  float x; float y;
  float dx; float dy;
  int radius;
  color ballColor = color(200, 100, 50);
  Ball() {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 2); 
    dy = random(1, 2);
    radius=10;
  }
  void move() {
    x = x+dx; 
    y = y+dy;
  }

  void draw() {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }
  
  void collide(Player tp) {
    if(y + radius >= tp.ypos && y - radius <= tp.ypos + PADDLEHEIGHT && x >= tp.xpos && x <= tp.xpos + PADDLEWIDTH){
        float speedMultiplier = abs(mouseX-pmouseX) / 6;
        float direction = mouseX-pmouseX;
        if(speedMultiplier > maxSpeed) {
          dy=-dy*maxSpeed;
        }
        else if(speedMultiplier < maxSpeed && speedMultiplier > 1){
          dy=-dy*speedMultiplier;
        } 
        else if(speedMultiplier > 0){
          dy=-dy*speedMultiplier;
        } 
        else {
          dy=-dy;
        }
        
        if(tp.type == "human") {
          // Direction
          if(direction >= 0 && dx < 0) {
            dx=-dx+1.1*direction;
          }
          if(direction <= 0 && dx > 0) {
            dx=-dx+1.1*direction;
          }
          collidedWith = 1;
        }
        if(tp.type == "computer") {
            collidedWith = 0; 
        }
    }
  }
  
  void wallCollide() {
    if(x-radius <=0) {
      dx=-dx; 
    }
    else if(x+radius >= SCREENX) {
      dx=-dx; 
    }
  }
  
  int reset() {
    if(y > SCREENY + radius) {
      // Player lost
      reset = true;
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      return 0;
    }
    else if(y < -radius) {
      // Computer lost
      reset = true;
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      return 1;
    }
    return -1;
  }
}
