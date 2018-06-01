/*
////////////////////////////////////////////////////
//    SCREEN SNAPS
// output: right now + project + version as a string
// 2015-03-15_portal-control/portal-control_v0.5.3_01-42-50
String nowAsString() {
  return nf(year(), 4)+"-"+
    nf(month(), 2)+"-"+
    nf(day(), 2)+"_"+
    project+"/"+
    project+"_"+
    version+"_"+
    nf(hour(), 2)+"-"+
    nf(minute(), 2)+"-"+
    nf(second(), 2);
}
// Save the current screen state as a .png in the SNAP_FOLDER_PATH,
// If you pass a filename, we'll use that, otherwise we'll default to the current date.
// NOTE: do NOT pass the ".jpg" or the path.
// Returns the name of the file saved.
String saveScreen() {
  return saveScreen(null);
}
String saveScreen(String fileName) {
  if (fileName == null) {
    fileName = nowAsString();
  }
  save(SNAP_FOLDER_PATH + fileName + ".png");
  println("SAVED AS "+fileName);
  return fileName;
}
//   END SCREEN SNAPS
////////////////////////////////////////////////////////////

*/
