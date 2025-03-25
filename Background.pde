class Background {
  ArrayList<PImage> backgrounds;
  int currentBackgroundIndex;
  
  Background() {
    this.currentBackgroundIndex = 0;
    backgrounds = new ArrayList<PImage>();
    backgrounds.add(loadImage("bg_0.png"));
    backgrounds.add(loadImage("bg_1.png"));
    backgrounds.add(loadImage("bg_2.png"));
    backgrounds.add(loadImage("bg_3.png"));
    backgrounds.add(loadImage("bg_4.png"));
  }
  
  //animates the background
  void update() {
    if (frameCount % 10 == 0) {
      if (currentBackgroundIndex == 4) {
        currentBackgroundIndex = 0;
      }
      else {
        currentBackgroundIndex += 1;
      }
    }
  }
  
  void render() {
    update();
    image(backgrounds.get(currentBackgroundIndex).get(100, 100, 1500, 700), width/2, height/2, width, height);
  }
}
