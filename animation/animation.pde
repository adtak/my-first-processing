float horizon;
float ground;
Background background;
AbstractTrains trains;

void setup() {
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ground = height*0.9;
  horizon = ground*0.95;
  background = new Background(horizon, ground);
  trains = createTrains(3*width);
}

void draw() {
  background.draw();
  trains.move(1);
}

AbstractTrains createTrains(float xInit) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  float speed = -10;
  int trainAmount = 3;
  return new BulletTrains(
    c, trainWidth, trainHeight,
    xInit, ground, speed, trainAmount);
}
