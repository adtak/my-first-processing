class Wheel {
  private color c;
  private float x, y;
  private float radius;

  public Wheel(
    color c,
    float x, float y,
    float radius
  ) {
    this.c = c;
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  public void draw(float x, float y) {
    this.x = x;
    this.y = y;
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
