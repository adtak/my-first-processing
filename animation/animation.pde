SL sl;

void setup() {
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  sl = createSL();
}

void draw() {
  background(0, 0, 10);
  sl.move(0, 0);
  if(width < sl.x-250) {
    sl = createSL();
  }
}

SL createSL() {
  color c = color(0, 0, 10);
  float x = -250;
  float y = height*0.8;
  int w = 500;
  int h = 150;
  return new SL(c, w, h, x, y, 10, 0);
}
