class Background {
  private float horizon, railLine1, railLine2;
  private ArrayList<Mountain> mountains;
  private ArrayList<Cloud> clouds;
  private ArrayList<Tree> backTrees;
  private ArrayList<Tree> midTrees;
  private ArrayList<Tree> frontTrees;

  public Background(float horizon, float railLine1, float railLine2) {
    this.horizon = horizon;
    this.railLine1 = railLine1;
    this.railLine2 = railLine2;
    this.mountains = new ArrayList();
    this.mountains.add(new Mountain(150, this.horizon, width*0.6, this.horizon*0.6));
    this.mountains.add(new Mountain(width*0.4, this.horizon, width*0.6, this.horizon*0.4));
    this.mountains.add(new Mountain(40, this.horizon, width*0.5, this.horizon*0.3));
    this.clouds = new ArrayList();
    this.clouds.add(new Cloud(width*0.1, height*0.2, 50, true));
    this.clouds.add(new Cloud(width*0.75, height*0.3, 75, true));
    this.clouds.add(new Cloud(width*0.25, height*0.3, 30, false));
    this.clouds.add(new Cloud(width*0.55, height*0.15, 35, false));
    this.backTrees = new ArrayList();
    this.backTrees.add(new Tree(width*0.1, railLine1-10));
    this.backTrees.add(new Tree(width*0.2, railLine1-10));
    this.backTrees.add(new Tree(width*0.6, railLine1-10));
    this.backTrees.add(new Tree(width*0.8, railLine1-10));
    this.midTrees = new ArrayList();
    this.midTrees.add(new Tree(width*0.16, railLine2-20));
    this.midTrees.add(new Tree(width*0.7, railLine2-20));
    this.midTrees.add(new Tree(width*0.9, railLine2-20));
    this.frontTrees = new ArrayList();
    this.frontTrees.add(new Tree(width*0.08, railLine2+20));
    this.frontTrees.add(new Tree(width*0.82, railLine2+15));
  }

  public void drawBack() {
    drawBackground();
    drawMountain();
    drawCloud();
    drawLine();
    drawBackTree();
  }

  public void drawMid() {
    drawMidTree();
  }

  public void drawFront() {
    drawFrontTree();
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
    for (Mountain m : this.mountains) {
      m.draw();
    }
  }

  private void drawCloud() {
    for (Cloud c : this.clouds) {
      c.draw();
    }
  }

  private void drawBackTree() {
    for(Tree t : this.backTrees) {
      t.draw();
    }
  }

  private void drawMidTree() {
    for(Tree t : this.midTrees) {
      t.draw();
    }
  }

  private void drawFrontTree() {
    for(Tree t : this.frontTrees) {
      t.draw();
    }
  }
}

class Tree {
  private float x, y;
  private float grassline, glrasstall;
  private color leftColor, rightColor;

  public Tree(float x, float y) {
    this.x = x;
    this.y = y;
    this.leftColor = color(125+int(random(-25, 25)), 3, 8);
    this.rightColor = color(125+int(random(-25, 25)), 3, 8);
    this.grassline = y-50;
    this.glrasstall = 200;
  }

  public void draw() {
    stroke(0, 0, 5);
    strokeWeight(5);

    fill(this.leftColor);
    beginShape();
    vertex(this.x, this.grassline-this.glrasstall);
    bezierVertex(
      this.x-60, this.grassline-30,
      this.x-60, this.grassline-30,
      this.x, this.grassline);
    endShape();

    fill(this.rightColor);
    beginShape();
    vertex(this.x, this.grassline-this.glrasstall);
    bezierVertex(
      this.x+60, this.grassline-30,
      this.x+60, this.grassline-30,
      this.x, this.grassline);
    endShape();

    line(this.x, this.y, this.x, this.grassline-this.glrasstall);
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
  private color c;

  public Mountain(float xStart, float y, float mountainWidth, float mountainHeight) {
    this.xStart = xStart;
    this.y = y;
    this.mountainWidth = mountainWidth;
    this.mountainHeight = mountainHeight;
    this.c = color(120+int(random(-50, 50)), 3, 8);
  }

  public void draw() {
    stroke(0, 0, 5);
    strokeWeight(5);
    fill(this.c);
    beginShape();
    vertex(this.xStart, this.y);
    bezierVertex(
      this.xStart+this.mountainWidth/2, this.y-this.mountainHeight,
      this.xStart+this.mountainWidth/2, this.y-this.mountainHeight,
      this.xStart+this.mountainWidth, this.y);
    endShape();
  }
}
