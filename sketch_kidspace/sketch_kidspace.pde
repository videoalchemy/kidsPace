/* jstephens - 2014-11-19
 proj: kidspace - responsive visuals for a child's play space
 repo: git@github.com:videoalchemy/kidspace.git
 */

color c;

void setup() {
  size(1024, 768);  //standard project dimensions
  c = color(0, 0, 0);
}

void draw() {
  pickColor();
  projectColor();
}

void pickColor() {
  if (keyPressed) {
    if (key == 'r') {
      c = color(255, 0, 0);
    } else if (key == 'g') {
      c = color(0, 255, 0);
    } else if (key == 'b') {
      c = color(0, 0, 255);
    } else {
      c = color(0);
    }
  }
}

void projectColor() {
  fill(c);
  rect(0, 0, width, height);
}


