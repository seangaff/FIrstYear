void setup(){
  Widget widget1, widget2,widget3;
  size(400, 400);
  stdFont=loadFont("ComicSansMS-36.vlw"); textFont(stdFont);
  widget1=new Widget((width/2)-(100/2), 100, 100, 40,"red", color(100), stdFont,EVENT_BUTTON1);
  widget2=new Widget((width/2)-(100/2), 200, 100, 40,"green", color(100), stdFont, EVENT_BUTTON2);
  widget3=new Widget((width/2)-(100/2), 300, 100, 40,"blue", color(100), stdFont, EVENT_BUTTON3);
  widgetList = new ArrayList();
  widgetList.add(widget1); widgetList.add(widget2);widgetList.add(widget3);
}
void draw(){
  for(int i = 0; i<widgetList.size(); i++){
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  }
}
void mousePressed(){
  int event;
  for(int i = 0; i<widgetList.size(); i++){
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX,mouseY);
    switch(event) {
      case EVENT_BUTTON1:
      println("red");
      aWidget.widgetColor = color(255,0,0);
      break;
      case EVENT_BUTTON2:
      println("green");
      aWidget.widgetColor = color(0,255,0);
      break;
      case EVENT_BUTTON3:
      println("blue");
      aWidget.widgetColor = color(0,0,255);
      break;
      default:
      aWidget.widgetColor = color(100);
      break;
    }
  }
}
void mouseMoved(){
  int event;
  for(Widget widget : widgetList){
    event = widget.getEvent(mouseX, mouseY);
    if(event!= EVENT_NULL){
      widget.strokeColour = color(255);
    } else {
      widget.strokeColour = color(0);
    }
  }
}
