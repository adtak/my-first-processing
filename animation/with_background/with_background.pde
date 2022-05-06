float ground;
float horizon;
Train train;

void setup() {
  // size(1920, 1080);
  size(1300, 700);
  colorMode(HSB, 360, 10, 10);
  ground = height*0.9;
  horizon = ground*0.95;
  color c = color(random(360), 5, 10);
  int train_width = 300;
  int train_height = 150;
  float speed = 0;
  train = new Train(
    c, train_width, train_height,
    width/2, ground, speed);
}

void draw() {
  background(200, 3, 10);
  fill(color(100, 3, 10));
  noStroke();
  rect(width/2, horizon+(height-horizon)/2, width, height-horizon);

  fill(color(0, 0, 10));
  noStroke();
  ellipse(200, 200, 150, 150);
  ellipse(325, 225, 100, 100);
  ellipse(280, 170, 100, 100);
  rect(260, 225, 110, 100);

  stroke(0, 0, 5);
  strokeWeight(5);
  line(0, horizon, width, horizon);

  stroke(0, 0, 5);
  strokeWeight(5);
  line(0, ground, width, ground);

  float x_start;
  float m_width;
  float m_height;

  beginShape();

  x_start = 50;
  m_width = width*3/5;
  m_height = horizon*3/5;
  stroke(0, 0, 5);
  strokeWeight(5);
  fill(color(120, 3, 8));
  vertex(x_start, horizon);
  bezierVertex(
    x_start+m_width/2, horizon-m_height,
    x_start+m_width/2, horizon-m_height,
    x_start+m_width, horizon);

  endShape();

  beginShape();

  x_start = width*2/5;
  m_width = width*3/5;
  m_height = horizon*2/5;
  stroke(0, 0, 5);
  strokeWeight(5);
  fill(color(120, 3, 8));
  vertex(x_start, horizon);
  bezierVertex(
    x_start+m_width/2, horizon-m_height,
    x_start+m_width/2, horizon-m_height,
    x_start+m_width, horizon);

  endShape();

  train.move();
}
