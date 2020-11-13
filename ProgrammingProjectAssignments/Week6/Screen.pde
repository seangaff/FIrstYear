class Screen{
    ArrayList<Widget> widgets;
    color backgroundColor;
    // Widget widget1, widget2;
    Screen(int backgroundColor){
        this.backgroundColor = color(backgroundColor); 
        widgets = new ArrayList<Widget>();
        // this.widget1 = widget1;
        // this.widget2 = widget2;
    }

    void draw(){
        background(backgroundColor);
        drawWidgets();  
    }

    int getEvent(int mousex, int mousey){
        int event = 0;
        for(Widget widget : widgets){
            event = widget.getEvent(mousex, mousey);
            if(event!=EVENT_NULL){
                return event;
            }
        }
        return event;
    }
    void drawWidgets(){
        for(Widget widget : widgets){
            widget.draw();
        }        
    }
    void addWidget(Widget widget){
        widgets.add(widget);
    }
}
