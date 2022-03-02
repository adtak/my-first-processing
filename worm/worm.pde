import java.util.List;
import java.util.ArrayList;

List<RandomPoint> ps;

void setup() {
  size(1440, 800);
  init();
}

void init() {
  background(0);
  ps = new ArrayList<RandomPoint>();
  for(int i=0; i<20; i++) {
    ps.add(new RandomPoint(width/2, height/2, random(-1, 1), random(-1, 1), 2));
  }
}

void draw() {
  for (RandomPoint p : ps) {
    p.move();
  }
}

void mousePressed() {
  init();
}

class RandomPoint {
  private float x, y;
  private float vx, vy;
  private float e;

  public RandomPoint(
    float x, float y, float vx, float vy, float e
  ) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.e = e;
  }

  public void move() {
    this.vx += random(-0.3, 0.3);
    this.vy += random(-0.3, 0.3);
    this.vx *= 0.97;
    this.vy *= 0.97;
    this.x += vx;
    this.y += vy;
    if((this.x-e/2<0) && (this.vx<0)) {
      this.vx *= -1;
    }
    if((width<this.x+this.e/2) && (this.vx>0)) {
      this.vx *= -1;
    }
    if((this.y-this.e/2<0) && (this.vy<0)) {
      this.vy *= -1;
    }
    if((height<this.y+this.e/2) && (this.vy>0)) {
      this.vy *= -1;
    }
    noStroke();
    fill(255, 70);
    ellipse(this.x, this.y, this.e, this.e);
  }
}