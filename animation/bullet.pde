class BulletTrain {
  private color c;
  private float x, y, yDefault;
  private int w, h;
  private float vx, vy;
  private Wheel[] wheels;
  private float jointWidth;

  public BulletTrain(
    color c,
    int w, int h,
    float x, float ground,
    float vx,
    float jointWidth
  ) {
    float wheelSize = 20;
    this.c = c;
    this.w = w;
    this.h = h;
    this.yDefault = ground-wheelSize*2-h/2;
    this.x = x;
    this.y = this.yDefault;
    this.vx = vx;
    this.vy = 0;
    this.wheels = new Wheel[] {
      new Wheel(
        c,
        x-w/4-wheelSize, ground-wheelSize,
        wheelSize),
      new Wheel(
        c,
        x-w/4+wheelSize, ground-wheelSize,
        wheelSize),
      new Wheel(
        c,
        x+w/4+80-wheelSize, ground-wheelSize,
        wheelSize),
      new Wheel(
        c,
        x+w/4+80+wheelSize, ground-wheelSize,
        wheelSize),
    };
    this.jointWidth = jointWidth;
  }

  public void move(float jumpRate) {
    if (this.y < this.yDefault) {
      this.vy += 0.5;
    } else {
      this.vy = 0;
      if (random(1) < jumpRate) {
        this.vy = random(-40, -20);
      }
    }
    this.x += this.vx;
    this.y += this.vy;
    this.y = min(this.yDefault, this.y);
    drawBody();
    drawWheel();
    drawJoint();
  }

  private void drawBody() {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h, 10, 20, 0, 10);
    beginShape();
    vertex(this.x+this.w/2-5, this.y-h/2+5);
    bezierVertex(
      this.x+this.w, this.y+h/2,
      this.x+this.w, this.y+h/2,
      this.x+this.w/2-5, this.y+h/2
    );
    endShape();
    beginShape();
    fill(190, 0.5, 10);
    vertex(this.x+this.w/2+15, this.y-h/2+23);
    vertex(this.x+this.w/2+15, this.y-h/2+23+40);
    vertex(this.x+this.w/2+15+5, this.y-h/2+23+40+5);
    vertex(this.x+this.w/2+15+63, this.y-h/2+23+40+5);
    endShape();
    line(this.x-this.w/2, this.y+this.h/3, this.x+this.w*0.7, this.y+this.h/3);
    drawWindows();
  }

  private void drawWindows() {
    drawWindow(this.x-this.w*3/8, this.y-this.h/10);
    drawWindow(this.x-this.w/8, this.y-this.h/10);
    drawWindow(this.x+this.w/8, this.y-this.h/10);
    drawWindow(this.x+this.w*3/8, this.y-this.h/10);
  }

  private void drawWindow(float x, float y) {
    float windowWidth = this.w/8;
    float windowHeight = this.h/2;
    fill(190, 0.5, 10);
    rect(x, y, windowWidth, windowHeight, 10);
    line(x-windowWidth/2, y-windowHeight/4, x+windowWidth/2, y-windowHeight/4);
  }

  private void drawWheel() {
    for (Wheel wheel : this.wheels) {
      wheel.draw(
        wheel.x+this.vx,
        this.y+this.h/2+wheel.radius
      );
    }
  }

  private void drawJoint() {
    rect(
      this.x-this.w/2-this.jointWidth/2, this.y,
      this.jointWidth, this.h*0.8,
      10);
  }
}