/* jstephens - 2014-11-19
 proj: kidspace - responsive visuals for a child's play space
 repo: git@github.com:videoalchemy/kidspace.git
 */
import oscP5.*;
OscP5 oscP5;

color c;
float r, g, b;
// button booleans
boolean b_REDisON = false;
boolean b_GREENisON = false;
boolean b_BLUEisON = false;
boolean buttonState = false;


void setup() {
  size(1024, 768);  //standard project dimensions
  c = color(0, 0, 0);
  background(c);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 8000);
}

void draw() {
  mixColor();
  projectColor();
}

void oscEvent(OscMessage theOscMessage) {

  String addr = theOscMessage.addrPattern(); 
  float val = theOscMessage.get(0).floatValue();  
  println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  print(val);
  if (val == 1) {
    buttonState = true;
  } else if (val == 0) {
    buttonState = false;
  }

  if (addr.equals("/1/red1")) {
    b_REDisON = buttonState;
  } else if (addr.equals("/1/green1")) {
    b_GREENisON = buttonState;
  } else if (addr.equals("/1/blue1")) {
    b_BLUEisON = buttonState;
  }
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

