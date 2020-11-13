final int SCREENX = 400; //<>//
final int SCREENY = 400;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.text.SimpleDateFormat;

ArrayList<Line> priceData;
ArrayList<Stock> stockData;
String[] stockArray;
SimpleDateFormat dateFormat;

void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  PFont myFont = loadFont("Serif-14.vlw");
  textFont(myFont);
  fill(0);
  background(255);
  priceData = new ArrayList<Line>();
  stockData = new ArrayList<Stock>();
  stockArray = readStockInfo("stocks.csv");

  readPriceData("daily_prices10k.csv");
  println("there are " + priceData.size() + " price points");
  println(priceData.get(250).getTicker());

  createStocks();
  latestDataPoints = queryLatestDataPoints();
}

void createStocks() {
  boolean quit = false;
  for (int i = 1; i < stockArray.length; i++) {
    String[] temp = split(stockArray[i], ",");
    String ticker = temp[0];

    for (int j = 0; j < priceData.size() && quit == false; j++) {
      if (ticker.equals(priceData.get(j).getTicker())) {
        initStock(ticker);
        quit = true;
      }
    }
    quit = false;
  }

  for (Stock stock : stockData) {
    stock.getStockData();
  }
}


void draw() {
  //closePriceOverTime = queryPriceOverTime("PEZ");
  //for(Float closePrice:closePriceOverTime) {
  //  println(closePrice);
  //  noLoop();
  //}

  //ArrayList<Line> latestDataPoints = queryLatestDataPoints();
  //for (Line line : latestDataPoints) {
  //  println(line.getTicker() + " " + line.getOpenPrice() + " " + line.getClosePrice() + " " + (line.getClosePrice() - line.getOpenPrice()));
  //  noLoop();
  //}

  //lowestPercentageChanges = queryLowestPercentage();
  //for (Line line : lowestPercentageChanges) {
  //  println(line.getTicker() + " " + line.getPercentageChange());
  //  noLoop();
  //}

  //highestPercentageChanges = queryHighestPercentage();
  //for (Line line : highestPercentageChanges) {
  //  println(line.getTicker() + " " + line.getPercentageChange());
  //  noLoop();
  //}
  
  ArrayList<Line> test = new ArrayList<Line>(queryNYSE());
  for(Line line : test)
    println(line.getTicker() + line.getOpenPrice());
  noLoop();
  
}

void mousePressed() {
}

String[] readStockInfo(String fileName) {
  String[] lines = loadStrings(fileName);
  println("there are " + lines.length + " stocks");
  return lines;
}

void initStock(String ticker) {
  for (int i = 0; i < stockArray.length; i++) {
    String[] data = split(stockArray[i], ",");
    if (data[0].equals(ticker)) {
      stockData.add(new Stock(stockArray[i]));
      break;
    }
  }
}

void readPriceData(String fileName) {
  String[] lines = loadStrings(fileName);
  for (int i = 0; i < lines.length; i++) {
    priceData.add(new Line(lines[i]));
    //println(lines[i]);
    //text(lines[i], 10, i*15);
  }
  println("there are " + lines.length + " lines");
}
