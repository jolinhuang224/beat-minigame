class EndScreen {
  PImage win;
  PImage lose;
  PImage restart;
  
  
  EndScreen() {
    this.win = loadImage("win.png");
    this.lose = loadImage("lose.png");
    this.restart = loadImage("restart.png");
    
  }
  
  void restart() {
    setup();
    loop();
  }
  
  void render(int type, int combo, int amazing, int bad, int miss) { // 0 = loss screen, 1 = win screen
    background(0);
    fill(0);
    rectMode(CENTER);
    
    if (type == 0) {
      rect(width/2, height/2, width, height);
      fill(#ffffff);
      image(lose, width/2, (height/6), 795 * 0.5, 187 * 0.5);
      
    }
    else {
      rect(width/2, height/2, width, height);
      fill(#ffffff);
      image(win, width/2, (height/6), 724 * 0.4, 292 * 0.4);
    }
    
    textSize(35);
    text("Highest Combo: " + combo, width/2, 6 * (height/20));
    text("Amazing: " + amazing, width/2, 7 * (height/20));
    text("Bad: " + bad, width/2, 8 * (height/20));
    text("Miss: " + miss, width/2, 9 * (height/20));
    
    image(restart, width/2, 4 * (height/6), 1017 * 0.4, 294 * 0.4);
    textSize(40);
    text("Press enter to restart", width/2, 17 * (height/20));

  }
 
}
