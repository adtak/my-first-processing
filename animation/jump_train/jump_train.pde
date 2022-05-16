float horizon;
float ground;
Background background;
Trains trains;
Crossing crossing;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ground = height*0.9;
  horizon = ground*0.95;
  background = new Background(horizon, ground);
  trains = create_trains();
  crossing = new Crossing(width/4, ground);
}

void draw() {
  background.draw();
  trains.move();
  if (width+1500<trains.cars.get(trains.cars.size()-1).x) {
    trains = create_trains();
  }
  crossing.draw(
    trains.cars.get(0).x,
    trains.cars.get(trains.cars.size()-1).x);
  // if (frameCount < 30*60*15) {
  //   saveFrame("frames/#####.png");
  // }
}

Trains create_trains() {
  color c = color(random(360), 4, 10);
  int trainWidth = 500;
  int trainHeight = 200;
  float speed = random(5, 15);
  int trainAmount = int(random(1, 15));
  return new Trains(
    c, trainWidth, trainHeight,
    -1500, ground, speed, trainAmount);
}
