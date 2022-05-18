float horizon;
float ground;
Background background;
ArrayList<Trains> trainsList;
Crossing crossing;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ground = height*0.9;
  horizon = ground*0.95;
  background = new Background(horizon, ground);
  trainsList = new ArrayList();
  trainsList.add(create_trains());
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
    newTrainsList.add(create_trains());
  }
  trainsList = newTrainsList;

  // crossing.draw(
  //   trains.cars.get(0).x,
  //   trains.cars.get(trains.cars.size()-1).x);

  // if (frameCount < 30*60*15) {
  //   saveFrame("frames/#####.png");
  // }
}

Trains create_trains() {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  float speed = int(random(7, 15));
  int trainAmount = 3;
  return new Trains(
    c, trainWidth, trainHeight,
    -400, ground, speed, trainAmount);
}
