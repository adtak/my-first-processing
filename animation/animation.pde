float horizon;
float ground;
Background background;
BulletTrainTail bulletTrain;

void setup() {
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ground = height*0.9;
  horizon = ground*0.95;
  background = new Background(horizon, ground);
  bulletTrain = create_train(0);
}

void draw() {
  background.draw();
  bulletTrain.move(-1);
}

BulletTrainTail create_train(float xInit) {
  color c = color(random(360), 4, 10);
  int trainWidth = 400;
  int trainHeight = 150;
  float speed = 1;
  int trainAmount = 1;
  return new BulletTrainTail(
    c, trainWidth, trainHeight,
    xInit, ground, speed, 10);
}
