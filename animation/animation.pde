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
  drawLocalTrains();
  background.drawMid();
  drawBulletTrains();
  background.drawFront();

  if(localTrainsList.size()<2) {
    if(random(0, 1)<0.005) {
      localTrainsList.add(createLocalTrains(false));
    }
    if(random(0, 1)<0.005) {
      localTrainsList.add(createLocalTrains(true));
    }
  }
  if(bulletTrainsList.size()<1) {
    if(random(0, 1)<0.005) {
      bulletTrainsList.add(createBulletTrains(false));
    }
    if(random(0, 1)<0.005) {
      bulletTrainsList.add(createBulletTrains(true));
    }
  }
  // save();
}

void save() {
  if (frameCount < 30*60*1) {
    saveFrame("frames/#####.png");
  }
}

LocalTrains createLocalTrains(boolean is_reverse) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  int trainAmount = 5;
  float xInit = is_reverse ? width+5*400 : -400;
  float speed = is_reverse ? -1*random(10, 15) : random(10, 15);
  return new LocalTrains(
    c, trainWidth, trainHeight,
    xInit, railLine1, speed, trainAmount);
}

BulletTrains createBulletTrains(boolean is_reverse) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  int trainAmount = 8;
  float xInit = is_reverse ? width+10*400 : -400;
  float speed = is_reverse ? -1*random(20, 30) : random(20, 30);
  return new BulletTrains(
    c, trainWidth, trainHeight,
    xInit, railLine2, speed, trainAmount);
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
    if (t.trains.get(0).x < -400) {
      continue;
    } else if (width+400 < t.trains.get(t.trains.size()-1).x) {
      continue;
    }
    newBulletTrainsList.add(t);
  }
  bulletTrainsList = newBulletTrainsList;
}
