float angle;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 10, 10);
  background(0, 0, 10);
  noStroke();
  angle = 0;
}

void draw() {
  angle += 0.01;
  fill(color(random(360), 5, 10));
  ellipse(
    width/2+cos(angle*4)*150,
    height/2+sin(angle*5)*150,
    2, 2
  );
}

void mouseDragged() {
  fill(color(random(360), 5, 10), 40);
  for(int x=0; x<width; x++) {
    float y = height/2+sin((x+mouseX)*0.01)*mouseY;
    rect(x, y, 1, 1);
  }
}
