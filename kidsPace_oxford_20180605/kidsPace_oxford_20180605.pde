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

// Kinect helper
Kinecter kinect;

void setup() {
  size(640, 480, P2D);

  kinect = new Kinecter(this);
}

void draw() {
  //kinect.drawDepthImage(); 
  //kinect.displayDistanceAndAngle();

  image(kinect.getRawDepthImage(), 0, 0);

  
}

/*
//
 Kinect kinect;
 
 // Depth image
 PImage depthImg;
 
 // Which pixels do we care about?
 int minDepth =  60;
 int maxDepth = 860;
 
 // What is the kinect's angle
 float angle;
 
 void setup() {
 size(1280, 480);
 
 kinect = new Kinect(this);
 kinect.initDepth();
 angle = kinect.getTilt();
 
 // Blank image
 depthImg = new PImage(kinect.width, kinect.height);
 }
 
 void draw() {
 // Draw the raw image
 image(kinect.getDepthImage(), 0, 0);
 
 // the below makes getRawDepth() faster
 //kinect.processDepthImage(false);
 
 
 // Threshold the depth image
 int[] rawDepth = kinect.getRawDepth();
 for (int i=0; i < rawDepth.length; i++) {
 if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
 depthImg.pixels[i] = color(255);
 } else {
 depthImg.pixels[i] = color(0);
 }
 }
 
 // Draw the thresholded image
 depthImg.updatePixels();
 image(depthImg, kinect.width, 0);
 
 fill(0);
 text("TILT: " + angle, 10, 20);
 text("THRESHOLD: [" + minDepth + ", " + maxDepth + "]", 10, 36);
 }
 
 
 
 // Adjust the angle and the depth threshold min and max
 void keyPressed() {
 if (key == CODED) {
 if (keyCode == UP) {
 angle++;
 } else if (keyCode == DOWN) {
 angle--;
 }
 angle = constrain(angle, 0, 30);
 kinect.setTilt(angle);
 } else if (key == 'a') {
 minDepth = constrain(minDepth+10, 0, maxDepth);
 } else if (key == 's') {
 minDepth = constrain(minDepth-10, 0, maxDepth);
 } else if (key == 'z') {
 maxDepth = constrain(maxDepth+10, minDepth, 2047);
 } else if (key =='x') {
 maxDepth = constrain(maxDepth-10, minDepth, 2047);
 }
 }
 
 */

/*
/////////////////////////////
 //    FOR USE WITH SourceChannels.  These should really have their own class
 PImage getDepthGraphic(){
 return depthGraphic;
 }
 
 PImage output(){
 return chnl_output;
 }
 
 */
