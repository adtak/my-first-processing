int rect_width = 100;
int rect_height = 25;
int x = rect_width;
int direction = 1;
int speed = 1;

void setup() {
  size(1200, 200);
  frameRate(60);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(193, 248, 207);
  x += direction * speed;
  if ((x<rect_width) || (width-rect_width<x)) {
    direction *= -1;
  }
  noStroke();
  fill(72, 143, 177);
  rect(x, 100, rect_width*2, rect_height*2);
  fill(79, 211, 196);
  rect(x, 120, rect_width*2, 5);
  int[] pos = {-85, -70, -35, -20, 20, 35, 70, 85};
  for (int p : pos) {
    rect(x+p, 95, 10, 20);
  }
}
