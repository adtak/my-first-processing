class Trains {
  private ArrayList<Train> cars;

  public Trains(
    color c, int w, int h, float xInit, float ground,
    float speed, int trainAmount
) {
    this.cars = new ArrayList<Train>();
    float jointWidth = 10;
    for(int i=0; i<trainAmount; i++) {
      float x = xInit-w*i-jointWidth*i;
      if(i == trainAmount-1) {
        jointWidth = 0;
      }
      cars.add(new Train(
        c, w, h, x, ground, speed, jointWidth
      ));
    }
  }

  public void move() {
    for (Train t : this.cars) {
      t.move();
    }
  }
}

class Train {
  private color c;
  private float x, y, yDefault;
  private int w, h;
  private float vx, vy;
  private Wheel[] wheels;
  private float jointWidth;

  public Train(
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
        ground, wheelSize,
        vx, 0),
      new Wheel(
        c,
        x-w/4+wheelSize, ground-wheelSize,
        ground, wheelSize,
        vx, 0),
      new Wheel(
        c,
        x+w/4-wheelSize, ground-wheelSize,
        ground, wheelSize,
        vx, 0),
      new Wheel(
        c,
        x+w/4+wheelSize, ground-wheelSize,
        ground, wheelSize,
        vx, 0),
    };
    this.jointWidth = jointWidth;
  }

  public void move() {
    if (this.y < this.yDefault) {
      this.vy += 0.5;
      this.y = min(this.yDefault, this.y);
    } else {
      this.vy = 0;
      if (random(1) > 0.98) {
        this.vy = -20;
      }
    }
    this.x += this.vx;
    this.y += this.vy;
    drawBody();
    for (Wheel w : this.wheels) {
      w.vx = this.vx;
      w.vy = this.vy;
    }
    drawWheel();
    drawJoint();
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
    float windowWidth = this.w/8;
    float windowHeight = this.h/2;
    fill(190, 0.5, 10);
    rect(x, y, windowWidth, windowHeight, 10);
    line(x-windowWidth/2, y-windowHeight/4, x+windowWidth/2, y-windowHeight/4);
  }

  private void drawWheel() {
    for (Wheel wheel : this.wheels) {
      wheel.move();
    }
  }

  private void drawJoint() {
    rect(
      this.x-this.w/2-this.jointWidth/2, this.y,
      this.jointWidth, this.h*0.8,
      10);
  }
}

class Wheel {
  private color c;
  private float x, y;
  private float ground;
  private float radius;
  private float vx, vy;

  public Wheel(
    color c, float x, float y,
    float ground, float radius,
    float vx, float vy
  ) {
    this.c = c;
    this.x = x;
    this.y = y;
    this.ground = ground;
    this.radius = radius;
    this.vx = vx;
    this.vy = vy;
  }

  public void move() {
    this.x += this.vx;
    this.y += this.vy;
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(0, 0, 9);
    ellipseMode(CENTER);
    // wheel
    ellipse(this.x, this.y, this.radius*2, this.radius*2);
    // axle
    ellipse(
      this.x, this.y,
      this.radius*2/5, this.radius*2/5);
    arc(
      this.x, this.y,
      this.radius*6/5, this.radius*6/5,
      this.x/25, this.x/25+PI/2, OPEN);
  }
}
