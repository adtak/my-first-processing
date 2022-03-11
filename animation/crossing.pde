class Crossing {
  private float x, y;

  public Crossing(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void draw() {
    stroke(0, 0, 5);
    strokeWeight(5);
    rectMode(CENTER);
    ellipseMode(CENTER);
  
    pushMatrix();
    translate(this.x, this.y+175);
    rotate(0);
    rect(150, 0, 300, 25, 10);
    popMatrix();

    rect(this.x, this.y+75, 10, 150, 10);
    rect(this.x, this.y+150+50, 30, 100, 10);
    rect(this.x, this.y+150+100, 100, 30, 10, 10, 0, 0);

    pushMatrix();
    translate(this.x, this.y);
    rotate(PI/4);
    rect(0, 0, 150, 25, 10);
    rotate(PI/2);
    rect(0, 0, 150, 25, 10);
    popMatrix();

    rect(this.x, this.y+100, 100, 10, 10);
    ellipse(this.x-50, this.y+100, 40, 40);
    ellipse(this.x+50, this.y+100, 40, 40);
    ellipse(this.x-50, this.y+100, 20, 20);
    ellipse(this.x+50, this.y+100, 20, 20);
  }
}
