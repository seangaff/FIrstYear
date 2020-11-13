// this class creates the buttons to switch the screen number
// created by Diarmuid McGonagle
class Widget {
  int x;
  int y; 
  int width; 
  int height; 
  int event; 
  int currentScreen;
  int newScreen;
  String deltaTicker;
  boolean strokeOn = false;
  // two constructors, one for basic buttons, other for buttons linking to price over time page
  // both Diarmuid
  Widget(int x,int y, int width, int height, int currentScreen)           
   {
    this.x=x; 
    this.y=y;
    this.width = width; 
    this.height= height; 
    this.currentScreen = currentScreen;
  }
  Widget(int x,int y, int width, int height, int currentScreen, String deltaTicker) {
    this.x=x; 
    this.y=y;
    this.width = width; 
    this.height= height; 
    this.currentScreen = currentScreen;
    this.deltaTicker=deltaTicker;
  }
  void draw(){
    if (strokeOn) stroke(255);
    else noStroke();
   
  }

  // Changes to basic page, include mouseX, mouseY and the screen to be changed to
  // created by Diarmuid McGonagle 
  void changeToNewPage(int mX, int mY, int deltaScreen) {
    if(mX>x && mX < x+width && mY >y && mY <y+height) {
      screenNumber = deltaScreen;
    }
  }
  // Changes to Price over Time page, include mouseX, mouseY, the screen to be changed to (5), and the ticker of the stock 
  // created by Diarmuid McGonagle 
  void changeToNewPot(int mX, int mY, int deltaScreen, String deltaTicker) {
    if(mX>x && mX < x+width && mY >y && mY <y+height) {
      screenNumber = deltaScreen;
      tickerName = deltaTicker;
    }
  }
  
  // Same as above, Changes to Price over Time page, include mouseX, mouseY, the screen to be changed to (5), but the ticker of the stock is already changed in main method 
  // created by Diarmuid McGonagle 
  void changeToNewPot(int mX, int mY, int deltaScreen) {
    if(mX>x && mX < x+width && mY >y && mY <y+height) {
      screenNumber = deltaScreen;
      tickerName = deltaTicker;
    }
  }
  void changeExchange(int mX, int mY) {
    if(mX>x && mX < x+width && mY >y && mY <y+height) {
     String placeHolder = exchangeName;
     exchangeName = previousExchangeName;
     previousExchangeName = placeHolder;
    }
  }
}

// this function centralizes all the button functionality for changing screens 
// input is mouseX, mouseY, and the current screen number so only certain buttons are activated
// Created by Diarmuid McGonagle
void activateAllButtons(int mX, int mY, int currentScreenNumber) {
 if (currentScreenNumber == 1) {
   homePageMasterList.changeToNewPage(mX,mY,2);
   homePageLosers.changeToNewPage(mX,mY,4);
   homePageWinners.changeToNewPage(mX,mY,3);
   
   homePageApple.changeToNewPot(mX,mY,5,"AAPL");
   homePageTesla.changeToNewPot(mX,mY,5,"AMSWA");
   homePageIBM.changeToNewPot(mX,mY,5,"EGHT");
   homePageFord.changeToNewPot(mX,mY,5,"FLWS");
   homePageNetflix.changeToNewPot(mX,mY,5,"RAVN");
 }
 else if (currentScreenNumber == 2) {
   masterPageHome.changeToNewPage(mX,mY,1);
   masterPageWinners.changeToNewPage(mX,mY,3);
   masterPageLosers.changeToNewPage(mX,mY,4); 
   if (currentScreenNumber == 2) {
     for (int i =0; i < masterListStockButtons.size(); i++) {
       masterListStockButtons.get(i).changeToNewPot(mX,mY,5);
     }
   }
   masterPageChangeExchange.changeExchange(mX,mY);
 }
  // Stephen 02/04/20 6pm - Using Diarmuid's approach, change screen accordingly between gainers, losers and potPage as user wishes
 else if (currentScreenNumber == 3) {
   gainerPageMasterList.changeToNewPage(mX,mY,2);
   gainerPageHomePage.changeToNewPage(mX,mY,1);
   gainerPageLosers.changeToNewPage(mX,mY,4);
   for(int i=0; i<stockGainers.size(); i++) {
     stockGainers.get(i).changeToNewPot(mX,mY,5,stockGainers.get(i).deltaTicker); // Stephen, 13/04/20 1am, updated line to pass in ticker aswell
     if(screenNumber == 5) {
     }
   }
 }
 else if (currentScreenNumber == 4) {
   loserPageMasterList.changeToNewPage(mX,mY,2);
   loserPageHomePage.changeToNewPage(mX,mY,1);
   loserPageWinners.changeToNewPage(mX,mY,3);
   for(int i=0; i<stockLosers.size(); i++) {
     stockLosers.get(i).changeToNewPot(mX,mY,5,stockLosers.get(i).deltaTicker);   // Stephen, 13/04/20 1am, updated line to pass in ticker aswell
     if(screenNumber == 5) {
     }
   }
 }
 else if (currentScreenNumber == 5) {     
   potPageHomePage.changeToNewPage(mX,mY,1);
   potPageMasterList.changeToNewPage(mX,mY,2);
 }
}
