float horizon;
float railLine1;
float railLine2;
Background background;
ArrayList<LocalTrains> localTrainsList;
ArrayList<BulletTrains> bulletTrainsList;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  railLine1 = height*0.8;
  railLine2 = height*0.9;
  horizon = railLine1*0.95;
  background = new Background(horizon, railLine1, railLine2);
  localTrainsList = new ArrayList();
  bulletTrainsList = new ArrayList();
}

void draw() {
  background.drawBack();
  drawBulletTrains();
  background.drawMid();
  drawLocalTrains();
  background.drawFront();

  if(localTrainsList.size()<2) {
    if(random(0, 1)<0.005) {
      localTrainsList.add(createLocalTrains(-400));
    }
    if(random(0, 1)<0.005) {
      localTrainsList.add(createReverseLocalTrains(width+5*400));
    }
  }
  if(bulletTrainsList.size()<1) {
    if(random(0, 1)<0.005) {
      bulletTrainsList.add(createBulletTrains(-400));
    }
  }
  // save();
}

void save() {
  if (frameCount < 30*60*1) {
    saveFrame("frames/#####.png");
  }
}

LocalTrains createLocalTrains(float xInit) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  float speed = random(10, 15);
  int trainAmount = 5;
  return new LocalTrains(
    c, trainWidth, trainHeight,
    xInit, railLine2, speed, trainAmount);
}

LocalTrains createReverseLocalTrains(float xInit) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  float speed = -1 * random(10, 15);
  int trainAmount = 5;
  return new LocalTrains(
    c, trainWidth, trainHeight,
    xInit, railLine2, speed, trainAmount);
}

BulletTrains createBulletTrains(float xInit) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  float speed = random(20, 30);
  int trainAmount = 8;
  return new BulletTrains(
    c, trainWidth, trainHeight,
    xInit, railLine1, speed, trainAmount);
}

void drawLocalTrains() {
  ArrayList<LocalTrains> newLocalTrainsList = new ArrayList();
  for (LocalTrains t : localTrainsList) {
    t.move(1, -5, -1);
    if (t.trains.get(0).x < -400) {
      continue;
    } else if (width+400 < t.trains.get(t.trains.size()-1).x) {
      continue;
    }
    newLocalTrainsList.add(t);
  }
  localTrainsList = newLocalTrainsList;
}

void drawBulletTrains() {
  ArrayList<BulletTrains> newBulletTrainsList = new ArrayList();
  for (BulletTrains t : bulletTrainsList) {
    t.move(0, -30, -20);
    if (t.trains.get(t.trains.size()-1).x < width+400) {
      newBulletTrainsList.add(t);
    }
  }
  bulletTrainsList = newBulletTrainsList;
}
