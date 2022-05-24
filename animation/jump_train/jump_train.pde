float horizon;
float ground;
Background background;
ArrayList<Trains> trainsList;
Crossing crossing;
float trainsHead, trainsTail;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ground = height*0.9;
  horizon = ground*0.95;
  background = new Background(horizon, ground);
  trainsList = new ArrayList();
  trainsList.add(create_trains(-1500));
  crossing = new Crossing(width/4, ground);
}

void draw() {
  background.draw();
  ArrayList<Trains> newTrainsList = new ArrayList();
  for (Trains trains : trainsList) {
    trains.move();
    if (trains.cars.get(trains.cars.size()-1).x < width+400) {
      newTrainsList.add(trains);
    }
  }
  if (random(1) > 0.995 && newTrainsList.size() < 3) {
    newTrainsList.add(create_trains(-400));
  }
  trainsList = newTrainsList;

  if (trainsHead < width) {
    trainsHead = trainsList.get(0).cars.get(0).x;
  } else {
    trainsHead = width;
  }
  trainsTail = 0;
  crossing.draw(trainsHead, trainsTail);

  // if (frameCount < 30*60*15) {
  //   saveFrame("frames/#####.png");
  // }
}

Trains create_trains(float xInit) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  float speed = int(random(7, 20));
  int trainAmount = 3;
  return new Trains(
    c, trainWidth, trainHeight,
    xInit, ground, speed, trainAmount);
}
