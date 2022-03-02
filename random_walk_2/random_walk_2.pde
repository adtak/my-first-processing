float x;
float y;
float vx;
float vy;
float e;

void setup() {
  size(400, 400);
  x = width/2;
  y = height/2;
  vx = 0;
  vy = 0;
  e = 50;
}

void draw() {
  vx += random(-0.5, 0.5);
  vy += random(-0.5, 0.5);
  vx *= 0.99;
  vy *= 0.99;
  x += vx;
  y += vy;
  if((x-e/2<0) && (vx<0)) {
    vx *= -1;
  }
  if((width<x+e/2) && (vx>0)) {
    vx *= -1;
  }
  if((y-e/2<0) && (vy<0)) {
    vy *= -1;
  }
  if((height<y+e/2) && (vy>0)) {
    vy *= -1;
  }
  background(255);
  fill(#50C1E9);
  ellipse(x, y, e, e);
}