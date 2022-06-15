class LocalTrains extends AbstractTrains {
  public LocalTrains(
    color c, int w, int h, float xInit, float ground,
    float speed, int trainAmount
  ) {
    this.trains = new ArrayList<AbstractTrain>();
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

  protected void move(float jumpRate, int minJumpVelocity, int maxJumpVelocity) {
    for (AbstractTrain t : this.trains) {
      if(0<t.x && t.x<width && random(1)<0) {
        jumpRate = 1;
        minJumpVelocity = -30;
        maxJumpVelocity = -20;
      }
      t.move(jumpRate, random(minJumpVelocity, maxJumpVelocity), 0);
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
        x-w/4-wheelSize, ground-wheelSize,
        wheelSize),
      new Wheel(
        x-w/4+wheelSize, ground-wheelSize,
        wheelSize),
      new Wheel(
        x+w/4-wheelSize, ground-wheelSize,
        wheelSize),
      new Wheel(
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
    fill(0, 0, 9);
    rect(this.x, this.y-this.h/2+this.h*0.08/2, this.w, this.h*0.08, 10, 10, 0, 0);
    line(
      this.x-this.w/2*0.9, this.y+this.h/2-this.h*0.15,
      this.x+this.w/2*0.9, this.y+this.h/2-this.h*0.15);
    drawWindows();
  }
}
