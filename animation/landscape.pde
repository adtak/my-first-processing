class LandscapeController {
  float horizon;
  ArrayList<Cloud> clouds;

  public LandscapeController(float horizon) {
    this.horizon = horizon;
    this.clouds = new ArrayList();
    this.clouds.add(new Cloud(width, height*0.2, 50, true));
  }

  public void moveBackground(float vx) {
    if (this.clouds.size()<10) {
      if (0.99<random(1)) {
        this.clouds.add(new Cloud(width, height*random(0.1, 0.3), 50, true));
      }
    }
    ArrayList<Cloud> newClouds = new ArrayList();
    for (Cloud cloud : this.clouds) {
      cloud.x += vx;
      if (-100<cloud.x) {
        newClouds.add(cloud);
      }
    }
    this.clouds = newClouds;
    drawBackground();
  }

  public void drawBackground() {
    background(200, 3, 10);
    rectMode(CORNER);
    fill(color(100, 3, 10));
    noStroke();
    rect(
      0, this.horizon,
      width, height);
    for (Cloud cloud : this.clouds) {
      cloud.draw();
    }
  }
}