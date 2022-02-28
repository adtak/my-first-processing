color[] top_colors = {#ffb6b9, #bbded6};
color[] bottom_colors = {#8ac6d1, #fae3d9};
int color_idx = 0;
int is_switch = 0;

void setup() {
  size(600, 330);
  noStroke();
  background(#fae3d9);
}

void draw() {
  if((second() == 0) && (is_switch == 1)) {
    fill(top_colors[color_idx]);
    rect(0, 0, width, 240);
    fill(bottom_colors[color_idx]);
    rect(0, 240, width, 90);
    color_idx = color_idx^1;
    is_switch = 0;
  }
  if((second() == 59) && (is_switch == 0)) {
    is_switch = 1;
  }
  // hour
  fill(top_colors[color_idx]);
  ellipse(120, 120, 240, 240);
  fill(top_colors[color_idx^1]);
  textSize(240);
  text(hour(), 0, 200);
  // :
  fill(top_colors[color_idx]);
  text(":", 270, 200);
  // minute
  fill(top_colors[color_idx]);
  text(minute(), 360, 200);
  // second
  int x = (second()+20)%20*30;
  int y = 240+second()/20*30;
  fill(bottom_colors[color_idx]);
  rect(x, y, 30, 30);
}