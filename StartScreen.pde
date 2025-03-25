class StartScreen {
  PImage title;
  boolean render;
  int difficulty; //1 = easy, 2 = normal, 3 = hard
  
  StartScreen() {
    this.title = loadImage("title.png");
    this.render = true;
  }
  
  void render() {
    if (render) {
      image(title, width/2, (height/3), 500, 500);
      textSize(20);
      text("press the corresponding arrow key and", width/2, 12 * (height/20));
      text("time the falling notes to the screen,", width/2, 13 * (height/20));
      text("survive for 30 seconds to win.", width/2, 14 * (height/20));
      text("careful... you only get three misses!", width/2, 15 * (height/20));
      text("Select a Difficulty:", width/2, 16 * (height/20));
      textSize(40);
      rectMode(CENTER);
      noStroke();
      fill(#08B400);
      rect(width/5, 7 * (height/8), 130, 50);
      fill(255);
      text("EASY", width/5, 7 * (height/8));
      fill(#2B2A86);
      rect(width/2, 7 * (height/8), 160, 50);
      fill(255);
      text("NORMAL", width/2, 7 * (height/8));
      fill(#B71212);
      rect(width/5 * 4, 7 * (height/8), 130, 50);
      fill(255);
      text("HARD", width/5 * 4, 7 * (height/8));
    }

    if (mousePressed == true) {
      if (mouseY > 7 * (height/8) - 25 && mouseY < 7 * (height/8) + 25) {
        //easy
        if (mouseX > width/5 - 65 && mouseX < width/5 + 65) {
          difficulty = 1;
          render = false;
        }
        //normal
        else if (mouseX > width/2 - 80 && mouseX < width/2 + 80) {
          difficulty = 2;
          render = false;
        }
        //hard
        else if (mouseX > (width/5 * 4) - 65 && mouseX < (width/5 * 4) + 65) {
          difficulty = 3;
          render = false;
        }
        
      }
    }
  }
}
