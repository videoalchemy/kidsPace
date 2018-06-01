
//////////////////////////////
// KeyEVENTS - flipping switches!


////////////////////////////////////////////////////
//  KEYCODE FOR EVENTS

//////////////////////////////////////
//  CREATE MOMENTARY SWITCH 
// Current keyCode for the pressed key

//   The system variable 'key' always contains the value 
//     of the most recent key on the keyboard (either pressed or released). 

//   For non-ASCII keys, use the 'keyCode' variable. 
//      The keys included in the ASCII specification 
//      (BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE) 
//      do not require checking to see if the key is coded, 
//      and you should simply use the 'key' variable instead of 'keyCode'

char currentKey; 
int currentKeyCode = -1;


// Remember the current key when it goes down.
void keyPressed() { 
  currentKeyCode = keyCode; 
  currentKey = key;

  //DEBUG: 
  println("keyCode = "+keyCode+ " key = "+key);


  //////////////////////////////////////////////////
  //  SNAP SCREEN  =  ENTER
  //////////////////////////////////////////////////
  if (currentKeyCode==ENTER) {
    // Turn off cursor if the cursor toggle switch is still on
    //  If toggle is on, then cursor should flip back at next animation cycle
    if (cursorIsOn) {
      println("hits this cursor");
      toggleCursor();
      snapScreen();
      toggleCursor();
    } else {
      snapScreen();
    }
  }

  /////////////////////////////////////////////////
  //  CLEAR BACKGROUND = TAB 
  /////////////////////////////////////////////////
  if (currentKeyCode==TAB) {
    background(0);
    pg_1.beginDraw();
    pg_1.background(0);
    pg_1.endDraw();
  } 

  // Handle CODED KEYS
  if (key == CODED) {
    print("-->Translated: ");
    if (keyCode == LEFT) {
      println("keyCode == LEFT");
    } else if (keyCode == RIGHT) {
      println("keyCode == RIGHT");
    } else if (keyCode == UP) {
      println("keyCode == UP");
    } else if (keyCode == DOWN) {
      println("keyCode == DOWN");
    }
  }

  // Handle standard keys as a switch
  switch(currentKey) {
  case 'r':
    println("TOGGLE RECORDING!");
    recording = !recording;
    println("*** Recording = " + recording + " ***");
    break;
  case 'c':
    //////////////////////////////////////////////////
    //  TOGGLE CURSOR  =  'c'
    toggleCursor();
    break;
  case '-':
    println("HYPEN!");
    break;
  case '1':
    println("1");
    break;
  case '2':
    println("2");
    break;
  case '3':
    println("3");
    break;
  case '4':
    println("4");
    break;
  case '5':
    println("5");
    break;
  case '6':
    println("6");
    break;
  case '7':
    println("7");
    break;
  case '8':
    println("8");
    break;
  case '9':
    println("9");
    break;
  case '0':
    println("10");
    break;
  }
}


// Clear the current key when it goes up.
void keyReleased() {
  currentKeyCode = -1;
}
//  END MOMENTARY SWITCH  
//////////////////////////////////////

//////////////////////////////////////
//  EXECUTE MOMENTARY SWITCHES
// This function runs only if a key is pressssssed 
void updateControlsFromKeyboard() {
  // if no key is currently down, make sure all of the buttons are up and bail  
  if (currentKeyCode == -1) {
    //clearButtons();
    return;
  }


  /////////////////////////////////////////////////
  //     SELECT NEW SOURCE IMAGES FOR CHANNELS 1-4
  /////////////////////////////////////////////////
  //NOTE: THESE ARE NOT DEBOUNCED! Expect repeating keys here!!!
  //select source for chnl 1
  if (currentKey == 'q') {
    println(currentKey);
  } else if (currentKey == 'w') {
    println(currentKey);
  }
  //select source for chnl 2
  else if (currentKey == 'e') {
    println(currentKey);
  } 

  //select source for chnl 3
  else if (currentKey == 't') {
    println(currentKey);
  } else if (currentKey == 'y') {
    println(currentKey);
  }
  //select source for chnl 4
  else if (currentKey == 'u') {
    println(currentKey);
  } else if (currentKey == 'i') {
    println(currentKey);
  }
  //select source for chnl 5
  else if (currentKey == 'o') {
    println(currentKey);
  } else if (currentKey == 'p') {
    println(currentKey);
  }
  //select source for chnl 6
  else if (currentKey == '[') {
    println(currentKey);
  } else if (currentKey == ']') {
    println(currentKey);
  }

  //     END SELECT NEW SOURCE IMAGE
  ////////////////////////////////////////////////
}
//  END KEYCODE FOR EVENTS
/////////////////////////////////////////////////////////////

/*
////////////////////////////////////////////////////
 //    RECORD SCREEN as FRAMES
 // filename pattern: version/project-date-time-millis-version.png
 // destination:      kidsPace/frames --> symlinked to Dropbox/_SNAPS/201806-kidsPace/frames
 // symlink command:  in kidsPace repo root:
 //       ln -s /Users/jstephens/Dropbox/_SNAPS/201806-kidsPace/frames ./frames
 // subdirectory:     in 'frames/<version>' determined by global VERSION
 // example:          "prototype/KidsPace-20180601-132143-3770-prototype.png"
 
 String frameAsString() {
 return version+"/"+
 nf(year(), 4)+
 nf(month(), 2)+
 nf(day(), 2)+"-"+
 nf(hour(), 2)+"/"+
 nf(year(), 4)+
 nf(month(), 2)+
 nf(day(), 2)+"-"+
 nf(hour(), 2)+"/"+
 nf(minute(), 2)+
 nf(second(), 2)+"-"+
 version;
 }
 // Record the current frame as a .tif in the FRAME_FOLDER_PATH,
 // If you pass a filename, we'll use that, otherwise we'll default to the current date.
 // NOTE: do NOT pass the ".jpg" or the path.
 // Returns the name of the file saved.
 String saveScreen() {
 return saveScreen(null);
 }
 String saveScreen(String frameName) {
 if (frameName == null) {
 frameName = frameAsString();
 }
 saveFrame(FRAMES_FOLDER_PATH + frameName + ".png");
 println("SAVED AS "+frameName);
 return frameName;
 }
 //   END: RECORD SCREEN as FRAMES
 ////////////////////////////////////////////////////////////
 */
