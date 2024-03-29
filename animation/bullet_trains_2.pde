class BulletTrains2 extends AbstractTrains {
  public BulletTrains2(
    color c, int w, int h, float xInit, float ground,
    float vx, int trainAmount
  ) {
    this.trains = new ArrayList<AbstractTrain>();
    float jointWidth = 10;
    float x = xInit;
    this.trains.add(
      new BulletTrainHead2(c, w, h, x, ground, vx, jointWidth)
    );
    for(int i=0; i<trainAmount; i++) {
      x = x-w-jointWidth;
      this.trains.add(
        new BulletTrainMiddle2(c, w, h, x, ground, vx, jointWidth)
      );
    }
    x = x-w-jointWidth;
    this.trains.add(
      new BulletTrainTail2(c, w, h, x, ground, vx)
    );
  }
}

class BulletTrainHead2 extends AbstractTrain {
  public BulletTrainHead2(
    color c,
    int w, int h,
    float x, float ground,
    float vx,
    float jointWidth
  ) {
    float wheelRadius = 20;
    this.c = c;
    this.w = w;
    this.h = h;
    this.yDefault = ground-wheelRadius*2-h/2;
    this.x = x;
    this.y = this.yDefault;
    this.vx = vx;
    this.vy = 0;
    this.wheels = new Wheel[] {
      new Wheel(
        x-w*0.5+wheelRadius*4, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x-w*0.5+wheelRadius*6, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x+w*0.5-wheelRadius*12, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x+w*0.5-wheelRadius*14, ground-wheelRadius,
        wheelRadius),
    };
    this.jointWidth = jointWidth;
  }

  protected void drawBody() {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);

    beginShape();
    vertex(this.x-this.w*0.5, this.y-this.h*0.5);
    vertex(this.x-this.w*0.1, this.y-this.h*0.5);
    bezierVertex(
      this.x-this.w*0.05, this.y-this.h*0.5,
      this.x-this.w*0.05, this.y-this.h*0.5,
      this.x, this.y-this.h*0.4
    );
    bezierVertex(
      this.x+this.w*0.1, this.y-this.h*0.4,
      this.x+this.w*0.2, this.y-this.h*0.25,
      this.x+this.w*0.25, this.y-this.h*0.1
    );
    bezierVertex(
      this.x+this.w*0.5, this.y+this.h*0.05,
      this.x+this.w*0.5, this.y+this.h*0.2,
      this.x+this.w*0.5, this.y+this.h*0.3
    );
    bezierVertex(
      this.x+this.w*0.5, this.y+this.h*0.5,
      this.x+this.w*0.4, this.y+this.h*0.5,
      this.x+this.w*0.4, this.y+this.h*0.5
    );
    vertex(this.x-this.w*0.5, this.y+this.h*0.5);
    endShape(CLOSE);

    fill(0, 0, 10);
    beginShape();
    vertex(this.x-this.w*0.5, this.y+this.h*0.15);
    vertex(this.x, this.y+this.h*0.15);
    bezierVertex(
      this.x+this.w*0.1, this.y+this.h*0.15,
      this.x+this.w*0.15, this.y+this.h*0.15,
      this.x+this.w*0.2, this.y+this.h*0.25
    );
    vertex(this.x+this.w*0.5, this.y+this.h*0.3);
    bezierVertex(
      this.x+this.w*0.5, this.y+this.h*0.5,
      this.x+this.w*0.4, this.y+this.h*0.5,
      this.x+this.w*0.4, this.y+this.h*0.5
    );
    vertex(this.x-this.w*0.5, this.y+this.h*0.5);
    endShape(CLOSE);

    fill(0, 0, 6);
    beginShape();
    vertex(this.x, this.y-this.h*0.4);
    bezierVertex(
      this.x+this.w*0.1, this.y-this.h*0.4,
      this.x+this.w*0.2, this.y-this.h*0.25,
      this.x+this.w*0.25, this.y-this.h*0.1
    );
    vertex(this.x+this.w*0.1, this.y-this.h*0.13);
    endShape(CLOSE);

    drawWindows();
  }

  protected void drawWindows() {
    drawWindow(this.x-this.w*0.5*7.5/9, this.y-this.h/10);
    drawWindow(this.x-this.w*0.5*5.5/9, this.y-this.h/10);
    drawWindow(this.x-this.w*0.5*3.5/9, this.y-this.h/10);
    drawWindow(this.x-this.w*0.5*1.5/9, this.y-this.h/10);
  }

  protected void drawWindow(float x, float y) {
    float windowWidth = this.w*0.5/9;
    float windowHeight = this.h*0.3;
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(190, 0.5, 10);
    rectMode(CENTER);
    rect(x, y, windowWidth, windowHeight, 10);
    line(x-windowWidth/2, y-windowHeight/4, x+windowWidth/2, y-windowHeight/4);
  }
}

class BulletTrainTail2 extends AbstractTrain {
  public BulletTrainTail2(
    color c,
    int w, int h,
    float x, float ground,
    float vx
  ) {
    float wheelRadius = 20;
    this.c = c;
    this.w = w;
    this.h = h;
    this.yDefault = ground-wheelRadius*2-h/2;
    this.x = x;
    this.y = this.yDefault;
    this.vx = vx;
    this.vy = 0;
    this.wheels = new Wheel[] {
      new Wheel(
        x+w*0.5-wheelRadius*4, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x+w*0.5-wheelRadius*6, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x-w*0.5+wheelRadius*12, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x-w*0.5+wheelRadius*14, ground-wheelRadius,
        wheelRadius),
    };
    this.jointWidth = 0;
  }

  protected void drawBody() {
    stroke(0, 0, 5);
    strokeWeight(5);

    fill(this.c);
    beginShape();
    vertex(this.x+this.w*0.5, this.y-this.h*0.5);
    vertex(this.x+this.w*0.1, this.y-this.h*0.5);
    bezierVertex(
      this.x+this.w*0.05, this.y-this.h*0.5,
      this.x+this.w*0.05, this.y-this.h*0.5,
      this.x, this.y-this.h*0.4
    );
    bezierVertex(
      this.x-this.w*0.1, this.y-this.h*0.4,
      this.x-this.w*0.2, this.y-this.h*0.25,
      this.x-this.w*0.25, this.y-this.h*0.1
    );
    bezierVertex(
      this.x-this.w*0.5, this.y+this.h*0.05,
      this.x-this.w*0.5, this.y+this.h*0.2,
      this.x-this.w*0.5, this.y+this.h*0.3
    );
    bezierVertex(
      this.x-this.w*0.5, this.y+this.h*0.5,
      this.x-this.w*0.4, this.y+this.h*0.5,
      this.x-this.w*0.4, this.y+this.h*0.5
    );
    vertex(this.x+this.w*0.5, this.y+this.h*0.5);
    endShape(CLOSE);

    fill(0, 0, 10);
    beginShape();
    vertex(this.x+this.w*0.5, this.y+this.h*0.15);
    vertex(this.x, this.y+this.h*0.15);
    bezierVertex(
      this.x-this.w*0.1, this.y+this.h*0.15,
      this.x-this.w*0.15, this.y+this.h*0.15,
      this.x-this.w*0.2, this.y+this.h*0.25
    );
    vertex(this.x-this.w*0.5, this.y+this.h*0.3);
    bezierVertex(
      this.x-this.w*0.5, this.y+this.h*0.5,
      this.x-this.w*0.4, this.y+this.h*0.5,
      this.x-this.w*0.4, this.y+this.h*0.5
    );
    vertex(this.x+this.w*0.5, this.y+this.h*0.5);
    endShape(CLOSE);

    fill(0, 0, 6);
    beginShape();
    vertex(this.x, this.y-this.h*0.4);
    bezierVertex(
      this.x-this.w*0.1, this.y-this.h*0.4,
      this.x-this.w*0.2, this.y-this.h*0.25,
      this.x-this.w*0.25, this.y-this.h*0.1
    );
    vertex(this.x-this.w*0.1, this.y-this.h*0.13);
    endShape(CLOSE);

    drawWindows();
  }

  protected void drawWindows() {
    drawWindow(this.x+this.w*0.5*7.5/9, this.y-this.h/10);
    drawWindow(this.x+this.w*0.5*5.5/9, this.y-this.h/10);
    drawWindow(this.x+this.w*0.5*3.5/9, this.y-this.h/10);
    drawWindow(this.x+this.w*0.5*1.5/9, this.y-this.h/10);
  }

  protected void drawWindow(float x, float y) {
    float windowWidth = this.w*0.5/9;
    float windowHeight = this.h*0.3;
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(190, 0.5, 10);
    rectMode(CENTER);
    rect(x, y, windowWidth, windowHeight, 10);
    line(x-windowWidth/2, y-windowHeight/4, x+windowWidth/2, y-windowHeight/4);
  }

  protected void drawJoint() {
    // ovverride do nothing
  }
}

class BulletTrainMiddle2 extends AbstractTrain {
  public BulletTrainMiddle2(
    color c,
    int w, int h,
    float x, float ground,
    float vx,
    float jointWidth
  ) {
    float wheelRadius = 20;
    this.c = c;
    this.w = w;
    this.h = h;
    this.yDefault = ground-wheelRadius*2-h/2;
    this.x = x;
    this.y = this.yDefault;
    this.vx = vx;
    this.vy = 0;
    this.wheels = new Wheel[] {
      new Wheel(
        x-w/4-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x-w/4+wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x+w/4-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        x+w/4+wheelRadius, ground-wheelRadius,
        wheelRadius),
    };
    this.jointWidth = jointWidth;
  }

  protected void drawBody() {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h, 10);
    fill(0, 0, 10);
    rect(this.x, this.y+this.h*0.33, this.w, this.h*0.34, 0, 0, 10, 10);
    drawWindows();
  }

    protected void drawWindows() {
    float windowWidth = this.w*0.5/9;
    float windowGap = (this.w-windowWidth*8)/9;
    drawWindow(this.x-windowWidth*3.5-windowGap*3.5, this.y-this.h/10);
    drawWindow(this.x-windowWidth*2.5-windowGap*2.5, this.y-this.h/10);
    drawWindow(this.x-windowWidth*1.5-windowGap*1.5, this.y-this.h/10);
    drawWindow(this.x-windowWidth*0.5-windowGap*0.5, this.y-this.h/10);
    drawWindow(this.x+windowWidth*0.5+windowGap*0.5, this.y-this.h/10);
    drawWindow(this.x+windowWidth*1.5+windowGap*1.5, this.y-this.h/10);
    drawWindow(this.x+windowWidth*2.5+windowGap*2.5, this.y-this.h/10);
    drawWindow(this.x+windowWidth*3.5+windowGap*3.5, this.y-this.h/10);
  }

  protected void drawWindow(float x, float y) {
    float windowWidth = this.w*0.5/9;
    float windowHeight = this.h*0.3;
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(190, 0.5, 10);
    rectMode(CENTER);
    rect(x, y, windowWidth, windowHeight, 10);
    line(x-windowWidth/2, y-windowHeight/4, x+windowWidth/2, y-windowHeight/4);
  }
}
