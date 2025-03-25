class Arrows {
  PImage arrows;
  
  Arrows() {
  this.arrows = loadImage("empty_notes.png");
  }
  
  //empty arrows at the bottom of screen
  void render() {
    image(arrows, width/2, 5 * (height/6), 358 * 1.5, 88 * 1.5);
  }
  
}
