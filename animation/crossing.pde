class Crossing {
  private float x, ground;

  public Crossing(float x, float ground) {
    this.x = x;
    this.ground = ground;
  }

  public void draw() {
    stroke(0, 0, 5);
    strokeWeight(5);
    rectMode(CENTER);
    ellipseMode(CENTER);

    drawBarrier();
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

  private void drawBarrier() {
    float y = this.ground-30-100;
    y += 15;
    pushMatrix();
    translate(this.x, y);
    rotate(0);
    rect(150, 0, 300, 25, 10);
    popMatrix();
  }
}
