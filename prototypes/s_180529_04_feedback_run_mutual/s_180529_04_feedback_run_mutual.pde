/*jstephens  - 2016_06
 feedback_runner
 navigate ellipse through a feedback scene
 TODO:
 - [] map baton rotation to location.x
 - [] make arrows the controllers
 - [] constrain controlls
 - [] perlin noise the width, height, rotation
 - [] mousePressed changes ellipse color and clears background
 - [] easing such that arrow controls aren't sticky
 
 -----------
 
 */

Particle p;
boolean saveFrameIsOn = true;
boolean mouseIsEngaged = false;
PImage baseLayer;
PVector location;
PVector mouse;

float angle = 0;
float rotVelocity = 0.05;
float thetaOscillator = 0;
float batonLength     = 150; //50 initial length
boolean strokeFlip = true;


float xAdjust = 0;
float yAdjust = 0;
float wAdjust = 0;
float hAdjust = 0;

void setup() {
  size(640, 480, P2D);

  baseLayer  = createImage(width, height, ARGB);
  p          = new Particle(new PVector(width/2, height*.2));
  location   = new PVector(width/2, height/2);
  mouse      = new PVector(width/2, height/2);


  background(255);
  smooth();
}

void draw() {
  checkAndSetMouseLocation(); 

  drawFeedbackLayer();
  filter(THRESHOLD);
  filter(INVERT);

  drawTwirlingBaton();
  drawUpDownOscillator();
  drawRunner();
  checkSaveFrame();
}

void drawFeedbackLayer() {
  PImage img = createImage(width, height, ARGB); 

  loadPixels();
  baseLayer.loadPixels();

  for (int i = 0; i < pixels.length; i++) {//copy the image to img
    img.pixels[i] = pixels[i];
    baseLayer.pixels[i] = pixels[i];
  }

  updatePixels();
  baseLayer.updatePixels();
  imageMode(CENTER);
  blendMode(BLEND);//BLEND

  //image(baseLayer, location.y-(1/(location.y+1)), location.x, width*1.1, height);
  //image(baseLayer, mouse.y-(1/(mouse.y+1)), mouse.x, width*1.1, height);
  pushMatrix();

  //translate(0, 0);
  translate(mouseX, mouseY);

  //rotate(.0001*millis());
  //image(baseLayer, mouse.y-(1/(mouse.y+1)), mouse.x, width*(1.05), height-50);
  //blendMode(DIFFERENCE);//BLEND
  //image(baseLayer, mouseY-(1/(mouseY+1)), -mouseX, -width*1.1, height*1.1);
  image(baseLayer, location.x, location.y, width*(.8), height*(.9));
  //image(img, location.x, location.y, img.width*(1+wAdjust)-50, img.height*(1+hAdjust)-50);
  image(img, location.x, location.y, img.width, img.height);
  blendMode(DIFFERENCE);//BLEND
  flipStroke();

  rect(location.x, location.y, img.width, img.height);
  image(baseLayer, location.x, location.y, width*1.01, height*.99);
  blendMode(BLEND);//BLEND


  popMatrix();
}

void flipStroke() {
  noFill();
  strokeWeight(3);
  //stroke(100,5);
  if (strokeFlip) {
    stroke(0);
    //fill(255);
    strokeFlip = false;
  } else {
    stroke(255);
    //fill(0);
    strokeFlip = true;
  }
}


void drawRunner() {
  strokeWeight(1);
  if (strokeFlip) {
    fill(255, 0, 0);
  } else {
    fill (0, 0, random(255));
  }
  ellipse(location.x, location.y, 40, 40);
  //ellipse(mouseX, mouseY, 40, 40);
}

void drawTwirlingBaton() {
  fill(127);
  //stroke(0);
  pushMatrix();
  rectMode(CENTER);
  //translate(width/2, height/2);
  translate(mouse.x, mouse.y);
  //translate(location.x, location.y);
  rotate(angle);
  line(-batonLength, 0, batonLength, 0);
  //stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(batonLength, 0, 16, 16);
  ellipse(-batonLength, 0, 16, 16);

  //massage the rotational velocity
  rotVelocity = map(location.x, 0, width, -2.5, 2.5);
  rotVelocity = constrain(rotVelocity, -.3, .3);
  //println("rotVelocity: " + rotVelocity);
  angle += rotVelocity;

  popMatrix();
}

void drawUpDownOscillator() {
  float y = 100*sin(thetaOscillator);
  thetaOscillator += 0.02;
  fill(255);
  pushMatrix();
  translate(location.x, location.y);
  //translate(width/2, height/2);
  //line(0,0,0,y);
  ellipse(0, y, 16, 16);
  popMatrix();
}

void runParticle() {
  p.run(); 
  if (p.isDead()) {
    p = new Particle(new PVector(width/2, height*.2));
  }
}

void checkAndSetMouseLocation () {
  //check if mouse is engaged. if so, set location and mouse vectors to mouseX mouseY
  if (mouseX>0) {
    mouseIsEngaged = true;
  }
  // use mouseX/Y or if no mouse, set starting point
  if (mouseIsEngaged) {
    mouse.x = mouseX;
    mouse.y = mouseY;
    location.x = mouseX + xAdjust;
    location.y = mouseY + yAdjust;
  } else {
    mouse.x = width/2;
    mouse.y = height/2;
    location.x = width/2 + xAdjust;
    location.y = height/2 + yAdjust;
  }
  //println("location.x: " + location.x + "  location.y:  " + location.y);
}


void checkSaveFrame() {
  if (saveFrameIsOn) {
    saveFrame("frames/#####.tif");
  }
}
void keyPressed() { //handle some user input
  if (key == 'u') {
    yAdjust-=10;
  } else if (key == 'd') {
    yAdjust+=10;
  } else if (key == 'l') {
    xAdjust-=10;
  } else if (key == 'r') {
    xAdjust+=10;
  } else if (key == 'n') {
    wAdjust-=.01;
  } else if (key == 'w') {
    wAdjust+=.01;
  } else if (key == 's') {
    hAdjust-=.01;
  } else if (key == 't') {
    hAdjust+=.01;
  }
}

void mousePressed() {
  saveFrameIsOn = !saveFrameIsOn;
}
