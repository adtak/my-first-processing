float horizon;
float ground;
Background background;
Train train;

void setup() {
  size(1920, 1080);
  // size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ground = height*0.9;
  horizon = ground*0.95;
  color c = color(random(360), 5, 10);
  int train_width = 300;
  int train_height = 150;
  float speed = 5;
  train = new Train(
    c, train_width, train_height,
    -100, ground, speed);
  background = new Background(horizon, ground);
}

void draw() {
  background.draw();
  train.move();
  if (frameCount < 10) {
    saveFrame("frames/#####.png");
  }
}
