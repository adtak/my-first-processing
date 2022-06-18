LandscapeController lc;
SL sl;
LocalTrains lt;
float idling;

void setup() {
  size(1920, 1080);
  // size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  lc = new LandscapeController(height*0.7);
  sl = createSL();
  lt = createLocalTrains();
  idling = 0;
}

void draw() {
  lc.moveBackground(-5);
  moveSL();
  lc.moveForeground(-5);
  save();
}

void save() {
  if (frameCount < 30*1) {
    saveFrame("frames/#####.png");
  }
}

SL createSL() {
  int w = 500;
  int h = 150;
  float x = width*0.75;
  float y = height*0.8;
  float speed = 0;
  float jointWidth = 10;
  return new SL(random(360), w, h, x, y, speed, jointWidth);
}

LocalTrains createLocalTrains() {
  color c = sl.cSub;
  int w = 500;
  int h = 250;
  float x = sl.x-sl.w/2-sl.jointWidth-w/2;
  float y = height*0.8;
  float speed = 0;
  int trainAmount = 2;
  return new LocalTrains(
    c, w, h, x, y, speed, trainAmount);
}

void moveSL() {
  idling += 0.1;
  sl.move(1, random(-5, -1), idling);
  lt.move(1, -5, -1);

}
