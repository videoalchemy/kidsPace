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

}

void draw() {
  //kinect.drawDepthImage(); 
  //kinect.displayDistanceAndAngle();

  image(kinect.getRawDepthImage(), 0, 0, width,height);


  
}
