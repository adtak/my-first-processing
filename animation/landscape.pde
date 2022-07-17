class LandscapeController {
  float horizon;
  ArrayList<Float> lines;
  ArrayList<Cloud> clouds;
  ArrayList<Mountain> mountains;
  ArrayList<Tree> backTrees;
  ArrayList<Tree> frontTrees;
  Crossing crossing;

  public LandscapeController(float horizon, ArrayList<Float> lines) {
    this.horizon = horizon;
    this.lines = lines;
    this.clouds = new ArrayList();
    this.initClouds(8);
    this.mountains = new ArrayList();
    this.backTrees = new ArrayList();
    this.frontTrees = new ArrayList();
    this.crossing = new Crossing(width+1000, height*0.95);
  }

  private void initClouds(int numOfClouds) {
    for(int i=0; i<numOfClouds; ++i) {
      this.clouds.add(new Cloud(random(width), height*random(0.1, 0.3), 50, true));
    }    
  }

  public void moveBackground(float vx) {
    moveClouds(vx*0.1);
    moveMountaions(vx*0.5);
    moveBackTrees(vx*0.9);
    drawBackground();
  }

  public void moveForeground(float vx) {
    moveFrontTrees(vx);
    moveCrossing(vx);
    drawForeground();
  }

  private void moveCrossing(float vx) {
    this.crossing.x += vx;
    if(this.crossing.x<-300) {
      this.crossing.x = width+random(1000, 1500);
    }
  }

  private void moveClouds(float vx) {
    if (this.clouds.size()<10) {
      if (0.99<random(1)) {
        this.clouds.add(new Cloud(width+100, height*random(0.1, 0.3), 50, true));
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
  }

  private void moveMountaions(float vx) {
    if (this.mountains.size()<8) {
      int mountainsAmount = this.mountains.size();
      boolean isMountainAdd;
      if(0<mountainsAmount) {
        Mountain latestM = this.mountains.get(mountainsAmount-1);
        isMountainAdd = latestM.xStart+latestM.w < width+latestM.w/2;
      } else {
        isMountainAdd = true;
      }
      if (isMountainAdd && 0.99<random(1)) {
        this.mountains.add(new Mountain(
          width,
          this.horizon,
          width*random(0.3, 0.6),
          height*random(0.3, 0.4)));
      }
    }
    ArrayList<Mountain> newMountains = new ArrayList();
    for (Mountain mountain : this.mountains) {
      mountain.xStart += vx;
      if (0<mountain.xStart+mountain.w) {
        newMountains.add(mountain);
      }
    }
    this.mountains = newMountains;
  }

  private void moveBackTrees(float vx) {
    if (this.backTrees.size()<10) {
      if (0.99<random(1)) {
        this.backTrees.add(new Tree(width+100, this.horizon*1.1));
      }
    }
    ArrayList<Tree> newTrees = new ArrayList();
    for (Tree tree : this.backTrees) {
      tree.x += vx;
      if (-100<tree.x) {
        newTrees.add(tree);
      }
    }
    this.backTrees = newTrees;
  }

  private void moveFrontTrees(float vx) {
    if (this.frontTrees.size()<10) {
      if (0.99<random(1)) {
        this.frontTrees.add(new Tree(width+100, this.horizon*1.3));
      }
    }
    ArrayList<Tree> newTrees = new ArrayList();
    for (Tree tree : this.frontTrees) {
      tree.x += vx;
      if (-100<tree.x) {
        newTrees.add(tree);
      }
    }
    this.frontTrees = newTrees;
  }

  public void drawBackground() {
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
    for (Float line : this.lines) {
      line(0, line, width, line);
    }
    for (Mountain mountain : this.mountains) {
      mountain.draw();
    }
    for (Cloud cloud : this.clouds) {
      cloud.draw();
    }
    for (Tree tree : this.backTrees) {
      tree.draw();
    }
  }

  public void drawForeground() {
    for (Tree tree : this.frontTrees) {
      tree.draw();
    }
    this.crossing.draw(this.crossing.x, this.crossing.x);
  }
}