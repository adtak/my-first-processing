BulletTrains2 bulletTrains;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  bulletTrains = new BulletTrains2(
    color(0, 4, 10), 800, 200, width/2, height*0.8, 0, 0
  );
}

void draw() {
  // lc.moveBackground(vx);
  // lc.moveForeground(vx);
  background(0, 0, 10);
  bulletTrains.move(0, 0, 0);
}

void save() {
  if (frameCount < 30*60*6) {
    saveFrame("frames/#####.png");
  }
}
