class HealthBar {
  PImage alive;
  PImage dead;
  int lifeCount;
  int iconWidth = 70;
  int iconHeight = 48;
  
  HealthBar() {
    this.alive = loadImage("alive.png");
    this.dead = loadImage("dead.png");
    this.lifeCount = 3;
  }
  
  //lose 1 life
  void subtract() {
    lifeCount -= 1;
  }
  
  //prints out lives
  void render() {
    int xPos = iconWidth;
    
    for (int i = 0; i < lifeCount; i++) {
      image(alive, xPos, iconHeight, iconWidth, iconHeight);
      xPos += iconWidth;
    }
    
    for (int i = 0; i < 3 - lifeCount; i++) {
      image(dead, xPos, iconHeight, iconWidth, iconHeight);
      xPos += iconWidth;
    }
    
  }
}
