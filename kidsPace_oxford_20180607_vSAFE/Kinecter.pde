class Kinecter {
  Kinect kinect;
  boolean isKinected = false;

  int minDepth = 840; //530: home testing, 60:standard
  int maxDepth = 977; // 920: home testing: 2000: stand

  float angle;

  int thresholdRange = 2047;
  PImage depthImg;
  PImage lowResDepthImg;

  public Kinecter(PApplet parent) {
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
    depthImg = new PImage(kinect.width, kinect.height);
    lowResDepthImg = new PImage(kinect.width, kinect.height);
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
    }
    depthImg.updatePixels();
    //image(depthImg, kinect.width, 0);
    return depthImg;
  }

  void createLowResDepthImage() {
    int skip = 5;
    lowResDepthImg.loadPixels();
    int [] rawDepth = kinect.getRawDepth();
    for (int x = 0; x < lowResDepthImg.width; x++) {
      for (int y = 0; y < lowResDepthImg.height; y++) {
        int index = x + y * lowResDepthImg.width;
        int depth = rawDepth[index];
        // if closer to sensor than min, then transparent
        if (depth < minDepth) {
          // set transparency here
          lowResDepthImg.pixels[index] = color(0);  // tint(255,0); ???
        } else if (depth > maxDepth) {
          lowResDepthImg.pixels[index] = color(0);  // tint(255,0); ???
        } else {
          // set alpha here as a map of distance as well.
          int greyScale = (int)map((float)depth, minDepth, maxDepth, 255, 10);
          //int greyScale = 255;
          lowResDepthImg.pixels[index] = color(greyScale);
        }
      }
    }
    lowResDepthImg.updatePixels();
    image(lowResDepthImg, 0, 0, width, height);
  }
}
