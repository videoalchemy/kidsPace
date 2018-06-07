class Kinecter {
  Kinect kinect;
  boolean isKinected = false;

  int minDepth = 530; //530: home testing, 60:standard
  int maxDepth = 1200; // 920: home testing: 2000: stand

  float angle;
  float vidScale = 1.6; //scale up the kinect image this much to match the output

  int thresholdRange = 2047;
  PImage depthImg;
  PImage lowResDepthImg;
  PImage cell3DGrid;

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
    cell3DGrid = new PImage(kinect.width, kinect.height);
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
    return depthImg;
  }

  PImage getLowResDepthImage() {
    int skip = 20;
    lowResDepthImg.loadPixels();
    int [] rawDepth = kinect.getRawDepth();
    for (int x = 0; x < lowResDepthImg.width; x+=skip) {
      for (int y = 0; y < lowResDepthImg.height; y+=skip) {
        int index = x + y * lowResDepthImg.width;
        int depth = rawDepth[index];
        // if closer to sensor than min, then transparent
        float greyScale = map((float)depth, minDepth, maxDepth, 255, 0);
        fill(greyScale);
        rect(x*vidScale, y*vidScale, skip*vidScale, skip*vidScale);
        //rect(x, y, skip, skip);
        //lowResDepthImg.pixels[index] = color(greyScale);
      }
    }
    lowResDepthImg.updatePixels();
    //image(lowResDepthImg, 0, 0, width, height);
    return lowResDepthImg;
  }

  void draw3DGrid() {
    int skip = 20;
    cell3DGrid.loadPixels();
    int [] rawDepth = kinect.getRawDepth();
    for (int x = 0; x < cell3DGrid.width; x+=skip) {
      for (int y = 0; y < cell3DGrid.height; y+=skip) {
        int index = x + y * cell3DGrid.width;
        int depth = rawDepth[index];
        
        float greyScale = map((float)depth, minDepth, maxDepth, 255, 0);
        float z = greyScale;
        fill(greyScale);
        pushMatrix();
        translate(x*vidScale, y*vidScale, z);
        
        rect(0, 0, skip*vidScale, skip*vidScale);
        popMatrix();
      }
    }
    cell3DGrid.updatePixels();
    //image(3DGrid, 0, 0, width, height);
    
    //return 3DGrid;
  }
}
