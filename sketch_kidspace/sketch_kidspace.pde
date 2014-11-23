/* jstephens - 2014-11-19
 proj: kidspace - responsive visuals for a child's play space
 repo: git@github.com:videoalchemy/kidspace.git
 */
color c;
float r, g, b;
// button booleans
boolean b_REDisON = false;
boolean b_GREENisON = false;
boolean b_BLUEisON = false;


void setup() {
  size(1024, 768);  //standard project dimensions
  c = color(0, 0, 0);
  background(c);
}

void draw() {
  mixColor();
  projectColor();
}

void keyPressed() {
  switch(key) {
    case('r'):
    b_REDisON = !b_REDisON;
    break;
    case('g'):
    b_GREENisON = !b_GREENisON;
    break;
    case('b'):
    b_BLUEisON = !b_BLUEisON;
    break;
  }
}

void mixColor() {
  if (b_REDisON) {
    r = 255;
  } else {
    r = 0;
  }
  if (b_GREENisON) {
    g = 255;
  } else {
    g = 0;
  }
  if (b_BLUEisON) {
    b = 255;
  } else {
    b = 0;
  }

  c = color(r, g, b);
}


void projectColor() {
  fill(c);
  rect(0, 0, width, height);
}

