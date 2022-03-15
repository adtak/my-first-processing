float ground;
ArrayList<Train> trains;
Crossing crossing;

void setup() {
  size(1200, 800);
  colorMode(HSB, 360, 10, 10);
  ground = height*5/6;
  trains = create_train();
  crossing = new Crossing(width/4, ground);
}

void draw() {
  background(0, 0, 10);
  for (Train t : trains) {
    t.move();
  }
  if (width+1000<trains.get(trains.size()-1).x) {
    trains = create_train();
  }
  crossing.draw(
    trains.get(0).x,
    trains.get(trains.size()-1).x);
}

ArrayList<Train> create_train() {
  ArrayList<Train> result = new ArrayList<Train>();
  int train_amount = int(random(10));
  int train_width = 400;
  float leadingX = -1000;
  float speed = random(5, 25);
  color c = color(random(360), 5, 10);
  for(int i=0; i<train_amount; i++) {
    leadingX = leadingX-train_width-5;
    result.add(new Train(
      c, train_width, 150,
      leadingX, ground, speed));
  }
  return result;
}
