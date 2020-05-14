class Widget {
  int x, y, widgetWidth, widgetHeight;
  String label; 
  int event;
  color widgetColor, labelColor, strokeColor;
  PFont widgetFont;
  
  Widget() {
    
  }
  
  Widget(int x, int y, int widgetWidth, int widgetHeight, String label, color widgetColor, PFont widgetFont, int event) {
    this.x=x; 
    this.y=y; 
    this.widgetWidth = widgetWidth; 
    this.widgetHeight= widgetHeight;
    this.label=label; 
    this.event=event;
    this.widgetColor=widgetColor; 
    this.widgetFont=widgetFont;
    labelColor= color(200);
    strokeColor = color(0);
  }
  
  
  void draw() {
    if(mouseX > x && mouseX < x + widgetWidth 
        && mouseY > y && mouseY < y + widgetHeight) {
      strokeColor = color(255, 255, 255);
    }
    else {
      strokeColor = color(0, 0, 0);
    }
    stroke(strokeColor);
    fill(widgetColor);
    rect(x, y, widgetWidth, widgetHeight);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+10, y+widgetHeight-10);
  }
  
  void setColor(color widgetColor) {
    this.widgetColor = widgetColor;
  }
  
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+widgetWidth && mY >y && mY <y+widgetHeight) {
      return event;
    }
    return EVENT_NULL;
  }
}
