abstract class AbstractTrains {
  protected ArrayList<AbstractTrain> trains;

  protected void move(float jumpRate, int minJumpVelocity, int maxJumpVelocity) {
    for (AbstractTrain t : this.trains) {
      t.move(jumpRate, random(minJumpVelocity, maxJumpVelocity), 0);
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

  public void move(float jumpRate, float jumpVelocity, float idling) {
    if (this.y < this.yDefault) {
      this.vy += 0.5;
    } else {
      this.vy = 0;
      if (random(1) < jumpRate) {
        this.vy = jumpVelocity;
      }
    }
    this.x += this.vx;
    float yBefore = this.y;
    this.y += this.vy;
    this.y = min(this.yDefault, this.y);
    this.vy = this.y - yBefore;
    drawBody();
    drawWheel(idling);
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

  protected void drawWheel(float idling) {
    for (Wheel wheel : this.wheels) {
      wheel.x += this.vx;
      wheel.y += this.vy;
      wheel.draw(idling);
    }
  }
}
