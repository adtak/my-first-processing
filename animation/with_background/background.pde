class Background {
  private float horizon, ground;

  public Background(float horizon, float ground) {
    this.horizon = horizon;
    this.ground = ground;
  }

  public void draw() {
    drawBackground();
    drawMountain();
    drawCloud();
    drawLine();
  }

  private void drawBackground() {
    background(200, 3, 10);
  
    fill(color(100, 3, 10));
    noStroke();
    rect(
      width/2, this.horizon+(height-this.horizon)/2,
      width, height-this.horizon);

    stroke(0, 0, 5);
    strokeWeight(5);
    line(0, this.horizon, width, this.horizon);
  }

  private void drawLine() {
    stroke(0, 0, 5);
    strokeWeight(5);
    line(0, this.ground, width, this.ground);
  }

  private void drawMountain() {
    Mountain m1 = new Mountain(50, this.horizon, width*3/5, this.horizon*3/5);
    m1.draw();
    Mountain m2 = new Mountain(width*2/5, this.horizon, width*3/5, this.horizon*2/5);
    m2.draw();
  }

  private void drawCloud() {
   MidiumCloud c1 = new MidiumCloud(200, 200);
   c1.draw();
  }
}

class MidiumCloud {
  private float x, y;

  public MidiumCloud(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void draw() {
    fill(color(0, 0, 10));
    noStroke();
    ellipse(this.x, this.y, 150, 150);
    ellipse(this.x+125, this.y+25, 100, 100);
    ellipse(this.x+80, this.y-30, 100, 100);
    rect(this.x+60, this.y+25, 110, 100);
  }
}

class Mountain {
  private float x_start;
  private float y;
  private float mountain_width;
  private float mountain_height;

  public Mountain(float x_start, float y, float mountain_width, float mountain_height) {
    this.x_start = x_start;
    this.y = y;
    this.mountain_width = mountain_width;
    this.mountain_height = mountain_height;
  }

  public void draw() {
    beginShape();
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(color(120, 3, 8));
    vertex(this.x_start, this.y);
    bezierVertex(
      this.x_start+this.mountain_width/2, this.y-this.mountain_height,
      this.x_start+this.mountain_width/2, this.y-this.mountain_height,
      this.x_start+this.mountain_width, this.y);
    endShape();
  }
}
