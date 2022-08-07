LandscapeController lc;
float vx;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  lc = new LandscapeController(height*0.7, lines);
  vx = -20;
}

void draw() {
  // lc.moveBackground(vx);
  // lc.moveForeground(vx);
  background(0, 0, 10);
}

void save() {
  if (frameCount < 30*60*6) {
    saveFrame("frames/#####.png");
  }
}
