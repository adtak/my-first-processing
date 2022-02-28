color[] colors = {#4A82C4, #43B6A9};
int color_idx = 0;
int is_switch = 0;

void setup() {
  size(600, 600);
  background(colors[color_idx^1]);
  noStroke();
}

void draw() {
  if((second() == 0) && (is_switch == 1)) {
    fill(colors[color_idx]);
    color_idx = color_idx^1;
    is_switch = 0;
    rect(0, 0, width, height);
  }
  if((second() == 59) && (is_switch == 0)) {
    is_switch = 1;
  }
  // hour
  fill(colors[color_idx]);
  ellipse(120, 120, 240, 240);
  fill(colors[color_idx^1]);
  textSize(240);
  text(hour(), 0, 200);
  // :
  fill(colors[color_idx]);
  text(":", 270, 200);
  // minute
  fill(colors[color_idx]);
  text(minute(), 360, 200);
  // second
  int x = (second()+10)%10*60;
  int y = 240+second()/10*60;
  fill(colors[color_idx]);
  rect(x, y, 60, 60);
}