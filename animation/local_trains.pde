class LocalTrains {
  private ArrayList<LocalTrain> trains;

  public LocalTrains(
    color c, int w, int h, float xInit, float ground,
    float speed, int trainAmount
) {
    this.trains = new ArrayList<LocalTrain>();
    float jointWidth = 10;
    for(int i=0; i<trainAmount; i++) {
      float x = xInit-w*i-jointWidth*i;
      if(i == trainAmount-1) {
        jointWidth = 0;
      }
      this.trains.add(new LocalTrain(
        c, w, h, x, ground, speed, jointWidth
      ));
    }
  }

  public void move(float jumpRate) {
    for (LocalTrain t : this.trains) {
      t.move(jumpRate);
    }
  }
}

class LocalTrain extends AbstractTrain {
  public LocalTrain(
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
        x+w/4-wheelSize, ground-wheelSize,
        wheelSize),
      new Wheel(
        c,
        x+w/4+wheelSize, ground-wheelSize,
        wheelSize),
    };
    this.jointWidth = jointWidth;
  }

  protected void drawBody() {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h, 10);
    line(this.x-this.w/2, this.y+this.h/3, this.x+this.w/2, this.y+this.h/3);
    drawWindows();
  }
}
