class Background {
  private float horizon, railLine1, railLine2;

  public Background(float horizon, float railLine1, float railLine2) {
    this.horizon = horizon;
    this.railLine1 = railLine1;
    this.railLine2 = railLine2;
  }

  public void draw() {
    drawBackground();
    drawMountain();
    drawCloud();
    drawLine();
  }

  private void drawBackground() {
    background(200, 3, 10);
    rectMode(CORNER);
    fill(color(100, 3, 10));
    noStroke();
    rect(
      0, this.horizon,
      width, height);
    stroke(0, 0, 5);
    strokeWeight(5);
    line(0, this.horizon, width, this.horizon);
  }

  private void drawLine() {
    stroke(0, 0, 5);
    strokeWeight(5);
    line(0, this.railLine1, width, this.railLine1);
    line(0, this.railLine2, width, this.railLine2);
  }

  private void drawMountain() {
    Mountain m1 = new Mountain(50, this.horizon, width*3/5, this.horizon*3/5);
    m1.draw();
    Mountain m2 = new Mountain(width*2/5, this.horizon, width*3/5, this.horizon*2/5);
    m2.draw();
  }

  private void drawCloud() {
   Cloud c1 = new Cloud(width*0.1, height*0.2, 50, true);
   c1.draw();
   Cloud c2 = new Cloud(width*0.75, height*0.3, 75, true);
   c2.draw();
   Cloud c3 = new Cloud(width*0.25, height*0.3, 30, false);
   c3.draw();
   Cloud c4 = new Cloud(width*0.55, height*0.15, 35, false);
   c4.draw();
  }
}

class Cloud {
  private float x, y;
  private float mainRadius, subRadius;
  private boolean isLarge;

  public Cloud(float x, float y, float mainRadius, boolean isLarge) {
    this.x = x;
    this.y = y;
    this.mainRadius = mainRadius;
    this.subRadius = mainRadius*0.7;
    this.isLarge = isLarge;
  }

  public void draw() {
    fill(color(0, 0, 10));
    noStroke();
    ellipse(this.x, this.y, this.mainRadius*2, this.mainRadius*2);
    ellipse(
      this.x+sqrt(sq(this.mainRadius+this.subRadius)-sq(this.mainRadius-this.subRadius)),
      this.y+this.mainRadius-this.subRadius,
      this.subRadius*2, this.subRadius*2);
    if (this.isLarge) {
      ellipse(
        this.x+this.mainRadius, this.y-this.mainRadius/2,
        this.subRadius*2, this.subRadius*2);
    }
    rectMode(CORNER);
    float contact = (this.mainRadius-this.subRadius)*0.7/1.7;
    rect(
      this.x, this.y+this.mainRadius-this.subRadius-contact,
      this.mainRadius+this.subRadius, contact+this.subRadius);
  }
}

class Mountain {
  private float xStart;
  private float y;
  private float mountainWidth;
  private float mountainHeight;

  public Mountain(float xStart, float y, float mountainWidth, float mountainHeight) {
    this.xStart = xStart;
    this.y = y;
    this.mountainWidth = mountainWidth;
    this.mountainHeight = mountainHeight;
  }

  public void draw() {
    beginShape();
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(color(120, 3, 8));
    vertex(this.xStart, this.y);
    bezierVertex(
      this.xStart+this.mountainWidth/2, this.y-this.mountainHeight,
      this.xStart+this.mountainWidth/2, this.y-this.mountainHeight,
      this.xStart+this.mountainWidth, this.y);
    endShape();
  }
}
