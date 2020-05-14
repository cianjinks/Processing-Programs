PFont stdFont, buttonFont;
final int EVENT_NULL=0;
final int S1W1_EVENT = 1;
final int S1W2_EVENT = 2;
final int S2W1_EVENT = 3;
final int S2W2_EVENT = 4;
final int S2C1_EVENT = 5;
final int RB1_EVENT = 6;
final int RB2_EVENT = 7;
final int RB3_EVENT = 8;

final int[] RB_EVENTS = new int[]{RB1_EVENT, RB2_EVENT, RB3_EVENT};

boolean drawBackward = false;

int currentScreen;
Widget screen1Widget1, screen1Widget2, screen2Widget1, screen2Widget2;
CheckBoxWidget checkBox;
RadioBoxWidget radioBox;
Screen screen1, screen2;

void setup() {
  stdFont=loadFont("CourierNewPS-ItalicMT-24.vlw");
  buttonFont=loadFont("SansSerif.bold-36.vlw");
  textFont(stdFont);
  screen1 = new Screen(color(0, 255, 0), 0);
  screen2 = new Screen(color(255, 0, 0), 1);
  currentScreen = screen1.getScreen();
  screen1Widget1 = new Widget(100, 100, 140, 40, "Widget 1", color(100), stdFont, S1W1_EVENT);
  screen1Widget2 = new Widget(100, 200, 140, 40, "Forward", color(100), stdFont, S1W2_EVENT);
  screen2Widget1 = new Widget(100, 100, 140, 40, "Widget 2", color(100), stdFont, S2W1_EVENT);
  screen2Widget2 = new Widget(100, 200, 140, 40, "Backward", color(100), stdFont, S2W2_EVENT);
  checkBox = new CheckBoxWidget(100, 50, 40, color(100), buttonFont, false, S2C1_EVENT);
  radioBox = new RadioBoxWidget(300, 100, color(100), buttonFont, 1, RB_EVENTS, 40);
  screen1.addWidget(screen1Widget1);
  screen1.addWidget(screen1Widget2);
  screen1.addWidget(radioBox);
  screen2.addWidget(screen2Widget1);
  //screen2.addWidget(screen2Widget2);
  screen2.addWidget(checkBox);
  size(400, 400);
}

void draw() {
  if(currentScreen == screen1.getScreen()) {
    screen1.draw();
  }
  else if(currentScreen == screen2.getScreen()){
    screen2.draw(); 
  }
}

void mousePressed() {
  int event = EVENT_NULL;
    if(currentScreen == screen1.getScreen()) {
      event = screen1.getEvent();
    }
    else if(currentScreen == screen2.getScreen()) {
      event = screen2.getEvent();
    }
    switch(event) {
    case S1W1_EVENT:
      println("Screen 1 Widget 1 was clicked!");
      break;
    case S1W2_EVENT:
      currentScreen = screen2.getScreen();
      break;
    case S2W1_EVENT:
      println("Screen 2 Widget 2 was clicked!");
      break;
    case S2W2_EVENT:
      currentScreen = screen1.getScreen();
      break;
    case S2C1_EVENT:
      checkBox.click();
      drawBackward = !drawBackward;
      if(drawBackward == false) {
         screen2.removeWidget(screen2Widget2);
      }
      else if(drawBackward == true) {
         screen2.addWidget(screen2Widget2);
      }
      break;
    case RB1_EVENT:
      radioBox.click(0);
      break;
    case RB2_EVENT:
      radioBox.click(1);
      break;
    case RB3_EVENT:
      radioBox.click(2);
      break;
  }
}
