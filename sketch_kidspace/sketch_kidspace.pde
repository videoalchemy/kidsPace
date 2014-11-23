/* jstephens - 2014-11-19
 proj: kidspace - responsive visuals for a child's play space
 repo: git@github.com:videoalchemy/kidspace.git
 */

color c;

void setup() {
  size(1024, 768);  //standard project dimensions
  c = color(0, 0, 0);
  background(c);
}

void draw() {
  pickColor();
  projectColor();
}

void pickColor() {
  if (keyPressed) {
    switch(key) {
      case('r'):
        c = color(255,0,0);
        break;
      case('g'):
        c = color(0,255,0);
        break;
      case('b'):
        c = color(0,0,255);
        break;
    }
  }
}
  
void projectColor() {
  fill(c);
  rect(0, 0, width, height);
}


