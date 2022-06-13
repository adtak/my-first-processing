LandscapeController lc;
SL sl;
float idling;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  lc = new LandscapeController(height*0.7);
  sl = createSL();
  idling = 0;
}

void draw() {
  lc.moveBackground(-5);
  idling += 0.1;
  sl.move(1, random(-5, -1), idling);
  if(width < sl.x-250) {
    sl = createSL();
  }
  lc.moveForeground(-5);
  // save();
}

void save() {
  if (frameCount < 2) {
    saveFrame("frames/#####.png");
  }
}

SL createSL() {
  float x = width/2;
  float y = height*0.8;
  int w = 500;
  int h = 150;
  return new SL(random(360), w, h, x, y, 0, 0);
}
