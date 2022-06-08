void setup() {
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
}

void draw() {
  rectMode(CENTER);
  stroke(0, 0, 5);
  strokeWeight(5);

  float x = width/2;
  float y = height/2;
  float w = 500;
  float h = 150;
  rect(x, y, w, h, 10, 0, 10, 10);

  arc(x+w/2-w*3/8-w/20, y+h/2, w/4, w/4, PI, TWO_PI);
  Wheel backWheel1 = new Wheel(x+w/2-w*3/8-w/20, y+h/2, w/4*0.4);
  backWheel1.draw(x+w/2-w*3/8-w/20, y+h/2);

  arc(x+w/2-w/8-w/20, y+h/2, w/4, w/4, PI, TWO_PI);
  Wheel backWheel2 = new Wheel(x+w/2-w/8-w/20, y+h/2, w/4*0.4);
  backWheel2.draw(x+w/2-w/8-w/20, y+h/2);

  arc(x-w/3, y+h/2+w/4*0.4-w/6*0.4, w/6, w/6, PI*1.1, TWO_PI*0.95);
  Wheel frontWheel = new Wheel(x-w/3, y+h/2+w/8-w/6*0.4, w/6*0.4);
  frontWheel.draw(x-w/3, y+h/2+w/4*0.4-w/6*0.4);

  rect(x-w/2-5, y, 10, h*0.8, 10, 0, 0, 10);
  line(x-w/2*0.9, y, x-w/8, y);

  float wChimney = w/8;
  float hChimney = h*0.8;
  float xChimney = x-w/3;
  float yChimney = y-h/2-hChimney/2;
  rect(xChimney, yChimney, wChimney, hChimney, 10, 10, 0, 0);
  rect(xChimney, yChimney-hChimney/2, wChimney+10, 30, 10);

  rect(x+w/4, y-h, w/2, h);
  rect(x+w/4, y-h*3/2-5, w/2+10, 30, 10, 10, 0, 0);
  float wFrontWindow = w/2*0.4;
  float xFrontWindow = x+w/2*0.3/3+wFrontWindow/2;
  float wBackWindow = w/2*0.3;
  float xBackWindow = x+w/2-w/2*0.3/3-wBackWindow/2;
  float yWindow = y-h;
  rect(xFrontWindow, yWindow, wFrontWindow, h*0.6, 10, 10, 0, 0);
  rect(xBackWindow, yWindow, wBackWindow, h*0.6, 10, 10, 0, 0);
}
