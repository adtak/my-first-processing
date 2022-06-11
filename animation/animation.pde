float noiseScale = 0.01;

void setup() {
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
}

void draw() {
  drawSL();
}

void drawSL() {
  color c = color(0, 0, 10);
  float x = width/2;
  float y = height/2;
  int w = 500;
  int h = 150;
  SL sl = new SL(c, w, h, x, y, 0.0, 0.0);
  sl.move(0, 0);
}
