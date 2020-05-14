class Alien {
    int direction = A_RIGHT;
    float x, y, sin;
    float speed = 1;
    float horizontalSpeed = 1;
    int downDistance = 0;
    int type = 0;
    boolean edge = false;
    boolean exploded = false;
    int explodeTime = 0;
    PImage alienImage;
    PImage bombImage;
    Bomb bomb;
    boolean bombDropped;
 /* declare variables for alien position, direction of movement and appearance */

 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(int xpos, int ypos, PImage alienImage, PImage alienImage2, PImage bombImage){
  /* set up the new alien object */ 
    int random = (int)random(2);
    if(random == 0) {
      this.alienImage = alienImage;
      type = 0;
    } else if(random == 1) {
      this.alienImage = alienImage2;
      type = 1;
    }
    this.x = xpos;
    this.y = ypos;
    this.bombImage = bombImage;
 }
 
 void createBomb() {
   bomb = new Bomb(x, y, bombImage);
 }
  
 void move(){
  /* Move the alien according to the instructions in the exercise */ 
  horizontalSpeed = horizontalSpeed + 0.0002;
  //println("[Speed] " + horizontalSpeed);
  
  if(direction == A_RIGHT && edge == false) {
    x += horizontalSpeed;
  }
  else if(direction == A_LEFT && edge == false) {
    x -= horizontalSpeed; 
  }
  else if(direction == A_DOWN && edge == true) {
    y += speed; 
    downDistance += speed;
  }
  // If hit a wall
  if(x >= SCREEN_WIDTH - ALIEN_WIDTH || x <= 0) {
    direction = A_DOWN;
    edge = true;
  }
  
  // After it finishes travelling down
  if(downDistance >= ALIEN_HEIGHT) {
    edge = false;
    downDistance = 0;
    if(x >= SCREEN_WIDTH - ALIEN_WIDTH) {
      direction = A_LEFT;
    }
    else if(x <= 0) {
      direction = A_RIGHT; 
    }
  }
  
 }
 
 void explode(PImage explodeImage, PImage explodeImage2) {
   if(exploded == false) {
       if(type == 0) {
        alienImage = explodeImage; 
       }
       else {
         alienImage = explodeImage2;
       }
       exploded = true;
   }
   
 }
 
 void draw(){
   /* Draw the alien using the image() method demonstrated in class */
   if(explodeTime < 30) {
     image(alienImage, x, y + 20*sin(0.1*x));
     if(exploded == true) {
       explodeTime++; 
     }
   }
   
   if(bomb == null) {
     bombDropped = false; 
   }
   
   if(bombDropped == false) {
     if(random(0, 500) <= 1) {
       createBomb();
       bombDropped = true;
     }
   }
  }
}
