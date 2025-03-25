class CountdownTimer {
  int timeCounter = 30;
  CountdownTimer() {}
  
  void updateTimeRemaining() {
     if(frameCount % 60 == 0) {
        if(timeCounter > 0) {
      timeCounter--;       
    }
  }
  }
  
  void render() {
    fill(255);
    textSize(30);
    text("TIME", width - 110, 48);
    text(timeCounter, width - 40, 48);
  }
}
