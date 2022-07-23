LandscapeController lc;
float vx;
float start_h;
ArrayList<Float> rains;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ArrayList<Float> lines = new ArrayList();
  lines.add(height*0.8);
  lc = new LandscapeController(height*0.7, lines);
  vx = -20;
  start_h = 0;
}

void draw() {
  // lc.moveBackground(vx);
  // lc.moveForeground(vx);
  background(0, 0, 10);
  start_h += 10;

  line(width/2, start_h, width/2, start_h+100);
}

void save() {
  if (frameCount < 30*60*6) {
    saveFrame("frames/#####.png");
  }
}
