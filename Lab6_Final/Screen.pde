class Screen {
  
  ArrayList<Widget> widgets;
  color backgroundColor;
  int screenID;
  
  Screen(color backgroundColor, int screenID) {
    this.backgroundColor = backgroundColor;
    this.screenID = screenID;
    widgets = new ArrayList<Widget>();
  }
  
  void draw() {
    background(backgroundColor);
    for(int index = 0; index < widgets.size(); index++) {
      widgets.get(index).draw(); 
    }
  }
  
  void addWidget(Widget widget) {
    widgets.add(widget);
  }
  
  void removeWidget(Widget widget) {
    widgets.remove(widget);    
  }
  
  int getScreen() {
    return screenID; 
  }
  
  int getEvent() {
    int event = EVENT_NULL;
    for(int index = 0; index < widgets.size(); index++) {
      if(widgets.get(index).getEvent(mouseX, mouseY) != EVENT_NULL) {
        event = widgets.get(index).getEvent(mouseX, mouseY);
      }
    }
    return event;
  }
}
