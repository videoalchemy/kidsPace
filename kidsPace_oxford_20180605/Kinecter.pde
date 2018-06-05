////////////////////////////////////////////////////////////
//  Kinect setup (constant for all configs)
////////////////////////////////////////////////////////////

// size of the kinect image

class Kinecter {
  Kinect kinect;
  boolean isKinected = false;

  int minDepth = 800; //Oxford depth 800
  int maxDepth = 1007; // oxford max depth 1007

  float angle;

  int thresholdRange = 2047;

  PImage depthImg;

  public Kinecter(PApplet parent) {
    //super();
    try {
      kinect = new Kinect(parent);
      kinect.initDepth();
      angle=kinect.getTilt();

      // the below makes getRawDepth() faster
      //kinect.processDepthImage(false);

      isKinected = true;
      println("KINECT IS INIITIALIZED");
    }
    catch (Throwable t) {
      isKinected = false; 
      println("KINECT NOT INIITIALIZED");
      println(t);
    }
    // blank image
    depthImg = new PImage(640, 480);
  }

  void drawDepthImage() {
    image(kinect.getDepthImage(), 0, 0);
  }

  void displayDistanceAndAngle() {
    fill(0);
    text("TILT: " + angle, 10, 20);
    text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);
  }

  void tiltCam(float theta) { 
    kinect.setTilt(angle);
  }

  PImage getRawDepthImage() {
    //depthImg.loadPixels();
    int [] rawDepth = kinect.getRawDepth();
    for (int i=0; i < rawDepth.length; i++) {
      int depth = rawDepth[i];

      // if closer to sensor than min, then transparent
      if (depth < minDepth) {
        // set transparency here
        depthImg.pixels[i] = color(0);  // tint(255,0); ???
        
      } else if (depth > maxDepth) {
        depthImg.pixels[i] = color(0);  // tint(255,0); ???
        
      } else {
        // set alpha here as a map of distance as well.
        int greyScale = (int)map((float)depth, minDepth, maxDepth, 255, 10);
        //int greyScale = 255;
        depthImg.pixels[i] = color(greyScale);
      }

      depthImg.updatePixels();
      //image(depthImg, kinect.width, 0);
    }
    return depthImg;
  }
}
