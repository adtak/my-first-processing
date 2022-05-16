class Trains {
  private ArrayList<Train> cars;

  public Trains(
    color c, int w, int h, float xInit, float ground,
    float speed, int trainAmount
) {
    this.cars = new ArrayList<Train>();
    float jointWidth = 20;
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
  private float x, y, ground;
  private int w, h;
  private float vx;
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
    this.x = x;
    this.y = ground-wheelSize*2-h/2;
    this.vx = vx;
    this.wheels = new Wheel[] {
      new Wheel(c, x-w/4-wheelSize, ground, wheelSize, vx),
      new Wheel(c, x-w/4+wheelSize, ground, wheelSize, vx),
      new Wheel(c, x+w/4-wheelSize, ground, wheelSize, vx),
      new Wheel(c, x+w/4+wheelSize, ground, wheelSize, vx),
    };
    this.jointWidth = jointWidth;
  }

  public void move() {
    this.x += this.vx;
    drawBody();
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
