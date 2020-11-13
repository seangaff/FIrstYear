// Stephen 19/03/20 4:20pm Created the losers sketch, originally had one big draw method, and sketch was in a separate folder
// Stephen 23/03/20 1pm updated layout of class to have one method to draw buttons, one to draw labels etc, and then one method to call all the smaller methods
// Stephen 31/03/20 6:45pm Made homePage, masterList and gainers buttons clickable by utilising Diarmuid's Widget class
// Stephen 02/04/20 6pm created stockLosers ArrayList to be able to "click" on the stock buttons to go to priceOverTime screen
// Stephen 13/04/20 1am updated to include the ticker name of stock when instantiating the widgets. 
 
Widget loserPageMasterList, loserPageHomePage, loserPageWinners; 
ArrayList<Widget> stockLosers;

void drawBiggestLosers() {
  background(PALE);
  myFont = createFont("NSimSun",20,true);
  frameRate(80);
  lowestPercentageChanges = queryLowestPercentage();
  drawLoserHeadings();
  drawLoserButtons();
  drawLoserLabels();
  drawLoserData(lowestPercentageChanges);
}

void drawLoserHeadings() {
  textFont(myFont);
  fill(PURPLE);  
  // Headings
  text("Lowest Percentage Change",(SCREEN_X/2)-100,30);
  text("Ticker",50,60);
  text("Open Price",275,60);
  text("Close Price",425,60);
  text("Percentage Change",575,60);
}

void drawLoserButtons() {
  fill(BLUE);
  rect((SCREEN_X-265),(SCREEN_Y-410),150,50);      // homePage button
  loserPageHomePage = new Widget((SCREEN_X-265),(SCREEN_Y-410),150,50, 4);
  rect((SCREEN_X-265),(SCREEN_Y-260),150,50);     // masterList button
  loserPageMasterList = new Widget((SCREEN_X-265),(SCREEN_Y-260),150,50, 4);
  rect((SCREEN_X-265),(SCREEN_Y-110),150,50);     // lowest percentage change button
  loserPageWinners = new Widget((SCREEN_X-265),(SCREEN_Y-110),150,50, 4);
}

void drawLoserLabels() {
  // Below labels the 3 buttons:
  fill(0);
  text("Home Page",(SCREEN_X-250),(SCREEN_Y-380));
  text("Master List",(SCREEN_X-250),(SCREEN_Y-230));
  text("Highest Change",(SCREEN_X-250),(SCREEN_Y-80));  
}

void drawLoserData(ArrayList<Line> lowestPercentageChanges) {
  yPos=100;
  stockY=80;
       stockLosers = new ArrayList<Widget>();
       for(int i=0; i<lowestPercentageChanges.size(); i++) {    
       fill(GREEN);
       rect(40,stockY,75,25);    // creates button for stocks
       if(stockLosers.size()<10) {
         Widget loser = new Widget(40,stockY,75,25,4,lowestPercentageChanges.get(i).getTicker());
         stockLosers.add(loser);       
       }
       fill(0);
       text(lowestPercentageChanges.get(i).getTicker(),50,yPos);
       text(""+lowestPercentageChanges.get(i).getOpenPrice(),275,yPos);
       text(""+lowestPercentageChanges.get(i).getClosePrice(),425,yPos);
       text(""+df.format(lowestPercentageChanges.get(i).getPercentageChange()) + "%",575,yPos);    
       yPos+=50;
       stockY+=50;
     }   
}
