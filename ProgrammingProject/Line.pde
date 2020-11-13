class Line implements Comparable<Line> {
  String ticker;
  float open_price;
  float close_price;
  float adjusted_close;
  float low;
  float high;
  int volume;
  Date date; //check for Date type in processing
  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

  Line(String ticker, String open_price, String close_price, String adjusted_close, String low, String high, String volume, String dateS) {
    //program defensively for empty fields
    //String[] data = split(rawData, ",");
    this.ticker = ticker;
    this.open_price = Float.parseFloat(open_price);
    this.close_price = Float.parseFloat(close_price);
    this.adjusted_close = Float.parseFloat(adjusted_close);
    this.low = Float.parseFloat(low);
    this.high = Float.parseFloat(high);
    this.volume = Integer.parseInt(volume);
    try {
      date = dateFormat.parse(dateS);
    } catch (Exception e) {
      println("Date in wrong format");
    }
  }
  
  @Override
  int compareTo(Line o) {
    return getDate().compareTo(o.getDate());
    //Date d = getDate();
    //if (d == null) {
    //  if(o == null || o.getDate() == null) return 0;
    //  return -1;
    //}
    //return d.compareTo(o.getDate());
  }
  
  String getTicker() {
    return ticker;
  }

  void setTicker(String ticker) {
    this.ticker = ticker;
  }

  float getOpenPrice() {
    return open_price;
  }

  void setOpenPrice(float open_price) {
    this.open_price = open_price;
  }

  float getClosePrice() {
    return close_price;
  }

  void setClosePrice(float close_price) {
    this.close_price = close_price;
  }

  float getAdjustedClose() {
    return adjusted_close;
  }

  void setAdjustedClose(float adjusted_close) {
    this.adjusted_close = adjusted_close;
  }

  float getLow() {
    return low;
  }

  void setLow(float low) {
    this.low = low;
  }

  float getHigh() {
    return high;
  }

  void setHigh(float high) {
    this.high = high;
  }

  int getVolume() {
    return volume;
  }

  void setVolume(int volume) {
    this.volume = volume;
  }

  Date getDate() {
    return date;
  }

  void setDate(Date date) {
    this.date = date;
  }
}
