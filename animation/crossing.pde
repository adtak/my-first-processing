class Crossing {
  private float x, ground;

  public Crossing(float x, float ground) {
    this.x = x;
    this.ground = ground;
  }

  public void draw(float objectHead, float objectTail) {
    stroke(0, 0, 5);
    strokeWeight(5);
    rectMode(CENTER);
    ellipseMode(CENTER);

    drawBarrier(objectHead, objectTail);
    drawBase();
    drawSign();
    drawLight();
  }

  private void drawBase() {
    rect(
      this.x, this.ground-15,
      100, 30,
      10, 10, 0, 0);
    rect(
      this.x, this.ground-30-50,
      30, 100,
      10, 10, 0, 0);
    rect(
      this.x, this.ground-30-100-75,
      10, 150,
      10, 10, 0, 0);
  }

  private void drawSign() {
    pushMatrix();
    translate(this.x, this.ground-30-100-150);
    rotate(PI/4);
    rect(0, 0, 150, 25, 10);
    rotate(PI/2);
    rect(0, 0, 150, 25, 10);
    popMatrix();
  }

  private void drawLight() {
    float y = this.ground-30-100;
    y -= 60;
    rect(this.x, y, 100, 10, 10);
    ellipse(this.x-50, y, 40, 40);
    ellipse(this.x+50, y, 40, 40);
    ellipse(this.x-50, y, 20, 20);
    ellipse(this.x+50, y, 20, 20);
  }

  private void drawBarrier(float objectHead, float objectTail) {
    float y = this.ground-30-100;
    y += 15;
    float threshold = 300;
    objectHead += 800;
    objectTail -= 800;
    pushMatrix();
    translate(this.x, y);
    if(objectHead<this.x && abs(this.x-objectHead)<threshold) {
      rotate(-PI*4/9*(this.x-objectHead)/threshold);
    } else if(this.x<objectTail && abs(objectTail-this.x)<threshold) {
      rotate(-PI*4/9*(objectTail-this.x)/threshold);
    } else if(objectTail<=this.x && this.x<=objectHead) {
      rotate(0);
    } else {
      rotate(-PI*4/9);
    }
    rect(150, 0, 300, 25, 10);
    popMatrix();
  }
}
