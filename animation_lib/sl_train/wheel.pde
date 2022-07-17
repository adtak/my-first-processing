class Wheel {
  private float x, y;
  private float radius;

  public Wheel(
    float x, float y,
    float radius
  ) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  public void draw(float idling) {
    float arcStart = this.x/40 + idling;
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
      arcStart, arcStart+PI/2, OPEN);
  }
}
