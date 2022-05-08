class Train {
  private color c;
  private float x, y, ground;
  private int w, h;
  private float vx;
  private Wheel[] wheels;

  public Train(color c, int w, int h, float x, float ground, float vx) {
    float wheelSize = 20;
    this.c = c;
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = ground-wheelSize*2-h/2;
    this.vx = vx;
    this.wheels = new Wheel[] {
      new Wheel(c, x-w/4-wheelSize, ground, wheelSize, vx),
      new Wheel(c, x-w/4+wheelSize, ground, wheelSize, vx),
      new Wheel(c, x+w/4-wheelSize, ground, wheelSize, vx),
      new Wheel(c, x+w/4+wheelSize, ground, wheelSize, vx),
    };
  }

  public void move() {
    this.x += this.vx;
    drawBody();
    drawWheel();
  }

  private void drawBody() {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h, 10);
    line(this.x-this.w/2, this.y+this.h/3, this.x+this.w/2, this.y+this.h/3);
    drawWindows();
  }

  private void drawWindows() {
    drawWindow(this.x-this.w*3/8, this.y-this.h/10);
    drawWindow(this.x-this.w/8, this.y-this.h/10);
    drawWindow(this.x+this.w/8, this.y-this.h/10);
    drawWindow(this.x+this.w*3/8, this.y-this.h/10);
  }

  private void drawWindow(float x, float y) {
    fill(0, 0, 9.9);
    float windowWidth = this.w/8;
    float windowHeight = this.h/2;
    rect(x, y, windowWidth, windowHeight, 10);
    line(x-windowWidth/2, y-windowHeight/4, x+windowWidth/2, y-windowHeight/4);
  }

  private void drawWheel() {
    for (Wheel wheel : this.wheels) {
      wheel.move();
    }
  }
}

class Wheel {
  private color c;
  private float x;
  private float ground;
  private float radius;
  private float vx;

  public Wheel(color c, float x, float ground, float radius, float vx) {
    this.c = c;
    this.x = x;
    this.ground = ground;
    this.radius = radius;
    this.vx = vx;
  }

  public void move() {
    this.x += this.vx;
    float y = this.ground-this.radius;
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(0, 0, 9);
    ellipseMode(CENTER);
    // wheel
    ellipse(this.x, y, this.radius*2, this.radius*2);
    // axle
    ellipse(
      this.x, y,
      this.radius*2/5, this.radius*2/5);
    arc(
      this.x, y,
      this.radius*6/5, this.radius*6/5,
      this.x/25, this.x/25+PI/2, OPEN);
  }
}
