class ScoreEffect {
  PImage miss;
  PImage bad;
  PImage amazing;
  
  ScoreEffect() {
    this.miss = loadImage("miss.png");
    this.bad = loadImage("bad.png");
    this.amazing = loadImage("perfect.png");
  }
  
  //animates miss, bad, or sick based on given type
  void render(int score) { // 0 = miss, 1 = bad, 2 = amazing
    if (score == 0) {
      image(miss, 5 * (width/6), 115, 288 * 0.5, 164 * 0.5);
    } else if (score == 1) {
      image(bad, 5 * (width/6), 115, 288 * 0.5, 164 * 0.5);
    } else if (score == 2) {
      image(amazing, 5 * (width/6), 115, 288 * 0.5, 164 * 0.5);
    }
  }
}
