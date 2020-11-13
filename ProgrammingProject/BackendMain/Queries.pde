  ArrayList<Line> latestDataPoints;
  ArrayList<Float> closePriceOverTime;
  ArrayList<Line> lowestPercentageChanges;
  ArrayList<Line> highestPercentageChanges;
  ArrayList<Line> nasdaq;
  ArrayList<Line> nyse;
  
  
  //
  // returns an ArrayList<Line> of all data points for a specific ticker
  //
  
  ArrayList queryTicker(String ticker) {
      for (Stock stock : stockData) {
         // accessing the correct Stock object from the ArrayList stockData
         if (ticker.equals(stock.getTicker())) {
           return stock.pricePoints;
         } 
       }
     return null;
   }
  
  //
  // returns an ArrayList<Float> of all the closing prices sorted by date (earliest -> latest) for a specific ticker
  // when calling use (please don't reinitialise closePriceOverTime, it's set as a global variable):
  //    closePriceOverTime = queryPriceOverTime("ticker");
  //
  
  ArrayList queryPriceOverTime(String ticker) {
    
    ArrayList<Line> priceOverTime = new ArrayList<Line>();
    closePriceOverTime = new ArrayList<Float>();
    
    priceOverTime = queryTicker(ticker);
    Collections.sort(priceOverTime, priceOverTime.get(0).dateComparator);
    for(Line line: priceOverTime) {
      closePriceOverTime.add(line.getClosePrice());
    }
    return closePriceOverTime;
  }
  
  //
  // returns an ArrayList<Line> with contains the most recent Line objects for each ticker (i.e only contains data from latest date for each company)
  // for the master list use something similar to:
  //  latestDataPoints = queryLatestDataPoints(); (latestDataPoints is global variable, don't reinitialise pls)
  //  for(Line line : latestDataPoints) {
  //    println(line.getTicker() + line.getOpenPrice() + line.getClosePrice() + (line.getClosePrice() - line.getOpenPrice()));
  //  }
  //
  
  ArrayList queryLatestDataPoints() {
    
    ArrayList<Line> tmp = new ArrayList<Line>();
    latestDataPoints = new ArrayList<Line>();
    
    for(Stock stock : stockData) {
      tmp = stock.pricePoints;
      Collections.sort(tmp, tmp.get(0).dateComparator);
      latestDataPoints.add(tmp.get(tmp.size()-1));
    }
    return latestDataPoints;
  }
  
  //
  // returns an ArrayList<Line> which is sorted by lowest to highest percentage changes (from the latest date for each company)
  //   i.e first element is the lowest percentage change
  // example use:
  //   lowestPercentageChanges = queryLowestPercentage();
  //   for (Line line : lowestPercentageChanges) {
  //    println(line.getTicker() + " " + line.getPercentageChange());
  //  }
  // ** percentageChange is now a variable in the Line class so don't calculate the change yourself, use line.getPercentageChange() or
  //    lowestPercentageChanges.get(i).getPercentageChange()
  //
  
  ArrayList queryLowestPercentage() {
   
    lowestPercentageChanges = new ArrayList<Line>();
    lowestPercentageChanges = queryLatestDataPoints();
    
    // calculates the percentage change for the latest data points of each ticker and then assigns value as percentageChange variable for
    // appropriate Line object
    for(Line line : latestDataPoints) {
      float percentageChange = ((line.getClosePrice() - line.getOpenPrice()) / line.getOpenPrice()) * 100;
      line.setPercentageChange(percentageChange);
    }
    Collections.sort(lowestPercentageChanges, lowestPercentageChanges.get(0).percentageChangeComparator);
    return lowestPercentageChanges;
  }
  
  //
  // returns an ArrayList<Line> which is sorted by highest to lowest percentage change
  // implementation same as queryLowestPercentageChange() 
  //
  
  ArrayList queryHighestPercentage() {
    highestPercentageChanges = new ArrayList<Line>(queryLowestPercentage());
    Collections.reverse(highestPercentageChanges);
    return highestPercentageChanges;
  }
  
  //
  // returns an ArrayList<Line> of the latest data points for each NASDAQ stock
  //
  
  ArrayList queryNASDAQ() {
    String nasdaqTicker;
    nasdaq = new ArrayList<Line>();
    for(Stock stock : stockData) {
      if(stock.getExchange().equalsIgnoreCase("NASDAQ")) {
        nasdaqTicker = stock.getTicker();
        for(Line line : latestDataPoints) {
          if(line.getTicker().equals(nasdaqTicker)) {
            nasdaq.add(line);
          }
        }
      }
    }
    return nasdaq;
  }
  
  //
  // returns an ArrayList<Line> of the latest data points for each NYSE stock
  //
  
  ArrayList queryNYSE() {
    String nyseTicker;
    nyse = new ArrayList<Line>();
    for(Stock stock : stockData) {
      if(stock.getExchange().equalsIgnoreCase("NYSE")) {
        nyseTicker = stock.getTicker();
        for(Line line : latestDataPoints) {
          if(line.getTicker().equals(nyseTicker)) {
            nyse.add(line);
          }
        }
      }
    }
    return nyse;
  }
