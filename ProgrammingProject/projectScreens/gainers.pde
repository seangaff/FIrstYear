// Stephen 19/03/20 4pm Created the gainers sketch, originally had one big draw method and sketch was in a separate folder
// Stephen 23/03/20 1pm updated layout of class to have one method to draw buttons, one to draw labels etc, and then one method to call all the smaller methods
// Stephen 31/03/20 6:45pm Made homePage, masterList and losers buttons clickable by utilising Diarmuid's Widget class
// Stephen 02/04/20 7:20pm created stockGainers ArrayList of type Widget to be able to "click" on the stock buttons to go to priceOverTime screen
// Stephen 13/04/20 1am updated to include the ticker name of stock when instantiating the widgets.

Widget gainerPageMasterList, gainerPageHomePage, gainerPageLosers;
ArrayList<Widget> stockGainers;

PFont myFont;
int yPos = 100;      // yPosition of each line of data, i.e. each stock
int stockY = 80;     // yPosition of each button around each stock
int i=0;

void drawGainers() {
  background(TAN);
  myFont = createFont("NSimSun",20,true);
  frameRate(80);
  highestPercentageChanges = queryHighestPercentage();
  drawGainerHeadings();
  drawGainerButtons();
  drawGainerLabels();
  drawGainerData(highestPercentageChanges); 
}

void drawGainerHeadings() {
  textFont(myFont);
  fill(PURPLE);  
  // Headings
  text("Highest Percentage Change",(SCREEN_X/2)-100,30);
  text("Ticker",50,60);
  text("Open Price",275,60);
  text("Close Price",425,60);
  text("Percentage Change",575,60);
}

void drawGainerButtons() {
  fill(RED);
  rect((SCREEN_X-265),(SCREEN_Y-410),150,50);      // homePage button
  gainerPageHomePage = new Widget((SCREEN_X-265),(SCREEN_Y-410),150,50, 3);
  rect((SCREEN_X-265),(SCREEN_Y-260),150,50);     // masterList button
  gainerPageMasterList = new Widget((SCREEN_X-265),(SCREEN_Y-260),150,50, 3);
  rect((SCREEN_X-265),(SCREEN_Y-110),150,50);     // lowest percentage change button
  gainerPageLosers = new Widget((SCREEN_X-265),(SCREEN_Y-110),150,50, 3);
}

void drawGainerLabels() {
  // Below labels the 3 buttons:
  fill(0);
  text("Home Page",(SCREEN_X-250),(SCREEN_Y-380));
  text("Master List",(SCREEN_X-250),(SCREEN_Y-230));
  text("Lowest Change",(SCREEN_X-250),(SCREEN_Y-80));  
}

void drawGainerData(ArrayList<Line> highestPercentageChanges) {
  yPos=100;
  stockY=80;
  stockGainers = new ArrayList<Widget>();
       for(int i=0; i<highestPercentageChanges.size(); i++) {    
       fill(BLUE);
       rect(40,stockY,75,25);    // creates button for stocks
       if(stockGainers.size()<10) {
         Widget gainer = new Widget(40,stockY,75,25,4,highestPercentageChanges.get(i).getTicker());
         stockGainers.add(gainer);       
       }
       fill(0);
       text(highestPercentageChanges.get(i).getTicker(),50,yPos);
       text(""+highestPercentageChanges.get(i).getOpenPrice(),275,yPos);
       text(""+highestPercentageChanges.get(i).getClosePrice(),425,yPos);
       text(""+df.format(highestPercentageChanges.get(i).getPercentageChange()) + "%",575,yPos);    
       yPos+=50;
       stockY+=50;
     }   
}
