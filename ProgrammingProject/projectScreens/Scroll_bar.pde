// Stephen 23/03/20 1:46pm, created scroll bar class which Diarmuid will use for the masterList page at a later stage

// final float heightOfCanvas = 1005;
class Scroll_Bar{
  // attributes
  float barXPos;
  float barYPos = 0;
  float barWidth = 20;
  float barHeight = 100;
  boolean isDraggable = false; 
  float offsetMouseY;    // distance from top of bar to mouseYPosition
  
  // constructor
  Scroll_Bar() {
    barXPos=(SCREEN_X-barWidth-1);  
  }
  
  void display() {
    fill(CYAN);
    rect(barXPos,barYPos,barWidth,barHeight);
  }
  
  
  void mousePressedBar() {
    if (canScroll()==true) {
      isDraggable=true;
      offsetMouseY=mouseY-barYPos; // offset = distance from top of the bar (barYPos) to current mouseY position
    }
  }
 
 void mouseReleasedBar() {
    scrollBar.isDraggable=false;
}
 
  void update() {    // updates position of the bar.
    // dragging of the mouse 
    if (isDraggable==true) {
      barYPos=mouseY-offsetMouseY;    // moves top left of bar to appropriate position.
      if (barYPos<0)
        barYPos=0;
      if (barYPos+barHeight>=(SCREEN_Y))
        barYPos=(SCREEN_Y-barHeight-1);
    }
  }
 
  float scrollValue() {
    return map(barYPos,0,(SCREEN_Y-barHeight),0,-(HEIGHTOFCANVAS - SCREEN_Y));
  }
  
  boolean canScroll() {
    if(mouseX>=barXPos && mouseX <=(barXPos+barWidth)
      && mouseY>=barYPos && mouseY<=(barYPos+barHeight)) {
      return true;
    }
   else {
     return false;  
   } 
  } 
}
