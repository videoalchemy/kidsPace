
// Adjust the angle and the depth threshold min and max
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      kinect.angle++;
    } else if (keyCode == DOWN) {
      kinect.angle--;
    }
    kinect.angle = constrain(kinect.angle, 0, 30);
    kinect.tiltCam(kinect.angle);
  } else if (key == 'a') {
    kinect.minDepth = constrain(kinect.minDepth+10, 0, kinect.maxDepth);
  } else if (key == 's') {
    kinect.minDepth = constrain(kinect.minDepth-10, 0, kinect.maxDepth);
  } else if (key == 'z') {
    kinect.maxDepth = constrain(kinect.maxDepth+10, kinect.minDepth, 2047);
  } else if (key =='x') {
    kinect.maxDepth = constrain(kinect.maxDepth-10, kinect.minDepth, 2047);
  }
}
