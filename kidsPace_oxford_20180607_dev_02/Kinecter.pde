class Kinecter {
  Kinect kinect;
  boolean isKinected = false;

  int minDepth = 840; //530: home testing, 60:standard
  int maxDepth = 1027; // 920: home testing: 2000: stand

  float angle;
  float vidScale = 1.6; //scale up the kinect image this much to match the output
  int skip = 20;
  int thresholdRange = 2047;
  PImage depthImg;
  PImage lowResDepthImg;
  PImage cell3DGrid;
  PShape rectShape;
  PShape s;

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
    rectShape = createShape(RECT, 0, 0, skip*vidScale, skip*vidScale);
    s = createShape();
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
    int skip = 10;
    cell3DGrid.loadPixels();
    int [] rawDepth = kinect.getRawDepth();
    for (int x = 0; x < cell3DGrid.width; x+=skip) {
      for (int y = 0; y < cell3DGrid.height; y+=skip) {
        int index = x + y * cell3DGrid.width;
        int depth = rawDepth[index];
        float zScale = map(mouseX, 0, width, 2500, -2500);
        float zScalePos = map(mouseY, 0, height, -2500, 2500);
        float greyScale = map((float)depth, minDepth, maxDepth, 255, 0);
        float z = map((float)depth, minDepth, maxDepth, zScalePos, zScale);
        float rot = map((float)depth, minDepth, maxDepth, -2, 2);
        //float z = map((float)depth, minDepth, maxDepth, 500,-500);//original
        //noStroke();
        pushMatrix();
        translate(x*vidScale, y*vidScale, z);
        rotate(rot);
        rotateZ(rot);
        fill(greyScale, 255-greyScale, greyScale);
        ellipse(0,0,skip*vidScale, skip*vidScale);
        translate(0,0, z*.1);
        fill(255-greyScale, 0, 255-greyScale);
        rect(0, 0, skip*vidScale, skip*vidScale);
        //rect(0, 0, skip, skip);
        popMatrix();
      }
    }
    cell3DGrid.updatePixels();
    //image(3DGrid, 0, 0, width, height);

    //return 3DGrid;
  }

  void drawRectShapeGrid() {
     
        s.beginShape();
        //s.fill(0, 0, greyScale);
        //s.noStroke();
        s.texture(getLowResDepthImage());
        s.vertex(0, 0);
        s.vertex(0, skip*vidScale);
        s.vertex(skip*vidScale, skip*vidScale);
        s.vertex(skip*vidScale, 0);
        s.endShape(CLOSE);
    
    int skip = 15;
    cell3DGrid.loadPixels();
    int [] rawDepth = kinect.getRawDepth();
    
    for (int x = 0; x < cell3DGrid.width; x+=skip) {
      for (int y = 0; y < cell3DGrid.height; y+=skip) {

        int index = x + y * cell3DGrid.width;
        int depth = rawDepth[index];

        float greyScale = map((float)depth, minDepth, maxDepth, 255, 0);
        float z = map((float)depth, minDepth, maxDepth, 550, -550);
        fill(0, greyScale, 0);


        pushMatrix();
        translate(x*vidScale, y*vidScale, z);

       

        shape(s, 0,0);
        //rect(0, 0, skip*vidScale, skip*vidScale);
        //rect(0, 0, skip, skip);
        popMatrix();
      }
    }
    //rectShape.endDraw();
    cell3DGrid.updatePixels();
    //image(3DGrid, 0, 0, width, height);

    //return 3DGrid;
  }
}
