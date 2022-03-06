class Train {
  private color c;
  private float x;
  private float y;
  private float vx;
  private Wheel[] wheels;

  public Train(color c, float x, float y, float vx) {
    this.c = c;
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.wheels = new Wheel[] {
      new Wheel(c, x-100-25, y+75+25, vx),
      new Wheel(c, x-100+25, y+75+25, vx),
      new Wheel(c, x+100-25, y+75+25, vx),
      new Wheel(c, x+100+25, y+75+25, vx),
    };
  }

  public void move() {
    this.x += this.vx;
    moveBody();
    moveWheel();
  }

  private void moveBody() {
    stroke(this.c);
    strokeWeight(5);
    rectMode(CENTER);
    rect(this.x, this.y, 400, 150, 10);
    line(this.x-200, this.y+50, this.x+200, this.y+50);
    // window
    rect(this.x-100-50, this.y-15, 50, 70, 10);
    line(this.x-175, this.y-20, this.x-125, this.y-20);
    rect(this.x-50, this.y-15, 50, 70, 10);
    line(this.x-75, this.y-20, this.x-25, this.y-20);
    rect(this.x+50, this.y-15, 50, 70, 10);
    line(this.x+25, this.y-20, this.x+75, this.y-20);
    rect(this.x+100+50, this.y-15, 50, 70, 10);
    line(this.x+125, this.y-20, this.x+175, this.y-20);
  }

  private void moveWheel() {
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

Train train;

void setup() {
  size(1200, 800);
  colorMode(HSB, 360, 10, 10);
  train = new Train(color(random(360), 5, 10), -500, height/2, 2);
}

void draw() {
  background(0, 0, 10);
  train.move();
  if (width+500<train.x) {
    train = new Train(color(random(360), 5, 10), -500, height/2, 2);
  }
}