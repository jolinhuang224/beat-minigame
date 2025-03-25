import processing.sound.*;

/* Create variables for components of the game 
that will be instantiated as objects */

StartScreen startScreen;
CountdownTimer countdown;
EndScreen endScreen;
HealthBar lives;
int amazingCount;
int badCount;
int missCount;
ArrayList<Note> notes;
Arrows arrowBar;
PFont font;
Background backgrounds;
ScoreEffect scoreEffect;
int scoreEffectType;
int scoreEffectFrames;
Combo combo;
boolean gameEnd;
SoundFile loseMusic;
SoundFile winMusic;
SoundFile beat;
ArrayList<SoundFile> musicList;
SoundFile currMusic;
int noteFrames;
int noteSpeed;

void setup() {
  background(255);
  size(600, 600);
  font = createFont("Phantomuff Difficult Font.ttf", 30);
  textFont(font);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  loseMusic = new SoundFile(this, "fail.mp3");
  winMusic = new SoundFile(this, "win.mp3");
  beat = new SoundFile(this, "bass.wav");
  musicList = new ArrayList<SoundFile>();
  musicList.add(new SoundFile(this, "music1.mp3"));
  musicList.add(new SoundFile(this, "music2.mp3"));
  musicList.add(new SoundFile(this, "music3.mp3"));
  musicList.add(new SoundFile(this, "music4.mp3"));
  init();
}

void init() {
  backgrounds = new Background();
  startScreen = new StartScreen();
  countdown = new CountdownTimer();
  endScreen = new EndScreen();
  scoreEffect = new ScoreEffect();
  scoreEffectFrames = 40;
  scoreEffectType = -1;
  combo = new Combo();
  amazingCount = 0;
  badCount = 0;
  missCount = 0;
  notes = new ArrayList<Note>();
  lives = new HealthBar();
  arrowBar = new Arrows();
  gameEnd = false;
  currMusic = musicList.get(int(random(4)));
  currMusic.play();
}

void setDifficulty(int diff) {
  switch(diff) {
    case 1:
      noteSpeed = 3;
      noteFrames = 60;
      break;
    case 2:
      noteSpeed = 7;
      noteFrames = 50;
      break;
    case 3:
      noteSpeed = 10;
      noteFrames = 20;
      break;
  }
}


void draw() {
  backgrounds.render();
  
  if (startScreen.render == true) {
    startScreen.render();
  } else {
    setDifficulty(startScreen.difficulty);
    textSize(30);
    arrowBar.render();
    lives.render();
    combo.render();
    
    //update timer
    countdown.updateTimeRemaining();
    countdown.render();
    
    //new note drops every 60 frames
    if (frameCount % noteFrames == 0) {
      notes.add(new Note(int(random(4)), noteSpeed));
    }
    
    //checks and renders each note currently on screen
    for (int i = notes.size() - 1; i >= 0; i--) {
      Note n = notes.get(i);
      n.move();
      n.render();
     
      // remove notes that leave screen or are hit & updated counters
      // keeps track of amazing, bad, and misses
      if (n.isHit == true) {
        beat.play();
        if (n.hitType == 1) {
          scoreEffectType = 2;
          amazingCount += 1;
          combo.add();
        }
        else if (n.hitType == 0) {
          scoreEffectType = 1;
          badCount += 1;
          combo.reset();
        }
        scoreEffectFrames = 40;
        n.playEffect();
        notes.remove(i);
      } else if (n.missed()) {
        missCount += 1;
        combo.reset();
        //check if no lives left
        if (lives.lifeCount == 0) {
          currMusic.stop();
          loseMusic.play();
          endScreen.render(0, combo.highestCombo, amazingCount, badCount, missCount);
          gameEnd = true;
          noLoop();
        }
        else {
          lives.subtract();
          notes.remove(i);
          scoreEffectType = 0;
          scoreEffectFrames = 40;
        }
      }
    }
    
    
    // continue to render score effect (e.g. "sick!", "miss") so that 
    // it won't only stay on one frame
    if (scoreEffectFrames > 0 && scoreEffectType >= 0) {
      scoreEffect.render(scoreEffectType);
      scoreEffectFrames--;
    }
    
    
    //check if out of time
    if (countdown.timeCounter == 0) {
      currMusic.stop();
      winMusic.play();
      endScreen.render(1, combo.highestCombo, amazingCount, badCount, missCount);
      gameEnd = true;
      noLoop();
    }
  }
}

//restart game
void keyPressed() {
  if (gameEnd && keyPressed == true && key == ENTER) {
    init();
    loop();
  }
}
