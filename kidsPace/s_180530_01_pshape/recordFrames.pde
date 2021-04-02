
////////////////////////////////////////////////////
//    RECORD SCREEN as FRAMES
// filename pattern: version/yyyymmdd-hr/yyyymmdd-hrmm-######.tiff
//       * this divides directory by hours, but within each hour, each frame is marked by minutes
//       * this avoids having frame 000001 rewritten if frame recording restarts within 60 seconds
// destination:      kidsPace/frames --> symlinked to Dropbox/_SNAPS/201806-kidsPace/frames
// symlink command:  in kidsPace repo root:
//       $ ln -s /Users/jstephens/Dropbox/_SNAPS/201806-kidsPace/frames ./frames
// subdirectory:     in 'frames/<version>/yyyymmdd-hr/' (version determined by global)
// example:          "frames/prototype/20180601-13/20180601-1321-0003789.tiff"

String frameAsString() {
  return version+
    "/"+
    nf(year(), 4)+
    nf(month(), 2)+
    nf(day(), 2)+
    "-"+
    nf(hour(), 2)+
    nf(minute(), 2)+
    "/"+
    nf(year(), 4)+
    nf(month(), 2)+
    nf(day(), 2)+
    "-"+
    nf(hour(), 2)+
    nf(minute(), 2)+ 
    nf(second(), 2)+
    "-";
}



// Record the current frame as a .tif in the FRAME_FOLDER_PATH,
// If you pass a filename, we'll use that, otherwise we'll default to the current date.
// NOTE: do NOT pass the ".jpg" or the path.
// Returns the name of the file saved.
String recordFrame() {
  return recordFrame(null);
}
String recordFrame(String frameName) {
  if (frameName == null) {
    frameName = frameAsString();
  }
  //saveFrame(FRAME_FOLDER_PATH + frameName);
  println("RETURNED NAME: "+frameName);
  return frameName;
}
//   END: RECORD SCREEN as FRAMES
////////////////////////////////////////////////////////////
