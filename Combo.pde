class Combo {
  int highestCombo;
  PImage combo;
  int currentCombo;
  
  Combo() {
    this.combo = loadImage("combo.png");
  }
  
  //updates current combo
  void add() {
    currentCombo += 1;
  }
  
  //resets combo
  void reset() {
    currentCombo = 0;
  }
  
  //updates highest combo for end page 
  void update() {
    if (currentCombo > highestCombo) {
      highestCombo = currentCombo;
    }
  }
  
  //prints combo
  void render() {
    update();
    image(combo, 354 * 0.3, 135, 354 * 0.5, 164 * 0.5);
    textSize(50);
    text(currentCombo, 354 * 0.5 + 35, 135);
  }
  
}
