class SL extends AbstractTrain {
  public SL(
    color c,
    int w, int h,
    float x, float ground,
    float vx,
    float jointWidth
  ) {
    float wheelSize = 20;
    this.c = c;
    this.w = w;
    this.h = h;
    this.yDefault = ground-wheelSize*2-h/2;
    this.x = x;
    this.y = this.yDefault;
    this.vx = vx;
    this.vy = 0;
    this.wheels = null;
    this.jointWidth = jointWidth;
  }

  protected void drawBody() {
    rectMode(CENTER);
    stroke(0, 0, 5);
    strokeWeight(5);

    rect(this.x, this.y, this.w, this.h, 10, 0, 10, 10);

    arc(this.x+this.w/2-this.w*3/8-this.w/20, this.y+this.h/2, this.w/4, this.w/4, PI, TWO_PI);
    arc(this.x+this.w/2-this.w/8-this.w/20, this.y+this.h/2, this.w/4, this.w/4, PI, TWO_PI);
    arc(this.x-this.w/3, this.y+this.h/2+this.w/4*0.4-this.w/6*0.4, this.w/6, this.w/6, PI*1.1, TWO_PI*0.95);

    rect(this.x-this.w/2-5, this.y, 10, this.h*0.8, 10, 0, 0, 10);
    line(this.x-this.w/2*0.9, this.y, this.x-this.w/8, this.y);

    float wChimney = this.w/8;
    float hChimney = this.h*0.8;
    float xChimney = this.x-this.w/3;
    float yChimney = this.y-this.h/2-hChimney/2;
    rect(xChimney, yChimney, wChimney, hChimney, 10, 10, 0, 0);
    rect(xChimney, yChimney-hChimney/2, wChimney+10, 30, 10);

    rect(x+w/4, y-h, w/2, h);
    rect(x+w/4, y-h*3/2-5, w/2+10, 30, 10, 10, 0, 0);
    float wFrontWindow = this.w/2*0.4;
    float xFrontWindow = this.x+this.w/2*0.3/3+wFrontWindow/2;
    float wBackWindow = this.w/2*0.3;
    float xBackWindow = this.x+this.w/2-this.w/2*0.3/3-wBackWindow/2;
    float yWindow = this.y-this.h;
    rect(xFrontWindow, yWindow, wFrontWindow, h*0.6, 10, 10, 0, 0);
    rect(xBackWindow, yWindow, wBackWindow, h*0.6, 10, 10, 0, 0);
  }

  protected void drawWheel() {
    Wheel backWheel1 = new Wheel(this.x+this.w/2-this.w*3/8-this.w/20, this.y+this.h/2, this.w/4*0.4);
    backWheel1.draw(this.x+this.w/2-this.w*3/8-this.w/20, this.y+this.h/2);

    Wheel backWheel2 = new Wheel(this.x+this.w/2-this.w/8-this.w/20, this.y+this.h/2, this.w/4*0.4);
    backWheel2.draw(this.x+this.w/2-this.w/8-this.w/20, this.y+this.h/2);

    Wheel frontWheel = new Wheel(this.x-this.w/3, this.y+this.h/2+this.w/8-this.w/6*0.4, this.w/6*0.4);
    frontWheel.draw(this.x-this.w/3, this.y+this.h/2+this.w/4*0.4-this.w/6*0.4);
  }
}