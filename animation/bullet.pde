class BulletTrains {
  private ArrayList<AbstractTrain> bulletTrains;

  public BulletTrains(
    color c, int w, int h, float xInit, float ground,
    float vx, int trainAmount
  ) {
    this.bulletTrains = new ArrayList<AbstractTrain>();
    float jointWidth = 10;
    float x = xInit;
    this.bulletTrains.add(
      new BulletTrainHead(c, w, h, x, ground, vx, jointWidth)
    );
    for(int i=0; i<trainAmount; i++) {
      x = x-w-jointWidth;
      this.bulletTrains.add(
        new BulletTrainMiddle(c, w, h, x, ground, vx, jointWidth)
      );
    }
    x = x-w-jointWidth;
    this.bulletTrains.add(
      new BulletTrainTail(c, w, h, x, ground, vx)
    );
  }

  public void move(float jumpRate) {
    for (AbstractTrain t : this.bulletTrains) {
      t.move(jumpRate);
    }
  }
}

abstract class AbstractTrain {
  protected color c;
  protected float x, y, yDefault;
  protected int w, h;
  protected float vx, vy;
  protected Wheel[] wheels;
  protected float jointWidth;

  abstract protected void drawBody();

  public void move(float jumpRate) {
    if (this.y < this.yDefault) {
      this.vy += 0.5;
    } else {
      this.vy = 0;
      if (random(1) < jumpRate) {
        this.vy = random(-2, -1);
      }
    }
    this.x += this.vx;
    this.y += this.vy;
    this.y = min(this.yDefault, this.y);
    drawBody();
    drawWheel();
    drawJoint();
  }

  protected void drawWindows() {
    drawWindow(this.x-this.w*3/8, this.y-this.h/10);
    drawWindow(this.x-this.w/8, this.y-this.h/10);
    drawWindow(this.x+this.w/8, this.y-this.h/10);
    drawWindow(this.x+this.w*3/8, this.y-this.h/10);
  }

  protected void drawWindow(float x, float y) {
    float windowWidth = this.w/8;
    float windowHeight = this.h/2;
    fill(190, 0.5, 10);
    rect(x, y, windowWidth, windowHeight, 10);
    line(x-windowWidth/2, y-windowHeight/4, x+windowWidth/2, y-windowHeight/4);
  }

  protected void drawJoint() {
    rect(
      this.x-this.w/2-this.jointWidth/2, this.y,
      this.jointWidth, this.h*0.8,
      10);
  }

  protected void drawWheel() {
    for (Wheel wheel : this.wheels) {
      wheel.draw(
        wheel.x+this.vx,
        this.y+this.h/2+wheel.radius
      );
    }
  }
}

class BulletTrainHead extends AbstractTrain {
  public BulletTrainHead(
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
        c,
        x-w/4-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x-w/4+wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x+w/4+80-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x+w/4+80+wheelRadius, ground-wheelRadius,
        wheelRadius),
    };
    this.jointWidth = jointWidth;
  }

  protected void drawBody() {
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
}

class BulletTrainTail extends AbstractTrain {
  public BulletTrainTail(
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
        c,
        x-w/4-80-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x-w/4-80+wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x+w/4-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x+w/4+wheelRadius, ground-wheelRadius,
        wheelRadius),
    };
    this.jointWidth = 0;
  }

  protected void drawBody() {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);
    rectMode(CENTER);
    rect(this.x, this.y, this.w, this.h, 20, 10, 10, 0);
    beginShape();
    vertex(this.x-this.w/2+5, this.y-h/2+5);
    bezierVertex(
      this.x-(this.w), this.y+h/2,
      this.x-(this.w), this.y+h/2,
      this.x-(this.w/2-5), this.y+h/2
    );
    endShape();
    beginShape();
    fill(190, 0.5, 10);
    vertex(this.x-(this.w/2+15), this.y-h/2+23);
    vertex(this.x-(this.w/2+15), this.y-h/2+23+40);
    vertex(this.x-(this.w/2+15+5), this.y-h/2+23+40+5);
    vertex(this.x-(this.w/2+15+63), this.y-h/2+23+40+5);
    endShape();
    line(this.x+this.w/2, this.y+this.h/3, this.x-this.w*0.7, this.y+this.h/3);
    drawWindows();
  }

  protected void drawJoint() {
    // ovverride do nothing
  }
}

class BulletTrainMiddle extends AbstractTrain {
  public BulletTrainMiddle(
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
        c,
        x-w/4-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x-w/4+wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
        x+w/4-wheelRadius, ground-wheelRadius,
        wheelRadius),
      new Wheel(
        c,
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
    line(this.x-this.w/2, this.y+this.h/3, this.x+this.w/2, this.y+this.h/3);
    drawWindows();
  }
}
