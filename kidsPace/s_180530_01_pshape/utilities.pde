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
