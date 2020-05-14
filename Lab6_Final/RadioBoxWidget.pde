class RadioBoxWidget extends Widget {
  
  int x;
  int y;
  color widgetColor;
  PFont widgetFont;
  int clicked;
  int[] event;
  int chkBoxScale;
  
  ArrayList<CheckBoxWidget> chkboxWidgets = new ArrayList<CheckBoxWidget>();
  
  RadioBoxWidget(int x, int y, color widgetColor, PFont widgetFont, int clicked, int[] event, int chkBoxScale) {
     this.x=x; 
     this.y=y; 
     this.widgetColor=widgetColor; 
     this.widgetFont=widgetFont;
     this.event = event;
     this.clicked = clicked;
     this.chkBoxScale = chkBoxScale;
     
     chkboxWidgets.add(new CheckBoxWidget(x, y, 40, widgetColor, widgetFont, false, event[0]));
     chkboxWidgets.add(new CheckBoxWidget(x, y + 50, 40, widgetColor, widgetFont, false, event[1]));
     chkboxWidgets.add(new CheckBoxWidget(x, y + 100, 40, widgetColor, widgetFont, false, event[2]));
     
     for(int i = 0; i < chkboxWidgets.size(); i++) { 
       if(i == clicked) {
         chkboxWidgets.get(i).click(); 
       }
     }
  }
  
  void draw() {
    for(int i = 0; i < chkboxWidgets.size(); i++) { 
       chkboxWidgets.get(i).draw(); 
    }
  }
  
  void click(int chkbox) {
    chkboxWidgets.get(chkbox).click();
    for(int i = 0; i < chkboxWidgets.size(); i++) { 
       if(i != chkbox) {
         chkboxWidgets.get(i).clear(); 
       }
    }
  }
  
  int getEvent(int mX, int mY) {
    for(int i = 0; i < chkboxWidgets.size(); i++) { 
       if(mX > chkboxWidgets.get(i).x && mX < chkboxWidgets.get(i).x + chkBoxScale && mY > chkboxWidgets.get(i).y && mY < chkboxWidgets.get(i).y + chkBoxScale) {
         return event[i];
       }
    }
    return EVENT_NULL;
  }
}
