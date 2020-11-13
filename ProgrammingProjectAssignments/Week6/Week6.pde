ArrayList<Screen> screens;
int selectedScreen;
void setup(){
  size(400,400);
  stdFont=loadFont("ComicSansMS-36.vlw"); textFont(stdFont);
  Screen screen1, screen2;
  Widget widget1, widget2;
  int xpos = (width/2)-(100/2);
  widget1 = new Widget(xpos, 100, 100, 40, "Button 1", color(255,0,0), stdFont, EVENT_BUTTON1);
  widget2 = new Widget(xpos, 200, 100, 40, "Forward", color(0,255,0), stdFont, EVENT_BUTTON3);
  color colour = color(0);
  screen1 = new Screen( colour);
  screen1.addWidget(widget1); screen1.addWidget(widget2);

  widget1 = new Widget(xpos, 100, 100, 40, "Button 2", color(0,0,255), stdFont, EVENT_BUTTON2);
  widget2 = new Widget(xpos, 200, 100, 40, "Backward", color(173,216,230), stdFont, EVENT_BUTTON4);
  colour = color(100);
  screen2 = new Screen(colour);
  screen2.addWidget(widget1); screen2.addWidget(widget2);

  screens = new ArrayList<Screen>();
  screens.add(screen1); screens.add(screen2);
}
void draw(){
  background(255);
  screens.get(selectedScreen).draw();
}

void mousePressed(){ 
  int event = screens.get(selectedScreen).getEvent(mouseX, mouseY);
  //println(event);
  switch(event) {
    case EVENT_BUTTON1:
      println("Button1 Pressed");

      //selectedScreen = 1;
      break;
    case(EVENT_BUTTON2):
      println("Button2 Pressed");
      //selectedScreen = 0;
      break;
    case EVENT_BUTTON3:
      selectedScreen = 1;
      break;
    case(EVENT_BUTTON4):
      selectedScreen = 0;
      break;
  }
  
}

void mouseMoved(){
  int event;
  Screen screen = screens.get(selectedScreen); 
  
  for(Widget widget : screen.widgets){
    event = widget.getEvent(mouseX, mouseY);
    if(event!= EVENT_NULL){
      widget.strokeColour = color(255);
    } else {
      widget.strokeColour = color(0);
    }
  }
}
