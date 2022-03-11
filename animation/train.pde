class Train {
  private color c;
  private float x, y;
  private int w, h;
  private float vx;
  private float wheel_radius;
  private Wheel[] wheels;

  public Train(color c, int w, int h, float x, float y, float vx) {
    this.c = c;
    this.w = w;
    this.h = h;
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.wheel_radius = 25;
    this.wheels = new Wheel[] {
      new Wheel(c, x-w/4-this.wheel_radius, y+h/2+this.wheel_radius, vx),
      new Wheel(c, x-w/4+this.wheel_radius, y+h/2+this.wheel_radius, vx),
      new Wheel(c, x+w/4-this.wheel_radius, y+h/2+this.wheel_radius, vx),
      new Wheel(c, x+w/4+this.wheel_radius, y+h/2+this.wheel_radius, vx),
    };
  }

  public void move() {
    this.x += this.vx;
    drawBody();
    drawWheel();
  }

  private void drawBody() {
    stroke(this.c);
    strokeWeight(5);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h, 10);
    line(this.x-200, this.y+50, this.x+200, this.y+50);
    drawWindow();
  }

  private void drawWindow() {
    rect(this.x-100-50, this.y-15, 50, 70, 10);
    line(this.x-175, this.y-20, this.x-125, this.y-20);
    rect(this.x-50, this.y-15, 50, 70, 10);
    line(this.x-75, this.y-20, this.x-25, this.y-20);
    rect(this.x+50, this.y-15, 50, 70, 10);
    line(this.x+25, this.y-20, this.x+75, this.y-20);
    rect(this.x+100+50, this.y-15, 50, 70, 10);
    line(this.x+125, this.y-20, this.x+175, this.y-20);
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
  private float y;
  private float vx;

  public Wheel(color c, float x, float y, float vx) {
    this.c = c;
    this.x = x;
    this.y = y;
    this.vx = vx;
  }

  public void move() {
    this.x += this.vx;
    stroke(this.c);
    strokeWeight(5);
    ellipseMode(CENTER);
    // wheel
    ellipse(this.x, this.y, 50, 50);
    // axle
    ellipse(this.x, this.y, 10, 10);
    arc(this.x, this.y, 30, 30, this.x/25, this.x/25+PI/2, OPEN);
  }
}
