Train train;
Crossing crossing;

void setup() {
  size(1200, 800);
  colorMode(HSB, 360, 10, 10);
  train = create_train();
  crossing = new Crossing(width/4, height/2);
}

void draw() {
  background(0, 0, 10);
  train.move();
  if (width+500<train.x) {
    train = create_train();
  }
  crossing.draw();
}

Train create_train() {
  return new Train(color(random(360), 5, 10), 400, 150, -500, height/2+125, 2);
}
