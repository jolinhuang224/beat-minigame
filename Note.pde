class Note {
  int type; // 0 = left, 1 = down, 2 = up, 3 = right
  int yPos;
  int speed;
  PImage fallingNotes;
  PImage pressedNotes;
  ArrayList<PImage> noteEffects;
  int noteWidth = int(358 * 1.5);
  int noteHeight = int(93 * 1.5);
  boolean isHit = false;
  int hitType; // 0 == bad, 1 == good
  
  Note(int type, int spd) {
    this.type = type;
    this.yPos = 0;
    this.fallingNotes = loadImage("default_notes.png");
    this.pressedNotes = loadImage("pressed_notes.png");
    this.noteEffects = new ArrayList<PImage>();
    noteEffects.add(loadImage("left_effect_3.png"));
    noteEffects.add(loadImage("down_effect_3.png"));
    noteEffects.add(loadImage("up_effect_3.png"));
    noteEffects.add(loadImage("right_effect_3.png"));
    this.speed = spd;
  }
  
  //falling notes
  void move() {
    yPos += speed;
  }
  
  //checks if note is within range for amazing
  boolean isAmazing() {
    return yPos > (5 * (height/6)) - (noteHeight * 0.6) 
    && yPos < (5 * (height/6)) - (noteHeight * 0.2);
  }
  
  //checks if note is within range for bad
  boolean isBad() {
     return yPos > 5 * (height/6) - noteHeight && yPos < 5 * (height/6) + noteHeight * 0.2;
  }
  
  //checks if not is missed
  boolean missed() {
    return yPos > (5 * (height/6)) && !(isAmazing()) && !(isBad());
  }
  
  //checks if key pressed is same as note
  boolean matchingArrow() {
    if (keyPressed == true && key == CODED) {
      if (type == 0) {
        if (keyCode == LEFT) { 
          return true; 
        } else { return false; }
      }
      else if (type == 1) {
        if (keyCode == DOWN) { 
          return true; 
        } else { return false; }
      } else if (type == 2) {
        if (keyCode == UP) { 
          return true; 
        } else { return false; }
      } else if (type == 3) {
        if (keyCode == RIGHT) { 
          return true; 
        } else { return false; }
      }
    }
    return false;
  }
  
  //animates splash when note is hit
  void playEffect() {
    image(noteEffects.get(type), (type * noteWidth / 4) + 85, 5 * (height/6), noteWidth/4, noteHeight);
  }
  
  void render() {
    if (matchingArrow() == true) {
      if (isAmazing() == true) {
        hitType = 1;
        copy(pressedNotes, type * 89, 0, 358/4, 93, (type * noteWidth / 4) + 35, yPos, noteWidth/4, noteHeight);
        isHit = true;
      }
      else if (isBad() == true) {
        hitType = 0;
        copy(pressedNotes, type * 89, 0, 358/4, 93, (type * noteWidth / 4) + 35, yPos, noteWidth/4, noteHeight);
        isHit = true;
      }
      copy(fallingNotes, type * 89, 0, 358/4, 93, (type * noteWidth / 4) + 35, yPos, noteWidth/4, noteHeight);
    }
    else {
      copy(fallingNotes, type * 89, 0, 358/4, 93, (type * noteWidth / 4) + 35, yPos, noteWidth/4, noteHeight);
    }
  }
}
