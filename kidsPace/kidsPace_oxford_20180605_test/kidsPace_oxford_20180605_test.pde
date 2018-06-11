/* jstephens  201806
 Extracts a depth image from the depthArray
 - removes background
 - sets all other pixels to transparent
 - exports a PGraphic 
 - to preserve to alpha
 - to use as a texture for a shape
 Removes Background for easy calibration
 Adjusts min and max
 Exports and 640x480
 From Shiffman and Zananiri examples
 */


import org.openkinect.freenect.*;
import org.openkinect.processing.*;

PGraphics pg;
PGraphics bg;
PShape    ps;
PImage img;




// Kinect helper
Kinecter kinect;

void setup() {
  //size(640, 480, P2D);
  size(1024,768, P2D);

  kinect = new Kinecter(this);
  
  pg = createGraphics (640, 480, P2D);
  pg.imageMode(CENTER);
  
  bg = createGraphics (width, height, P2D);
  bg.imageMode(CENTER);
  
  img = createImage(640, 480, ARGB);

}

void draw() {
  //kinect.drawDepthImage(); 
  //kinect.displayDistanceAndAngle();

  //image(kinect.getRawDepthImage(), 0, 0, width,height);
  kinect.createRawDepthImage();
  /*
  pg.beginDraw();
  pg.pushMatrix();
  pg.image(pg,0,0,width, height);
  //pg.translate(width/2, height/2);
  pg.translate(mouseX, mouseY);
  //pg.scale(1.1);
  pg.filter(INVERT);
  pg.image(pg,0,0);
  
  pg.popMatrix();
  pg.endDraw();
  
  //kinect.createRawDepthImage();
  */
  
  //image(depthImg,0,0,width,height);
  image(pg,0,0,width,height);
  
  /*
  pg.loadPixels();
  pg.beginDraw();
  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int index = (x + y * pg.width);
      float b = brightness(pg.pixels[index]);
      //pg.fill(b);
      pg.rect(x*1.3,y*1.3,5,5);
    }
  }
  pg.endDraw();
  pg.updatePixels();
  image(pg,0,0,width,height);
  
  */
  


  
}
