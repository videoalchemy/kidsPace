////////////////////////////////////
// UTILITY FUNCTIONS
////////////////////////////////////

//////////////////////////////////////////////////
//  TOGGLE CURSOR  =  'c'
void toggleCursor () {
  cursorIsOn = !cursorIsOn;    
  println("*** Cursor is " + cursorIsOn + " ***");
  if (cursorIsOn) {
    cursor();
  } else {
    noCursor();
  }
}
//  END: TOGGLE CURSOR
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//  TOGGLE RECORDING  =  'r'
void toggleRecording () {
  directoryStartTime = frameAsString();
  recordIsOn = !recordIsOn;
  println("TOGGLE RECORDING!");
  println("*** Recording = " + recordIsOn + " ***");
  println ("directory by StartTime: kidsPace/frames/" + directoryStartTime);
}
//  END: TOGGLE RECORDING
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//  RECORD FRAMES  =  'r'
void checkRecordFrame() {
  if (recordIsOn) {
    saveFrame(FRAME_FOLDER_PATH + directoryStartTime + "#####.tif");
  }
}
//  END: RECORD FRAMES
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//  MAKE PIXELS CLEAR FOR PGRAPHIC  =  'TAB'
void makePixelsClearAgain() {
    //background(0);
    pg_1.beginDraw();
    pg_1.clear();
    pg_1.endDraw();
}
//  END: MAKE PIXELS CLEAR
//////////////////////////////////////////////////


void mousePressed() {
  //saveFrameIsOn = !saveFrameIsOn;
}
