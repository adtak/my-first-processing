class SL extends AbstractTrain {
  color cSub;
  ArrayList<Smoke> smoke;

  public SL(
    float colorV1,
    int w, int h,
    float x, float ground,
    float vx,
    float jointWidth
  ) {
    float wheelSize = 20;
    this.c = color(colorV1, 4, 10);
    this.cSub = color(colorV1-20, 4, 10);
    this.w = w;
    this.h = h;
    this.yDefault = ground-wheelSize*2-h/2;
    this.x = x;
    this.y = this.yDefault;
    this.vx = vx;
    this.vy = 0;
    this.wheels = new Wheel[] {
      new Wheel(this.x-this.w/2+this.w*3/8+this.w/20, this.y+this.h/2, this.w/4*0.4),
      new Wheel(this.x-this.w/2+this.w/8+this.w/20, this.y+this.h/2, this.w/4*0.4),
      new Wheel(this.x+this.w/3, this.y+this.h/2+this.w/4*0.4-this.w/6*0.4, this.w/6*0.4),
    };
    this.jointWidth = jointWidth;
    this.smoke = new ArrayList();
  }

  protected void drawBody() {
    rectMode(CENTER);
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, 0, 10, 10, 10);
    fill(color(0, 0, 8));
    arc(
      this.x-this.w/2+this.w*3/8+this.w/20, this.y+this.h/2,
      this.w/4*0.9, this.w/4*0.9,
      PI, TWO_PI);
    arc(
      this.x-this.w/2+this.w/8+this.w/20, this.y+this.h/2,
      this.w/4*0.9, this.w/4*0.9,
      PI, TWO_PI);
    arc(
      this.x+this.w/3, this.y+this.h/2+this.w/4*0.4-this.w/6*0.4,
      this.w/6, this.w/6,
      PI*1.1, TWO_PI*0.95);
    fill(this.c);
    rect(this.x+this.w/2+5, this.y, 10, this.h*0.8, 0, 50, 50, 0);
    line(this.x+this.w/2*0.9, this.y, this.x+this.w/8, this.y);

    float wChimney = this.w/8;
    float hChimney = this.h*0.8;
    float xChimney = this.x+this.w/3;
    float yChimney = this.y-this.h/2-hChimney/2;
    fill(this.cSub);
    rect(xChimney, yChimney, wChimney, hChimney, 10, 10, 0, 0);
    rect(xChimney, yChimney-hChimney/2, wChimney+10, 30, 10);

    fill(this.cSub);
    rect(this.x-w/4, this.y-this.h, this.w/2, this.h);
    fill(color(0, 0, 8));
    rect(this.x-w/4, this.y-this.h*3/2-5, this.w/2+10, 30, 10, 10, 0, 0);

    drawWindows();
    drawSmoke(xChimney, yChimney-hChimney/2-30);
  }

  protected void drawWindows() {
    fill(190, 0.5, 10);
    float wFrontWindow = this.w/2*0.4;
    float xFrontWindow = this.x-this.w/2*0.3/3-wFrontWindow/2;
    float wBackWindow = this.w/2*0.3;
    float xBackWindow = this.x-this.w/2+this.w/2*0.3/3+wBackWindow/2;
    float yWindow = this.y-this.h;
    rect(xFrontWindow, yWindow, wFrontWindow, h*0.6, 10, 10, 0, 0);
    rect(xBackWindow, yWindow, wBackWindow, h*0.6, 10, 10, 0, 0);
  }

  protected void drawSmoke(float x, float y) {
    ArrayList<Smoke> newSmoke = new ArrayList();
    for (Smoke s : this.smoke) {
      s.vx += random(-0.05, 0);
      s.vy += random(-0.001, 0);
      s.draw();
      if (0<s.x && 0<s.y) {
        newSmoke.add(s);
      }
    }
    int len = int(random(10));
    for (int i=0; i<len; i++) {
      smoke.add(new Smoke(x, y));
    }
  }
}

class Smoke {
  float x;
  float y;
  float vx;
  float vy;
  float diameter;
  color c;

  public Smoke(float x, float y) {
    this.x = x;
    this.y = y;
    this.vx = random(-1, -0.5);
    this.vy = random(-1, 0);
    this.diameter = random(10, 100);
    this.c = color(0, 0, 7, 20);
  }

  public void draw() {
    this.x += this.vx;
    this.y += this.vy;
    fill(this.c);
    noStroke();
    ellipse(this.x, this.y, this.diameter, this.diameter);
  }
}
