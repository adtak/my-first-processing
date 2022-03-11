void setup() {
  size(1200, 600);
  background(0);
}

void draw() {
  background(0);
  noStroke();
  color c1 = color(255, 140, 0);
  color c2 = color(0, 255, 255);
  for(float d=400; d>0; d-=5){
    color c = lerpColor(c1, c2, d/400.0);
    fill(c);
    ellipse(width/2, height/2, d, d);
  }
  stroke(255, 80);
  for(int i=0; i<1000; i++) {
    float angle = random(0, TWO_PI);
    float length = random(6, 10);
    line(
      width/2, height/2,
      width/2+cos(angle)*length*20, height/2+sin(angle)*length*20);
  }
  stroke(0);
  for(int i=0; i<1000; i++) {
    float angle = random(0, TWO_PI);
    float length = random(8, 10);
    line(
      width/2, height/2,
      width/2+cos(angle)*length*7, height/2+sin(angle)*length*7);
  }
}
