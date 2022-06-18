LandscapeController lc;
SL sl;
LocalTrains lt;
BulletTrains bt;
float idling;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  lc = new LandscapeController(height*0.7, height*0.8, height*0.85);
  sl = createSL();
  lt = createLocalTrains();
  bt = createBulletTrains();
  idling = 0;
}

void draw() {
  lc.moveBackground(-10);
  moveSL();
  moveBulletTrains();
  lc.moveForeground(-10);
  // save();
}

void save() {
  if (frameCount < 30*10) {
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

BulletTrains createBulletTrains() {
  color c = color(random(360), 4, 10);
  int w = 700;
  int h = 250;
  int trainAmount = 8;
  float xInit = w+(trainAmount+2)*w+random(5000, 10000);
  float speed = -1*random(20, 30);
  return new BulletTrains(
    c, w, h,
    xInit, height*0.85, speed, trainAmount);
}

void moveSL() {
  idling += 0.1;
  sl.move(1, random(-5, -1), idling);
  lt.move(1, -5, -1, idling);
}

void moveBulletTrains() {
  bt.move(0, 0, 0);
  if(bt.trains.get(0).x+bt.trains.get(0).w/2<0) {
    bt = createBulletTrains();
  }
}
