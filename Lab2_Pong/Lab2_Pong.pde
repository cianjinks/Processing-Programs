Player humanPlayer;
Player computerPlayer;
Ball theBall;
PFont font24;
PFont font48;
PFont font10;


void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  humanPlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT, "human");
  computerPlayer = new Player(MARGIN, "computer");
  theBall = new Ball();
  font10 = loadFont("MicrosoftYaHeiUI-10.vlw");
  font24 = loadFont("MicrosoftYaHeiUI-24.vlw");
  font48 = loadFont("MicrosoftYaHeiUI-48.vlw");
  textFont(font24);
  ellipseMode(RADIUS);
  frameRate(60);
}

void draw() {
  background(255);
  noStroke();
  humanPlayer.move(mouseX);
  float direction = mouseX-pmouseX;
  println("Direction: " + direction);
  
  // AI
  if(reset == false) {
    float difficulty = 0.3;
    // If the ball us directly above the paddle
    if(computerPlayer.xpos + PADDLEWIDTH/2 == theBall.x) {
      computerPlayer.move(computerPlayer.xpos);
    }
    // If the ball is to the right of the paddle
    else if(computerPlayer.xpos + PADDLEWIDTH < theBall.x) {
      computerPlayer.move(computerPlayer.xpos+(1+difficulty*speedLevelx));
    }
    // If the ball is to the left of the paddle
    else if(computerPlayer.xpos > theBall.x) {
      computerPlayer.move(computerPlayer.xpos-(1+difficulty*speedLevelx));
    }
    // Reaches paddle bounds and moving right
    else if(computerPlayer.xpos + PADDLEWIDTH > theBall.x && computerPlayer.xpos < theBall.x && theBall.dx > 0) {
      computerPlayer.move(computerPlayer.xpos+(1+difficulty*speedLevelx));
    }
    // Reaches paddle bounds and moving left
    else if(computerPlayer.xpos + PADDLEWIDTH > theBall.x && computerPlayer.xpos < theBall.x && theBall.dx < 0) {
      computerPlayer.move(computerPlayer.xpos-(1+difficulty*speedLevelx));
    }
  }
  
  int death = theBall.reset();
  if(death == 1) {
    computerPlayer.lives -= 1;
  }  
  else if(death == 0) {
    humanPlayer.lives -= 1; 
  }
  
  if(humanPlayer.lives == 0) {
    textFont(font48);
    text("GAME OVER", SCREENX/2 - 140, SCREENY/2);
  }
  if(computerPlayer.lives == 0) {
    textFont(font48);
    text("YOU WIN", SCREENX/2 - 120, SCREENY/2);
  }
  
  if(reset == false) {
    theBall.move();
    myFrames++;
  }
  
  // Cap Speed
  if(theBall.dx >= maxSpeed) {
    theBall.dx = maxSpeed;
  }
  if(theBall.dy >= maxSpeed) {
    theBall.dy = maxSpeed;
  }  
  // Computer lives
  textFont(font24);
  text("Lives: " + computerPlayer.lives, MARGIN - 20, MARGIN);
  text("Lives: " + humanPlayer.lives, MARGIN - 20, SCREENY - MARGIN);
  textFont(font10);
  speedLevelx = abs(theBall.dx);
  speedLevely = abs(theBall.dy);
  text("Speed: DX-" + (speedLevelx - speedLevelx%0.01) + " DY-" + (speedLevely - speedLevely%0.01), SCREENX - MARGIN - 100, MARGIN - 15);
  
  if(collidedWith == 0) {
    theBall.collide(humanPlayer);
    
  }
  if(collidedWith == 1) {
    theBall.collide(computerPlayer);
  }
  
  
  theBall.wallCollide();
  humanPlayer.draw();
  computerPlayer.draw();
  theBall.draw();
}

void mousePressed() {
  if(reset == true) {
    reset = false;
    theBall.dx = random(1, 2); 
    theBall.dy = random(1, 2);
    speedLevelx = abs(theBall.dx);
    speedLevely = abs(theBall.dy);
    collidedWith = 0;
    if(humanPlayer.lives == 0 || computerPlayer.lives == 0) {
      humanPlayer.lives = LIVES;
      computerPlayer.lives = LIVES;
    }
  }
}
