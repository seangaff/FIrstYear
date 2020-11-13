class Line { 
  String ticker;
  float open_price;
  float close_price;
  float adjusted_close;
  float low;
  float high;
  int volume;
  Date date;
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  float percentageChange;

  Line(String rawData) {
    //program defensively for empty fields
    String[] data = split(rawData, ",");
    ticker = data[0];
    open_price = Float.parseFloat(data[1]);
    close_price = Float.parseFloat(data[2]);
    adjusted_close = Float.parseFloat(data[3]);
    low = Float.parseFloat(data[4]);
    high = Float.parseFloat(data[5]);
    volume = Integer.parseInt(data[6]);
    try {
      date = dateFormat.parse(data[7]);
    } catch (Exception e) {
      println("Date in wrong format");
    }
  }

  Comparator<Line> dateComparator = new Comparator<Line>() {
    @Override
    int compare(Line line1, Line line2) {
      return line1.getDate().compareTo(line2.getDate());
    }
  };
  
  Comparator<Line> percentageChangeComparator = new Comparator<Line>() {
    @Override
    int compare(Line line1, Line line2) {
      return Float.compare(line1.getPercentageChange(), line2.getPercentageChange());
    }
  };
    
  String getTicker() {
    return ticker;
  }

  float getOpenPrice() {
    return open_price;
  }

  float getClosePrice() {
    return close_price;
  }

  float getAdjustedClose() {
    return adjusted_close;
  }

  float getLow() {
    return low;
  }

  float getHigh() {
    return high;
  }

  int getVolume() {
    return volume;
  }

  Date getDate() {
    return date;
  }
  
  void setPercentageChange(float percentageChange) {
    this.percentageChange = percentageChange;
  }
  
  float getPercentageChange() {
    return percentageChange;
  }
}
