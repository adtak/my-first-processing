class Crossing {
  private float x, ground;
  private final float DEFAULT_BARRIER_ANGLE = -PI*4/9;

  public Crossing(float x, float ground) {
    this.x = x;
    this.ground = ground;
  }

  public void draw(float objectHead, float objectTail) {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(0, 0, 10);
    rectMode(CENTER);
    ellipseMode(CENTER);

    float barrierAngle = calcBarrierAngle(objectHead, objectTail);
    drawBarrier(barrierAngle);
    drawBase();
    drawSign();
    drawLight(barrierAngle);
  }

  private void drawBase() {
    fill(0, 0, 6);
    rect(
      this.x, this.ground-15,
      100, 30,
      10, 10, 0, 0);

    fill(50, 3, 10);
    rect(
      this.x, this.ground-30-50,
      30, 100,
      10, 10, 0, 0);
    fill(0, 0, 6);
    rect(
      this.x, this.ground-30-50-20,
      30, 20);
    rect(
      this.x, this.ground-30-50+20,
      30, 20);

    fill(50, 3, 10);
    rect(
      this.x, this.ground-30-100-75,
      10, 150,
      10, 10, 0, 0);
    fill(0, 0, 6);
    rect(
      this.x, this.ground-30-100-75-20,
      10, 30);
    rect(
      this.x, this.ground-30-100-75+60,
      10, 30);
  }

  private void drawSign() {
    pushMatrix();
    translate(this.x, this.ground-30-100-150);
    rotate(PI/4);
    fill(50, 3, 10);
    rect(0, 0, 175, 25, 10);
    fill(0, 0, 6);
    rect(0, 0, 25, 25);
    rect(-50, 0, 25, 25);
    rect(50, 0, 25, 25);
    rotate(-PI*2/4);
    fill(50, 3, 10);
    rect(0, 0, 175, 25, 10);
    fill(0, 0, 6);
    rect(0, 0, 25, 25);
    rect(-50, 0, 25, 25);
    rect(50, 0, 25, 25);
    popMatrix();
  }

  private void drawLight(float barrierAngle) {
    float y = this.ground-30-100;
    y -= 60;
    fill(0, 0, 6);
    rect(this.x, y, 100, 10, 10);
    fill(0, 0, 6);
    ellipse(this.x-50, y, 40, 40);
    ellipse(this.x+50, y, 40, 40);
    if(this.DEFAULT_BARRIER_ANGLE<barrierAngle) {
      if(millis()/500%2==0) {
        fill(0, 5, 10);
        ellipse(this.x-50, y, 20, 20);
        fill(0, 0, 10);
        ellipse(this.x+50, y, 20, 20);
      } else {
        fill(0, 5, 10);
        ellipse(this.x+50, y, 20, 20);
        fill(0, 0, 10);
        ellipse(this.x-50, y, 20, 20);
      }
    } else {
      fill(0, 0, 10);
      ellipse(this.x-50, y, 20, 20);
      ellipse(this.x+50, y, 20, 20);
    }
  }

  private void drawBarrier(float barrierAngle) {
    float y = this.ground-30-100;
    y += 15;
    pushMatrix();
    translate(this.x, y);
    rotate(barrierAngle);
    fill(50, 3, 10);
    rect(150, 0, 300, 25, 10);
    fill(0, 0, 6);
    rect(50, 0, 25, 25);
    rect(100, 0, 25, 25);
    rect(150, 0, 25, 25);
    rect(200, 0, 25, 25);
    rect(250, 0, 25, 25);
    popMatrix();
  }

  private float calcBarrierAngle(float objectHead, float objectTail) {
    float barrierRotate;
    float threshold = 300;
    // buffer
    objectHead += 800;
    objectTail -= 800;
    if(objectHead<this.x && abs(this.x-objectHead)<threshold) {
      return -PI*4/9*(this.x-objectHead)/threshold;
    } else if(this.x<objectTail && abs(objectTail-this.x)<threshold) {
      return -PI*4/9*(objectTail-this.x)/threshold;
    } else if(objectTail<=this.x && this.x<=objectHead) {
      return 0;
    } else {
      return this.DEFAULT_BARRIER_ANGLE;
    }
  }
}
