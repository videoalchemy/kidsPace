////////////////////////////////////////////////////
//    SCREEN SNAPS
// filename pattern: version/project-date-time-millis-version.png
// destination:      kidsPace/snaps --> symlinked to Dropbox/_SNAPS/201806-kidsPace/snaps
// symlink command:  in kidsPace repo root:
//       ln -s /Users/jstephens/Dropbox/_SNAPS/201806-kidsPace/snaps ./snaps
// subdirectory:     in 'snaps/<version>' determined by global VERSION
// example:          "prototype/KidsPace-20180601-132143-3770-prototype.png"
String nowAsString() {
  return version+"/"+
    project+"-"+
    nf(year(), 4)+
    nf(month(), 2)+
    nf(day(), 2)+"-"+
    nf(hour(), 2)+
    nf(minute(), 2)+
    nf(second(), 2)+"-"+
    nf(millis())+"-"+
    version;
}
// Save the current screen state as a .png in the SNAP_FOLDER_PATH,
// If you pass a filename, we'll use that, otherwise we'll default to the current date.
// NOTE: do NOT pass the ".jpg" or the path.
// Returns the name of the file saved.
String snapScreen() {
  return snapScreen(null);
}
String snapScreen(String fileName) {
  if (fileName == null) {
    fileName = nowAsString();
  }
  
  // Turn off cursor before snap
  // If toggle is on, then cursor should flip back at next animation cycle
  if (cursorIsOn) {
    toggleCursor();
    save(SNAP_FOLDER_PATH + fileName);
    println("SAVED AS "+fileName);
    toggleCursor();
  } else {
    save(SNAP_FOLDER_PATH + fileName);
    println("SAVED AS "+fileName);
  } 
  return fileName;
}
//   END SCREEN SNAPS
////////////////////////////////////////////////////////////
