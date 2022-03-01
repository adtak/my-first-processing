float x;
float y;

void setup() {
  size(600, 600);
  noStroke();
  fill(0, 0, 0);
  x = 300;
  y = 300;
}

void draw() {
  background(255, 255, 255);
  x = x + random(-10, +10);
  y = y + random(-10, +10);
  ellipse(x, y, 100, 100);
}