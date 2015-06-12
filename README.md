##KidsPace
> You know, for kids!  Responsive projection mapping for a child's play space
__________________________

###dev tasks
- [ ] install oF
- [ ] couple oF tutorials 
- [ ] read the oF for Processing tutorials writeup

###Features
####v1.0.0
- converts and aligns 3D world point as viewed by Kinect to a pixel point projected into kidSpace
- projects silhouette of moving objects
- removes background


###Future Features
+ control the flow of water down from a wall across the floor
- touchscreen control (iPad and iPhone)
- create and control virtual shapes
- virtual shapes move autonomously
- shapes respond to movement in the space
- shapes respond to real objects in the space
- projection mapping to objects in the space
- physical interaction with projection mapped objects
- HOT WHEELS TRACKING!
    + RaceTrack Mapping
    + virtual obstructions
    + Car tracking / Car recognition
    + Race winner validation (who entered area x first?)
    + etc etc etc


_________________________________

###oF Dependencies
- [ofxKinectProjectorToolkit]
    + addon for calibrating a projector to a Kinect, allowing for automated projection mapping aligned to the Kinect.
- [ofxOpenNI]
    + The ofxOpenNI module is a wrapper for the openNI + NITE + SensorKinect libraries/middleware for openFrameworks.
- [ofxCv]
    + ofxCv represents an alternative approach to wrapping OpenCV for openFrameworks.
- [ofxSecondWindow]
    + This is a simple openFrameworks addon which allows for creating multiple windows.

____________________________

##Main Components
###Calibration
###Mapping
+ The key function for mapping is getProjectedPoint(ofVec3f worldPoint). This function takes any 3d world point from the Kinect and converts it to a pixel point. For example, using ofxKinect, the pixel point associated with the world point inside the depth image at (x, y) is found:
```
ofVec3f worldPoint = kinect.getWorldCoordinateAt(x, y);
ofVec2f projectorPoint = kpt.getProjectedPoint(worldPoint);
```
Using ofxOpenNi, the world point is acquired slightly differently, directly from the raw depth pixels.
```
ofShortPixels depthPixels = kinect.getDepthRawPixels();
ofPoint depthPoint = ofPoint(x, y, depthPixels[x +y * kinect.getWidth()]);
ofVec3f worldPoint = kinect.projectiveToWorld(depthPoint);
ofVec2f projectedPoint = kpt.getProjectedPoint(worldPoint);
```

###Projections
###Physics 


________________________________________
###Tutorials & Examples
- [openFrameworks for Processing users]
- [Steps to your first particle system in oF]
- [oF tutorials]

________________________

###git tags
```
# list tags
git tag

# set tag
git tag v1

# push tags
git push --tags

# checkout tag
git checkout v1 (i think.  need to verify)
```


        





____________________________
[ofxKinectProjectorToolkit]:https://github.com/genekogan/ofxKinectProjectorToolkit
[ofxOpenNI]:https://github.com/gameoverhack/ofxOpenNI
[ofxCv]:https://github.com/kylemcdonald/ofxCv
[ofxSecondWindow]:https://github.com/genekogan/ofxSecondWindow
[openFrameworks for Processing users]:http://openframeworks.cc/tutorials/first%20steps/002_openFrameworks_for_processing_users.html
[Steps to your first particle system in oF]:http://openframeworks.cc/tutorials/first%20steps/001_My_first_particle_system.html
[oF tutorials]:http://openframeworks.cc/tutorials/