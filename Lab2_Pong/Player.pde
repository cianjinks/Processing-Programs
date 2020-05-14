
class Player {
  float xpos; float ypos;
  int lives;
  String type;
  color paddlecolor = color(50);
  
  Player(int screen_y, String type) {
    xpos=SCREENX/2;
    ypos=screen_y;
    lives = LIVES;
    this.type = type;
  }

  void move(float x) {
    
    if(x > SCREENX-PADDLEWIDTH) {
      xpos = SCREENX-PADDLEWIDTH;
    }
    else if(x < 0) {
      xpos = 0;
    }
    else {
      xpos=x; 
    }
  }
  
  void draw() {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
